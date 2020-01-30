package com.example.association2.repository;


import com.example.association2.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserRepository {

    @Results(id="userMap", value={
            @Result(property = "userId", column = "userid"),
            @Result(property = "password", column = "password"),
            @Result(property = "type", column = "type"),
    })

    @Select("select * from user")
    public List<User> findAllUsers();

    @Select("select type from user where userid=#{userId}")
    public int finUserTypeById(@Param("userId")int userId);

    @Select("select * from user where userid=#{userId}")
    public User finUserById(@Param("userId")int userId);

    @Select("select * from user where userid=#{userId}  and password=#{password}")
    @ResultMap(value="userMap")
    public User validUser(@Param("userId")int userId,@Param("password")String password);

    @Insert("insert into user(userid,password,type) values(#{userId},#{password},#{type})")
    public void addUser(@Param("userId")int userId,@Param("password")String password,@Param("type")int type);

    @Delete("delete from user where userid=#{userId}")
    public void deleteUser(@Param("userId")int userId);

    @Update("update user set password =#{password} where userid =#{userId}")
    public void updateUserPassword(@Param("userId")int userId,@Param("password")String password);

    @Update("update user set type =#{type} where userid =#{userId}")
    public void updateUserType(@Param("userId")int userId,@Param("type")int type);



    //查看账户是否已在数据库存在
    @Select("select * from user where userid=#{userId} ")
    @ResultMap(value="userMap")
    public User validUserAccount(@Param("userId")int userId);




}