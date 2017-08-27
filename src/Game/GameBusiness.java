package Game;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class GameBusiness {

    List<Client> clients = new ArrayList<>();

    public GameBusiness(){}

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
