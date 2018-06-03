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
public class Request {

    private int requestId;
    private String requestSubject;
    private String requestBody;
    private String requestReply;
    private int employeeId;
    private String employeeName;
    private int adminStatus;
    private String dateTime;
    private String replyDateTime;
    private String flag;
    private boolean isRequestReplied;
    private boolean isRequestRead;

    public Request(int requestId, String requestSubject, String requestBody, String requestReply, int employeeId, String employeeName, int adminStatus, String dateTime, String replyDateTime, String flag, boolean isRequestReplied, boolean isRequestRead) {
        this.requestId = requestId;
        this.requestSubject = requestSubject;
        this.requestBody = requestBody;
        this.requestReply = requestReply;
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.adminStatus = adminStatus;
        this.dateTime = dateTime;
        this.replyDateTime = replyDateTime;
        this.flag = flag;
        this.isRequestReplied = isRequestReplied;
        this.isRequestRead = isRequestRead;
    }

    public Request() {
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getRequestSubject() {
        return requestSubject;
    }

    public void setRequestSubject(String requestSubject) {
        this.requestSubject = requestSubject;
    }

    public String getRequestBody() {
        return requestBody;
    }

    public void setRequestBody(String requestBody) {
        this.requestBody = requestBody;
    }

    public String getRequestReply() {
        return requestReply;
    }

    public void setRequestReply(String requestReply) {
        this.requestReply = requestReply;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public int getAdminStatus() {
        return adminStatus;
    }

    public void setAdminStatus(int adminStatus) {
        this.adminStatus = adminStatus;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getReplyDateTime() {
        return replyDateTime;
    }

    public void setReplyDateTime(String replyDateTime) {
        this.replyDateTime = replyDateTime;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public boolean isIsRequestReplied() {
        return isRequestReplied;
    }

    public void setIsRequestReplied(boolean isRequestReplied) {
        this.isRequestReplied = isRequestReplied;
    }

    public boolean isIsRequestRead() {
        return isRequestRead;
    }

    public void setIsRequestRead(boolean isRequestRead) {
        this.isRequestRead = isRequestRead;
    }
}
