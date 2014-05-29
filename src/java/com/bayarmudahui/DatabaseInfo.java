/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bayarmudahui;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Abdullah Izzuddiin A
 */
public class DatabaseInfo {
    public static final String KELAS = "com.mysql.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost/bayarmudahui"; 
    public static final String USERNAME = "root";
    public static final String PASSWORD = "";
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;
    
    private void openConnection()
    {
        try {
            Class.forName(KELAS);
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            stmt = conn.createStatement();
        } catch (Exception e) {            
        }
    }
    
    private void closeConnection() throws SQLException
    {
        if(stmt != null) {
            try {
                stmt.close();;
            } catch (SQLException e) {
            }
        }
        if(conn != null) {
            try {

                conn.close();

            } catch (SQLException e) {
            }
        }
        
    }
    public Akun getAkun(String npm) throws SQLException
    {
        openConnection();
        String query = "select * from akun where npm = "+npm;
        try {
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                String nama = rs.getString("nama");
                String npmX = rs.getString("npm");
                String sex = rs.getString("sex");
                String jurusan = rs.getString("jurusan");
                String noHP = rs.getString("noHP");
                String domisili = rs.getString("domisili");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String foto = rs.getString("foto");
                double saldo = rs.getFloat("saldo");
                
                Akun akun = new Akun(nama, npmX, sex, jurusan, noHP, domisili, email, password, foto, saldo);
                closeConnection();
                return akun;
            }
        } catch (Exception e) {
        }
        closeConnection();
        return null;
    }
    public Voucher getVoucher(String noVoucher) throws SQLException {
        openConnection();
        String queryVoucher = "Select * from voucher where kode_voucher ='"+noVoucher+"'";
        try {
            rs = stmt.executeQuery(queryVoucher);
            while (rs.next()) {
                String kode_voucher = rs.getString("kode_voucher");
                int nominal = (int)rs.getFloat("nominal");
                String status = rs.getString("status");
                
                Voucher voucher = new Voucher();
                closeConnection();
                return voucher;
            }
        } catch (SQLException e) {
        }
        closeConnection();
        return null;
    }
    
    public Double getSaldobyNPM(String nama) throws SQLException
    {
        openConnection();
        String query = "Select saldo from akun where nama ='"+nama+"'";
        try {
            rs = stmt.executeQuery(query);
            if (rs.next()) {
                String hasil = rs.getString("saldo");
                Double saldo = Double.parseDouble(hasil);
                closeConnection();
                return saldo;
            }

        } catch (SQLException e) {
        }
        closeConnection();
        return null;
    }
    
    public void updateSaldo(double saldo, String nama)
    {
        openConnection();
        String query = "UPDATE akun SET saldo ='"+ (float)(saldo)+"' where nama ='"+nama+"'";
        try {
            stmt.executeQuery(query);
            closeConnection();
        } catch (Exception e) {
        }
    }
    
    public void updateVoucher(String noVoucher)
    {
        openConnection();
        String query = "UPDATE voucher SET status ='Digunakan' where kode_voucher ='"+noVoucher+"'";
        try {
           stmt.executeQuery(query);
           closeConnection();
        } catch (Exception e) {
        }
    }
}
