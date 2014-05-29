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
public class transaksi {
    private int besarTransaksi;
    private String tanggal;
    private String deskripsi;
    private String npmTujuan;

    public transaksi() {
    }

    public int getBesarTransaksi() {
        return besarTransaksi;
    }

    public void setBesarTransaksi(int besarTransaksi) {
        this.besarTransaksi = besarTransaksi;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public String getNpmTujuan() {
        return npmTujuan;
    }

    public void setNpmTujuan(String npmTujuan) {
        this.npmTujuan = npmTujuan;
    }
    
    
}
