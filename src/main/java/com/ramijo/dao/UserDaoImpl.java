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

        if (user.getEmail().contains("@admin.com") && user.getPassword().equals("12345678")) {
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
            ps.setString(7, user.getPassword());

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
        int userID = this.findUserID(user);

        String sql = "DELETE FROM User\n" +
                "WHERE id = ?;";
        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);

            int count = ps.executeUpdate();

            if (count == 1) {
                System.out.println("Delete user successful");
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
        int userID = findUserID(user);

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,user.getFirst_name());
            ps.setString(2,user.getLast_name());
            ps.setString(3,user.getPhone_number());
            ps.setString(4,user.getEmail());
            ps.setString(5,user.getAddress());
            ps.setInt(6,userID);

            int count = ps.executeUpdate();

            if (count == 1) {
                System.out.println("Update User successful");
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
    public int findUserID(User user){
        DatabaseUtil util = new DatabaseUtil();

        util.getConnection();

        Connection conn = util.getConnection();

        String sql = "select id from User where Email = ? AND password = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());

            rs = ps.executeQuery();

            if(rs!=null)
                rs.next();
            user.setId(rs.getInt(1));
        }
        catch (SQLException e){
            e.printStackTrace();
            System.err.println("User ID not found");
        }
        finally {
            util.close(conn,ps,rs);
        }
        return user.getId();
    }

    @Override
    public Boolean login(User user) {
        boolean tag = false;
        DatabaseUtil util = new DatabaseUtil();

        Connection conn = null;

        PreparedStatement ps = null;

        ResultSet rs = null;

        String sql = "SELECT * FROM user WHERE id = ?";
        int userID = findUserID(user);

        try {
            conn = util.getConnection();

            ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);

            rs = ps.executeQuery();

            if(rs.next()) {
                user.setId(rs.getInt("id"));
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setPhone_number(rs.getString("PhoneNumber"));
                user.setAddress(rs.getString("Address"));
                user.setRole(rs.getString("role"));

                tag = true;
                return tag;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("An error occured. Unable to login!!!");

        } finally {
            util.close(conn, ps, rs);
        }
        return tag;
    }
}
