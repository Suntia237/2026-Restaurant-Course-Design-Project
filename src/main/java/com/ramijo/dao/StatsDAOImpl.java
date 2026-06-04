package com.ramijo.dao;

import com.ramijo.model.Menu;
import com.ramijo.model.Order;
import com.ramijo.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StatsDAOImpl implements StatsDAO {
    DatabaseUtil JDBCUtil = new DatabaseUtil();

    @Override
    public int getTotalOrders() {

        OrderDAO orderDAO = new OrderDAOImpl();
        List<Order> orders = orderDAO.getAllOrders();
        return orders.size();
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

        MenuDao menuDao = new MenuDaoImpl();
        List<Menu> menus = menuDao.getAllMenus();

        return menus.size();
    }

    @Override
    public int getCompletedPercent() {
        int total = this.getTotalOrders();
        if(total == 0)  return 0;
        return this.countOrdersByStatus("finished") * 100 / this.getTotalOrders();
    }

    @Override
    public int getPendingPercent() {
        int total = this.getTotalOrders();
        if(total == 0)  return 0;
        return this.countOrdersByStatus("pending") * 100 / this.getTotalOrders();
    }

    @Override
    public int getCancelledPercent() {
        int total = this.getTotalOrders();
        if(total == 0)  return 0;
        return this.countOrdersByStatus("canceled") * 100 / this.getTotalOrders();
    }

    @Override
    public int countOrdersByStatus(String status) {

        String statusSql =
                "SELECT COUNT(*) FROM `order` WHERE status=?";

        try(Connection conn = JDBCUtil.getConnection()) {

            int statusCount = 0;

            try(PreparedStatement ps =
                        conn.prepareStatement(statusSql)) {

                ps.setString(1,status);

                try(ResultSet rs = ps.executeQuery()) {

                    if(rs.next()) {
                        statusCount = rs.getInt(1);
                    }
                }
            }

            return statusCount;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}