package com.ramijo.dao;

import com.ramijo.model.User;

import java.util.List;

public interface UserDao {
    boolean addUser(User user);
    boolean deleteUser(int userID);
    boolean updateUser(User user,String action);
    int findUserID(User user);
    User login(String email, String password);
}
