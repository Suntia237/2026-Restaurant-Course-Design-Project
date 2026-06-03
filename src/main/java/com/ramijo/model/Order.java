package com.ramijo.model;

import java.util.Date;

public class Order {
    private int order_id;
    private int client_id;
    private String table_number;
    private Date order_date;
    private String status;
    private int total;

    public Order() {
    }

    public Order(int order_id, int client_id, String table_number, Date order_date, String status, int total) {
        this.order_id = order_id;
        this.client_id = client_id;
        this.table_number = table_number;
        this.order_date = order_date;
        this.status = status;
        this.total = total;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public String getTable_number() {
        return table_number;
    }

    public void setTable_number(String table_number) {
        this.table_number = table_number;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", client_id=" + client_id +
                ", table_number='" + table_number + '\'' +
                ", order_date=" + order_date +
                ", status='" + status + '\'' +
                ", total=" + total +
                '}';
    }
}
