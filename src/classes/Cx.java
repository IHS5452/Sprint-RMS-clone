/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.util.Date;
    import java.util.List;


/**
 *
 * @author ischrauth
 */

public class Cx {

    private int id;

    private String prefix;
    private String firstName;
    private String middleName;
    private String lastName;
    private String suffix;
    private String email;
    private boolean emailNotProvided;
    private String ssn;
    private Date birthDate;

    private String dlNumber;
    private String dlState;
    private Date dlExp;

    private String contactPhone1;
    private String contactPhone2;
    private String contactPhone3;

    private String streetNumber;
    private String streetName;
    private String addressLine2;
    private String city;
    private String state;
    private String zip;

    private String employer;
    private boolean isNvp;
    private boolean assignToBusinessAccount;
    private boolean attachToHierarchy;

    private String accountType;
    private String creditSsn;
    private String creditClass;
    private int approvedLines;
    private Date lastDateChecked;

    private String typeOfAccount;
    private String accountNumber;
    private Integer downpayPerc;
    private Boolean downpaymentNeeded;

    public Cx() {
    }

    /* ================= GETTERS / SETTERS ================= */

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isEmailNotProvided() {
        return emailNotProvided;
    }

    public void setEmailNotProvided(boolean emailNotProvided) {
        this.emailNotProvided = emailNotProvided;
    }

    public String getSsn() {
        return ssn;
    }

    public void setSsn(String ssn) {
        this.ssn = ssn;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getDlNumber() {
        return dlNumber;
    }

    public void setDlNumber(String dlNumber) {
        this.dlNumber = dlNumber;
    }

    public String getDlState() {
        return dlState;
    }

    public void setDlState(String dlState) {
        this.dlState = dlState;
    }

    public Date getDlExp() {
        return dlExp;
    }

    public void setDlExp(Date dlExp) {
        this.dlExp = dlExp;
    }

    public String getContactPhone1() {
        return contactPhone1;
    }

    public void setContactPhone1(String contactPhone1) {
        this.contactPhone1 = contactPhone1;
    }

    public String getContactPhone2() {
        return contactPhone2;
    }

    public void setContactPhone2(String contactPhone2) {
        this.contactPhone2 = contactPhone2;
    }

    public String getContactPhone3() {
        return contactPhone3;
    }

    public void setContactPhone3(String contactPhone3) {
        this.contactPhone3 = contactPhone3;
    }

    public String getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(String streetNumber) {
        this.streetNumber = streetNumber;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getEmployer() {
        return employer;
    }

    public void setEmployer(String employer) {
        this.employer = employer;
    }

    public boolean isNvp() {
        return isNvp;
    }

    public void setNvp(boolean nvp) {
        isNvp = nvp;
    }

    public boolean isAssignToBusinessAccount() {
        return assignToBusinessAccount;
    }

    public void setAssignToBusinessAccount(boolean assignToBusinessAccount) {
        this.assignToBusinessAccount = assignToBusinessAccount;
    }

    public boolean isAttachToHierarchy() {
        return attachToHierarchy;
    }

    public void setAttachToHierarchy(boolean attachToHierarchy) {
        this.attachToHierarchy = attachToHierarchy;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public String getCreditSsn() {
        return creditSsn;
    }

    public void setCreditSsn(String creditSsn) {
        this.creditSsn = creditSsn;
    }

    public String getCreditClass() {
        return creditClass;
    }

    public void setCreditClass(String creditClass) {
        this.creditClass = creditClass;
    }

    public int getApprovedLines() {
        return approvedLines;
    }

    public void setApprovedLines(int approvedLines) {
        this.approvedLines = approvedLines;
    }

    public Date getLastDateChecked() {
        return lastDateChecked;
    }

    public void setLastDateChecked(Date lastDateChecked) {
        this.lastDateChecked = lastDateChecked;
    }

    public String getTypeOfAccount() {
        return typeOfAccount;
    }

    public void setTypeOfAccount(String typeOfAccount) {
        this.typeOfAccount = typeOfAccount;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public Integer getDownpayPerc() {
        return downpayPerc;
    }

    public void setDownpayPerc(Integer downpayPerc) {
        this.downpayPerc = downpayPerc;
    }

    public Boolean getDownpaymentNeeded() {
        return downpaymentNeeded;
    }

    public void setDownpaymentNeeded(Boolean downpaymentNeeded) {
        this.downpaymentNeeded = downpaymentNeeded;
    }

    /* ================= UTIL ================= */

   public static Cx retainOnlyMatching(List<Cx> cxList, String groupIdToKeep) {
    for (Cx cx : cxList) {
        String groupId = cx.getAccountNumber();

        boolean matchesGroupId = groupIdToKeep != null && groupIdToKeep.equals(groupId);

        if (matchesGroupId) {
            System.out.println(cx.getEmail());
            return cx; // return the matching Cx
        }
    }
    return null; // return null if no match is found
}
    public void clearAllFields() {
        prefix = null;
        firstName = null;
        middleName = null;
        lastName = null;
        suffix = null;
        email = null;
        emailNotProvided = false;
        ssn = null;
        birthDate = null;
        dlNumber = null;
        dlState = null;
        dlExp = null;
        contactPhone1 = null;
        contactPhone2 = null;
        contactPhone3 = null;
        streetNumber = null;
        streetName = null;
        addressLine2 = null;
        city = null;
        state = null;
        zip = null;
        employer = null;
        isNvp = false;
        assignToBusinessAccount = false;
        attachToHierarchy = false;
        accountType = null;
        creditSsn = null;
        creditClass = null;
        approvedLines = 0;
        lastDateChecked = null;
        typeOfAccount = null;
        accountNumber = null;
        downpayPerc = null;
        downpaymentNeeded = null;
    }
    
    
}
