package game;

import character.CharacterState;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;

public class Client implements Runnable {

    private final Socket clientSocket; //initialize in const'r
    private OutputStream out;
    private Game g;
    private CharacterState characterState = new CharacterState();

    public Client(Socket _clientSocket, Game _g) {
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
        characterState.setRoom(g.getZones().get(10).getRooms().get(1));

        try {
            in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        String nextline;
        try {
            writeMessage(characterState.getRoom().getDescription()+"\n\n");
            while ((nextline = in.readLine()) != null) {
                String output = CommandCenter.handleCommand(nextline, g, characterState);
                writeMessage(output);
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
        for(int i=0; i<message.length(); i++)
        {
            out.write(message.charAt(i));
        }
    }

}
