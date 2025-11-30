/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author ianschrauth
 */
import java.sql.Date;

public class Agents {
    private int pid;
    private String agentFname;
    private String agentLname;
    private String agentPosition;
    private String companyEmail;
    private String passwordToRms;
    private boolean isContractor;
    private boolean isActiveInPayroll;
    private Date hireDate;
    private boolean isManager;
    private boolean isLeadership;
    private boolean canAccessRmsLite;
    private boolean isFranchiseEmployee;

    // Getters and Setters
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getAgentFname() {
        return agentFname;
    }

    public void setAgentFname(String agentFname) {
        this.agentFname = agentFname;
    }

    public String getAgentLname() {
        return agentLname;
    }

    public void setAgentLname(String agentLname) {
        this.agentLname = agentLname;
    }

    public String getAgentPosition() {
        return agentPosition;
    }

    public void setAgentPosition(String agentPosition) {
        this.agentPosition = agentPosition;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public String getPasswordToRms() {
        return passwordToRms;
    }

    public void setPasswordToRms(String passwordToRms) {
        this.passwordToRms = passwordToRms;
    }

    public boolean isContractor() {
        return isContractor;
    }

    public void setContractor(boolean isContractor) {
        this.isContractor = isContractor;
    }

    public boolean isActiveInPayroll() {
        return isActiveInPayroll;
    }

    public void setActiveInPayroll(boolean isActiveInPayroll) {
        this.isActiveInPayroll = isActiveInPayroll;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public boolean isManager() {
        return isManager;
    }

    public void setManager(boolean isManager) {
        this.isManager = isManager;
    }

    public boolean isLeadership() {
        return isLeadership;
    }

    public void setLeadership(boolean isLeadership) {
        this.isLeadership = isLeadership;
    }

    public boolean canAccessRmsLite() {
        return canAccessRmsLite;
    }

    public void setCanAccessRmsLite(boolean canAccessRmsLite) {
        this.canAccessRmsLite = canAccessRmsLite;
    }

    public boolean isFranchiseEmployee() {
        return isFranchiseEmployee;
    }

    public void setFranchiseEmployee(boolean isFranchiseEmployee) {
        this.isFranchiseEmployee = isFranchiseEmployee;
    }
}

