/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.UI.submain;

/**
 *
 * @author ianschrauth
 */
import java.awt.Component;
import javax.swing.JOptionPane;
import java.sql.*;
import rms.clone.main.business.vars;

public class StolenDevicePopup {

           public static String accountNumber = "";

    public static void showDeviceCheck() {
        Component frame = null;
        

        int choice = JOptionPane.showConfirmDialog(
                null,
                "Does this device seem like it is stolen?",
                "Device Check",
                JOptionPane.YES_NO_OPTION,
                JOptionPane.QUESTION_MESSAGE
        );

        if (choice == JOptionPane.YES_OPTION) {
            try {
                String SQL = "update customer_info set requires_fraud_investigation=true where account_number=?;";
                
                PreparedStatement ps = vars.conn.prepareStatement(SQL);
                ps.setString(1, accountNumber);
                int rs = ps.executeUpdate();
                JOptionPane.showMessageDialog(
                        null,
                        "Please deny the sale and warm transfer the customer to Fraud and Abuse.",
                        "Sale Denied",
                        JOptionPane.WARNING_MESSAGE
                );
            } catch (SQLException ex) {
                System.getLogger(StolenDevicePopup.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
            }


        } else if (choice == JOptionPane.NO_OPTION) {
            System.out.println("No code");
        }
    }
}