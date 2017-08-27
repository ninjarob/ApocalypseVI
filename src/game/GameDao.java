package game;

import model.Direction;
import model.Exit;
import model.Room;
import model.Zone;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

import static javax.swing.UIManager.getString;

public class GameDao {

    public GameDao(){}

    public Game loadGame() {
        Connection connection;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/apoc6db";
            connection = DriverManager.getConnection(url,"root", "2Kn1gh2s");
            Game g = new Game();
            g.setCommands(getCommands(connection));
            g.setDirections(getDirections(connection));
            g.setZones(getZones(connection, g));
            return g;
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
            System.exit(1);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            System.exit(2);
        }
        return null;
    }

    public Map<String, String> getCommands(Connection c) throws SQLException {
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT c.command, a.code FROM commands c JOIN actions a ON c.action_id = a.id");
        Map<String, String> commands = new HashMap<>();
        while (rs.next()) {
            commands.put(rs.getString(1), rs.getString(2));
        }
        return commands;
    }

    public Map<String, Direction> getDirections(Connection c) throws SQLException {
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT d.name, d.long_name FROM directions d");
        Map<String, Direction> directions = new HashMap<>();
        while (rs.next()) {
            Direction d = new Direction();
            d.setName(rs.getString("name"));
            d.setLongName(rs.getString("long_name"));
            directions.put(d.getName(), d);
        }
        return directions;
    }

    private Map<Integer, Zone> getZones(Connection c, Game g) throws SQLException {
        PreparedStatement s = c.prepareStatement("SELECT z.id, z.authors, z.name, z.description, z.zone_number, z.suggested_min_lvl, z.suggested_max_lvl, z.min_lvl, z.max_lvl FROM zones z");
        ResultSet rs = s.executeQuery();
        Map<Integer, Zone> zones = new HashMap<>();
        while (rs.next()) {
            Zone z = new Zone();
            z.setId(rs.getInt("id"));
            z.setAuthors(rs.getString("authors"));
            z.setName(rs.getString("name"));
            z.setDescription(rs.getString("description"));
            z.setZone(rs.getInt("zone_number"));
            z.setSuggestedMinLevel(rs.getInt("suggested_min_lvl"));
            z.setSuggestedMaxLevel(rs.getInt("suggested_max_lvl"));
            z.setMinLevel(rs.getInt("min_lvl"));
            z.setMaxLevel(rs.getInt("max_lvl"));
            zones.put(z.getZone(), z);
        }

        //GET ROOMS FOR ZONE
        for (Zone z : zones.values()) {
            s = c.prepareStatement("SELECT r.id, r.name, r.name_secondary, r.description, r.short_description, r.notes, r.zone_exit FROM rooms r where r.zone_id = ?");
            s.setInt(1, z.getId());
            rs = s.executeQuery();
            Map<Integer, Room> rooms = new HashMap<>();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setSecondName(rs.getString("name_secondary"));
                r.setDescription(rs.getString("description"));
                r.setShortDescription(rs.getString("short_description"));
                r.setNotes(rs.getString("notes"));
                r.setZoneExit(rs.getBoolean("zone_exit"));
                rooms.put(r.getId(), r);
            }
            z.setRooms(rooms);

            // GET EXITS FOR ROOM
            for (Room r : rooms.values()) {
                s = c.prepareStatement("SELECT e.exit_room_id, e.direction_id, e.look_description, d.name FROM exites e JOIN directions d on d.id = e.direction_id where e.room_id = ?");
                s.setInt(1, r.getId());
                ResultSet exitsRs = s.executeQuery();
                Map<String, Exit> exits = new HashMap<>();
                while (exitsRs.next()) {
                    Exit e = new Exit();
                    e.setExitRoom(rooms.get(exitsRs.getInt("exit_room_id")));
                    e.setDirection(g.getDirections().get(exitsRs.getString("name")));
                    e.setDescription(exitsRs.getString("look_description"));
                    exits.put(e.getDirection().getName(), e);
                }
                r.setExits(exits);
            }
        }
        return zones;
    }
}
