package Game;

import character.CharacterState;
import model.Exit;
import model.Room;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.StringTokenizer;

public class CommandCenter {

    public static String handleCommand(String input, Game g, Client c, CharacterState characterState) {
        String command = parseCommand(input, g);
        if (null == command) {
            return Constants.UNRECOGNIZED;
        } else {
            Method method;
            try {
                method = CommandCenter.class.getMethod(command, CharacterState.class);
                return (String)(method.invoke(null, characterState));
            } catch (SecurityException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
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
    public static String goNorth(CharacterState characterState) {
        return go("n", characterState);
    }

    public static String goSouth(CharacterState characterState) {
        return go("s", characterState);
    }

    public static String goEast(CharacterState characterState) {
        return go("e", characterState);
    }

    public static String goWest(CharacterState characterState) {
        return go("w", characterState);
    }

    public static String goUp(CharacterState characterState) {
        return go("u", characterState);
    }

    public static String goDown(CharacterState characterState) {
        return go("d", characterState);
    }

    public static String go(String dir, CharacterState characterState) {
        Exit exit = characterState.getRoom().getExits().get(dir);
        if (exit == null) return Constants.NO_DIRECTION;
        characterState.setRoom(exit.getExitRoom());
        return characterState.getRoom().getDescription();
    }

    public static String look(CharacterState characterState) {
        return characterState.getRoom().getDescription();
    }

}
