package com.apocalypse.game;

import com.apocalypse.model.UserCharacter;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;

public class Client implements Runnable {

    private AbstractApplicationContext context;
    private final Socket clientSocket; //initialize in const'r
    private OutputStream out;
    private Game g;

    public Client(AbstractApplicationContext _context, Socket _clientSocket, Game _g) {
        context = _context;
        clientSocket = _clientSocket;
        try {
            out = clientSocket.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        g = _g;
    }

    public void run() {
        BufferedReader in;
        ClientService cb = (ClientService) context.getBean("clientService");
        UserCharacter c = cb.loadCharacter(g, "pocket");

        c.setRoom(g.getZones().get(10).getRooms().get(1));

        try {
            in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        String nextline;
        try {
            writeMessage(c.getRoom().getDescription()+"\n\n");
            while ((nextline = in.readLine()) != null) {
                String output = CommandCenter.handleCommand(nextline, g, c);
                if (output.length() != 0) {
                    output = output + "\n";
                }
                writeMessage(output + ">");
            }
            clientSocket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (!clientSocket.isClosed()) {
            try {
                clientSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    void writeMessage(String message) throws IOException
    {
        if (message != null) {
            for (int i = 0; i < message.length(); i++) {
                out.write(message.charAt(i));
            }
        }
    }

}
