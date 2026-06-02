package com.ramijo.dao;

import com.ramijo.model.CartItem;
import com.ramijo.model.Order;

import java.util.List;

public interface PayDAO {

    boolean addPayCheck(int orderID, String payMethod);

    boolean updateOrderStatus(int orderId, String status);

    Order getOrderById(int orderId);

    List<Order> getAllOrders();

    List<Order> getOrdersByStatus(String status);

    List<Order> getOrdersByUser(int userId);

    List<CartItem> getOrderItems(int orderId);
}