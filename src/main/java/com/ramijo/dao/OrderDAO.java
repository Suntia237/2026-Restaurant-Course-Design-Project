package com.ramijo.dao;

import com.ramijo.model.CartItem;
import com.ramijo.model.Order;
import com.ramijo.model.OrderLine;
import com.ramijo.model.OrderLine2;

import java.util.List;

public interface OrderDAO {

    int addOrder(Order order, List<CartItem> cartItems);

    boolean updateOrderStatus(int orderId, String status);

    List<OrderLine2> getAllPendingOrdersDetails();

    Order getOrderById(int orderId);

    List<Order> getAllOrders();

    List<Order> getOrdersByStatus(int userID, String status);

    List<Order> getOrdersByUser(int userId);

    List<OrderLine> getOrdersDetailsByUser(int userId);

    List<CartItem> getOrderItems(int orderId);
}