package com.apocalypse.game;

import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service("gameService")
public class GameServiceImpl implements GameService {

    private List<Client> clients = new ArrayList<>();

    public void addClient(Client client) {
        clients.add(client);
    }

    public void tic() {
        // send db tic message to all logged in
        for (Client c : clients) {
            try {
                c.writeMessage("\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
