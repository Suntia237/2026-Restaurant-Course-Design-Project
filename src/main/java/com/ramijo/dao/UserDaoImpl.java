package com.ramijo.dao;

import com.ramijo.model.User;

import java.sql.*;

public class UserDaoImpl implements UserDao{
    public boolean addUser(User user) {
        boolean tag = false;

        DatabaseUtil util = new DatabaseUtil();

        util.getConnection();

        Connection conn = util.getConnection();

        String sql = "insert into User(first_name,last_name,PhoneNumber,Email,Address,role,password) values(?,?,?,?,?,?,?)";
        PreparedStatement ps = null;

        if (user.getEmail().contains("@admin.com")) {
            user.setRole("admin");
        } else {
            user.setRole("client");
        }

        try{
            ps = conn.prepareStatement(sql);
            ps.setString(1,user.getFirst_name());
            ps.setString(2,user.getLast_name());
            ps.setString(3,user.getPhone_number());
            ps.setString(4,user.getEmail());
            ps.setString(5,user.getAddress());
            ps.setString(6,user.getRole());
            ps.setString(7,"1111");

            int count = ps.executeUpdate();

            if(count==1){
                System.out.println("Insert User successful");
                tag = true;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            // the last step: release resourses
            util.close(conn,ps);
        }
        return tag;
    }
    @Override
    public boolean deleteUser(User user){
        boolean tag = false;

        DatabaseUtil util = new DatabaseUtil();

        util.getConnection();

        Connection conn = util.getConnection();

        String sql = "DELETE FROM User\n" +
                "WHERE id = ?;";
        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user.getId());

            int count = ps.executeUpdate();

            if (count == 1) {
                System.out.println("Delete userdent successful");
                tag = true;
            }
            if (count == 0)
                System.err.println("Error! "+user.getId()+" is not found in database");
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            // the last step: release resourses
            util.close(conn,ps);
        }
        return tag;
    }
    @Override
    public boolean updateUser(User user) {
        boolean tag = false;

        DatabaseUtil util = new DatabaseUtil();

        util.getConnection();

        Connection conn = util.getConnection();

        String sql = "UPDATE user\n" +
                "SET first_name = ?,last_name = ?,phone_number = ?,email = ?,address = ?\n"+
                "WHERE id = ?;";
        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,user.getFirst_name());
            ps.setString(2,user.getLast_name());
            ps.setString(3,user.getPhone_number());
            ps.setString(4,user.getEmail());
            ps.setString(5,user.getAddress());
            ps.setInt(6,user.getId());

            int count = ps.executeUpdate();

            if (count == 1) {
                System.out.println("Update student successful");
                tag = true;
            }
            if (count == 0)
                System.err.println("Error! "+user.getId()+" is not found in database");
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            // the last step: release resourses
            util.close(conn,ps);
        }
        return tag;
    }
}
