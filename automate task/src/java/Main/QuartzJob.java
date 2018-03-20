/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 *
 * @author Administrator
 */
public class QuartzJob implements Job {

    Connection_Mgr obj = new Connection_Mgr();
    Connection con = obj.conn();
    List finalbtch = new ArrayList();
    List id = new ArrayList();

   
    public void execute(JobExecutionContext context)
            throws JobExecutionException {

        if (con != null) {
            DateFormat dateFormat = new SimpleDateFormat("HH");

            changeflag();

          //  add_absent();

        } else {
            // do nothing 
        }
    }

    public String getdate() {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date date = new java.util.Date();
        String dt = dateFormat.format(date);
        return dt;
    }

    public String getdatee() {
        DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        java.util.Date date = new java.util.Date();
        String dt = dateFormat.format(date);
        return dt;
    }

    public boolean add_absent() {
        List btch_code = new ArrayList();
        List sid_btc = new ArrayList();
        List sid_att = new ArrayList();
        btch_code.clear();
        sid_att.clear();
        sid_btc.clear();
        boolean flag = false;
        int count = 1;
        finalbtch.clear();
        List att = new ArrayList();

        att.clear();
        System.out.println("ee");
        String q = "select BTCH_CODE,btch_attendance from BTCH where FLAG='R' AND AUTOMATE_FLAG='X'";
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(q);

            while (rs.next()) {
                btch_code.add(rs.getString("BTCH_CODE"));
                att.add(rs.getString("btch_attendance"));

            }

        } catch (Exception e) {

        }

        System.out.println(btch_code.size());
        DateFormat dateFormat1 = new SimpleDateFormat("HH:mm");
        Calendar cal = Calendar.getInstance();

        String q5 = "insert into ATTENDACE_DTLS values(?,?,?,?,?)";

        for (int i = 0; i <= btch_code.size() - 1; i++) {

            String q6 = "select count(*) from btch where btch_code='" + btch_code.get(i) + "'  AND FLAG='R' AND AUTOMATE_FLAG='X' and (to_date('" + dateFormat1.format(cal.getTime()) + "', 'hh24:mi') > to_date('" + att.get(i) + "', 'hh24:mi'))";
            int counter = 0;
            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(q6);
                while (rs.next()) {
                    counter = rs.getInt("count(*)");
                }
                if (counter == 1 && chk_day(btch_code.get(i).toString())) {

                    finalbtch.add(btch_code.get(i));
                    finalbtch.toString();
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        for (int i = 0; i <= finalbtch.size() - 1; i++) {
            String q3 = "select std_id from BTCH_DTLS where btch_cd='" + finalbtch.get(i) + "'";
            String q4 = "select std_id from ATTENDACE_DTLS where btch_code='" + finalbtch.get(i) + "' AND date_time=to_char(sysdate,'DD/MM/YYYY')";

            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(q3);

                Statement stmt2 = con.createStatement();
                ResultSet rs2 = stmt2.executeQuery(q4);

                while (rs.next()) {
                    sid_btc.add(rs.getString("std_id"));
                }

                while (rs2.next()) {
                    sid_att.add(rs2.getString("std_id"));
                }

            } catch (Exception e) {
                System.out.println(e);
            }

            sid_btc.removeAll(sid_att);

            for (int j = 0; j <= sid_btc.size() - 1; j++) {

                try {
                    PreparedStatement ps = con.prepareCall(q5);
                    ps.setString(1, sid_btc.get(j).toString());
                    ps.setString(2, finalbtch.get(j).toString());
                    ps.setString(3, getdate());
                    ps.setString(4, "n/a");
                    ps.setString(5, "A");
                    ps.executeUpdate();
                } catch (Exception e) {
                    System.out.println(e);
                }

            }
            try {
                Statement stmt = con.createStatement();
                stmt.executeUpdate("update btch set AUTOMATE_FLAG='Y' where btch_code='" + finalbtch.get(i) + "'");
            } catch (Exception e) {
                System.out.println(e);
            }
            add_trigg("Attendance Marked for " + finalbtch.get(i));
        }

        if (count == 0) {
            return flag;
        } else {
            return flag;
        }

    }

