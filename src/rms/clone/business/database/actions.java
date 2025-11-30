/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.business.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *
 * @author ian
 */
public class actions {
    private static final String DB_URL = "jdbc:mysql://192.168.1.100:3306/rms_clone";
    private static final String DB_USER = "ideuser";
    private static final String DB_PASSWORD = "idepasswd123";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}

