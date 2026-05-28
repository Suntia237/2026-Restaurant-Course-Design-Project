package com.ramijo.dao;

import com.ramijo.model.User;

import java.sql.*;

public class UserDaoImpl implements UserDao {

    private final DatabaseUtil databaseUtil = new DatabaseUtil();

    @Override
    public boolean addUser(User user) {

        String sql = "INSERT INTO user (first_name, last_name, phone_number, email, role, password) VALUES (?, ?, ?, ?, ?, ?)";

        // Choose role according to email and password
        user.setRole(
                user.getEmail().contains("@admin.com") 
                        && user.getPassword().equals("12345678")
                        ? "admin" : "client"
        );

        try (
                Connection conn = databaseUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, user.getFirst_name());
            ps.setString(2, user.getLast_name());
            ps.setString(3, user.getPhone_number());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getRole());
            ps.setString(6, user.getPassword());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error while adding user");
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteUser(User user) {

        String sql = "DELETE FROM user WHERE id = ?";

        try (
                Connection conn = databaseUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setInt(1, user.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error while deleting user");
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateUser(User user) {

        String sql = "UPDATE user"+
                "SET first_name = ?, last_name = ?, phone_number = ?, email = ?" +
                "WHERE id = ?";

        try (
                Connection conn = databaseUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, user.getFirst_name());
            ps.setString(2, user.getLast_name());
            ps.setString(3, user.getPhone_number());
            ps.setString(4, user.getEmail());
            ps.setInt(5, user.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error while updating user");
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public int findUserID(User user) {

        String sql = "SELECT id FROM user"+
                "WHERE email = ? AND password = ?";

        try (
                Connection conn = databaseUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return rs.getInt("id");
                }
            }

        } catch (SQLException e) {
            System.err.println("Error while finding user ID");
            e.printStackTrace();
        }

        return -1;
    }

    @Override
    public User login(String email, String password) {

        String sql = " SELECT * FROM user WHERE email = ? AND password = ?";

        try (
                Connection conn = databaseUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, email);
            ps.setString(2, password);
            User user = new User();

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    user.setId(rs.getInt("id"));
                    user.setFirst_name(rs.getString("first_name"));
                    user.setLast_name(rs.getString("last_name"));
                    user.setPhone_number(rs.getString("phone_number"));
                    user.setRole(rs.getString("role"));
                    user.setEmail(email);
                    user.setPassword(password);

                    return user;
                }
            }

        } catch (SQLException e) {
            System.err.println("Login failed");
            e.printStackTrace();
        }
        return null;
    }
}
