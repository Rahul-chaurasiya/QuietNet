
package com.net.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionProvider {
    public static Connection con;
    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Creating a connection
                String db_url = "jdbc:mysql://localhost:3306/quietnet";
                String db_uname = "root";
                String db_upass = "#Rahul123";
                con = DriverManager.getConnection(db_url, db_uname, db_upass);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
