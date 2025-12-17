/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author ischrauth
 */
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import rms.clone.main.business.vars;

public class Alerts {

    // Fields matching the database
    private int alertId;
    private String assignedToGroup;
    private String alertTitle;
    private String alertDesc;
    private boolean isActive;
    private Timestamp datetimeAdded;

    // Empty constructor
    public Alerts() {}

    // Full constructor
    public Alerts(int alertId, String assignedToGroup, String alertTitle, String alertDesc, boolean isActive, Timestamp datetimeAdded) {
        this.alertId = alertId;
        this.assignedToGroup = assignedToGroup;
        this.alertTitle = alertTitle;
        this.alertDesc = alertDesc;
        this.isActive = isActive;
        this.datetimeAdded = datetimeAdded;
    }

    // Getters and Setters
    public int getAlertId() {
        return alertId;
    }

    public void setAlertId(int alertId) {
        this.alertId = alertId;
    }

    public String getAssignedToGroup() {
        return assignedToGroup;
    }

    public void setAssignedToGroup(String assignedToGroup) {
        this.assignedToGroup = assignedToGroup;
    }

    public String getAlertTitle() {
        return alertTitle;
    }

    public void setAlertTitle(String alertTitle) {
        this.alertTitle = alertTitle;
    }

    public String getAlertDesc() {
        return alertDesc;
    }

    public void setAlertDesc(String alertDesc) {
        this.alertDesc = alertDesc;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public Timestamp getDatetimeAdded() {
        return datetimeAdded;
    }

    public void setDatetimeAdded(Timestamp datetimeAdded) {
        this.datetimeAdded = datetimeAdded;
    }

    // Static Methods (Database Operations)

  public static Alerts selectAlertById(int alertId) {
        Alerts alert = null;
        try {
            PreparedStatement stmt = vars.conn.prepareStatement("SELECT * FROM customer_alerts WHERE alert_id = ?");
            stmt.setInt(1, alertId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                alert = new Alerts();
                alert.setAlertId(rs.getInt("alert_id"));
                alert.setAlertTitle(rs.getString("alert_title"));
                alert.setAlertDesc(rs.getString("alert_desc"));
                alert.setActive(rs.getBoolean("is_active"));
                alert.setDatetimeAdded(rs.getTimestamp("datetime_added"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Alerts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return alert;
    }

    
}
