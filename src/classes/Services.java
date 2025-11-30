/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import rms.clone.main.business.vars;

public class Services {

    // Fields matching `services` table
    private int serviceId;
    private boolean isActive;
    private Timestamp createdAt;
    private String serviceName;
    private String serviceDesc;
    private Boolean requiresSupervisorApproval; // nullable

    
    // for searching only
       private String serviceType;
       
    
    
    
    // Fields from `customer_services_list`
    private Timestamp effectiveDate;
    private Date falloffDate;
    private Integer pidOfAddedUser;
    private Double costPerMonth;

    // Empty constructor
    public Services() {}

    // Full constructor
    public Services(int serviceId,
                    boolean isActive,
                    Timestamp createdAt,
                    String serviceName,
                    String serviceDesc,
                    Boolean requiresSupervisorApproval,
                    Timestamp effectiveDate,
                    Date falloffDate,
                    Integer pidOfAddedUser,
                    Double costPerMonth) {

        this.serviceId = serviceId;
        this.isActive = isActive;
        this.createdAt = createdAt;
        this.serviceName = serviceName;
        this.serviceDesc = serviceDesc;
        this.requiresSupervisorApproval = requiresSupervisorApproval;

        this.effectiveDate = effectiveDate;
        this.falloffDate = falloffDate;
        this.pidOfAddedUser = pidOfAddedUser;
        this.costPerMonth = costPerMonth;
    }
    
    
    
    
    public Services(Boolean isEnabled, String title, String type, String desc, double price) {
        this.costPerMonth = price;
        this.isActive = isEnabled;
        this.serviceDesc = desc;
        this.serviceName = title;
        this.serviceType = type;
    }

    // ----------- Getters & Setters ------------

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    
    
    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceDesc() {
        return serviceDesc;
    }

    public void setServiceDesc(String serviceDesc) {
        this.serviceDesc = serviceDesc;
    }

    public Boolean getRequiresSupervisorApproval() {
        return requiresSupervisorApproval;
    }

    public void setRequiresSupervisorApproval(Boolean requiresSupervisorApproval) {
        this.requiresSupervisorApproval = requiresSupervisorApproval;
    }

    public Timestamp getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(Timestamp effectiveDate) {
        this.effectiveDate = effectiveDate;
    }

    public Date getFalloffDate() {
        return falloffDate;
    }

    public void setFalloffDate(Date falloffDate) {
        this.falloffDate = falloffDate;
    }

    public Integer getPidOfAddedUser() {
        return pidOfAddedUser;
    }

    public void setPidOfAddedUser(Integer pidOfAddedUser) {
        this.pidOfAddedUser = pidOfAddedUser;
    }

    public Double getCostPerMonth() {
        return costPerMonth;
    }

    public void setCostPerMonth(Double costPerMonth) {
        this.costPerMonth = costPerMonth;
    }

    // ---------- Static DB Lookup Method ----------

    public static Services selectServiceById(int serviceId) {
        Services svc = null;

        String sql =
            "SELECT s.service_id, s.is_active, s.created_at, " +
            "       s.service_name, s.service_desc, s.requires_supervisor_approval, " +
            "       csl.associated_service_effective_date, " +
            "       csl.associated_service_falloff_date, " +
            "       csl.pid_of_added_user, " +
            "       csl.cost_per_month " +
            "FROM services s " +
            "LEFT JOIN customer_services_list csl " +
            "  ON s.service_id = csl.associated_service_id " +
            "WHERE s.service_id = ?";

        try (PreparedStatement stmt = vars.conn.prepareStatement(sql)) {
            stmt.setInt(1, serviceId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                svc = new Services();

                // Base service fields
                svc.setServiceId(rs.getInt("service_id"));
                svc.setActive(rs.getBoolean("is_active"));
                svc.setCreatedAt(rs.getTimestamp("created_at"));
                svc.setServiceName(rs.getString("service_name"));
                svc.setServiceDesc(rs.getString("service_desc"));

                Object sup = rs.getObject("requires_supervisor_approval");
                svc.setRequiresSupervisorApproval(
                    sup != null ? rs.getBoolean("requires_supervisor_approval") : null
                );

                // Customer service list fields
                svc.setEffectiveDate(rs.getTimestamp("associated_service_effective_date"));
                svc.setFalloffDate(rs.getDate("associated_service_falloff_date"));

                Object pidObj = rs.getObject("pid_of_added_user");
                svc.setPidOfAddedUser(pidObj != null ? rs.getInt("pid_of_added_user") : null);

                Object costObj = rs.getObject("cost_per_month");
                svc.setCostPerMonth(costObj != null ? rs.getDouble("cost_per_month") : null);
            }

            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(Services.class.getName()).log(Level.SEVERE, null, ex);
        }

        return svc;
    }
}
