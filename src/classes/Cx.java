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
    private String typeOfAccount; // ENUM type as String
    private String groupId;

    public Cx() {
    }

    public Cx(String prefix, String firstName, String middleName, String lastName, String suffix, String email, boolean emailNotProvided, String ssn, Date birthDate, String dlNumber, String dlState, Date dlExp, String contactPhone1, String contactPhone2, String contactPhone3, String streetNumber, String streetName, String addressLine2, String city, String state, String zip, String employer, boolean isNvp, boolean assignToBusinessAccount, boolean attachToHierarchy, String accountType, String creditSsn, String creditClass, int approvedLines, Date lastDateChecked, String typeOfAccount, String groupId) {
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
        this.groupId = groupId;
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

    public boolean isIsNvp() {
        return isNvp;
    }

    public void setIsNvp(boolean isNvp) {
        this.isNvp = isNvp;
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

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }
    


   public static Cx retainOnlyMatching(List<Cx> cxList, String groupIdToKeep) {
    for (Cx cx : cxList) {
        String groupId = cx.getGroupId();

        boolean matchesGroupId = groupIdToKeep != null && groupIdToKeep.equals(groupId);

        if (matchesGroupId) {
            System.out.println(cx.getEmail());
            return cx; // return the matching Cx
        }
    }
    return null; // return null if no match is found
}

public void clearAllFields() {
    this.prefix = null;
    this.firstName = null;
    this.middleName = null;
    this.lastName = null;
    this.suffix = null;
    this.email = null;
    this.emailNotProvided = false;
    this.ssn = null;
    this.birthDate = null;
    this.dlNumber = null;
    this.dlState = null;
    this.dlExp = null;
    this.contactPhone1 = null;
    this.contactPhone2 = null;
    this.contactPhone3 = null;
    this.streetNumber = null;
    this.streetName = null;
    this.addressLine2 = null;
    this.city = null;
    this.state = null;
    this.zip = null;
    this.employer = null;
    this.isNvp = false;
    this.assignToBusinessAccount = false;
    this.attachToHierarchy = false;
    this.accountType = null;
    this.creditSsn = null;
    this.creditClass = null;
    this.approvedLines = 0;
    this.lastDateChecked = null;
    this.typeOfAccount = null;
    this.groupId = null;
}

    
    
    
}
