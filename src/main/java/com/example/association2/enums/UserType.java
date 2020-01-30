package com.example.association2.enums;

public enum UserType {
    ADMIN(1),
    ASSADMIN(2),
    STUDENT(0),
    ;
    private int userType;
    private UserType(int userType){
        this.userType=userType;
    }
    public int getUserType(){
        return userType;
    }
}
