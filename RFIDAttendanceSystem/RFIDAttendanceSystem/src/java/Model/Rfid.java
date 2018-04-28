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

    public Rfid() {
    }

    public Rfid(int RFIDNUMBER) {
        this.RFIDNUMBER = RFIDNUMBER;
    }

    public int getRFIDNUMBER() {
        return RFIDNUMBER;
    }

    public void setRFIDNUMBER(int RFIDNUMBER) {
        this.RFIDNUMBER = RFIDNUMBER;
    }


   

}
