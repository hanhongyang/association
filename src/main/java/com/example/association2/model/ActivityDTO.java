package com.example.association2.model;

import lombok.Data;

@Data
public class ActivityDTO {
    private String name;//社团名称
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
