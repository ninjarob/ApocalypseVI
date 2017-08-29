package com.apocalypse.game;

import com.apocalypse.model.UserCharacter;

interface ClientDao {

    void createCharacter(UserCharacter character, Game g);

    UserCharacter loadCharacter(Game g, String username);
}
