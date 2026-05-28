package com.ramijo;

import com.ramijo.dao.UserDao;
import com.ramijo.dao.UserDaoImpl;
import com.ramijo.model.User;

public class Test {
    public static void main(String[] args) {
        UserDao userDao = new UserDaoImpl();
        User user2 = new User("Mike","Joan","15594601058","mike@gmail.com","XYNU","1234");
        userDao.addUser(user2);
//        userDao.deleteUser(user2);
    }
}
