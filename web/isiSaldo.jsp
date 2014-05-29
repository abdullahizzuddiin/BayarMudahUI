<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<% 
    String noVoucher = request.getParameter("noVoucher");
    String npm = session.getAttribute("npm").toString();
    String nama = session.getAttribute("nama").toString();

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/bayarmudahui";
    Connection con = DriverManager.getConnection(url,"root","");
    Statement st1,st2,st3,st4, st5,st6;       
    st1 =  con.createStatement();
    st2 =  con.createStatement();
    st3 =  con.createStatement();
    st4 =  con.createStatement();
    st5 =  con.createStatement();
    st6 =  con.createStatement();
    

    String queryAkun = "Select saldo from akun where npm ='"+npm+"'";
    ResultSet resultAkun = st1.executeQuery(queryAkun);
    Double saldo = 0.0;
                
    if(resultAkun.first())
    {
        saldo = Double.parseDouble(resultAkun.getObject(1).toString());
    }
    
    String queryVoucher = "Select * from voucher where kode_voucher ='"+noVoucher+"'";
    ResultSet resultVoucher = st2.executeQuery(queryVoucher);
        
    double nominal = 0.0;
    String status = "";
    if(resultVoucher.first())
    {
        nominal = Double.parseDouble(resultVoucher.getObject(2).toString());
        status = resultVoucher.getObject(3).toString();
        
        if(status.equals("Tersedia"))
        {
            String updateAkun = "UPDATE akun SET saldo ='"+(saldo+nominal)+"' where npm ='"+npm+"'";
            st3.executeUpdate(updateAkun);
            
            String updateVoucher = "UPDATE voucher SET status ='Digunakan' where kode_voucher ='"+noVoucher+"'";
            st4.executeUpdate(updateVoucher);
            
            String catatRiwayat = "INSERT INTO `riwayatReload`(`kode_voucher`, `npm`) VALUES ('"+noVoucher+"','"+npm+"')";
            st6.executeUpdate(catatRiwayat);
        }
        
    }
    
    String queryRiwayat = "SELECT * FROM `riwayatReload` r, voucher v where r.npm = "+npm+" and r.kode_voucher = v.kode_voucher";
    ResultSet resultRiwayat = st5.executeQuery(queryRiwayat);
    Locale locale = new Locale("in", "ID");
    NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
%>
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
                <img class="img-rounded img-thumbnail"  src="img\verified.png" style=" border-radius: 0; margin-bottom: 10px; margin-top:0px; width: 200px; height: 250px;"/>
                <a href="editProfile.jsp"><img class="img-rounded"  src="img\setting.png" style=" margin-top: 30px; vertical-align: top; width: 30px;"/></a>                
                <br>                
                <form action="index.jsp">
                <input class="btn btn-default" 
                       type="submit" nsme="Login" value="Logout" 
                       style="font-family: inherit; font-size: 20pt; background-color:#15ad9f ;color: white; height: 50px;width: 200px;border-width: 0px; border-radius: 0px;"/>                
                </form>
            </div>
            <div class="col-sm-4" style="width: 630px; margin-top: 40px; padding-left: 50px">                
                <form action="isiSaldo.jsp">
                    <h3 style="font-size: 36pt;">Masukan nomor voucher</h3>
                    <input name="noVoucher" class="form-control" type="text" style="height: 40px;width: 400px;border-radius: 0px;"/>
                
                    <input class="btn btn-default" type="submit" 
                           style="margin-top: 20px; font-family: inherit; font-size: 20pt; background-color:#15ad9f ;color: white; height: 50px;width: 200px;border-width: 0px; border-radius: 0px;"/>                
                </form>
                
                
                <h2>Riwayat pengisian saldo</h2>                
                <table class="table" style="font-size: 13pt">
                    <th>No</th>
                    <th>Waktu pengisian</th>
                    <th>Nominal</th>
                    <th>Nomor voucher</th>
                    <% 
                        int i = 1;
                        while(resultRiwayat.next()){
                     %>
                    <tr>
                        <td><%= i %></td>
                        <td><%= resultRiwayat.getObject(4) %></td>
                        <td><%= fmt.format(resultRiwayat.getObject(6)) %></td>
                        <td><%= resultRiwayat.getObject(2) %></td>
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
