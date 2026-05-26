package com.ramijo.model;

public class OrderLine {
    private int line_id;
    private int order_id;
    private int menu_id;
    private int quantity;
    private int unit_price;
    private int sub_total;

    public OrderLine() {
    }

    public OrderLine(int line_id, int order_id, int menu_id, int quantity, int unit_price, int sub_total) {
        this.line_id = line_id;
        this.order_id = order_id;
        this.menu_id = menu_id;
        this.quantity = quantity;
        this.unit_price = unit_price;
        this.sub_total = sub_total;
    }

    public int getLine_id() {
        return line_id;
    }

    public void setLine_id(int line_id) {
        this.line_id = line_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(int unit_price) {
        this.unit_price = unit_price;
    }

    public int getSub_total() {
        return sub_total;
    }

    public void setSub_total(int sub_total) {
        this.sub_total = sub_total;
    }

    @Override
    public String toString() {
        return "OrderLine{" +
                "line_id=" + line_id +
                ", order_id=" + order_id +
                ", menu_id=" + menu_id +
                ", quantity=" + quantity +
                ", unit_price=" + unit_price +
                ", sub_total=" + sub_total +
                '}';
    }
}
