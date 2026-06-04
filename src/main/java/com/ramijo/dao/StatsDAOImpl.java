package com.ramijo.dao;

import com.ramijo.model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StatsDAOImpl implements StatsDAO {
    DatabaseUtil JDBCUtil = new DatabaseUtil();

    @Override
    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {

            conn = JDBCUtil.getConnection();

            String sql =
                    "SELECT o.*, p.calculated_total AS total "+
                    "FROM `order` o "+
                    "JOIN payment_with_total p ON o.order_id = p.order_id "+
                    "ORDER BY order_date DESC";

            stmt = conn.createStatement();

            rs = stmt.executeQuery(sql);

            while(rs.next()) {
                Order order = new Order();

                order.setOrder_id(rs.getInt("order_id"));
                order.setClient_id(rs.getInt("user_id"));
                order.setTable_number(rs.getString("table_number"));
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setStatus(rs.getString("status"));
                order.setTotal(rs.getInt("total"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, stmt, rs);
        }

        return orders;
    }

    @Override
    public int getTotalOrders() {

        String sql = "SELECT COUNT(*) FROM `order`";

        try(Connection conn = JDBCUtil.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {

            if(rs.next()) {
                return rs.getInt(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int getTotalRevenue() {

        String sql =
                "SELECT SUM(p.`calculated_total`) "+
                "FROM payment_with_total p " +
                "WHERE `status` = 'successfully';";

        try(Connection conn = JDBCUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {

            if(rs.next()) {
                return rs.getInt(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int getTotalUserByRole(String role) {

        String sql =
                "SELECT COUNT(*) FROM `user` " +
                        "WHERE role= ?";

        try(Connection conn = JDBCUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
            ) {

            ps.setString(1,role);

            try(ResultSet rs = ps.executeQuery()){

                if(rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int getTotalMenus() {

        String sql = "SELECT COUNT(*) FROM menu";

        try(Connection conn = JDBCUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {

            if(rs.next()) {
                return rs.getInt(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int getCompletedPercent() {

        return calculateStatusPercentage("finished");
    }

    @Override
    public int getPendingPercent() {

        return calculateStatusPercentage("pending");
    }

    @Override
    public int getCancelledPercent() {

        return calculateStatusPercentage("canceled");
    }

    private int calculateStatusPercentage(String status) {

        String totalSql =
                "SELECT COUNT(*) FROM `order`";

        String statusSql =
                "SELECT COUNT(*) FROM `order` WHERE status=?";

        try(Connection conn = JDBCUtil.getConnection()) {

            int total = 0;
            int statusCount = 0;

            try(Statement stmt =
                        conn.createStatement();
                ResultSet rs = stmt.executeQuery(totalSql)) {

                if(rs.next()) {
                    total = rs.getInt(1);
                }
            }

            try(PreparedStatement ps =
                        conn.prepareStatement(statusSql)) {

                ps.setString(1,status);

                try(ResultSet rs = ps.executeQuery()) {

                    if(rs.next()) {
                        statusCount = rs.getInt(1);
                    }
                }
            }

            if(total == 0) {
                return 0;
            }

            return (statusCount * 100) / total;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}