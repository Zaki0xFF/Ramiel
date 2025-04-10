package com.ramiel.launcher;

public class RomInfo {
    private String fileName;
    private String title;
    private String hash;
    private String imagePath;

    public RomInfo(String fileName, String hash) {
        this.fileName = fileName;
        this.hash = hash;
        this.title = null;
    }

    // Getters and setters
    public String getFileName() { return fileName; }
    public String getTitle() { return title; }
    public String getHash() { return hash; }
    public String getImagePath() { return imagePath; }
    
    public void setTitle(String title) { this.title = title; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}
