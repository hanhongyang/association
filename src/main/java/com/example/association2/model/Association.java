package com.example.association2.model;

import lombok.Data;

import java.util.Date;
@Data
public class Association {
    private int associationId;
    private int associationStatus;
    private String createTime;
    private int type;
    private String description;
    private int ownerId;
    private String name;
    private String logo;
    private  Integer signatureActivity;
}
