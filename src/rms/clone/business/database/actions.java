/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.business.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import rms.clone.vars.*;


/**
 *
 * @author ian
 */
public class actions {
 

    public static Connection getConnection() throws SQLException {
        
        return DriverManager.getConnection(db.DB_URL + db.DB_NAME, db.DB_USER, db.DB_PASSWORD);
    }
}

