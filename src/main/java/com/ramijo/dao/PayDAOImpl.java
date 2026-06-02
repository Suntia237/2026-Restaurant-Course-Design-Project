package com.ramijo.dao;

import com.ramijo.model.CartItem;
import com.ramijo.model.Menu;
import com.ramijo.model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PayDAOImpl implements PayDAO {

    private DatabaseUtil dbUtil;

    public PayDAOImpl() {
        dbUtil = new DatabaseUtil();
    }

    @Override
    public boolean addPayCheck(int orderID, String payMethod) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = dbUtil.getConnection();

            String sql ="INSERT INTO `payment` (order_id, pay_method, status) " +
                    "VALUES (?, ?, ?)";

            ps = conn.prepareStatement(
                    sql,
                    Statement.RETURN_GENERATED_KEYS
            );

            ps.setInt(1, orderID);
            ps.setString(2, payMethod);
            ps.setString(3, "successfully");

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating payment check failed.");
            }
            success = true;
        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            dbUtil.close(conn,ps);
        }

        return success;
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

                orders.add(mapOrder(rs));
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

                orders.add(mapOrder(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, stmt, rs);
        }

        return orders;
    }

    @Override
    public List<Order> getOrdersByUser(int userId) {

        List<Order> orders = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = dbUtil.getConnection();

            String sql =
                    "SELECT * FROM `order` " +
                            "WHERE user_id = ? " +
                            "ORDER BY date_order DESC";

            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, userId);

            rs = stmt.executeQuery();

            while(rs.next()) {
                orders.add(mapOrder(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, stmt, rs);
        }

        return orders;
    }

    @Override
    public Order getOrderById(int orderId) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = dbUtil.getConnection();

            String sql =
                    "SELECT * FROM `order` " +
                            "WHERE order_id = ?";

            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, orderId);

            rs = stmt.executeQuery();

            if(rs.next()) {
                return mapOrder(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, stmt, rs);
        }

        return null;
    }

    @Override
    public List<CartItem> getOrderItems(int orderId) {

        List<CartItem> items = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = dbUtil.getConnection();

            String sql =
                    "SELECT ol.quantity, " +
                            "       m.menu_id, " +
                            "       m.menu_name, " +
                            "       m.description, " +
                            "       m.price, " +
                            "       m.img_url, " +
                            "       m.category " +
                            "FROM order_line ol " +
                            "INNER JOIN menu m " +
                            "ON ol.menu_id = m.menu_id " +
                            "WHERE ol.order_id = ?";

            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, orderId);

            rs = stmt.executeQuery();

            while(rs.next()) {

                Menu menu = mapMenu(rs);

                CartItem item = new CartItem(menu, rs.getInt("quantity"));

                items.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, stmt, rs);
        }

        return items;
    }

    private Order mapOrder(ResultSet rs) throws SQLException {

        Order order = new Order();

        order.setOrder_id(rs.getInt("order_id"));
        order.setClient_id(rs.getInt("user_id"));
        order.setTable_number(rs.getString("table_number"));
        order.setOrder_date(rs.getTimestamp("date_order"));
        order.setStatus(rs.getString("status"));

        return order;
    }
    private Menu mapMenu(ResultSet rs) throws SQLException {

        Menu menu = new Menu();

        menu.setMenu_id(rs.getInt("menu_id"));
        menu.setMenu_name(rs.getString("menu_name"));
        menu.setPrice(rs.getInt("price"));
        menu.setImg_url(rs.getString("img_url"));
        menu.setCategory(rs.getString("category"));

        return menu;
    }
}