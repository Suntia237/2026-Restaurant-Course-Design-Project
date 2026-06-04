package com.ramijo.dao;

import com.ramijo.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    private final DatabaseUtil databaseUtil = new DatabaseUtil();

    @Override
    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {

            conn = databaseUtil.getConnection();

            String sql =
                    "SELECT * "+
                            "FROM `user` "+
                            "ORDER BY role DESC";

            stmt = conn.createStatement();

            rs = stmt.executeQuery(sql);

            while(rs.next()) {
                User user = new User();

                user.setId(rs.getInt(1));
                user.setFirst_name(rs.getString(2));
                user.setLast_name(rs.getString(3));
                user.setPhone_number(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setRole(rs.getString(6));

                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            databaseUtil.close(conn, stmt, rs);
        }

        return users;
    }

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
    public boolean deleteUser(int userID) {

        String sql = "DELETE FROM user WHERE id = ?";

        try (
                Connection conn = databaseUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setInt(1, userID);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error while deleting user");
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateUser(User user, String action) {
        if (action.equals("profile")){
            String sql = "UPDATE user "+
                    "SET first_name = ?, last_name = ?, phone_number = ?, email = ? " +
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
                System.err.println("Error while updating user profile");
                e.printStackTrace();
            }

            return false;
        }else if(action.equals("password")){
            String sql = "UPDATE user "+
                    "SET password = ? " +
                    "WHERE id = ? ";

            try (
                    Connection conn = databaseUtil.getConnection();
                    PreparedStatement ps = conn.prepareStatement(sql)
            ) {

                ps.setString(1, user.getPassword());
                ps.setInt(2, user.getId());

                return ps.executeUpdate() > 0;

            } catch (SQLException e) {
                System.err.println("Error while updating user password");
                e.printStackTrace();
            }

            return false;
        }
        System.err.println("Error invalide action entered");
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
