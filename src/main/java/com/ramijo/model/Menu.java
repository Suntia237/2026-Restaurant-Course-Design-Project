package com.ramijo.model;

public class Menu {
    private int menu_id;
    private String menu_name;
    private int unit_price;
    private String category;

    public Menu() {
    }

    public Menu(int menu_id, String menu_name, int unit_price, String category) {
        this.menu_id = menu_id;
        this.menu_name = menu_name;
        this.unit_price = unit_price;
        this.category = category;
    }

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public int getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(int unit_price) {
        this.unit_price = unit_price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "menu_id=" + menu_id +
                ", menu_name='" + menu_name + '\'' +
                ", unit_price=" + unit_price +
                ", category='" + category + '\'' +
                '}';
    }
}
