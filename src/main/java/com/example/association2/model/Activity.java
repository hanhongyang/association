package com.example.association2.model;

import lombok.Data;

import java.util.Date;
@Data
public class Activity {
    private int activityId;
    private String description;
    private String title;
    private int activityStatus;
    private String picture;
    private int associationId;
    private String startTime;
    private String endTime;
    private String location;
    private float material;
}
