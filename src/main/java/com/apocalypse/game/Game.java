package com.apocalypse.game;

import com.apocalypse.model.*;

import java.util.Map;

public class Game {


    //GAME FUNCTION
    private Map<String,String> commands;
    private Map<String, Direction> directions;
    private Map<Integer, Size> sizes;
    private Map<Integer, Race> races;
    private Map<Integer, ClassGroup> classGroups;
    private Map<Integer, CharacterClass> characterClasses;
    private Map<String, String> localizedStrings;
    private Map<String, String> helps;
    private Map<Integer, Zone> zones;

    public Map<String, String> getCommands() {
        return commands;
    }

    public void setCommands(Map<String, String> commands) {
        this.commands = commands;
    }

    public Map<String, Direction> getDirections() {
        return directions;
    }

    public void setDirections(Map<String, Direction> directions) {
        this.directions = directions;
    }

    public Map<Integer, Size> getSizes() {
        return sizes;
    }

    public void setSizes(Map<Integer, Size> sizes) {
        this.sizes = sizes;
    }

    public Map<Integer, Race> getRaces() {
        return races;
    }

    public void setRaces(Map<Integer, Race> races) {
        this.races = races;
    }

    public Map<Integer, ClassGroup> getClassGroups() {
        return classGroups;
    }

    public void setClassGroups(Map<Integer, ClassGroup> classGroups) {
        this.classGroups = classGroups;
    }

    public Map<Integer, CharacterClass> getCharacterClasses() {
        return characterClasses;
    }

    public void setCharacterClasses(Map<Integer, CharacterClass> characterClasses) {
        this.characterClasses = characterClasses;
    }

    public Map<String, String> getLocalizedStrings() {
        return localizedStrings;
    }

    public void setLocalizedStrings(Map<String, String> localizedStrings) {
        this.localizedStrings = localizedStrings;
    }

    public Map<String, String> getHelps() {
        return helps;
    }

    public void setHelps(Map<String, String> helps) {
        this.helps = helps;
    }

    public Map<Integer, Zone> getZones() {
        return zones;
    }

    public void setZones(Map<Integer, Zone> zones) {
        this.zones = zones;
    }

}
