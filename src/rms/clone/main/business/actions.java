/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.business;


import java.nio.file.*;
import java.sql.*;
import classes.Agents;

import classes.Cx;
import classes.phoneNumbers;
import java.awt.Component;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import rms.clone.main.UI.main.RMS_Clone_CSR;
import static rms.clone.main.UI.main.RMS_Clone_CSR.alerts_table;
import static rms.clone.main.UI.main.RMS_Clone_CSR.customer_line_table;
import static rms.clone.main.UI.main.RMS_Clone_CSR.services_table;
import static rms.clone.main.UI.main.RMS_Clone_CSR.notes_table;
import rms.clone.main.UI.submain.new_activation;

/**
 *
 * @author ianschrauth
 */
public class actions {
    
    public static Cx selectCustomerByAccountNumber(String accountNumber) {
    String SQL = "SELECT * FROM customer_info WHERE account_number = ? LIMIT 1";

    try (PreparedStatement ps = vars.conn.prepareStatement(SQL)) {
        ps.setString(1, accountNumber);

        try (ResultSet rs = ps.executeQuery()) {
            if (!rs.next()) {
                System.out.println("No customer found for account_number=" + accountNumber);
                return null;
            }

            // Build CX from DB row
            return new Cx(rs);
        }
    } catch (SQLException ex) {
        Logger.getLogger(actions.class.getName()).log(Level.SEVERE, null, ex);
        return null;
    }
}
    
    
    
