/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author ianschrauth
 */
public class SelectedPhone {
    
    int dvid;
    String device_type;
    String device_make;
    String device_model;
    String device_imei;
    String device_release_year;
    boolean payment_plan_elig;
    double pay_plan_monthyl_cost;
    double up_front_cost;
    boolean is_pre_order;
    boolean is_pending_shipment; //Pending shipment from manufacturer
    boolean is_refurb;
    boolean return_eligable;

    public SelectedPhone() {
    }

 
    
    public SelectedPhone(int dvid, String device_type, String device_make, String device_model, String device_imei, String device_release_year, boolean payment_plan_elig, double pay_plan_monthyl_cost, double up_front_cost, boolean is_pre_order, boolean is_pending_shipment, boolean is_refurb, boolean return_eligable) {
        this.dvid = dvid;
        this.device_type = device_type;
        this.device_make = device_make;
        this.device_model = device_model;
        this.device_imei = device_imei;
        this.device_release_year = device_release_year;
        this.payment_plan_elig = payment_plan_elig;
        this.pay_plan_monthyl_cost = pay_plan_monthyl_cost;
        this.up_front_cost = up_front_cost;
        this.is_pre_order = is_pre_order;
        this.is_pending_shipment = is_pending_shipment;
        this.is_refurb = is_refurb;
        this.return_eligable = return_eligable;
    }

    public int getDvid() {
        return dvid;
    }

    public void setDvid(int dvid) {
        this.dvid = dvid;
    }

    public String getDevice_type() {
        return device_type;
    }

    public void setDevice_type(String device_type) {
        this.device_type = device_type;
    }

    public String getDevice_make() {
        return device_make;
    }

    public void setDevice_make(String device_make) {
        this.device_make = device_make;
    }

    public String getDevice_model() {
        return device_model;
    }

    public void setDevice_model(String device_model) {
        this.device_model = device_model;
    }

    public String getDevice_imei() {
        return device_imei;
    }

    public void setDevice_imei(String device_imei) {
        this.device_imei = device_imei;
    }

    public String getDevice_release_year() {
        return device_release_year;
    }

    public void setDevice_release_year(String device_release_year) {
        this.device_release_year = device_release_year;
    }

    public boolean isPayment_plan_elig() {
        return payment_plan_elig;
    }

    public void setPayment_plan_elig(boolean payment_plan_elig) {
        this.payment_plan_elig = payment_plan_elig;
    }

    public double getPay_plan_monthyl_cost() {
        return pay_plan_monthyl_cost;
    }

    public void setPay_plan_monthyl_cost(double pay_plan_monthyl_cost) {
        this.pay_plan_monthyl_cost = pay_plan_monthyl_cost;
    }

    public double getUp_front_cost() {
        return up_front_cost;
    }

    public void setUp_front_cost(double up_front_cost) {
        this.up_front_cost = up_front_cost;
    }

    public boolean isIs_pre_order() {
        return is_pre_order;
    }

    public void setIs_pre_order(boolean is_pre_order) {
        this.is_pre_order = is_pre_order;
    }

    public boolean isIs_pending_shipment() {
        return is_pending_shipment;
    }

    public void setIs_pending_shipment(boolean is_pending_shipment) {
        this.is_pending_shipment = is_pending_shipment;
    }

    public boolean isIs_refurb() {
        return is_refurb;
    }

    public void setIs_refurb(boolean is_refurb) {
        this.is_refurb = is_refurb;
    }

    public boolean isReturn_eligable() {
        return return_eligable;
    }

    public void setReturn_eligable(boolean return_eligable) {
        this.return_eligable = return_eligable;
    }
    
    
    
    
    
    
    
    
}
