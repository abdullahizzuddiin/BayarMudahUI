/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

/**
 *
 * @author Abdullah Izzuddiin A
 */
public class Voucher {
    private String kode_voucher;
    private int nominal;
    private String status;

    public Voucher() {
    }

    public String getKode_voucher() {
        return kode_voucher;
    }

    public void setKode_voucher(String kode_voucher) {
        this.kode_voucher = kode_voucher;
    }

    public int getNominal() {
        return nominal;
    }

    public void setNominal(int nominal) {
        this.nominal = nominal;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
}
