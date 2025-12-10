/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.UI;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import rms.clone.business.database.actions;
import rms.clone.vars.*;


/**
 *
 * @author ianschrauth
 */
public class starter {
    
    
    public static void main(String[] args){
        
        try {
            Class.forName(db.CLASS_FILE);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(starter.class.getName()).log(Level.SEVERE, null, ex);
        }
        
                if (args.length > 0) {

            for (String arg : args) {
                switch (arg) {
                    case "--dev-db":
                        System.out.println("Using the JPOSS Developer Database...");
                        db.DB_NAME = "rms_clone_dev";
                        version.DATABASE_INSTANCE = "development";
                        new RMS_Clone_CSR().setVisible(true);
                        return;    
                        
                         // Exit after opening login window
                    case "--version":
                        // viewing the icon from a web page and from the file is broken. 
                        //Add all new developers to the map below
                        // Note, only put the first and last name, and the email. 
                              Map<String,String> devs = new LinkedHashMap<>();
                             devs.put("Ian Schrauth", "contact@ianschrauth.com");

                            Map<String,String> info = new LinkedHashMap<>();
                            info.put("App Name", version.APPLICATION_NAME);
                            info.put("App Version", "V" + version.VERSION_NUMBER);
                            info.put("App Build Number", version.VERISON_BUILD_NUMBER);
                            info.put("Last Build Date", version.DATE_OF_LAST_BUILD);
                            info.put("Database Instance", version.DATABASE_INSTANCE);
                       
                        aboutApp w = new aboutApp( null, "",
                   "",    // (subtitle is represented inside info map above)
                    "",
                    version.IS_IN_BETA,
                    version.BETA_NUMBER,
                    devs,
                    info);
                        w.setVisible(true);
                            
                        return; // Exit after printing version
                        
                 
                    default:
                         
        new RMS_Clone_CSR().setVisible(true);
                            
                        
                        return; // Exit after handling default action
                }
            }
        } else {
            // If no arguments are provided, perform default actions
        new RMS_Clone_CSR().setVisible(true);
        
        
                }
        
        

        
    }
    
    
    
}
