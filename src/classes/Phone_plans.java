/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author ianschrauth
 */


public class Phone_plans {

    private int planId;
    private String planName;
    private String planDescription;

    private boolean isActive;

    private boolean isUnlimitedTalkMins;
    private Integer maxNumTalkMins;

    private boolean isUnlimitedTexts;
    private Integer maxNumTexts;

    private boolean isUnlimitedData;
    private Integer maxDataGb;

    private boolean isUnlimitedPriorityData;
    private Integer maxPriorityDataGb;

    private boolean isPrepaid;
    private boolean isPostpaid;

    private String typeOfDevice;

    // Constructors
    public Phone_plans() {}

    public Phone_plans(int planId, String planName, String planDescription, boolean isActive, boolean isUnlimitedTalkMins, Integer maxNumTalkMins, boolean isUnlimitedTexts, Integer maxNumTexts, boolean isUnlimitedData, Integer maxDataGb, boolean isUnlimitedPriorityData, Integer maxPriorityDataGb, boolean isPrepaid, boolean isPostpaid, String typeOfDevice) {
        this.planId = planId;
        this.planName = planName;
        this.planDescription = planDescription;
        this.isActive = isActive;
        this.isUnlimitedTalkMins = isUnlimitedTalkMins;
        this.maxNumTalkMins = maxNumTalkMins;
        this.isUnlimitedTexts = isUnlimitedTexts;
        this.maxNumTexts = maxNumTexts;
        this.isUnlimitedData = isUnlimitedData;
        this.maxDataGb = maxDataGb;
        this.isUnlimitedPriorityData = isUnlimitedPriorityData;
        this.maxPriorityDataGb = maxPriorityDataGb;
        this.isPrepaid = isPrepaid;
        this.isPostpaid = isPostpaid;
        this.typeOfDevice = typeOfDevice;
    }
    
    
    
    

    // Getters and Setters

    public int getPlanId() {
        return planId;
    }

    public void setPlanId(int planId) {
        this.planId = planId;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public String getPlanDescription() {
        return planDescription;
    }

    public void setPlanDescription(String planDescription) {
        this.planDescription = planDescription;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public boolean isUnlimitedTalkMins() {
        return isUnlimitedTalkMins;
    }

    public void setIfUnlimitedTalkMins(boolean unlimitedTalkMins) {
        isUnlimitedTalkMins = unlimitedTalkMins;
    }

    public Integer getMaxNumTalkMins() {
        return maxNumTalkMins;
    }

    public void setMaxNumTalkMins(Integer maxNumTalkMins) {
        this.maxNumTalkMins = maxNumTalkMins;
    }

    public boolean isUnlimitedTexts() {
        return isUnlimitedTexts;
    }

    public void setIfUnlimitedTexts(boolean unlimitedTexts) {
        isUnlimitedTexts = unlimitedTexts;
    }

    public Integer getMaxNumTexts() {
        return maxNumTexts;
    }

    public void setMaxNumTexts(Integer maxNumTexts) {
        this.maxNumTexts = maxNumTexts;
    }

    public boolean isIfHasUnlimitedData() {
        return isUnlimitedData;
    }

    public void setIfUnlimitedData(boolean unlimitedData) {
        isUnlimitedData = unlimitedData;
    }

    public Integer getMaxDataGb() {
        return maxDataGb;
    }

    public void setMaxDataGb(Integer maxDataGb) {
        this.maxDataGb = maxDataGb;
    }

    public boolean isUnlimitedPriorityData() {
        return isUnlimitedPriorityData;
    }

    public void setIfUnlimitedPriorityData(boolean unlimitedPriorityData) {
        isUnlimitedPriorityData = unlimitedPriorityData;
    }

    public Integer getMaxPriorityDataGb() {
        return maxPriorityDataGb;
    }

    public void setMaxPriorityDataGb(Integer maxPriorityDataGb) {
        this.maxPriorityDataGb = maxPriorityDataGb;
    }

    public boolean isPrepaid() {
        return isPrepaid;
    }

    public void setPrepaid(boolean prepaid) {
        isPrepaid = prepaid;
    }

    public boolean isPostpaid() {
        return isPostpaid;
    }

    public void setPostpaid(boolean postpaid) {
        isPostpaid = postpaid;
    }

    public String getTypeOfDevice() {
        return typeOfDevice;
    }

    public void setTypeOfDevice(String typeOfDevice) {
        this.typeOfDevice = typeOfDevice;
    }
}