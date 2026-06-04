package com.ramijo.model;

import java.util.Date;
import java.util.List;

public class OrderLine2 {
//    I use it to collect orders info for the admin
    private int order_id;
    private String customerName;
    private String tableNumber;
    private List<AdminCartItem> items;
    private int totalAmount;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getTableNumber() {
        return tableNumber;
    }

    public void setTableNumber(String tableNumber) {
        this.tableNumber = tableNumber;
    }

    public List<AdminCartItem> getItems() {
        return items;
    }

    public void setItems(List<AdminCartItem> items) {
        this.items = items;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "OrderLine2{" +
                "order_id=" + order_id +
                ", customerName='" + customerName + '\'' +
                ", tableNumber='" + tableNumber + '\'' +
                ", items=" + items +
                ", totalAmount=" + totalAmount +
                '}';
    }
}
