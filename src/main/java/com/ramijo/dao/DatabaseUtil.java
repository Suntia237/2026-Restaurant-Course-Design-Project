package com.ramijo.dao;

import java.sql.*;

public class DatabaseUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/restaurantJRM";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "1985";

    //Static segment just only run once time
    static{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Load driver successful");
        }
        catch(ClassNotFoundException e){
            System.err.println("Can not load the MySQL Database driver.");
        }
    }

    public Connection getConnection(){
        Connection conn = null;
        try{
            conn = DriverManager.getConnection(URL,USER_NAME,PASSWORD);
        }
        catch (SQLException e){
            System.err.println("Can not get a connection from database");
        }
        return conn;
    }

    // release (close) the JDBC connection
    //Result set
    public void close(ResultSet rs){
        if(rs!=null){
            try{
                if(!rs.isClosed())
                    rs.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }
            finally {
                try{
                    rs.close();
                }
                catch (SQLException e){
                    e.printStackTrace();
                }
            }
        }
    }

    //Result set, Statement and connection
    public void close(Connection conn, Statement stmt, ResultSet rs){
        if(rs!=null){
            try{
                if(!rs.isClosed())
                    rs.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }
            finally {
                try{
                    rs.close();
                }
                catch (SQLException e){
                    e.printStackTrace();
                }
            }
        }
        this.close(conn,stmt);
    }

    // Statement and Connection
    public void close(Connection conn, Statement stmt){
        if(stmt!=null){
            try{
                if(!stmt.isClosed())
                    stmt.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }
            finally {
                try{
                    stmt.close();
                }
                catch (SQLException e){
                    e.printStackTrace();
                }
            }
        }
        this.close(conn);
    }

    //Connection only "last step"
    private void close(Connection conn){
        if(conn!=null){
            try{
                if(!conn.isClosed())
                    conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }
            finally {
                try{
                    conn.close();
                }
                catch (SQLException e){
                    e.printStackTrace();
                }
            }
        }
    }

}


