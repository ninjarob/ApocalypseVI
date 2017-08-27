import game.*;
import utils.Constants;

import java.net.*;
import java.util.Timer;
import java.util.TimerTask;

public class Server
{
    @SuppressWarnings("InfiniteLoopStatement")
    public static void main(String[] args) throws Exception
    {
        GameDao gd = new GameDao();
        Game g = gd.loadGame();

        GameBusiness gb = new GameBusiness();

        //START TIMERS
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
            Socket clientSocket = serverSocket.accept();
            Client c = new Client(clientSocket, g);
            gb.addClient(c);
            new Thread(c).start();
        }
    }
}