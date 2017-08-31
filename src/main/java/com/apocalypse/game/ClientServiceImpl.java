package com.apocalypse.game;

import com.apocalypse.model.UserCharacter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("clientService")
public class ClientServiceImpl implements ClientService {

    @Autowired private ClientDao clientDao;

    public void createCharacter(UserCharacter c, Game g) {
        clientDao.createCharacter(c, g);
    }

    public UserCharacter loadCharacter(Game g, String username) {
        return clientDao.loadCharacter(g, username);
    }
}