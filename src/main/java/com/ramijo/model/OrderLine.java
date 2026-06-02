package com.ramijo.model;

import java.util.Date;
import java.util.List;

public class OrderLine {
    private int order_id;
    private List<String> menu_img;
    private int item_count;
    private int total;
    private Date date;

    public OrderLine() {
    }

    public OrderLine(int order_id, List<String> menu_img, int item_count, int total, Date date) {
        this.order_id = order_id;
        this.menu_img = menu_img;
        this.item_count = item_count;
        this.total = total;
        this.date = date;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public List<String> getMenu_img() {
        return menu_img;
    }

    public void setMenu_img(List<String> menu_img) {
        this.menu_img = menu_img;
    }

    public int getItem_count() {
        return item_count;
    }

    public void setItem_count(int item_count) {
        this.item_count = item_count;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "OrderLine{" +
                "order_id=" + order_id +
                ", menu_img=" + menu_img +
                ", item_count=" + item_count +
                ", total=" + total +
                ", date=" + date +
                '}';
    }
}
