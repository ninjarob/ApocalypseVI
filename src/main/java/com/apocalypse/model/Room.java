package com.apocalypse.model;

import java.util.List;
import java.util.Map;

public class Room {

    private int id;
    private String name;
    private String secondName;
    private String description;
    private String shortDescription;
    private String notes;
    private boolean zoneExit;
    private int dangerLevel;
    private Zone zone;
    private List<RoomType> roomTypes;
    private Map<String, Exit> exits;

    public Room() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public boolean isZoneExit() {
        return zoneExit;
    }

    public void setZoneExit(boolean zoneExit) {
        this.zoneExit = zoneExit;
    }

    public int getDangerLevel() {
        return dangerLevel;
    }

    public void setDangerLevel(int dangerLevel) {
        this.dangerLevel = dangerLevel;
    }

    public Zone getZone() {
        return zone;
    }

    public void setZone(Zone zone) {
        this.zone = zone;
    }

    public List<RoomType> getRoomTypes() {
        return roomTypes;
    }

    public void setRoomTypes(List<RoomType> roomTypes) {
        this.roomTypes = roomTypes;
    }

    public Map<String, Exit> getExits() {
        return exits;
    }

    public void setExits(Map<String, Exit> exits) {
        this.exits = exits;
    }
}
