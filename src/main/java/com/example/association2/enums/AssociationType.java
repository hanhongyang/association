package com.example.association2.enums;

public enum AssociationType {
    ASS1(1),
    ASS2(2),
    ASS3(3),
    ;
    private int associationType;
    private AssociationType(int associationType){
        this.associationType=associationType;
    }
    public int getAssociationType(){
        return associationType;
    }
}
