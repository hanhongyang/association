package com.example.association2.repository;

import com.example.association2.model.Activity;
import com.example.association2.model.ActivityDTO;
import com.example.association2.model.Association;
import com.example.association2.model.User;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

@Mapper
public interface ActivityRepository {


    @Select("select * from activity where activityid=#{activityId}")
    public Activity findActivityById(@Param("activityId")int activityId);

    @Select("select * from activity ac,(select name,associationid from association)ass where ac.associationid=ass.associationid and ac.activityId=#{activityId}")
    public ActivityDTO findActivityAndNameById(@Param("activityId")int activityId);

    @Select("select * from activity")
    public List<Activity> findAllActivity();

    @Select("select * from activity where associationid=#{associationId}")
    public List<Activity> findActivityByAssociationId(@Param("associationId")int associationId);

    @Select("select * from activity ac,(select associationid from association where type=#{associationType})ass where ac.associationid=ass.associationid")
    public List<Activity> findActivityByAssociationType(@Param("associationType")int associationType);

    @Select("select * from activity ac,(select name,associationid from association)ass where ac.associationid=ass.associationid")
    public List<ActivityDTO> findAllActivityAndName();

    @Select("select * from activity ac,(select name,associationid from association)ass where ac.associationid=ass.associationid and activitystatus=0")
    public List<ActivityDTO> findAllActivityApply();

    @Select("select * from activity ac,(select name,associationid from association where type=#{associationType})ass where ac.associationid=ass.associationid")
    public List<ActivityDTO> findActivityAndNameByAssociationType(@Param("associationType")int associationType);

    @Select("select * from activity order by starttime desc limit 5")
    public List<Activity> findLastActivity();


    @Insert("insert into activity(" +
            "title," +
            "description," +
            "activitystatus," +
            "associationid," +
            "starttime," +
            "endtime," +
            "location," +
            "material," +
            "picture) " + "values(" +
            "#{title}," +
            "#{description}," +
            "0," +
            "#{associationId}," +
            "#{startTime}," +
            "#{endTime}," +
            "#{location}," +
            "#{material}," +
            "#{picture})")
    public void addActivity(@Param("title")String title,
                            @Param("description")String description,
                            @Param("associationId")int associationId,
                            @Param("startTime") String startTime,
                            @Param("endTime")String endTime,
                            @Param("location")String location,
                            @Param("material")float material,
                            @Param("picture")String picture
                            );

    @Delete("delete from activity where activityid=#{activityId}")
    public void deleteActivity(@Param("activityId")int activityId);

    @Update("update activity set activitystatus =#{activityStatus} where activityid =#{activityId}")
    public void updateActivityStatus(@Param("activityStatus")int activityStatus,@Param("activityId")int activityId);

    @Update("update activity set title =#{title}," +
            "description=#{description}," +
            "associationid=#{associationId}," +
            "starttime=#{startTime}, " +
            "endtime=#{endTime}," +
            "location=#{location}," +
            "picture=#{picture}," +
            "material=#{material}," +
            "activityStatus=#{activityStatus} where activityid =#{activityId}")
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
    @Update("update activity set activitystatus =1 where activityid =#{activityId}")
    public void applyPass(@Param("activityId")int activityId);
    @Update("update activity set activitystatus =2 where activityid =#{activityId}")
    public void applyRefuse(@Param("activityId")int activityId);


}
