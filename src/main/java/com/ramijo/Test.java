package com.ramijo;

import com.ramijo.dao.*;
import com.ramijo.model.Menu;
import com.ramijo.model.OrderLine;
import com.ramijo.model.User;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAOImpl();
        List<OrderLine> orderLines = new ArrayList<OrderLine>();

        orderLines = orderDAO.getOrdersDetailsByUser(6);
        for(OrderLine o : orderLines)
            System.out.println(o);
    }
}
