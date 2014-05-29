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
            } catch (Exception e) {
            }
        }
        if(conn != null) {
            conn.close();
        }
    }
    
    public Voucher getVoucher(String noVoucher) {
        openConnection();
        String queryVoucher = "Select * from voucher where kode_voucher ='"+noVoucher+"'";
        try {
            rs = stmt.executeQuery(queryVoucher);
            while (rs.next()) {
                String kode_voucher = rs.getString("kode_voucher");
                int nominal = (int)rs.getFloat("nominal");
                String status = rs.getString("status");
                
                Voucher voucher = new Voucher();
            }
        } catch (Exception e) {
        }
    }

}
