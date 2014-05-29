<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
    <% 
        String username = session.getAttribute("username").toString();
        String nama = session.getAttribute("nama").toString();
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/bayarmudahui";
        Connection con = DriverManager.getConnection(url,"root","");
        Statement st1;    
        st1 =  con.createStatement();
    
        String query = "SELECT * FROM transaksi t, akuntransaksi at where at.username = '"+username+"' and at.id_transaksi = t.id ";
        ResultSet resultRiwayat = st1.executeQuery(query);
        
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
                <img class="img-rounded img-thumbnail"  src="img\verified.png" style=" border-radius: 0; margin-bottom: 10px; margin-top: 0px; width: 200px; height: 250px;"/>
                <a href="editProfile.jsp"><img class="img-rounded"  src="img\setting.png" style=" margin-top: 30px; vertical-align: top; width: 30px;"/></a>                
                <br>                
                <form action="index.jsp">
                <input class="btn btn-default" 
                       type="submit" nsme="Login" value="Logout" 
                       style="font-family: inherit; font-size: 20pt; background-color:#15ad9f ;color: white; height: 50px;width: 200px;border-width: 0px; border-radius: 0px;"/>                
                </form>
            </div>
            <div class="col-sm-4" style="width: 630px; margin-top: 60px; padding-left: 50px">                
                <h2>Riwayat transaksi</h2>                
                <table class="table" style="font-size: 13pt">
                    <th>Waktu</th>
                    <th>Kode Transaksi</th>
                    <th>Username Tujuan</th>
                    <th>Nama Barang</th>
                    <th>Nominal</th>
                    <th>Saldo</th>
                    <% while(resultRiwayat.next()){
                     %>
                    <tr>
                        <td><%= resultRiwayat.getObject(3) %></td>
                        <td><%= resultRiwayat.getObject(1) %></td>
                        <td><%= resultRiwayat.getObject(5) %></td>
                        <td><%= resultRiwayat.getObject(4) %></td>
                        <td><%= fmt.format(resultRiwayat.getObject(2)) %></td>
                        <td><%= fmt.format(resultRiwayat.getObject(9)) %></td>
                    </tr>
                    <% } %>
                </table>
                
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
