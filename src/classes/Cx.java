/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.util.Date;
    import java.util.List;
import java.sql.*;


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
    public Double currentCredits;

    public Cx() {
    }

    
    
    public Cx(ResultSet rs) throws SQLException {
   this.clearAllFields();

    this.id = rs.getInt("id");
    this.prefix = rs.getString("prefix");
    this.firstName = rs.getString("firstName");
    this.middleName = rs.getString("middleName");
    this.lastName = rs.getString("lastName");
    this.suffix = rs.getString("suffix");
    this.email = rs.getString("email");
    this.emailNotProvided = rs.getBoolean("emailNotProvided");
    this.ssn = rs.getString("ssn");
    this.birthDate = rs.getDate("birthDate");
    this.dlNumber = rs.getString("dlNumber");
    this.dlState = rs.getString("dlState");
    this.dlExp = rs.getDate("dlExp");
    this.contactPhone1 = rs.getString("contactPhone1");
    this.contactPhone2 = rs.getString("contactPhone2");
    this.contactPhone3 = rs.getString("contactPhone3");
    this.streetNumber = rs.getString("streetNumber");
    this.streetName = rs.getString("streetName");
    this.addressLine2 = rs.getString("addressLine2");
    this.city = rs.getString("city");
    this.state = rs.getString("state");
    this.zip = rs.getString("zip");
    this.employer = rs.getString("employer");

    // These fields exist in your earlier constructor signature—set them if your table has them:
    // (Only keep lines that match real DB column names)
    this.isNvp = rs.getBoolean("isNvp");
    this.assignToBusinessAccount = rs.getBoolean("assignToBusinessAccount");
    this.attachToHierarchy = rs.getBoolean("attachToHierarchy");

    this.accountType = rs.getString("accountType");
    this.creditSsn = rs.getString("creditSsn");
    this.creditClass = rs.getString("creditClass");
    this.approvedLines = rs.getInt("approvedLines");
    this.lastDateChecked = rs.getDate("lastDateChecked");
    this.typeOfAccount = rs.getString("typeOfAccount");
    this.accountNumber = rs.getString("account_number");
    this.currentCredits = rs.getDouble("current_credits");

    // Optional nullable numeric/boolean fields:
    Integer dp = (Integer) rs.getObject("downpay_perc");
    this.downpayPerc = dp;

    Boolean dn = (Boolean) rs.getObject("downpayment_needed");
    this.downpaymentNeeded = dn;
}

    
    
    public Cx(int id, String prefix, String firstName, String middleName, String lastName, String suffix, String email, boolean emailNotProvided, String ssn, Date birthDate, String dlNumber, String dlState, Date dlExp, String contactPhone1, String contactPhone2, String contactPhone3, String streetNumber, String streetName, String addressLine2, String city, String state, String zip, String employer, boolean isNvp, boolean assignToBusinessAccount, boolean attachToHierarchy, String accountType, String creditSsn, String creditClass, int approvedLines, Date lastDateChecked, String typeOfAccount, String accountNumber, Integer downpayPerc, Boolean downpaymentNeeded, double currentCredits) {
        this.id = id;
        this.prefix = prefix;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.suffix = suffix;
        this.email = email;
        this.emailNotProvided = emailNotProvided;
        this.ssn = ssn;
        this.birthDate = birthDate;
        this.dlNumber = dlNumber;
        this.dlState = dlState;
        this.dlExp = dlExp;
        this.contactPhone1 = contactPhone1;
        this.contactPhone2 = contactPhone2;
        this.contactPhone3 = contactPhone3;
        this.streetNumber = streetNumber;
        this.streetName = streetName;
        this.addressLine2 = addressLine2;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.employer = employer;
        this.isNvp = isNvp;
        this.assignToBusinessAccount = assignToBusinessAccount;
        this.attachToHierarchy = attachToHierarchy;
        this.accountType = accountType;
        this.creditSsn = creditSsn;
        this.creditClass = creditClass;
        this.approvedLines = approvedLines;
        this.lastDateChecked = lastDateChecked;
        this.typeOfAccount = typeOfAccount;
        this.accountNumber = accountNumber;
        this.downpayPerc = downpayPerc;
        this.downpaymentNeeded = downpaymentNeeded;
        this.currentCredits = currentCredits;
    }


    
    
    
    
    
    public Double getCurrentCredits() {
        return currentCredits;
    }

    /* ================= GETTERS / SETTERS ================= */
    public void setCurrentCredits(Double currentCredits) {
        this.currentCredits = currentCredits;
    }

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
