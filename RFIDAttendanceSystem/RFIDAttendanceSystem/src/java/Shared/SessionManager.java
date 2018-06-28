/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import java.util.Hashtable;
import javax.servlet.ServletContext;

/**
 *
 * @author mohnish
 */
public class SessionManager {
    
    ServletContext ctx = null;
    static Hashtable<String, String> sessions = new Hashtable<String, String>();
    
    public static void addSession(String employeeId, String sessionId) {
        sessions.put(employeeId, sessionId);
    }
    
    public static void removeSession(String employeeId) {
        sessions.remove(employeeId);
    }
    
    public static boolean sessionExists(String employeeId) {       
        return sessions.containsKey(employeeId);
    }
}
