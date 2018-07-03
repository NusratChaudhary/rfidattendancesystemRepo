/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author mohnish
 */
public class Pin {

    private int Id;
    private int pinNumber;
    private int employeeId;
    private String type;
    private String mobileNumber;
    private Boolean isActive;

    public Pin(int Id, int pinNumber, int employeeId, String type, String mobileNumber, Boolean isActive) {
        this.Id = Id;
        this.pinNumber = pinNumber;
        this.employeeId = employeeId;
        this.type = type;
        this.mobileNumber = mobileNumber;
        this.isActive = isActive;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getPinNumber() {
        return pinNumber;
    }

    public void setPinNumber(int pinNumber) {
        this.pinNumber = pinNumber;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    
    
}
