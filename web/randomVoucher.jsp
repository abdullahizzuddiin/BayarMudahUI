<%-- 
    Document   : randomVoucher
    Created on : May 24, 2014, 11:09:43 PM
    Author     : Abdullah Izzuddiin A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        float[] nominal = {5000,10000,20000,50000};
        int[] b = new int[16];
        String a = "";
        Random c = new Random();
        for(int ii=0;ii<b.length;ii++) {
            a += c.nextInt(10)+"";
        }

        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/bayarmudahui";
        Connection con = DriverManager.getConnection(url,"root","");
        Statement st1;
        st1 = conn.createStatement();
        String query = "INSERT into voucher (kode_voucher, nominal, status) " +
                        "VALUES ('"+a+"','"+nominal[c.nextInt(4)+"','Tersedia')";

        
        %>
        <h1>Hello World!</h1>
    </body>
</html>
