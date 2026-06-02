package com.ramijo.dao;

import com.ramijo.model.CartItem;
import com.ramijo.model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {

    private DatabaseUtil dbUtil;

    public OrderDAOImpl() {
        dbUtil = new DatabaseUtil();
    }

    @Override
    public int addOrder(Order order, List<CartItem> cartItems) {

        Connection conn = null;
        PreparedStatement orderStmt = null;
        PreparedStatement lineStmt = null;
        ResultSet rs = null;

        int orderId = -1;

        try {

            conn = dbUtil.getConnection();
            conn.setAutoCommit(false);

            String orderSql =
                    "INSERT INTO `order` (user_id, table_number, status) " +
                            "VALUES (?, ?, ?)";

            orderStmt = conn.prepareStatement(
                    orderSql,
                    Statement.RETURN_GENERATED_KEYS
            );

            orderStmt.setInt(1, order.getClient_id());
            orderStmt.setString(2, order.getTable_number());
            orderStmt.setString(3, order.getStatus());

            int affectedRows = orderStmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order failed.");
            }

            rs = orderStmt.getGeneratedKeys();

            if (rs.next()) {
                orderId = rs.getInt(1);
            } else {
                throw new SQLException("No order ID obtained.");
            }

            String lineSql =
                    "INSERT INTO order_line " +
                            "(order_id, menu_id, quantity, price) " +
                            "VALUES (?, ?, ?, ?)";

            lineStmt = conn.prepareStatement(lineSql);

            for (CartItem item : cartItems) {

                lineStmt.setInt(1, orderId);
                lineStmt.setInt(2, item.getMenu().getMenu_id());
                lineStmt.setInt(3, item.getQuantity());
                lineStmt.setInt(4, item.getMenu().getPrice());

                lineStmt.addBatch();
            }

            lineStmt.executeBatch();

            conn.commit();

        } catch (Exception e) {

            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            e.printStackTrace();

        } finally {

            dbUtil.close(rs);
            dbUtil.close(conn, lineStmt);
            dbUtil.close(conn, orderStmt);
        }

        return orderId;
    }

    @Override
    public boolean updateOrderStatus(int orderId, String status) {

        Connection conn = null;
        PreparedStatement stmt = null;

        boolean success = false;

        try {

            conn = dbUtil.getConnection();

            String sql =
                    "UPDATE `order` " +
                            "SET status = ? " +
                            "WHERE order_id = ?";

            stmt = conn.prepareStatement(sql);

            stmt.setString(1, status);
            stmt.setInt(2, orderId);

            success = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, stmt);
        }

        return success;
    }

    @Override
    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = dbUtil.getConnection();

            String sql =
                    "SELECT * FROM `order` " +
                            "ORDER BY date_order DESC";

            stmt = conn.prepareStatement(sql);

            rs = stmt.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrder_id(rs.getInt("order_id"));
                order.setClient_id(rs.getInt("user_id"));
                order.setTable_number(rs.getString("table_number"));
                order.setOrder_date(rs.getTimestamp("date_order"));
                order.setStatus(rs.getString("status"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, stmt, rs);
        }

        return orders;
    }

    @Override
    public List<Order> getOrdersByStatus(String status) {

        List<Order> orders = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = dbUtil.getConnection();

            String sql =
                    "SELECT * FROM `order` " +
                            "WHERE status = ? " +
                            "ORDER BY date_order DESC";

            stmt = conn.prepareStatement(sql);

            stmt.setString(1, status);

            rs = stmt.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrder_id(rs.getInt("order_id"));
                order.setClient_id(rs.getInt("user_id"));
                order.setTable_number(rs.getString("table_number"));
                order.setOrder_date(rs.getTimestamp("date_order"));
                order.setStatus(rs.getString("status"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, stmt, rs);
        }

        return orders;
    }
}