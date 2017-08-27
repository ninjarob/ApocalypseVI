package model;

public class Exit {

    private Direction direction;
    private Room exitRoom;
    private String description;

    public Exit() {}

    public Direction getDirection() {
        return direction;
    }

    public void setDirection(Direction direction) {
        this.direction = direction;
    }

    public Room getExitRoom() {
        return exitRoom;
    }

    public void setExitRoom(Room exitRoom) {
        this.exitRoom = exitRoom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
