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

    private int RFIDNUMBER;
    private BLOB IMAGE;

    public Rfid() {
    }

    public Rfid(int RFIDNUMBER, BLOB IMAGE) {
        this.RFIDNUMBER = RFIDNUMBER;
        this.IMAGE = IMAGE;
    }

    public void setRFIDNUMBER(int RFIDNUMBER) {
        this.RFIDNUMBER = RFIDNUMBER;
    }

    public void setIMAGE(BLOB IMAGE) {
        this.IMAGE = IMAGE;
    }

    public int getRFIDNUMBER() {
        return RFIDNUMBER;
    }

    public BLOB getIMAGE() {
        return IMAGE;
    }

}
