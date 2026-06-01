package com.ramijo.dao;

import com.ramijo.dao.DatabaseUtil;

import java.sql.Connection;

public class Main {

    public static void main(String[] args) {

        DatabaseUtil databaseUtil = new DatabaseUtil();
        Connection connection = null;

        try {

            connection = databaseUtil.getConnection();

            if (connection != null) {

                System.out.println("=================================");
                System.out.println("DATABASE CONNECTION SUCCESSFUL");
                System.out.println("Database : " + connection.getCatalog());
                System.out.println("=================================");

            } else {

                System.out.println("=================================");
                System.out.println("DATABASE CONNECTION FAILED");
                System.out.println("=================================");

            }

        } catch (Exception e) {

            System.out.println("Error while connecting to database");
            e.printStackTrace();

        } finally {

            try {

                if (connection != null && !connection.isClosed()) {
                    connection.close();
                    System.out.println("Connection closed successfully.");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

}
