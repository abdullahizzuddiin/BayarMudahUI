<%@page import="java.text.NumberFormat"%>
<!DOCTYPE html>
<html lang="en">
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Bayar Mudah UI v0.1</title>

    <!-- Bootstrap core CSS -->
    
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS for the 'Business Frontpage' Template -->
    <link href="css/content.css" rel="stylesheet">
    <link href="css/font.css" rel="stylesheet">
</head>

<body>
    <% 
        String username = session.getAttribute("username").toString();
        String nama = session.getAttribute("nama").toString();
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/bayarmudahui";
        Connection con = DriverManager.getConnection(url,"root","");
        Statement st = con.createStatement();
        if(request.getParameter("usernametujuan") != null && request.getParameter("nominal") != null){
    
        
        String query = "select * from akun where username = "+request.getParameter("usernametujuan");
        ResultSet resultSet = st.executeQuery(query);
        ResultSetMetaData rsmd = resultSet.getMetaData();
        
        if (resultSet.first() && !resultSet.next()) {
            resultSet.first();
            double nominal = Double.parseDouble(request.getParameter("nominal"));
            System.out.println(resultSet.getObject(8).toString());
            double saldo = Double.parseDouble(resultSet.getObject(8).toString());
            if (nominal < saldo) {
                saldo += nominal;
                String query2 = "UPDATE `bayarmudahui`.`akun` SET `saldo` = '"+saldo+"' WHERE `akun`.`username` = '"+request.getParameter("usernametujuan")+"'";
                st.executeUpdate(query2);
                resultSet = st.executeQuery("select * from akun where username = "+username);
                resultSet.first();
                saldo = Double.parseDouble(resultSet.getObject(8).toString());
                saldo -= nominal;
                String query3 = "UPDATE `bayarmudahui`.`akun` SET `saldo` = '"+saldo+"' WHERE `akun`.`username` = "+username+";";
                st.executeUpdate(query3);
                String query4 = "INSERT INTO `riwayatTransfer`(`usernamePengirim`, `usernamePenerima`, `nominal`) VALUES ('"+username+"','"+request.getParameter("usernametujuan")+"','"+nominal+"')";
                st.executeUpdate(query4);
                }
            
            }else{
            
            //pw.print(hash);
                       }
        //con.close();
        //st.close();
}
String queryRiwayat = "SELECT * FROM `riwayatTransfer` where `usernamePengirim` = "+username;
ResultSet resultRiwayat = st.executeQuery(queryRiwayat);
Locale locale = new Locale("in", "ID");
    NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
%>



    <nav class="navbar navbar-fixed-top navbar-inverse" 
         role="navigation" style=" vertical-align: middle; background-color: #15ad9f; border-color: #15ad9f; color: white; height: 50px;">
        <div class="container">                   
            <div class="navbar-header">                
                <a class="navbar-brand" href="content.jsp"><img src="img\home1.png" style="width: 30px; height: 30px;"/></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">                    
                    <li style="background-color: #75c98e"><a href="isiSaldo.jsp">Isi Saldo</a>
                    </li>
                    <li style="background-color: #b0ce86"><a href="transferSaldo.jsp">Transfer Saldo</a>
                    </li>
                  
                    <li style="background-color: #ead47e"><a href="riwayatTransaksi.jsp">Riwayat Transaksi</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="business-header">
        <div class="row" >
<div class="col-sm-4" style="background-color:#222222; height:400px; margin-top: 50px; padding-left: 30px; padding-bottom: 45px; margin-left: 70px; width: 270px;">                        
                <p style="text-align: left; margin-top: 5px; color: white"><%= nama %></p>
                <img class="img-rounded img-thumbnail"  src="img\verified.png" style=" border-radius: 0; margin-bottom: 10px; margin-top: 0px; width: 200px; height: 250px;"/>
                <a href="editProfile.jsp"><img class="img-rounded"  src="img\setting.png" style=" margin-top: 30px; vertical-align: top; width: 30px;"/></a>                
                <br>                
                <form action="index.jsp">
                <input class="btn btn-default" 
                       type="submit" nsme="Login" value="Logout" 
                       style="font-family: inherit; font-size: 20pt; background-color:#15ad9f ;color: white; height: 50px;width: 200px;border-width: 0px; border-radius: 0px;"/>                
                </form>
            </div>
            <div class="col-sm-4" style="width: 630px; margin-top: 40px; padding-left: 50px">                
                <form action="transferSaldo.jsp" method="post">
                <h3>NPM tujuan</h3>  <input id="usernametujuan" name="usernametujuan" class="form-control" type="text" style="height: 40px;width: 300px;border-radius: 0px;"/>
                <h3>Nominal</h3>
                <input id="nominal" name="nominal" class="form-control" type="text" style="height: 40px;width: 300px;border-radius: 0px;"/>
                <input class="btn btn-default" type="submit" 
                       style="margin-top: 20px; font-family: inherit; font-size: 20pt; background-color:#15ad9f ;color: white; height: 50px;width: 200px;border-width: 0px; border-radius: 0px;"/>                
                </form>
                
                
                <h2>Riwayat transfer saldo</h2>                
                <table class="table" style="font-size: 13pt">
                    <th>No</th>
                    <th>Waktu Transfer</th>
                    <th>Username Tujuan</th>
                    <th>Nominal</th>
                    <% 
                        int i = 1;
                        while(resultRiwayat.next()){
                     %>
                    <tr>
                        <td><%= i %></td>
                        <td><%= resultRiwayat.getObject(5) %></td>
                        <td><%= resultRiwayat.getObject(3) %></td>
                        <td><%= fmt.format(resultRiwayat.getObject(4)) %></td>
                    </tr>
                    <% i++; } %>
                </table>
            </div>
            <div class="col-sm-4" style="background-color:#ead47e; height:400px; margin-top: 50px; padding: 20px; padding-bottom: 50px; width: 400px;" >
                <h4 style="font-size: 28pt; color: #15ad9f">Ringkasan Akun Anda</h4>
            <img src="img\time.png" style="width: 20px; height: 20px "/> <p>Kunjungan Terakhir : </p>
            <img src="img\shopping.png" style="width: 30px; height: 30px "/> <p>Pembelian Terakhir : </p>
            <img src="img\duit.png" style="width: 30px; height: 30px "/> <p>Saldo : </p>
            
            </div>
        </div>                
        
        <footer>
            <div class="navbar navbar-fixed-bottom" style="background-color: #15ad9f; color: white; text-align: center">                                   
                    <div class="row">
                    <div class="col-sm-12">
                        <img class="img-rounded"  src="img\icon.png" style="width:200px; margin-top: 30px; vertical-align: top; "/>
                        <h4>COPYRIGHT &copy; 2014. BayarMudahUI ALL FEATURES &copy; OF THEIR RESPECTIVE OWNERS</h4>
                        
                    </div>
        </div>                
                    
            </div>
        </footer>   

    </div>
    <!-- /container -->


    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

</body>

</html>
