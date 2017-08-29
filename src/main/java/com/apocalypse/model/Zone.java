package com.apocalypse.model;

import java.util.Map;

public class Zone {
    private int id;
    private String authors;
    private String name;
    private String description;
    private int zone;
    private int suggestedMinLevel;
    private int suggestedMaxLevel;
    private int minLevel;
    private int maxLevel;
    private Map<Integer, Room> rooms;

    public Zone() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthors() {
        return authors;
    }

    public void setAuthors(String authors) {
        this.authors = authors;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getZone() {
        return zone;
    }

    public void setZone(int zone) {
        this.zone = zone;
    }

    public int getSuggestedMinLevel() {
        return suggestedMinLevel;
    }

    public void setSuggestedMinLevel(int suggestedMinLevel) {
        this.suggestedMinLevel = suggestedMinLevel;
    }

    public int getSuggestedMaxLevel() {
        return suggestedMaxLevel;
    }

    public void setSuggestedMaxLevel(int suggestedMaxLevel) {
        this.suggestedMaxLevel = suggestedMaxLevel;
    }

    public int getMinLevel() {
        return minLevel;
    }

    public void setMinLevel(int minLevel) {
        this.minLevel = minLevel;
    }

    public int getMaxLevel() {
        return maxLevel;
    }

    public void setMaxLevel(int maxLevel) {
        this.maxLevel = maxLevel;
    }

    public Map<Integer, Room> getRooms() {
        return rooms;
    }

    public void setRooms(Map<Integer, Room> rooms) {
        this.rooms = rooms;
    }
}
