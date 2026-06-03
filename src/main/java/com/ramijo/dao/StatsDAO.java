package com.ramijo.dao;

import com.ramijo.model.Order;

import java.util.List;

public interface StatsDAO {

    List<Order> getAllOrders();

    int getTotalOrders();

    int getTotalRevenue();

    int getTotalUserByRole(String role);

    int getTotalMenus();

    int getCompletedPercent();

    int getPendingPercent();

    int getCancelledPercent();
}