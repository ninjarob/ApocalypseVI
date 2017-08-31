package com.apocalypse.game;

import com.apocalypse.model.Command;
import com.apocalypse.model.Exit;
import com.apocalypse.model.UserCharacter;
import com.apocalypse.utils.Constants;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

@SuppressWarnings("unused")
class CommandCenter {

    static String handleCommand(String input, Game g, UserCharacter uc) {
        Command command = parseCommand(input, g);
        if (null == command.getCommand()) {
            if (isWhiteSpace(input)) {
                return "";
            }
            return g.getLocalizedStrings().get(Constants.UNRECOGNIZED);
        }
        else {
            Method method;
            try {
                method = CommandCenter.class.getMethod(command.getCommand(), Game.class, UserCharacter.class, List.class);
                return (String) (method.invoke(null, g, uc, command.getArgs()));
            } catch (SecurityException | NoSuchMethodException | IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        return g.getLocalizedStrings().get(Constants.ERROR);
    }

    private static Command parseCommand(String input, Game g) {
        String[] ca = input.split(" ");
        if (ca.length > 0) {
            String command = ca[0];
            List<String> args = new ArrayList<>();
            if (ca.length > 1) {
                for (int i = 1; i < ca.length; i++) {
                    args.add(ca[i]);
                }
            }
            return new Command(g.getCommands().get(command), args);
        }
        return null;
    }

    //COMMANDS
    public static String goNorth(Game g, UserCharacter uc, List<String> args) {
        return go("n", uc);
    }

    public static String goSouth(Game g, UserCharacter uc, List<String> args) {
        return go("s", uc);
    }

    public static String goEast(Game g, UserCharacter uc, List<String> args) {
        return go("e", uc);
    }

    public static String goWest(Game g, UserCharacter uc, List<String> args) {
        return go("w", uc);
    }

    public static String goUp(Game g, UserCharacter uc, List<String> args) {
        return go("u", uc);
    }

    public static String goDown(Game g, UserCharacter uc, List<String> args) {
        return go("d", uc);
    }
    
    public static String look(Game g, UserCharacter uc, List<String> args) {
        return uc.getRoom().getDescription();
    }

    public static String help(Game g, UserCharacter uc, List<String> args) {
        String helpString = g.getHelps().get(args.get(0));
        if (helpString == null) {
            helpString = Constants.NO_HELP_STRING;
        }
        return g.getLocalizedStrings().get(helpString);
    }


    private static String go(String dir, UserCharacter uc) {
        Exit exit = uc.getRoom().getExits().get(dir);
        if (exit == null) return Constants.NO_DIRECTION;
        uc.setRoom(exit.getExitRoom());
        return uc.getRoom().getDescription();
    }

    private static boolean isWhiteSpace(String str) {
        for (int i = 0; i < str.length(); i++) {
            if ((Character.isWhitespace(str.charAt(i)) == false)) {
                return false;
            }
        }
        return true;
    }


}
