package com.example.association2.service;

import com.example.association2.model.Activity;
import com.example.association2.model.ActivityDTO;
import com.example.association2.repository.ActivityRepository;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService{
    @Autowired
    private ActivityRepository activityRepository;
    @Override
    public Activity findActivityById(int activityId) {
        return activityRepository.findActivityById(activityId);
    }

    @Override
    public List<Activity> findAllActivity() {
        return activityRepository.findAllActivity();
    }

    @Override
    public List<Activity> findActivityByAssociationId(int associationId) {
        return activityRepository.findActivityByAssociationId(associationId);
    }

    @Override
    public void addActivity(String title,
                            String description,
                            int associationId,
                            String startTime,
                            String endTime,
                            String location,
                            float material,
                            String picture) {
        activityRepository.addActivity(title,description,associationId,startTime,endTime,location,material,picture);
    }



    @Override
    public void deleteActivity(int activityId) {
activityRepository.deleteActivity(activityId);
    }

    @Override
    public void updateActivityStatus(int activityStatus, int activityId) {
activityRepository.updateActivityStatus(activityStatus,activityId);
    }

    @Override
    public void updateActivity(String title, String description, int associationId, String startTime, String endTime, String location, String picture, float material, int activityStatus, int activityId) {
        activityRepository.updateActivity(title,description,associationId,startTime,endTime,location,picture,material,activityStatus,activityId);
    }


    @Override
    public List<Activity> findActivityByAssociationType(int associationType) {
        return activityRepository.findActivityByAssociationType(associationType);
    }

    @Override
    public List<ActivityDTO> findActivityAndNameByAssociationType(int associationType) {
        return activityRepository.findActivityAndNameByAssociationType(associationType);
    }

    @Override
    public List<ActivityDTO> findAllActivityAndName() {
        return activityRepository.findAllActivityAndName();
    }

    @Override
    public List<Activity> findLastActivity() {
        return activityRepository.findLastActivity();
    }

    @Override
    public List<ActivityDTO> findAllActivityApply() {
        return activityRepository.findAllActivityApply();
    }

    @Override
    public void applyPass(int activityId) {
        activityRepository.applyPass(activityId);
    }

    @Override
    public void applyRefuse(int activityId) {
        activityRepository.applyRefuse(activityId);
    }

    @Override
    public ActivityDTO findActivityAndNameById(int activityId) {
        return activityRepository.findActivityAndNameById(activityId);
    }
}
