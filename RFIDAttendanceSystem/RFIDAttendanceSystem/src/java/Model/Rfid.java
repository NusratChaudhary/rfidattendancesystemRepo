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

    private int rfidNumber;
    private boolean verifyCheckin;

    public Rfid() {
    }

    public Rfid(int rfidNumber, boolean verifyCheckin) {
        this.rfidNumber = rfidNumber;
        this.verifyCheckin = verifyCheckin;
    }

    public Rfid(int rfidNumber) {
        this.rfidNumber = rfidNumber;
    }

    public int getRfidNumber() {
        return rfidNumber;
    }

    public void setRfidNumber(int rfidNumber) {
        this.rfidNumber = rfidNumber;
    }

    public boolean isVerifyCheckin() {
        return verifyCheckin;
    }

    public void setVerifyCheckin(boolean verifyCheckin) {
        this.verifyCheckin = verifyCheckin;
    }

}
