/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.system;

import java.awt.Desktop;
import java.awt.desktop.AboutEvent;
import java.awt.desktop.AboutHandler;
import java.sql.SQLException;
import rms.clone.main.UI.main.aboutApp;
import rms.clone.main.UI.main.RMS_Clone_CSR;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import rms.clone.business.database.actions;
import rms.clone.main.UI.submain.output_console;
import rms.clone.main.business.vars;
import rms.clone.vars.*;


/**
 *
 * @author ianschrauth
 */
public class starter {
    
    
    public static void main(String[] args){
                System.setProperty("apple.awt.application.name", "Sprint Retail Managment System (RMS) Clone");

        if (Desktop.isDesktopSupported()) {
            Desktop desktop = Desktop.getDesktop();

            desktop.setAboutHandler(new AboutHandler() {
                @Override
                public void handleAbout(AboutEvent e) {
  Map<String, String> devs = new LinkedHashMap<>();
    devs.put("Ian Schrauth", "contact@ianschrauth.com");

    Map<String, String> info = new LinkedHashMap<>();
    info.put("App Name", version.APPLICATION_NAME);
    info.put("App Version", "V" + version.VERSION_NUMBER);
    info.put("App Build Number", version.VERISON_BUILD_NUMBER);
    info.put("Last Build Date", version.DATE_OF_LAST_BUILD);
    info.put("Database Instance", version.DATABASE_INSTANCE);

    aboutApp w = new aboutApp(null, "", "", "", 
                              version.IS_IN_BETA, 
                              version.BETA_NUMBER, 
                              devs, info);
    w.setVisible(true);
    return;                 }
            });
        }

        
        
        
        
        
      try {
    Class.forName(db.CLASS_FILE);
} catch (ClassNotFoundException ex) {
    Logger.getLogger(starter.class.getName()).log(Level.SEVERE, null, ex);
}

// 1. Define flags and variables for the new arguments
boolean isDev = false;
boolean showVersion = false;
boolean showOutput = false;

int profileId = -1;       // Default to -1 (no ID)
String autoPassword = ""; // Default to empty

// 2. Process all arguments
for (String arg : args) {
    // Handle fixed arguments
    if (arg.equals("--output")) {
        showOutput = true;
    } else if (arg.equals("--dev")) {
        isDev = true;
    } else if (arg.equals("--version")) {
        showVersion = true;
    } 
    // Handle dynamic arguments (key=value)
    else if (arg.startsWith("-pid=")) {
        try {
            profileId = Integer.parseInt(arg.substring(5));
        } catch (NumberFormatException e) {
            System.out.println("Invalid PID: " + arg.substring(5));
        }
    } else if (arg.startsWith("-p=")) {
        autoPassword = arg.substring(3);
    }
}

// 3. Execution Logic
if (showOutput) {
    new output_console().setVisible(true);
}

if (showVersion) {
// Version Window Logic
    Map<String, String> devs = new LinkedHashMap<>();
    devs.put("Ian Schrauth", "contact@ianschrauth.com");

    Map<String, String> info = new LinkedHashMap<>();
    info.put("App Name", version.APPLICATION_NAME);
    info.put("App Version", "V" + version.VERSION_NUMBER);
    info.put("App Build Number", version.VERISON_BUILD_NUMBER);
    info.put("Last Build Date", version.DATE_OF_LAST_BUILD);
    info.put("Database Instance", version.DATABASE_INSTANCE);

    aboutApp w = new aboutApp(null, "", "", "", 
                              version.IS_IN_BETA, 
                              version.BETA_NUMBER, 
                              devs, info);
    w.setVisible(true);
    return; 
}

if (isDev) {
    System.out.println("Using the Developer Database...");
    db.DB_NAME = "rms_clone_dev";
    version.DATABASE_INSTANCE = "development";
}

// 4. Launch Main App with Auto-Login data
//new RMS_Clone_CSR().setVisible(true);

// If both PID and Password were provided, trigger auto-login
if (profileId != -1 && !autoPassword.isEmpty()) {
          try {
              vars.conn = rms.clone.business.database.actions.getConnection();
              System.out.println("Connection Sucesfull.");
              System.out.println("Attempting auto-login for PID: " + profileId);
              // You will need to create this method (or similar logic) inside your RMS_Clone_CSR class
              RMS_Clone_CSR.performAutoLogin(profileId, autoPassword);
          } catch (SQLException ex) {
              Logger.getLogger(starter.class.getName()).log(Level.SEVERE, null, ex);
          }
} else {
    new RMS_Clone_CSR().setVisible(true);

}


    }
    
    
    
    
    
}
