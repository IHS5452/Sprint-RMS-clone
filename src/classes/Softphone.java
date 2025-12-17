/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author ian
 */
public class Softphone {
    
    
    public  String sevrer_sip_address;
    public  String sip_username;
    public  String sip_extension;
    public  String sip_password;
    public String agent_extensions;

    public Softphone() {
    }

    public Softphone(String sevrer_sip_address, String sip_username, String sip_extension, String sip_password) {
        this.sevrer_sip_address = sevrer_sip_address;
        this.sip_username = sip_username;
        this.sip_extension = sip_extension;
        this.sip_password = sip_password;
    }

    public String getSevrer_sip_address() {
        return sevrer_sip_address;
    }

    public void setSevrer_sip_address(String sevrer_sip_address) {
        this.sevrer_sip_address = sevrer_sip_address;
    }

    public String getSip_username() {
        return sip_username;
    }

    public void setSip_username(String sip_username) {
        this.sip_username = sip_username;
    }

    public String getSip_extension() {
        return sip_extension;
    }

    public void setSip_extension(String sip_extension) {
        this.sip_extension = sip_extension;
    }

    public String getSip_password() {
        return sip_password;
    }

    public void setSip_password(String sip_password) {
        this.sip_password = sip_password;
    }

  
    
    
    
    
}
