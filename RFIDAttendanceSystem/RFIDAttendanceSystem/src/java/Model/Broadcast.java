/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;

/**
 *
 * @author mohnish
 */
public class Broadcast {

    private int id;
    private String message;
    private String broadcastType;
    private String flag;
    private List<Employee> employeesList;

    public Broadcast() {
    }

    public Broadcast(int id, String message, String broadcastType, String flag, List<Employee> employeesList) {
        this.id = id;
        this.message = message;
        this.broadcastType = broadcastType;
        this.flag = flag;
        this.employeesList = employeesList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getBroadcastType() {
        return broadcastType;
    }

    public void setBroadcastType(String broadcastType) {
        this.broadcastType = broadcastType;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public List<Employee> getEmployeesList() {
        return employeesList;
    }

    public void setEmployeesList(List<Employee> employeesList) {
        this.employeesList = employeesList;
    }

}
