/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.business;

import classes.Cx;
import java.sql.*;
/**
 *
 * @author ianschrauth
 */
public class vars {
    
    
    public static boolean isLoggedIn = false;
    public static String loggedInUID = "";
    public static String timeLoggedIn = ""; 
    public static Connection conn;
    public static String typeOfSelectedAccount = "";
    public static Cx selectedCx;
    public static boolean hasManagerAuth = false;
    public static String currentOrderNumber = "";
    
}
