<!DOCTYPE html>
<html lang="en">

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
         role="navigation" style="background-color: #15ad9f; border-color: #15ad9f; color: white; height: 70px;">
        <div class="container">                   
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><img src="img\icon.png" style=" padding-left: 940px;margin-top:5px; height: 40px;"/></a>
            </div>
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="business-header">
        <div class="row">
            <div class="col-sm-4" style="margin-left: 70px; width: 320px;">                        
                <div class="row" style="background-color:#222222; margin-top: 30px; padding: 20px; padding-bottom: 45px">
                <form action="content.jsp">
                        <h2 style="color: #15ad9f; font-family: sans-serif">easy login with SSO UI </h2>
                    <h3 style="color: white">Username</h3>
                    <input class="form-control" type="text" name="nama" placeholder="Nama Anda" style="height: 40px;width: 300px;border-radius: 0px;"/>
                <h3 style="color: white">Password</h3>
                <input class="form-control" type="password" name="password" placeholder="Password" style="height: 40px;width: 300px;border-radius: 0px;"/>
                <br>
                <input class="btn btn-default" 
                       type="submit" name="Login" value="mari bayar :)" 
                       style="font-family: inherit; font-size: 20pt; background-color:#15ad9f ;color: white; height: 50px;width: 300px;border-width: 0px; border-radius: 0px;"/>
                </form>
                </div>                
            </div>
            <div class="col-sm-4" style="margin-left: 40px; width: 280px; ">                        
                <div class="row" style="background-color:#75c98e; height:400px; margin-top: 30px; padding: 20px; padding-bottom: 50px">
                    <br><br><br>
                    <img src="img\mudah.png" style="display: block; margin-left: auto; margin-right: auto;width: 100px;"/>                    
                    <br>
                    <h4 style=" font-size: 20pt; text-align: center;color: #222222;">mudah, sekali klik. <br> 
                                        barang yang Anda beli terbayar</h4>
                    <br>
                </div>
            </div>
            <div class="col-sm-4" style="margin-left: 30px; width: 280px;">                        
                <div class="row" style="background-color:#b0ce86; height:400px; margin-top: 30px; padding: 20px; padding-bottom: 50px">
                    <br><br><br>
                    <img src="img\cepat.png" style="display: block; margin-left: auto; margin-right: auto; width: 250px;"/>
                    <br>
                    <h4 style=" font-size: 20pt; text-align: center;color: #222222;">proses transaksi cepat. 
                                        </h4>
                    
                </div>
            </div>
            <div class="col-sm-4" style="margin-left: 30px; ;width: 280px;">                        
                <div class="row" style="background-color:#ead47e; height:400px; margin-top: 30px; padding: 20px; padding-bottom: 50px">
                    <br><br><br>
                    <img src="img\uang.png" style="display: block; margin-left: auto; margin-right: auto;width: 130px;"/>
                    <br>
                    <h4 style=" font-size: 20pt; text-align: center;color: #222222;">hemat penggunaan 
                                            <br> uang cash
                                        </h4>                    
                </div>
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
    