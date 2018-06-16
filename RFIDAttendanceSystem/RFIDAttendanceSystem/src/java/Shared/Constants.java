/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

/**
 *
 * @author mohnish
 */
public class Constants {

    public static final String API_KEY = "c6e14e8de5f7ef8dd433b64c01d830d3";

    public static final String USER_ACTIVE = "user_active";
    public static final String USER_VERIFY = "user_verify";
    public static final String USER_HOLIDAY = "user_holiday";
    public static final String USER_INACTIVE = "user_deactive";

    public static final String RFID_ACTIVE = "rfid_active";
    public static final String RFID_INACTIVE = "rfid_deactive";

    public static final String LOGIN_SUCCESS = "login_success";
    public static final String LOGIN_INSUCCESS = "login_unsuccess";
    public static final String LOGIN_HOLIDAY = "login_holiday";

    public static final String REGISTER_SUCCESS = "register_success";
    public static final String REGISTER_INSUCCESS = "register_insuccess";
    public static final String REGISTER_ALREADY = "register_already";

    public static final String MODE_VERIFY_EMAIL = "mode_verify_email";
    public static final String PENDING = "pending";
    public static final String COMPLETED = "completed";
    public static final String ALREADY_VERIFIED = "already_verified";

    public static final String RFID_CARD_ACTIVE = "rfid_card_active";
    public static final String RFID_CARD_INACTIVE = "rfid_card_inactive";

    public static final String RFID_CARD_NOT_AVAILABLE = "rfid_card_unavailable";

    public static final String GET_EMP_ATTENDANCE = "get_employee_attendance";
    public static final String ATTENDANCE_NOT_FOUND = "attendance_not_found";

    public static final String OK = "OK";
    public static final String ERROR = "ERR";

    public static final String EMAIL_VERIFICATION_TEMPLATE = "Thanks for signing up!\n Your account has been created, you can login after you have activated your account \n Please click this link to activate your account: \n\n";

    public static final String TYPE_STRING = "string";
    public static final String TYPE_INT = "int";

    public static final String LOGGED_OUT = "logged_out";
    public static final String HOST_ADDRESS = "http://localhost:8080/RFIDAttendanceSystem/";

    public static final String ALLOWED_PAGES = "welcome.jsp,verification.jsp,RfidEntry.jsp";

    public static final String ATTENDANCE_IN = "in";
    public static final String ATTENDANCE_OUT = "out";
    public static final String ATTENDANCE_ABSENT = "absent";
    public static final String ATTENDANCE_ALREADY_COMPLETED = "already_completed";

    public static final String DELETE_EMPLOYEE = "delete_employee";

    public static final String REQUEST_PENDING = "request_pending";
    public static final String REQUEST_READ = "request_read";
    public static final String REQUEST_RESPONDED = "request_responded";
    public static final String REQUEST_SENT_TO_ADMIN = "request_sent_to_admin";

    public static final String GET_ALL_ATTENDANCE = "get_all_attendance";
    public static final String DELETE_ATTENDANCE = "delete_attendance";
    public static final String UPDATE_ATTENDANCE = "update_attendance";
    public static final String GET_SPECIFIC_RECORDS = "get_specific_records";

    public static final String GET_REQUESTS = "get_requests";
    public static final String REQUESTS_NOT_FOUND = "requests_not_found";
    public static final String ADD_REQUEST = "add_request";
    public static final String CHANGE_REQUEST_STATUS = "change_request_status";
    public static final String POST_REPLY = "post_reply";
    public static final String POST_ADMIN = "post_admin";

    public static final String LOAD_BROADCASTDATA = "load_broadcastdata";
    public static final String INDIVIDUAL_MODE = "individual_mode";
    public static final String BROADCAST_MODE = "broadcast_mode";
    public static final String BROADCAST_ACTIVE = "broadcast_active";
    public static final String BROADCAST_INACTIVE = "broadcast_inactive";
    public static final String POST_BROADCAST = "post_broadcast";
    public static final String DELETE_BROADCAST = "delete_broadcast";
    public static final String LOAD_BROADCAST_EMPLOYEE = "load_broadcast_employee";
}