    public static void clearCustomerFromRMS() {
                    DefaultTableModel model_cx_lines = (DefaultTableModel) customer_line_table.getModel();
        DefaultTableModel model_alert = (DefaultTableModel) alerts_table.getModel();
        DefaultTableModel model_services = (DefaultTableModel) services_table.getModel();
        DefaultTableModel model_notes = (DefaultTableModel) notes_table.getModel();
        
        
        
        model_cx_lines.setRowCount(0);
        model_alert.setRowCount(0);
        model_services.setRowCount(0);
        model_notes.setRowCount(0);
        
        
        
        //clear notes fields
        
      RMS_Clone_CSR.pid_entered_by_txt.setText("");
      RMS_Clone_CSR.entered_date_txt.setText("");
      RMS_Clone_CSR.note_full_txt.setText("");
      
      
      //clear services fields
      RMS_Clone_CSR.effective_date_txt.setText("");
      RMS_Clone_CSR.falloff_date_txt.setText("");
      RMS_Clone_CSR.service_desc_txt.setText("");
      RMS_Clone_CSR.service_id_txt.setText("");
      RMS_Clone_CSR.service_name_txt.setText("");
        
        
        // clear the saved cx var
        
        if (vars.selectedCx != null) {
        vars.selectedCx.clearAllFields();
            
        }
        

        
        
    }
    
    
    
    
    
    
    

      
       
    
public void incomingCall(String phoneNumber, String accountNumber) {
    
}

public static String login(String pid, String password) {
    try {
        PreparedStatement stmt = vars.conn.prepareStatement(
            "SELECT * FROM company_logins WHERE PID = ?"
        );
        stmt.setInt(1, Integer.parseInt(pid));
        ResultSet rs = stmt.executeQuery();

        if (!rs.next()) {
            // PID not found
            return classes.Strings.NO_PID;
        }

        String correctPassword = rs.getString("password_to_rms");
        if (!password.equals(correctPassword)) {
            // Password doesn't match
            return classes.Strings.PASSWD_WRONG;
        }

        Agents agent = new Agents();
        agent.setPid(rs.getInt("PID"));
        agent.setPasswordToRms(correctPassword);
        agent.setActiveInPayroll(rs.getBoolean("is_active_in_payroll"));
        agent.setFranchiseEmployee(rs.getBoolean("is_franchise_employee"));

        if (!agent.isActiveInPayroll()) {
            if (agent.isFranchiseEmployee()) {
                return classes.Strings.NOT_ACTIVE_IN_PAYROLL_FRAN;
            } else {
                return classes.Strings.NOT_ACTIVE_IN_PAYROLL_CORP;
            }
        }

        // Populate the rest of the agent's info
        agent.setAgentFname(rs.getString("agent_fname"));
        agent.setAgentLname(rs.getString("agent_lname"));
        agent.setAgentPosition(rs.getString("agent_position"));
        agent.setCompanyEmail(rs.getString("company_email"));
        agent.setContractor(rs.getBoolean("is_contractor"));
        agent.setHireDate(rs.getDate("hire_date"));
        agent.setManager(rs.getBoolean("is_manager"));
        agent.setLeadership(rs.getBoolean("is_leadership"));
        agent.setCanAccessRmsLite(rs.getBoolean("can_access_RMS_lite"));

        return classes.Strings.SUCCESS;

    } catch (SQLException e) {
        e.printStackTrace();
        return classes.Strings.GENERAL_ERROR;
    }
}




public static Cx selectCustomer(String id) {
     try {
                     Cx cx = new Cx();
                     cx.clearAllFields();
         String SQL = "SELECT * FROM customer_info WHERE id = ?";
         PreparedStatement ps = null;
         
         ps = vars.conn.prepareStatement(SQL);
         ps.setString(1, id);
         
         ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            cx.setPrefix(rs.getString("prefix"));
            cx.setFirstName(rs.getString("firstName"));
            cx.setMiddleName(rs.getString("middleName"));
            cx.setLastName(rs.getString("lastName"));
            cx.setSuffix(rs.getString("suffix"));
            cx.setEmail(rs.getString("email"));
            cx.setEmailNotProvided(rs.getBoolean("emailNotProvided"));
            cx.setSsn(rs.getString("ssn"));
            cx.setBirthDate(rs.getDate("birthDate"));
            cx.setDlNumber(rs.getString("dlNumber"));
            cx.setDlState(rs.getString("dlState"));
            cx.setDlExp(rs.getDate("dlExp"));
            cx.setContactPhone1(rs.getString("contactPhone1"));
            cx.setContactPhone2(rs.getString("contactPhone2"));
            cx.setContactPhone3(rs.getString("contactPhone3"));
            cx.setStreetNumber(rs.getString("streetNumber"));
            cx.setStreetName(rs.getString("streetName"));
            cx.setAddressLine2(rs.getString("addressLine2"));
            cx.setCity(rs.getString("city"));
            cx.setState(rs.getString("state"));
            cx.setZip(rs.getString("zip"));
            cx.setEmployer(rs.getString("employer"));
            cx.setAssignToBusinessAccount(rs.getBoolean("assignToBusinessAccount"));
            cx.setCreditSsn(rs.getString("creditSsn"));
            cx.setCreditClass(rs.getString("creditClass"));
            cx.setApprovedLines(rs.getInt("approvedLines"));
            cx.setLastDateChecked(rs.getDate("lastDateChecked"));
            cx.setAccountNumber(rs.getString("account_number")); // Add if applicable
            cx.setAccountType(rs.getString("accountType")); // Add if applicable
        }
         
         
         return cx;
         
         
     } catch (SQLException ex) {
         Logger.getLogger(actions.class.getName()).log(Level.SEVERE, null, ex);
     }
    
    return null;
}    
    
