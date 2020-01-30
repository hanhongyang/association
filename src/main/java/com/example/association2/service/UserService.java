package com.example.association2.service;

import com.example.association2.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    public List<User> findAllUsers();
    public User validUser(@Param("userId")int userId, @Param("password")String password);
    public void addUser(@Param("userId")int userId,@Param("password")String password,@Param("type")int type);
    public void deleteUser(@Param("userId")int userId);
    public void updateUserPassword(@Param("userId")int userId,@Param("password")String password);
    public void updateUserType(@Param("userId")int userId,@Param("type")int type);
    public User validUserAccount(@Param("userId")int userId);
    public int finUserTypeById(@Param("userId")int userId);
    public User finUserById(@Param("userId")int userId);
}
