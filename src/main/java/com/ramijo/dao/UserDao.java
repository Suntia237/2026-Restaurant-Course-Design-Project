package com.ramijo.dao;

import com.ramijo.model.User;

import java.util.List;

public interface UserDao {
    boolean addUser(User user);
    boolean deleteUser(User user);
    boolean updateUser(User user);
    int findUserID(User user);
    User login(String email, String password);
}
