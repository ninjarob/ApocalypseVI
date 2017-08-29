package com.apocalypse.game;

interface GameDao {

    void saveCharacter(Character character);

    Character loadCharacter(Game g);
}
