package com.example.association2.enums;

public enum Position {
    PRESIDENT(1),
    VICE_PRESIDENT(2),
    MINISTER(3),
    MEMBER(0),
    ;
    private int position;

private Position(int position){
    this.position=position;
}
    public int getPosition() {
        return position;
    }

}
