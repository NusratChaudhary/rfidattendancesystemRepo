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
    private static final String USER_AGENT = "Mozilla/5.0";

    public String SendSMS(String mobileNo, String message) throws NoSuchAlgorithmException {
        try {
            String rawurl = API_URL + "Mobile=" + HOST_MOBILENO + "&Password=" + HOST_PASSWORD + "&Message=" + message + "&To=" + mobileNo + "&Key=" + API_KEY;

//            URL obj = new URL(url);
//            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
//            con.setRequestMethod("GET");
//            con.setRequestProperty("User-Agent", USER_AGENT);
//            int responseCode = con.getResponseCode();
//            System.out.println("GET Response Code :: " + responseCode);
//            if (responseCode == HttpURLConnection.HTTP_OK) { // success
//                BufferedReader in = new BufferedReader(new InputStreamReader(
//                        con.getInputStream()));
//                String inputLine;
//                StringBuffer response = new StringBuffer();
//
//                while ((inputLine = in.readLine()) != null) {
//                    response.append(inputLine);
//                }
//                in.close();
//                SMS smsResponse = new ObjectMapper().readValue(response.toString(), SMS.class);
//                System.out.println(smsResponse.getMsg());
//                System.out.println(smsResponse.getStatus());
//
//                System.out.println(response.toString());
//            }
            /*
     *  fix for
     *    Exception in thread "main" javax.net.ssl.SSLHandshakeException:
     *       sun.security.validator.ValidatorException:
     *           PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException:
     *               unable to find valid certification path to requested target
             */
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

            // Create all-trusting host name verifier
            HostnameVerifier allHostsValid = new HostnameVerifier() {
                public boolean verify(String hostname, SSLSession session) {
                    return true;
                }
            };
            // Install the all-trusting host verifier
            HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
            /*
     * end of the fix
             */

            URL url = new URL("https://smsapi.engineeringtgr.com/send/?Mobile=9969742702&Password=frankenstein96&Message=testweb&To=9969742702&Key=anjar3sLrq0zjEHbBc5XDNuKySTp1");
            URLConnection urlcon = url.openConnection();
            InputStream stream = urlcon.getInputStream();
            int i;
            String response = "";
            while ((i = stream.read()) != -1) {
                response += (char) i;
            }
            if (response.contains("success")) {
                System.out.println("Successfully send SMS");
                //your code when message send success
            } else {
                System.out.println(response);
                //your code when message not send
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
        } catch (KeyManagementException ex) {
            System.out.println(ex);
            Logger.getLogger(SMSManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
