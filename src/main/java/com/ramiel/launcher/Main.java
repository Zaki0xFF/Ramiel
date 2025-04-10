package com.ramiel.launcher;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.apache.commons.codec.digest.DigestUtils;
import java.util.Map;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.layout.GridPane;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.geometry.Pos;
import javafx.scene.layout.Priority;

public class Main extends Application {
    private Stage mainStage;
    private TextField searchField;
    private ObservableList<RomInfo> roms = FXCollections.observableArrayList();
    private FilteredList<RomInfo> filteredRoms = new FilteredList<>(roms);
    private Map<String, Map<String, String>> hashToImageMap;
    private GridPane romGrid;
    private static final int TILE_SIZE = 150;

    @Override
    public void start(Stage primaryStage) {
        mainStage = primaryStage;
        mainStage.setTitle("Ramiel Launcher");

        // Setup UI
        VBox root = new VBox(5);
        searchField = new TextField();
        searchField.setPromptText("Search games...");
        
        romGrid = new GridPane();
        romGrid.setHgap(5);
        romGrid.setVgap(5);
        romGrid.setAlignment(Pos.TOP_LEFT);

        ScrollPane scrollPane = new ScrollPane(romGrid);
        scrollPane.setFitToWidth(true);
        scrollPane.setFitToHeight(true);
        VBox.setVgrow(scrollPane, Priority.ALWAYS);

        root.getChildren().addAll(searchField, scrollPane);

        initializeDatabase();
        loadRoms();
        
        searchField.textProperty().addListener((obs, old, newVal) -> updateGridView());
        Scene scene = new Scene(root, 900, 600);
        scene.widthProperty().addListener((obs, old, newVal) -> updateGridView());

        mainStage.setScene(scene);
        updateGridView();
        mainStage.show();
    }

    private void initializeDatabase() {
        hashToImageMap = Map.of(
            "982ed5d2b12a0377eb14bcdc4123744e", 
            Map.of("image", "images/tetris.jpg", "name", "Tetris")
        );
    }

    private void loadRoms() {
        try {
            Path romsDir = Paths.get(System.getProperty("user.dir")).resolve("roms");
            if (!Files.exists(romsDir)) Files.createDirectory(romsDir);

            Files.list(romsDir)
                .filter(path -> path.toString().toLowerCase().matches(".*\\.(gb|gbc|bin)$"))
                .forEach(path -> {
                    String hash = calculateMD5(path);
                    RomInfo romInfo = new RomInfo(path.getFileName().toString(), hash);
                    
                    Map<String, String> romData = hashToImageMap.get(hash);
                    if (romData != null) {
                        romInfo.setImagePath(romData.get("image"));
                        romInfo.setTitle(romData.get("name"));
                    }
                    roms.add(romInfo);
                });
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateGridView() {
        romGrid.getChildren().clear();
        int columns = Math.max(1, (int) (mainStage.getScene().getWidth()) / TILE_SIZE);
        
        int col = 0, row = 0;
        String searchText = searchField.getText().toLowerCase();
        
        for (RomInfo rom : filteredRoms) {
            if (searchText.isEmpty() || rom.getFileName().toLowerCase().contains(searchText)) {
                romGrid.add(createRomTile(rom), col, row);
                if (++col >= columns) {
                    col = 0;
                    row++;
                }
            }
        }
    }

    private VBox createRomTile(RomInfo rom) {
        VBox tile = new VBox(5);
        tile.setPrefSize(TILE_SIZE, TILE_SIZE);
        tile.setAlignment(Pos.TOP_CENTER);

        VBox imageContainer = new VBox();
        imageContainer.setPrefSize(TILE_SIZE, TILE_SIZE - 30);
        imageContainer.setAlignment(Pos.CENTER);

        ImageView imageView = new ImageView();
        imageView.setFitWidth(TILE_SIZE);
        imageView.setFitHeight(TILE_SIZE - 30);
        imageView.setPreserveRatio(true);

        try {
            String imagePath = rom.getImagePath() != null ? rom.getImagePath() : "images/missing.png";
            imageView.setImage(new Image(getClass().getResourceAsStream("/" + imagePath)));
        } catch (Exception e) {
            imageView.setImage(new Image(getClass().getResourceAsStream("/images/missing.png")));
        }

        imageContainer.getChildren().add(imageView);

        Label nameLabel = new Label(rom.getTitle() != null ? rom.getTitle() : rom.getFileName());
        nameLabel.setWrapText(true);
        nameLabel.setPrefWidth(TILE_SIZE);
        nameLabel.setAlignment(Pos.CENTER);
        nameLabel.setTextAlignment(javafx.scene.text.TextAlignment.CENTER);
        nameLabel.setStyle("-fx-font-size: 12px; -fx-padding: 5;");

        tile.getChildren().addAll(imageContainer, nameLabel);
        tile.setOnMouseClicked(e -> {
            if (e.getClickCount() == 2) launchRom(rom);
        });

        return tile;
    }

    private void launchRom(RomInfo rom) {
        try {
            Path romPath = Paths.get(System.getProperty("user.dir"))
                .resolve("roms")
                .resolve(rom.getFileName());
            
            new ProcessBuilder("cargo", "run", "--", romPath.toString())
                .directory(Paths.get(System.getProperty("user.dir")).toFile())
                .start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String calculateMD5(Path path) {
        try {
            return DigestUtils.md5Hex(Files.readAllBytes(path));
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        launch(args);
    }
}