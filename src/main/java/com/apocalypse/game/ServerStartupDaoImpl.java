package com.apocalypse.game;

import com.apocalypse.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class ServerStartupDaoImpl implements ServerStartupDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Game loadGame() {
        Game g = new Game();
        g.setCommands(getCommands());
        g.setDirections(getDirections());
        g.setZones(getZones(g));
        g.setLocalizedStrings(getLocalizedStrings(1));
        g.setHelps(getHelps());
        g.setClassGroups(getClassGroups(g));
        g.setCharacterClasses(getCharacterClasses(g));
        g.setSizes(getSizes());
        g.setRaces(getRaces(g));
        return g;
    }

    private Map<String, String> getCommands() {
        Map<String, String> commands = new HashMap<>();
        jdbcTemplate.query("SELECT c.command, a.code FROM commands c JOIN actions a ON c.action_id = a.id", rs -> {
            commands.put(rs.getString("command"), rs.getString("code"));
        });
        return commands;
    }

    private Map<String, Direction> getDirections() {
        Map<String, Direction> directions = new HashMap<>();
        jdbcTemplate.query("SELECT d.name, d.long_name FROM directions d", rs -> {
            Direction d = new Direction();
            d.setName(rs.getString("name"));
            d.setLongName(rs.getString("long_name"));
            directions.put(d.getName(), d);
        });

        return directions;
    }

    private Map<Integer, Zone> getZones(Game g) {
        Map<Integer, Zone> zones = new HashMap<>();

        jdbcTemplate.query("SELECT z.id, z.authors, z.name, z.description, z.zone_number, z.suggested_min_lvl, z.suggested_max_lvl, z.min_lvl, z.max_lvl FROM zones z", rs -> {
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
        });


        //GET ROOMS FOR ZONE
        for (Zone z : zones.values()) {
            Map<Integer, Room> rooms = new HashMap<>();
            jdbcTemplate.query("SELECT r.id, r.name, r.name_secondary, r.description, r.short_description, r.notes, r.zone_exit FROM rooms r where r.zone_id = ?",
                    new Object[]{z.getId()}, rs -> {
                        Room r = new Room();
                        r.setId(rs.getInt("id"));
                        r.setName(rs.getString("name"));
                        r.setSecondName(rs.getString("name_secondary"));
                        r.setDescription(rs.getString("description"));
                        r.setShortDescription(rs.getString("short_description"));
                        r.setNotes(rs.getString("notes"));
                        r.setZoneExit(rs.getBoolean("zone_exit"));
                        rooms.put(r.getId(), r);
                    });


            z.setRooms(rooms);

            // GET EXITS FOR ROOM
            for (Room r : rooms.values()) {
                Map<String, Exit> exits = new HashMap<>();
                jdbcTemplate.query("SELECT e.exit_room_id, e.direction_id, e.look_description, d.name FROM exites e JOIN directions d on d.id = e.direction_id where e.room_id = ?",
                        new Object[]{r.getId()}, rs -> {
                            Exit e = new Exit();
                            e.setExitRoom(rooms.get(rs.getInt("exit_room_id")));
                            e.setDirection(g.getDirections().get(rs.getString("name")));
                            e.setDescription(rs.getString("look_description"));
                            exits.put(e.getDirection().getName(), e);
                        });
                r.setExits(exits);
            }
        }
        return zones;
    }

    private Map<String,String> getLocalizedStrings(int langId) {

        Map<String, String> localizedStrings = new HashMap<>();
        jdbcTemplate.query("SELECT sk.string_key, ls.text FROM string_keys sk JOIN localized_strings ls ON sk.id = ls.string_key_id where ls.lang_id = ?", new Object[]{langId}, rs -> {
            localizedStrings.put(rs.getString("string_key"), rs.getString("text"));
        });
        return localizedStrings;
    }

    private Map<String,String> getHelps() {
        Map<String, String> helps = new HashMap<>();
        jdbcTemplate.query("SELECT h.key, h.string_key from helps h", rs -> {
            helps.put(rs.getString("key"), rs.getString("string_key"));
        });
        return helps;
    }

    private Map<Integer,ClassGroup> getClassGroups(Game g) {
        Map<Integer, ClassGroup> classGroups = new HashMap<>();
        jdbcTemplate.query("SELECT cg.id, cg.name from class_groups cg", rs -> {
            ClassGroup cc = new ClassGroup();
            cc.setId(rs.getInt("id"));
            cc.setName(rs.getString("name"));
        });
        return classGroups;
    }

    private Map<Integer,CharacterClass> getCharacterClasses(Game g) {
        Map<Integer, CharacterClass> characterClasses = new HashMap<>();
        jdbcTemplate.query("SELECT cc.id, cc.name, cc.class_group_id from character_classes cc", rs -> {
            CharacterClass cc = new CharacterClass();
            cc.setId(rs.getInt("id"));
            cc.setName(rs.getString("name"));
            cc.setClassGroup(g.getClassGroups().get(rs.getInt("class_group_id")));
            characterClasses.put(cc.getId(), cc);
        });
        return characterClasses;
    }

    private Map<Integer,Size> getSizes() {
        Map<Integer, Size> sizes = new HashMap<>();
        jdbcTemplate.query("SELECT s.id, s.name from sizes s", rs -> {
            Size s = new Size();
            s.setId(rs.getInt("id"));
            s.setName(rs.getString("name"));
            sizes.put(s.getId(), s);
        });
        return sizes;
    }

    private Map<Integer,Race> getRaces(Game g) {
        Map<Integer, Race> races = new HashMap<>();
        jdbcTemplate.query("SELECT r.id, r.name, r.size_id from races r", rs -> {
            Race race = new Race();
            race.setId(rs.getInt("id"));
            race.setName(rs.getString("name"));
            race.setSize(g.getSizes().get(rs.getInt("size_id")));
            races.put(race.getId(), race);
        });
        return races;
    }
}