public static List<Map.Entry<phoneNumbers, Cx>> searchCustomer(
        String typeOfSearch, String phoneNumber, String accountNumber,
        String firstName, String lastName) {

    List<Map.Entry<phoneNumbers, Cx>> results = new ArrayList<>();
    String SQL = "";
    PreparedStatement ps = null;

    try {
        if (typeOfSearch == null) {
            return results;
        }

        // Normalize search type (handles "pho", "PHO ", etc.)
        String searchType = typeOfSearch.trim().toUpperCase();

        // ------------------------------
        // SEARCH BY ACCOUNT NUMBER (ACC)
        // ------------------------------
        if (searchType.equals("ACC")) {

SQL =
"SELECT " +
"  ci.id AS customer_id, " +
"  ci.prefix, ci.firstName, ci.middleName, ci.lastName, ci.suffix, " +
"  ci.email, ci.emailNotProvided, ci.ssn, ci.birthDate, " +
"  ci.dlNumber, ci.dlState, ci.dlExp, " +
"  ci.contactPhone1, ci.contactPhone2, ci.contactPhone3, " +
"  ci.streetNumber, ci.streetName, ci.addressLine2, " +
"  ci.city, ci.state, ci.zip, ci.employer, " +
"  ci.isNvp, ci.assignToBusinessAccount, ci.attachToHierarchy, " +
"  ci.accountType, ci.creditSsn, ci.creditClass, ci.approvedLines, " +
"  ci.lastDateChecked, ci.typeOfAccount, ci.account_number, " +
"  cp.id AS phone_id, " +
"  cp.type_of_line, cp.phoneNumber, " +
"  cp.date_time_added_to_acct, cp.caller_id_fname, cp.caller_id_lname, " +
"  cp.is_unlimited_talk, cp.is_unlimited_text, cp.is_unlimited_data, " +
"  cp.ammt_of_priority_data_gb, cp.plan_name, cp.plan_code, " +
"  cp.can_inbound, cp.can_outbound, cp.is_forwarding_calls, " +
"  cp.forward_calls_number, cp.assigned_service_ids_csv, cp.is_active " +
"FROM customer_info ci " +
"LEFT JOIN phone_numbers cp " +
"  ON cp.account_number = ci.account_number " +
"WHERE TRIM(ci.account_number) = TRIM(?);";

ps = vars.conn.prepareStatement(SQL);
ps.setString(1, accountNumber);

            System.out.println("Running ACC search for account " + accountNumber);
        }

        // ------------------------------
        // SEARCH BY PHONE NUMBER (PHO)
        // ------------------------------
        else if (searchType.equals("PHO")) {
SQL =
"SELECT " +
"  ci.id AS customer_id, " +
"  ci.prefix, ci.firstName, ci.middleName, ci.lastName, ci.suffix, " +
"  ci.email, ci.emailNotProvided, ci.ssn, ci.birthDate, " +
"  ci.dlNumber, ci.dlState, ci.dlExp, " +
"  ci.contactPhone1, ci.contactPhone2, ci.contactPhone3, " +
"  ci.streetNumber, ci.streetName, ci.addressLine2, " +
"  ci.city, ci.state, ci.zip, ci.employer, " +
"  ci.isNvp, ci.assignToBusinessAccount, ci.attachToHierarchy, " +
"  ci.accountType, ci.creditSsn, ci.creditClass, ci.approvedLines, " +
"  ci.lastDateChecked, ci.typeOfAccount, ci.account_number, " +
"  cp.id AS phone_id, " +
"  cp.type_of_line, cp.phoneNumber, " +
"  cp.date_time_added_to_acct, cp.caller_id_fname, cp.caller_id_lname, " +
"  cp.is_unlimited_talk, cp.is_unlimited_text, cp.is_unlimited_data, " +
"  cp.ammt_of_priority_data_gb, cp.plan_name, cp.plan_code, " +
"  cp.can_inbound, cp.can_outbound, cp.is_forwarding_calls, " +
"  cp.forward_calls_number, cp.assigned_service_ids_csv, cp.is_active " +
"FROM phone_numbers cp " +
"LEFT JOIN customer_info ci " +
"  ON ci.account_number = cp.account_number " +
"WHERE TRIM(cp.phoneNumber) = TRIM(?) " +
"   OR TRIM(?) IN (TRIM(ci.contactPhone1), TRIM(ci.contactPhone2), TRIM(ci.contactPhone3));";

ps = vars.conn.prepareStatement(SQL);
ps.setString(1, phoneNumber);
ps.setString(2, phoneNumber);




            System.out.println("Running PHO search for phone " + phoneNumber);
        }

        // ------------------------------
        // SEARCH BY FIRST + LAST NAME (FAL)
        // ------------------------------
        else if (searchType.equals("FAL")) {
SQL =
"SELECT " +
"  ci.id AS customer_id, " +
"  ci.prefix, ci.firstName, ci.middleName, ci.lastName, ci.suffix, " +
"  ci.email, ci.emailNotProvided, ci.ssn, ci.birthDate, " +
"  ci.dlNumber, ci.dlState, ci.dlExp, " +
"  ci.contactPhone1, ci.contactPhone2, ci.contactPhone3, " +
"  ci.streetNumber, ci.streetName, ci.addressLine2, " +
"  ci.city, ci.state, ci.zip, ci.employer, " +
"  ci.isNvp, ci.assignToBusinessAccount, ci.attachToHierarchy, " +
"  ci.accountType, ci.creditSsn, ci.creditClass, ci.approvedLines, " +
"  ci.lastDateChecked, ci.typeOfAccount, ci.account_number, " +
"  cp.id AS phone_id, " +
"  cp.type_of_line, cp.phoneNumber, " +
"  cp.date_time_added_to_acct, cp.caller_id_fname, cp.caller_id_lname, " +
"  cp.is_unlimited_talk, cp.is_unlimited_text, cp.is_unlimited_data, " +
"  cp.ammt_of_priority_data_gb, cp.plan_name, cp.plan_code, " +
"  cp.can_inbound, cp.can_outbound, cp.is_forwarding_calls, " +
"  cp.forward_calls_number, cp.assigned_service_ids_csv, cp.is_active " +
"FROM customer_info ci " +
"LEFT JOIN phone_numbers cp " +
"  ON cp.account_number = ci.account_number " +
"WHERE ci.firstName LIKE ? AND ci.lastName LIKE ?;";

ps = vars.conn.prepareStatement(SQL);
ps.setString(1, firstName.trim() + "%");
ps.setString(2, lastName.trim() + "%");


            System.out.println("Running FAL search for name " + firstName + " " + lastName);
        }

        else {
            System.out.println("Unknown search type: " + typeOfSearch);
            return results;
        }

        // ------------------------------
        // EXECUTE QUERY
        // ------------------------------
        ResultSet rs = ps.executeQuery();

        boolean hasResults = false;

        while (rs.next()) {
            hasResults = true;

            Cx cx = new Cx();
            phoneNumbers phnos = new phoneNumbers();

            // --- Cx object ---
            cx.setId(rs.getInt("customer_id"));
            cx.setPrefix(rs.getString("prefix"));
            cx.setFirstName(rs.getString("firstName"));
            cx.setMiddleName(rs.getString("middleName"));
            cx.setLastName(rs.getString("lastName"));
            cx.setSuffix(rs.getString("suffix"));
            cx.setEmail(rs.getString("email"));
            cx.setEmailNotProvided(rs.getBoolean("emailNotProvided"));
            cx.setSsn(rs.getString("ssn"));
            cx.setBirthDate(rs.getDate("birthDate"));
            cx.setDlNumber(rs.getString("dlNumber"));
            cx.setDlState(rs.getString("dlState"));
            cx.setDlExp(rs.getDate("dlExp"));
            cx.setContactPhone1(rs.getString("contactPhone1"));
            cx.setContactPhone2(rs.getString("contactPhone2"));
            cx.setContactPhone3(rs.getString("contactPhone3"));
            cx.setStreetNumber(rs.getString("streetNumber"));
            cx.setStreetName(rs.getString("streetName"));
            cx.setAddressLine2(rs.getString("addressLine2"));
            cx.setCity(rs.getString("city"));
            cx.setState(rs.getString("state"));
            cx.setZip(rs.getString("zip"));
            cx.setEmployer(rs.getString("employer"));
            cx.setAssignToBusinessAccount(rs.getBoolean("assignToBusinessAccount"));
            cx.setAttachToHierarchy(rs.getBoolean("attachToHierarchy"));
            cx.setAccountType(rs.getString("accountType"));
            cx.setCreditSsn(rs.getString("creditSsn"));
            cx.setCreditClass(rs.getString("creditClass"));
            cx.setApprovedLines(rs.getInt("approvedLines"));
            cx.setLastDateChecked(rs.getDate("lastDateChecked"));
            cx.setTypeOfAccount(rs.getString("typeOfAccount"));
                        cx.setAccountNumber(rs.getString("account_number")); // Add if applicable


            // --- phoneNumbers object ---
            if (!searchType.equals("FAL")) {
                phnos.setId(rs.getInt("phone_id"));
                phnos.setTypeOfLine(rs.getString("type_of_line"));
                phnos.setPhoneNumber(rs.getString("phoneNumber"));
                phnos.setDateTimeAddedToAcct(rs.getTimestamp("date_time_added_to_acct"));
                phnos.setCallerIdFname(rs.getString("caller_id_fname"));
                phnos.setCallerIdLname(rs.getString("caller_id_lname"));
                phnos.setIsUnlimitedTalk(rs.getBoolean("is_unlimited_talk"));
                phnos.setIsUnlimitedText(rs.getBoolean("is_unlimited_text"));
                phnos.setIsUnlimitedData(rs.getBoolean("is_unlimited_data"));
                phnos.setAmmtOfPriorityDataGb(rs.getInt("ammt_of_priority_data_gb"));
                phnos.setPlanName(rs.getString("plan_name"));
                phnos.setPlanCode(rs.getInt("plan_code"));
                phnos.setCanInbound(rs.getBoolean("can_inbound"));
                phnos.setCanOutbound(rs.getBoolean("can_outbound"));
                phnos.setIsForwardingCalls(rs.getBoolean("is_forwarding_calls"));
                phnos.setForwardCallsNumber(rs.getString("forward_calls_number"));
                phnos.setAssignedServiceIdsCsv(rs.getString("assigned_service_ids_csv"));
                phnos.setIsActive(
                    rs.getObject("is_active") != null ? rs.getBoolean("is_active") : null
                );
            }

            results.add(new AbstractMap.SimpleEntry<>(phnos, cx));
        }

        if (!hasResults) {
            System.out.println("No customers found for search type " + searchType);
        }

        rs.close();
        ps.close();

    } catch (SQLException ex) {
        Logger.getLogger(actions.class.getName()).log(Level.SEVERE, null, ex);
    }

    return results;
}


  public static boolean checkIfDiscountAppliesToCart(DefaultTableModel cart_model) {

  
  
  
  
  
  
  return false;
  }
  
  
  
  
  
  
  
