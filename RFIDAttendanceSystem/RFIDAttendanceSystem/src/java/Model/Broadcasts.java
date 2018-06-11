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
public class Broadcasts {

    private List<Employee> employeesList;
    private List<Broadcast> broadcastList;

    public Broadcasts() {
    }

    public Broadcasts(List<Employee> employeesList, List<Broadcast> broadcastList) {
        this.employeesList = employeesList;
        this.broadcastList = broadcastList;
    }

    public List<Employee> getEmployeesList() {
        return employeesList;
    }

    public void setEmployeesList(List<Employee> employeesList) {
        this.employeesList = employeesList;
    }

    public List<Broadcast> getBroadcastList() {
        return broadcastList;
    }

    public void setBroadcastList(List<Broadcast> broadcastList) {
        this.broadcastList = broadcastList;
    }

}
