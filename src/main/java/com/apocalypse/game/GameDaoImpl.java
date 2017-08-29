
package com.apocalypse.game;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.*;

@Repository
public class GameDaoImpl implements GameDao {

    @Autowired JdbcTemplate jdbcTemplate;

    public GameDaoImpl() {}

//    private Connection getConnection() {
//        try
//        {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            String url = "jdbc:mysql://localhost:3306/apoc6db";
//            return DriverManager.getConnection(url,"root", "2Kn1gh2s");
//        }
//        catch (ClassNotFoundException e)
//        {
//            e.printStackTrace();
//            System.exit(1);
//        }
//        catch (SQLException e)
//        {
//            e.printStackTrace();
//            System.exit(2);
//        }
//        return null;
//    }

    public void saveCharacter(Character character) {
//        Connection c = getConnection();
//        if (c==null) return;
    }

    public Character loadCharacter(Game g) {
//        Connection c = getConnection();
//        if (c==null) return null;
//        Statement s = null;
//        try {
//            s = c.createStatement();
//
//
//            ResultSet rs = s.executeQuery("SELECT * from characters c where c.username = ?");
//            while (rs.next()) {
//                //commands.put(rs.getString(1), rs.getString(2));
//            }
//            //return commands;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
        return null;
    }
}
