package Game;

import model.Direction;
import model.Room;
import model.Zone;

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
