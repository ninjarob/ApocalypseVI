package com.apocalypse.game;

import com.apocalypse.model.Direction;
import com.apocalypse.model.Race;
import com.apocalypse.model.Zone;

import java.util.Map;

public class Game {


    //GAME FUNCTION
    private Map<String,String> commands;

    public Map<String, String> getCommands() {
        return commands;
    }

    public void setCommands(Map<String, String> commands) {
        this.commands = commands;
    }

    private Map<String, Direction> directions;

    public Map<String, Direction> getDirections() {
        return directions;
    }

    public void setDirections(Map<String, Direction> directions) {
        this.directions = directions;
    }

    private Map<Integer, Race> races;

    public Map<Integer, Race> getRaces() {
        return races;
    }

    public void setRaces(Map<Integer, Race> races) {
        this.races = races;
    }



    //GAME PERMANENT STATE
    private Map<Integer, Zone> zones;

    public Map<Integer, Zone> getZones() {
        return zones;
    }

    public void setZones(Map<Integer, Zone> zones) {
        this.zones = zones;
    }

    //GAME VARIABLE STATE



}
