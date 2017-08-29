package com.apocalypse.game;

import com.apocalypse.model.UserCharacter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDaoImpl implements ClientDao {

    @Autowired JdbcTemplate jdbcTemplate;

    public void createCharacter(UserCharacter character, Game g) {

    }

    public UserCharacter loadCharacter(Game g, String username) {

        UserCharacter c = jdbcTemplate.queryForObject("SELECT * FROM characters c WHERE c.username = ?", new Object[]{username}, (rs, i) -> {
            UserCharacter uc = new UserCharacter();
            uc.setId(rs.getInt("id"));
            uc.setName(rs.getString("name"));
            uc.setRace(g.getRaces().get(rs.getInt("race_id")));
            return uc;
        });
        return c;
    }
}
