package com.example.association2.service;

import com.example.association2.model.Activity;
import com.example.association2.model.ActivityDTO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ActivityService {
    public Activity findActivityById(@Param("activityId")int activityId);
    public List<Activity> findAllActivity();
    public List<Activity> findActivityByAssociationId(@Param("associationId")int associationId);
    public void addActivity(@Param("title")String title,
                            @Param("description")String description,
                            @Param("associationId")int associationId,
                            @Param("startTime") String startTime,
                            @Param("endTime")String endTime,
                            @Param("location")String location,
                            @Param("material")float material,
                            @Param("material")String picture
    );
    public void deleteActivity(@Param("activityId")int activityId);
    public void updateActivityStatus(@Param("activityStatus")int activityStatus,@Param("activityId")int activityId);
    public void updateActivity(@Param("title")String title,
                               @Param("description")String description,
                               @Param("associationId")int associationId,
                               @Param("startTime") String startTime,
                               @Param("endTime")String endTime,
                               @Param("location")String location,
                               @Param("picture")String picture,
                               @Param("material")float material,
                               @Param("activityStatus")int activityStatus,
                               @Param("activityId")int activityId);
    public List<Activity> findActivityByAssociationType(@Param("associationType")int associationType);
    public List<ActivityDTO> findActivityAndNameByAssociationType(@Param("associationType")int associationType);
    public List<ActivityDTO> findAllActivityAndName();
    public List<Activity> findLastActivity();
    public List<ActivityDTO> findAllActivityApply();
    public void applyPass(@Param("activityId")int activityId);
    public void applyRefuse(@Param("activityId")int activityId);
    public ActivityDTO findActivityAndNameById(@Param("activityId")int activityId);

}
