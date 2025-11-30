/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author ianschrauth
 */

import java.sql.Timestamp;

public class phoneNumbers {
    private int id;
    private String assignedToGroupId;
    private String typeOfLine;
    private String phoneNumber;
    private Timestamp dateTimeAddedToAcct;
    private String callerIdFname;
    private String callerIdLname;
    private boolean isUnlimitedTalk;
    private boolean isUnlimitedText;
    private boolean isUnlimitedData;
    private int ammtOfPriorityDataGb;
    private String planName;
    private int planCode;
    private boolean canInbound;
    private boolean canOutbound;
    private boolean isForwardingCalls;
    private String forwardCallsNumber;
    private String assignedServiceIdsCsv;
    private Boolean isActive;
    

    public phoneNumbers() {}

    // --- Getters and Setters ---

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAssignedToGroupId() {
        return assignedToGroupId;
    }

    public void setAssignedToGroupId(String assignedToGroupId) {
        this.assignedToGroupId = assignedToGroupId;
    }

    public String getTypeOfLine() {
        return typeOfLine;
    }

    public void setTypeOfLine(String typeOfLine) {
        this.typeOfLine = typeOfLine;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Timestamp getDateTimeAddedToAcct() {
        return dateTimeAddedToAcct;
    }

    public void setDateTimeAddedToAcct(Timestamp dateTimeAddedToAcct) {
        this.dateTimeAddedToAcct = dateTimeAddedToAcct;
    }

    public String getCallerIdFname() {
        return callerIdFname;
    }

    public void setCallerIdFname(String callerIdFname) {
        this.callerIdFname = callerIdFname;
    }

    public String getCallerIdLname() {
        return callerIdLname;
    }

    public void setCallerIdLname(String callerIdLname) {
        this.callerIdLname = callerIdLname;
    }

    public boolean isUnlimitedTalk() {
        return isUnlimitedTalk;
    }

    public void setUnlimitedTalk(boolean isUnlimitedTalk) {
        this.isUnlimitedTalk = isUnlimitedTalk;
    }

    public boolean isUnlimitedText() {
        return isUnlimitedText;
    }

    public void setUnlimitedText(boolean isUnlimitedText) {
        this.isUnlimitedText = isUnlimitedText;
    }

    public boolean isUnlimitedData() {
        return isUnlimitedData;
    }

    public void setUnlimitedData(boolean isUnlimitedData) {
        this.isUnlimitedData = isUnlimitedData;
    }

    public int getAmmtOfPriorityDataGb() {
        return ammtOfPriorityDataGb;
    }

    public void setAmmtOfPriorityDataGb(int ammtOfPriorityDataGb) {
        this.ammtOfPriorityDataGb = ammtOfPriorityDataGb;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public int getPlanCode() {
        return planCode;
    }

    public void setPlanCode(int planCode) {
        this.planCode = planCode;
    }

    public boolean isCanInbound() {
        return canInbound;
    }

    public void setCanInbound(boolean canInbound) {
        this.canInbound = canInbound;
    }

    public boolean isCanOutbound() {
        return canOutbound;
    }

    public void setCanOutbound(boolean canOutbound) {
        this.canOutbound = canOutbound;
    }

    public boolean isForwardingCalls() {
        return isForwardingCalls;
    }

    public void setForwardingCalls(boolean isForwardingCalls) {
        this.isForwardingCalls = isForwardingCalls;
    }

    public String getForwardCallsNumber() {
        return forwardCallsNumber;
    }

    public void setForwardCallsNumber(String forwardCallsNumber) {
        this.forwardCallsNumber = forwardCallsNumber;
    }

    public String getAssignedServiceIdsCsv() {
        return assignedServiceIdsCsv;
    }

    public void setAssignedServiceIdsCsv(String assignedServiceIdsCsv) {
        this.assignedServiceIdsCsv = assignedServiceIdsCsv;
    }

    public boolean isIsUnlimitedTalk() {
        return isUnlimitedTalk;
    }

    public void setIsUnlimitedTalk(boolean isUnlimitedTalk) {
        this.isUnlimitedTalk = isUnlimitedTalk;
    }

    public boolean isIsUnlimitedText() {
        return isUnlimitedText;
    }

    public void setIsUnlimitedText(boolean isUnlimitedText) {
        this.isUnlimitedText = isUnlimitedText;
    }

    public boolean isIsUnlimitedData() {
        return isUnlimitedData;
    }

    public void setIsUnlimitedData(boolean isUnlimitedData) {
        this.isUnlimitedData = isUnlimitedData;
    }

    public boolean isIsForwardingCalls() {
        return isForwardingCalls;
    }

    public void setIsForwardingCalls(boolean isForwardingCalls) {
        this.isForwardingCalls = isForwardingCalls;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }
    
    
    
    
}