public static void launchNewActivationWindowWithData(String imei, String typeOfDevice, String make, String model, boolean isPiadUpFront, double price_today, double price_per_month, boolean requiresDownpayment, int downpaymentPerc) {
           new new_activation().setVisible(true);

           new_activation.typeOfDevice = typeOfDevice;
    new_activation.imei_txt.setText(imei);
     new_activation.make_txt.setText(make);
     new_activation.model_txt.setText(model);
    if (!isPiadUpFront) {
         new_activation.paid_in_full_cb.setSelected(true);
         new_activation.cost_per_month_txt.setText("0.00");
         new_activation.cost_today_txt.setText(Double.toString(price_today));
    } else {
           new_activation.paid_in_full_cb.setSelected(false);
      
        
        if (requiresDownpayment) {
            double downpayment_ammt = price_today * (downpaymentPerc * .01);
            
            double newPricePerMonth = (price_today - downpayment_ammt) / 24;

                     new_activation.cost_per_month_txt.setText(Double.toString(rms.clone.main.business.actions.roundToTwoDecimals(newPricePerMonth)));

                     new_activation.cost_today_txt.setText(Double.toString(rms.clone.main.business.actions.roundToTwoDecimals(downpayment_ammt)));  

        } else {
                                 new_activation.cost_per_month_txt.setText(Double.toString(price_per_month));

                     new_activation.cost_today_txt.setText("0.00");  

        }
        
        
        
          
    }
    
    
    
    
    
    
    
}



    public static double roundToTwoDecimals(double value) {
        return Math.round(value * 100.0) / 100.0;
    }




}
