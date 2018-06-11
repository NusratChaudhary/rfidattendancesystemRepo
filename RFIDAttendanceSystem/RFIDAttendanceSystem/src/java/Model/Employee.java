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
public class Employee {

    private int employeeId;
    private String dob;
    private String firstName;
    private String lastName;
    private String gender;
    private String phoneNumber;
    private String email;
    private String address;
    private Rfid rfid;
    private boolean isUserHr;
    private int salary;
    private String departmentName;

    public Employee(int employeeId, String dob, String firstName, String lastName, String gender, String phoneNumber, String email, String address, Rfid rfid, boolean isHr) {
        this.employeeId = employeeId;
        this.dob = dob;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.rfid = rfid;
        this.isUserHr = isHr;
    }

    public Employee(int employeeId, String firstName, String lastName) {
        this.employeeId = employeeId;
        this.firstName = firstName;
        this.lastName = lastName;
    }
    
    public Employee(int employeeId, String dob, String firstName, String lastName, String gender, String phoneNumber, String email, String address, Rfid rfid, int salary, String departmentName) {
        this.employeeId = employeeId;
        this.dob = dob;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.rfid = rfid;
        this.salary = salary;
        this.departmentName = departmentName;
    }

    public Employee() {
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Rfid getRfid() {
        return rfid;
    }

    public void setRfid(Rfid rfid) {
        this.rfid = rfid;
    }

    public boolean isUserHr() {
        return isUserHr;
    }

    public void setisUserHr(boolean isHr) {
        this.isUserHr = isHr;
    }

    public int getsalary() {
        return salary;
    }

    public void setsalary(int salary) {
        this.salary = salary;
    }

    public String getdepartmentName() {
        return departmentName;
    }

    public void setdepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getName() {
        return firstName + " " + lastName;
    }
}