    public boolean chk_day(String btch) {
        boolean flag = false, flag2 = false;
        String q = "select dayss from btch where BTCH_CODE='" + btch + "' ";
        String a = null;

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(q);
            while (rs.next()) {
                a = rs.getString("dayss");
            }
            flag = true;
        } catch (Exception e) {
            System.out.println(e);
            flag = false;
        }

        if (flag) {

            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            String today = new SimpleDateFormat("EE", Locale.ENGLISH).format(date.getTime());

            flag2 = a.contains(today);

        } else {

        }

        if (flag && flag2) {
            return true;
        } else {
            return false;
        }

    }

    public void getid() {

        List id2 = new ArrayList();

        String q = "select std_id from std_dtls";
        String q1 = "select std_id from std_brk where flag='Y'";

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(q);
            while (rs.next()) {
                id.add(rs.getString("std_id"));
            }

            Statement stmt2 = con.createStatement();
            ResultSet rs2 = stmt2.executeQuery(q1);
            while (rs2.next()) {
                id2.add(rs2.getString("std_id"));
            }

            id.removeAll(id2);
        } catch (Exception e) {
        }
    }

    public boolean changeflag() {
        boolean chk = false;
        int a = 0;
        String q1 = "select count(*) from triggg where date_time LIKE '%" + getdate() + "%'";
        String q2 = "update btch set automate_flag='X' where flag='R'";
        String q3 = "update rfid set login='-',logout='-',flag='X'";
        try {
            Statement stmt2 = con.createStatement();
            ResultSet rs = stmt2.executeQuery(q1);
            while (rs.next()) {
                a = rs.getInt("count(*)");
            }
        } catch (Exception e) {
        }

        if (a == 0) {

            try {
                Statement stmt2 = con.createStatement();
                stmt2.executeUpdate(q2);
                chk = true;
                add_trigg("Flag Changed For Attendance");
            } catch (Exception e) {
                System.out.println(e);
            }

            try {
                Statement stmt4 = con.createStatement();
                stmt4.executeUpdate(q3);
                chk = true;
                add_trigg("Flag Changed For RFID");
            } catch (Exception e) {
                System.out.println(e);
            }

            String q = "update STD_DTLS set flag='B',OTP='-',DATEE='-' where flag='A' or flag='B' or flag='C'";

            try {
                Statement stmt = con.createStatement();
                stmt.executeUpdate(q);
                chk = true;
                add_trigg("Flag Changed");
            } catch (Exception e) {
                System.out.println(e);
            }

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date date = new java.util.Date();
            dateFormat.format(date);

            String q4 = "select u_id from std_brk where flag='Z' AND to_date('" + dateFormat.format(date) + "','DD/MM/YYYY')= to_date(brk_dt_str,'DD/MM/YYYY') OR to_date('" + dateFormat.format(date) + "','DD/MM/YYYY')> to_date(brk_dt_str,'DD/MM/YYYY') ";
            List u_id = new ArrayList();
            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(q4);
                while (rs.next()) {
                    u_id.add(rs.getString("u_id"));
                }
            } catch (Exception e) {
            }
            if (u_id.size() > 0) {

                for (int l = 0; l <= u_id.size() - 1; l++) {
                    String q5 = "update std_brk set flag='Y' where u_id='" + u_id.get(l) + "'";

                    String q7 = "update std_dtls set flag='D' where std_id=(select std_id from std_brk where u_id='" + u_id.get(l) + "')";
                    try {
                        Statement stmt = con.createStatement();
                        stmt.executeUpdate(q5);
                        Statement stmt2 = con.createStatement();
                        stmt2.executeUpdate(q7);
                    } catch (Exception e) {
                    }
                }

            } else {

            }

            u_id.clear();
            u_id.clear();

            String q5 = "select u_id from std_brk where flag='Y' AND to_date('" + dateFormat.format(date) + "','DD/MM/YYYY')> to_date(brk_dt_stp,'DD/MM/YYYY')";
            System.out.println(q5);
            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(q5);
                while (rs.next()) {
                    u_id.add(rs.getString("u_id"));
                }
            } catch (Exception e) {
            }

            if (u_id.size() > 0) {
              
                for (int m = 0; m <=u_id.size() - 1; m++) {
                    String kl = "update std_brk set flag='X' where u_id='" + u_id.get(m) + "'";
                    String k2 = "update std_dtls set flag='B' where std_id=(select std_id from std_brk where u_id='" + u_id.get(m) + "')";
                  
                    try {
                        Statement stmt = con.createStatement();
                        stmt.executeUpdate(kl);
                        Statement stmt2 = con.createStatement();
                        stmt2.executeUpdate(k2);
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                }

            } else {

            }

        } else {
            chk = false;
        }

        // start of email
        String q6 = "select count(*) from rfid where flag='P'";
        int cntt = 0;
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(q6);
            while (rs.next()) {
                cntt = rs.getInt("count(*)");
            }
        } catch (Exception e) {
        }
        List sid = new ArrayList();
        List imgpth = new ArrayList();
        List nm = new ArrayList();

        if (cntt > 0) {
            String q8 = "select sid,imgpth from rfid where flag='P'";

            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(q8);
                while (rs.next()) {
                    sid.add(rs.getString("sid"));
                    imgpth.add(rs.getString("imgpth"));

                }

            } catch (Exception e) {
            }

            for (int i = 0; i <= sid.size() - 1; i++) {
                try {
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("select std_name from rfid where std_id='" + sid.get(i) + "'");
                    while (rs.next()) {
                        nm.add(rs.getString("std_name"));
                    }

                } catch (Exception e) {
                }

            }
            
            
            for (int i = 0; i <=sid.size(); i++) {
             //   sendmail(nm.get(i).toString(), sid.get(i).toString(), imgpth.get(i).toString());
            }

        } else {

            // do nothing
        }

        // end of email
        return chk;
    }

    public int add_trigg(String com) {
        int a = 0;
        String q = "insert into triggg values(?,?)";

        try {
            PreparedStatement ps = con.prepareCall(q);
            ps.setString(1, getdate() + " " + getdatee());
            ps.setString(2, com);
            a = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return a;
    }

    public void sendmail(String nm, String sid, String impth) {
        String to = "mohnishanjaria@gmail.com";//change accordingly  
        final String from = "niit.vpe.studentservices@gmail.com";
        final String password = "P*1niitvpe#2";

        //1) get the session object     
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        //get Session   
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        //2) compose message     
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("NIIT ID PRINT");

            //3) create MimeBodyPart object and set your message text     
            BodyPart messageBodyPart1 = new MimeBodyPart();
            messageBodyPart1.setText("STUDENT ID = " + sid + "\n STUDENT NAME = " + nm);

            //4) create new MimeBodyPart object and set DataHandler object to this object      
            MimeBodyPart messageBodyPart2 = new MimeBodyPart();

            String filename = impth;//change accordingly  
            DataSource source = new FileDataSource(filename);
            messageBodyPart2.setDataHandler(new DataHandler(source));
            messageBodyPart2.setFileName(filename);

            //5) create Multipart object and add MimeBodyPart objects to this object      
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart1);
            multipart.addBodyPart(messageBodyPart2);

            //6) set the multiplart object to the message object  
            message.setContent(multipart);

            //7) send message  
            Transport.send(message);

            try {
                Statement stmt=con.createStatement();
                stmt.executeUpdate("update rfid set flag='S' where sid='"+sid+"'");
            } catch (Exception e) {
            }
            System.out.println("message sent....");
        } catch (MessagingException ex) {
            System.out.println(ex);
            ex.printStackTrace();
        }

    }

   
}
