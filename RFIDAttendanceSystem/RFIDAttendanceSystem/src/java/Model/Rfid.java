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

    public Rfid() {
    }

    public Rfid(int RFIDNUMBER) {
        this.rfidNumber = RFIDNUMBER;
    }

    public int getRFIDNUMBER() {
        return rfidNumber;
    }

    public void setRFIDNUMBER(int RFIDNUMBER) {
        this.rfidNumber = RFIDNUMBER;
    }


   

}
