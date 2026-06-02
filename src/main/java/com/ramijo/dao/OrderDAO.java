package com.ramijo.dao;

import com.ramijo.model.CartItem;
import com.ramijo.model.Order;

import java.util.List;

public interface OrderDAO {

    int addOrder(Order order, List<CartItem> cartItems);

    boolean updateOrderStatus(int orderId, String status);

    List<Order> getAllOrders();

    List<Order> getOrdersByStatus(String status);
}