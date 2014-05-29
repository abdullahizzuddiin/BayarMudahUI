/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bayarmudah;

import com.bayarmudahui.DatabaseInfo;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.sql.*;
import java.util.*;

/**
 *
 * @author luqman
 */
@WebService(serviceName = "beliBarang")
public class beliBarang {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "beli")
    public int beli(@WebParam(name = "pengirim") String pengirim, @WebParam(name = "penerima") String penerima, @WebParam(name = "nominal") String nominal, @WebParam(name = "keterangan") String keterangan){
        //TODO write your implementation code here:
        DatabaseInfo db = new DatabaseInfo();
        return 0;
    }

}
