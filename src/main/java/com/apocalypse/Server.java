package com.apocalypse;

import com.apocalypse.configuration.ApplicationConfig;
import com.apocalypse.game.Client;
import com.apocalypse.game.Game;
import com.apocalypse.game.GameService;
import com.apocalypse.game.ServerStartupService;
import com.apocalypse.utils.Constants;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import java.net.*;
import java.util.Timer;
import java.util.TimerTask;

public class Server
{
    @SuppressWarnings("InfiniteLoopStatement")
    public static void main(String[] args) throws Exception
    {
        AbstractApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
        ServerStartupService startupService = (ServerStartupService) context.getBean("serverStartupService");
        GameService gameService  = (GameService) context.getBean("gameService");

        //LOAD GAME
        Game g = startupService.loadGame();

        //START TIMERS
        TimerTask timerTask = new TimerTask() {
            @Override
            public void run() {
                gameService.tic();
            }
        };
        Timer ticTimer = new Timer();
        ticTimer.scheduleAtFixedRate(timerTask, 0, Constants.TIC);

        //START COLLECTING CLIENTS
        ServerSocket serverSocket = new ServerSocket(23);
        for (;;) {
            Socket clientSocket = serverSocket.accept();
            Client c = new Client(context, clientSocket, g);
            gameService.addClient(c);
            new Thread(c).start();
        }
    }
}