/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import Model.SMS;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 * @author mohnish
 */
public class SMSManager {

    private static final String API_URL = "https://smsapi.engineeringtgr.com/send/?";
    private static final String API_KEY = "anjar3sLrq0zjEHbBc5XDNuKySTp1";
    private static final String HOST_MOBILENO = "9969742702";
    private static final String HOST_PASSWORD = "frankenstein96";
    private static final String USER_AGENT = "Mozilla/5.0";

    public String SendSMS(String mobileNo, String message) {
        try {
            String url = API_URL + "Mobile=" + HOST_MOBILENO + "&Password=" + HOST_PASSWORD + "&Message=" + message + "&To=" + mobileNo + "&Key=" + API_KEY;

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", USER_AGENT);
            int responseCode = con.getResponseCode();
            System.out.println("GET Response Code :: " + responseCode);
            if (responseCode == HttpURLConnection.HTTP_OK) { // success
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        con.getInputStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();
                SMS smsResponse = new ObjectMapper().readValue(response.toString(), SMS.class);
                System.out.println(smsResponse.getMsg());
                System.out.println(smsResponse.getStatus());

                System.out.println(response.toString());
            }
//            SMS smsResponse = new ObjectMapper().readValue(response, SMS.class);
//            System.out.println(smsResponse.getMsg());
//            System.out.println(smsResponse.getStatus());
//            if (response.contains("success")) {
//                System.out.println("Successfully send SMS");
//                //your code when message send success
//            } else {
//                System.out.println(response);
//                //your code when message not send
//            }
        } catch (IOException e) {
            System.out.println(e);
        }
        return null;
    }
}
