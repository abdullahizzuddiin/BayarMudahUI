<%-- 
    Document   : Login
    Created on : Apr 20, 2014, 10:23:33 PM
    Author     : Abdullah Izzuddiin A
--%>

<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="com.sun.xml.internal.ws.api.addressing.WSEndpointReference.Metadata"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
                public String md5(String input) {
         
                    String md5 = null;

                    if(null == input) return null;

                    try {

                    //Create MessageDigest object for MD5
                    MessageDigest digest = MessageDigest.getInstance("MD5");

                    //Update input string in message digest
                    digest.update(input.getBytes(), 0, input.length());

                    //Converts message digest value in base 16 (hex) 
                    md5 = new BigInteger(1, digest.digest()).toString(16);

                    } catch (NoSuchAlgorithmException e) {

                        e.printStackTrace();
                    }
                    return md5;
                }
%>
        <% 
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/bayarmudahui";
        Connection con = DriverManager.getConnection(url,"root","");
        Statement st = con.createStatement();
        
        String username = request.getParameter("nama");
        String password = request.getParameter("password");
       String query = "select * from akun u where u.nama='"+username+"' and u.password='"+password+"'";
       ResultSet resultSet = st.executeQuery(query);
         
        System.out.println(username);
        PrintWriter pw = response.getWriter();
        ResultSetMetaData rsmd = resultSet.getMetaData();
        
        /*int kolom = rsmd.getColumnCount();
        while(resultSet.next()){
            for(int i=1;i<=kolom;i++){
                pw.print(resultSet.getObject(i)+"\n");
            }
        }*/
        if (resultSet.first() && !resultSet.next()) {
            resultSet.first();
            //pw.print("Welcome, "+resultSet.getObject(7));
//            System.out.println(resultSet.getObject(7)+"asadio");
//            System.out.println(resultSet.getObject(11)+"1238");
            session.setAttribute("npm", resultSet.getObject(2));
            session.setAttribute("nama", resultSet.getObject(1));
//pw.print(session.getAttribute("nama").toString());
//            session.setAttribute("role", resultSet.getObject(11));
//            int role = Integer.parseInt(resultSet.getObject(9).toString());
//            switch(role){
//                case 1 : response.sendRedirect("content.jsp");
              response.sendRedirect("content.jsp");
//                break;
//                default:response.sendRedirect("index.jsp");
//            }
            
            }else{
            pw.print("Wrong username or password");
            //pw.print(hash);
                       }
        con.close();
        st.close();
%>
    </body>
</html>
