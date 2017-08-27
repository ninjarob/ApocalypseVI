import Game.*;

import java.net.*;
import java.util.Timer;
import java.util.TimerTask;

public class Server
{
    public static void main(String[] args) throws Exception
    {
        GameDao gd = new GameDao();
        Game g = gd.loadGame();

        GameBusiness gb = new GameBusiness();
        //start tic timer

        TimerTask timerTask = new TimerTask() {
            @Override
            public void run() {
                gb.tic();
            }
        };
        Timer ticTimer = new Timer();
        ticTimer.scheduleAtFixedRate(timerTask, 0, Constants.TIC);

        ServerSocket serverSocket = new ServerSocket(23);
        for (;;) {
            Socket clientSocket = null;
            clientSocket = serverSocket.accept();
            //delegate to new thread
            Client c = new Client(clientSocket, g);
            gb.addClient(c);
            new Thread(c).start();
        }
    }
}