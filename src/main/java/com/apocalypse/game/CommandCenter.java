package com.apocalypse.game;

import com.apocalypse.model.Exit;
import com.apocalypse.model.UserCharacter;
import com.apocalypse.utils.Constants;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.StringTokenizer;

@SuppressWarnings("unused")
class CommandCenter {

    static String handleCommand(String input, Game g, UserCharacter uc) {
        String command = parseCommand(input, g);
        if (null == command) {
            return Constants.UNRECOGNIZED;
        } else {
            Method method;
            try {
                method = CommandCenter.class.getMethod(command, UserCharacter.class);
                return (String)(method.invoke(null, uc));
            } catch (SecurityException | NoSuchMethodException | IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        return Constants.ERROR;
    }

    private static String parseCommand(String line, Game g) {
        StringTokenizer st = new StringTokenizer(line, " ", false);
        String command = st.nextToken();
        return g.getCommands().get(command);
    }

    //COMMANDS
    public static String goNorth(UserCharacter uc) {
        return go("n", uc);
    }

    public static String goSouth(UserCharacter uc) {
        return go("s", uc);
    }

    public static String goEast(UserCharacter uc) {
        return go("e", uc);
    }

    public static String goWest(UserCharacter uc) {
        return go("w", uc);
    }

    public static String goUp(UserCharacter uc) {
        return go("u", uc);
    }

    public static String goDown(UserCharacter uc) {
        return go("d", uc);
    }

    private static String go(String dir, UserCharacter uc) {
        Exit exit = uc.getRoom().getExits().get(dir);
        if (exit == null) return Constants.NO_DIRECTION;
        uc.setRoom(exit.getExitRoom());
        return uc.getRoom().getDescription();
    }

    public static String look(UserCharacter uc) {
        return uc.getRoom().getDescription();
    }

}
