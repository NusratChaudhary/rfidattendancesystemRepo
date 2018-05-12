/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mohnish
 */
public class Employees {

    private int employeesCount;
    private int employeesHoliday;
    private int employeesDisabled;
    private List<Employee> employeeList;

    public Employees(int employeesCount, int employeesHoliday, int employeesDisabled, List<Employee> employeeList) {       
        this.employeesCount = employeesCount;
        this.employeesHoliday = employeesHoliday;
        this.employeesDisabled = employeesDisabled;
        this.employeeList = employeeList;
    }

    public Employees() {
    }

    public int getEmployeesCount() {
        return employeesCount;
    }

    public void setEmployeesCount(int employeesCount) {
        this.employeesCount = employeesCount;
    }

    public int getEmployeesHoliday() {
        return employeesHoliday;
    }

    public void setEmployeesHoliday(int employeesHoliday) {
        this.employeesHoliday = employeesHoliday;
    }

    public int getEmployeesDisabled() {
        return employeesDisabled;
    }

    public void setEmployeesDisabled(int employeesDisabled) {
        this.employeesDisabled = employeesDisabled;
    }

    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

}
