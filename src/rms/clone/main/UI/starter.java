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
                        new RMS_Clone_CSR().setVisible(true);
                        return;    
                        
                         // Exit after opening login window
                    case "--version":
                        // viewing the icon from a web page and from the file is broken. 
                        //Add all new developers to the map below
                        // Note, only put the first and last name, and the email. 
                         Map<String, String> devs = new LinkedHashMap<>();
            
                        devs.put("Ian Schrauth", "contact@ianschrauth.com");
           
                        aboutApp w = new aboutApp(
                                version.APPLICATION_NAME,
                                version.VERSION_NUMBER,
                                  version.VERISON_BUILD_NUMBER,
                                version.IS_IN_BETA , 
                                version.BETA_NUMBER,
                                devs,
                                "https://www.flaticon.com/free-icon/store-management_12474329"
                        );
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
