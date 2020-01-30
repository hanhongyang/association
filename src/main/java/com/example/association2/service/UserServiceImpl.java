package com.example.association2.service;

import com.example.association2.model.User;
import com.example.association2.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Override
    public List<User> findAllUsers() {
        return userRepository.findAllUsers();
    }

    @Override
    public User validUser(int userId, String password) {
        return userRepository.validUser(userId,password);
    }

    @Override
    public void addUser(int userId, String password, int type) {
        userRepository.addUser(userId,password,type);
    }

    @Override
    public void deleteUser(int userId) {
        userRepository.deleteUser(userId);
    }

    @Override
    public void updateUserPassword(int userId, String password) {
     userRepository.updateUserPassword(userId,password);
    }

    @Override
    public void updateUserType(int userId, int type) {
        userRepository.updateUserType(userId,type);
    }

    @Override
    public User validUserAccount(int userId) {
        return userRepository.validUserAccount(userId);
    }

    @Override
    public int finUserTypeById(int userId) {
        return userRepository.finUserTypeById(userId);
    }

    @Override
    public User finUserById(int userId) {
        return userRepository.finUserById(userId);
    }
}
