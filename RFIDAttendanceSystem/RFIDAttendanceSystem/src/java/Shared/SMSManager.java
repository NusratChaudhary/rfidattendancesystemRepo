/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.security.cert.X509Certificate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mohnish
 */
public class SMSManager {

    private static final String API_URL = "https://smsapi.engineeringtgr.com/send/?";
    private static final String API_KEY = "anjar3sLrq0zjEHbBc5XDNuKySTp1";
    private static final String HOST_MOBILENO = "9969742702";
    private static final String HOST_PASSWORD = "frankenstein96";

    public String SendSMS(String mobileNo, String message) throws NoSuchAlgorithmException {
        try {// message.replace(" ", "%20") have to do as there are spaces inside the message string and in url space is refered as %20
            String rawurl = API_URL + "Mobile=" + HOST_MOBILENO + "&Password=" + HOST_PASSWORD + "&Message=" + message.replace(" ", "%20") + "&To=" + mobileNo + "&Key=" + API_KEY;
            TrustManager[] trustAllCerts = new TrustManager[]{
                new X509TrustManager() {
                    public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                        return null;
                    }

                    public void checkClientTrusted(X509Certificate[] certs, String authType) {
                    }

                    public void checkServerTrusted(X509Certificate[] certs, String authType) {
                    }
                }
            };
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
            HostnameVerifier allHostsValid = new HostnameVerifier() {
                public boolean verify(String hostname, SSLSession session) {
                    return true;
                }
            };
            HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
            URL url = new URL(rawurl);
            URLConnection urlcon = url.openConnection();
            InputStream stream = urlcon.getInputStream();
            int i;
            String response = "";
            while ((i = stream.read()) != -1) {
                response += (char) i;
            }
            if (response.contains("success")) {
                System.out.println("Successfully send SMS");
                logSMS(mobileNo, message);
                return Constants.OK;
            } else {
                System.out.println(response);
                logSMS(mobileNo, message);
                return Constants.ERROR;
            }
        } catch (IOException e) {
            System.out.println(e);
            return Constants.ERROR;
        } catch (KeyManagementException ex) {
            System.out.println(ex);
            Logger.getLogger(SMSManager.class.getName()).log(Level.SEVERE, null, ex);
            return Constants.ERROR;
        }
    }

    private void logSMS(String mobileNo, String message) {
        Connection con = new ConnectionManager().getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("insert into SMSSERVICE values (?,?,?)");
            ps.setString(1, mobileNo);
            ps.setString(2, message);
            ps.setTimestamp(3, Helper.getCurrentTimeStamp());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
