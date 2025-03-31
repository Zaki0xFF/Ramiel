package com.ramiel.launcher;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.*;

public class Main extends Application {
    private Stage mainStage;
    private ListView<String> romList;
    private TextField searchField;
    private Process emulatorProcess;
    private TrayIcon trayIcon;
    private ObservableList<String> roms;
    private FilteredList<String> filteredRoms;

    @Override
    public void start(Stage primaryStage) {
        mainStage = primaryStage;
        mainStage.setTitle("Ramiel Launcher");
        
        roms = FXCollections.observableArrayList();
        filteredRoms = new FilteredList<>(roms);
        
        VBox root = new VBox(5);
        
        searchField = new TextField();
        searchField.setPromptText("Search games...");

        romList = new ListView<>();
        romList.setItems(filteredRoms);
        
        root.getChildren().addAll(searchField, romList);
        
        Scene scene = new Scene(root, 800, 600);
        mainStage.setScene(scene);
        
        setupSystemTray();
        
        searchField.textProperty().addListener((obs, oldVal, newVal) -> {
            filteredRoms.setPredicate(rom -> 
                rom.toLowerCase().contains(newVal.toLowerCase())
            );
        });
        
        romList.setOnMouseClicked(event -> {
            if (event.getClickCount() == 2) {
                String selectedRom = romList.getSelectionModel().getSelectedItem();
                if (selectedRom != null) launchRom(selectedRom);
            }
        });
        
        loadRoms();
        mainStage.show();
    }

    private void setupSystemTray() {
        if (!SystemTray.isSupported()) return;

        try {
            SystemTray tray = SystemTray.getSystemTray();
            PopupMenu popup = new PopupMenu();
            java.awt.MenuItem showItem = new java.awt.MenuItem("Show");
            java.awt.MenuItem exitItem = new java.awt.MenuItem("Exit");
            
            showItem.addActionListener(e -> Platform.runLater(() -> {
                mainStage.setIconified(false);
                mainStage.show();
                mainStage.toFront();
            }));
            
            exitItem.addActionListener(e -> {
                if (emulatorProcess != null) emulatorProcess.destroy();
                Platform.exit();
                System.exit(0);
            });
            
            popup.add(showItem);
            popup.add(exitItem);
            
            BufferedImage image = new BufferedImage(16, 16, BufferedImage.TYPE_INT_ARGB);
            for (int x = 0; x < 16; x++) for (int y = 0; y < 16; y++) image.setRGB(x, y, 0xFF000000);
            
            trayIcon = new TrayIcon(image, "Ramiel Launcher", popup);
            trayIcon.setImageAutoSize(true);
            tray.add(trayIcon);
            
        } catch (AWTException e) { e.printStackTrace(); }
    }

    private void loadRoms() {
        Path romsDir = Paths.get(System.getProperty("user.dir")).getParent().resolve("roms");
        if (!Files.exists(romsDir)) try { Files.createDirectory(romsDir); } catch (IOException e) { e.printStackTrace(); }

        try {
            Files.list(romsDir)
                .filter(path -> {
                    String fileName = path.toString().toLowerCase();
                    return fileName.endsWith(".gb") || fileName.endsWith(".gbc") || fileName.endsWith(".bin");
                })
                .map(path -> path.getFileName().toString())
                .forEach(roms::add);
        } catch (IOException e) { e.printStackTrace(); }
    }

    private void launchRom(String romName) {
        try {
            Path romPath = Paths.get(System.getProperty("user.dir")).getParent().resolve("roms").resolve(romName);
            ProcessBuilder pb = new ProcessBuilder("cargo", "run", "--", romPath.toString());
            pb.directory(new File(System.getProperty("user.dir")).getParentFile());
            
            emulatorProcess = pb.start();
            Platform.runLater(() -> mainStage.hide());
        } catch (IOException e) { e.printStackTrace(); }
    }

    public static void main(String[] args) { launch(args); }
} 