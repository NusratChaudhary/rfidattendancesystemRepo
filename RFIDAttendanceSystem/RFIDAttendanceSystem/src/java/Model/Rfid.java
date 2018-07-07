/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import oracle.sql.BLOB;

/**
 *
 * @author mohnish
 */
public class Rfid {

    private int rfidnumber;
    private boolean verifyCheckin;

    public Rfid() {
    }

    public Rfid(int rfidnumber, boolean verifyCheckin) {
        this.rfidnumber = rfidnumber;
        this.verifyCheckin = verifyCheckin;
    }

    public Rfid(int rfidnumber) {
        this.rfidnumber = rfidnumber;
    }

    public int getRfidnumber() {
        return rfidnumber;
    }

    public void setRfidnumber(int rfidnumber) {
        this.rfidnumber = rfidnumber;
    }

    public boolean isVerifyCheckin() {
        return verifyCheckin;
    }

    public void setVerifyCheckin(boolean verifyCheckin) {
        this.verifyCheckin = verifyCheckin;
    }

}
