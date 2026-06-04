package com.ramijo.dao;

import com.ramijo.model.Order;
import com.ramijo.model.User;

import java.util.List;

public interface StatsDAO {

    int getTotalOrders();

    int getTotalRevenue();

    int getTotalUserByRole(String role);

    int getTotalMenus();

    int getCompletedPercent();

    int getPendingPercent();

    int getCancelledPercent();

    int countOrdersByStatus(String status);
}