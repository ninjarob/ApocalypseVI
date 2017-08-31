package com.apocalypse.game;

import com.apocalypse.model.UserCharacter;

interface ClientService {

    public void createCharacter(UserCharacter c, Game g);

    public UserCharacter loadCharacter(Game g, String username);
}
