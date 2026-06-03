package com.ramijo.model;

public class Payment {
    private int pay_id;
    private int order_id;
    private int total;
    private String pay_method;
    private String status;

    public void Payment() {
    }

    public void Payment(int pay_id, int order_id, int total, String pay_method, String status) {
        this.pay_id = pay_id;
        this.order_id = order_id;
        this.total = total;
        this.pay_method = pay_method;
        this.status = status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getPay_id() {
        return pay_id;
    }

    public void setPay_id(int pay_id) {
        this.pay_id = pay_id;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getPay_method() {
        return pay_method;
    }

    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "pay_id=" + pay_id +
                ", order_id=" + order_id +
                ", total=" + total +
                ", pay_method='" + pay_method + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
