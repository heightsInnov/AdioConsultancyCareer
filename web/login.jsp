<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="AEP - Login">
        <meta name="author" content="AEP">
        <meta name="keyword" content="">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>Adio Consultancy</title>

        <!-- Bootstrap CSS -->    
        <link href="logincss/bootstrap.min.css" rel="stylesheet" />
        <!-- bootstrap theme -->
        <link href="logincss/bootstrap-theme.css" rel="stylesheet">
        <!--external css-->
        <!-- font icon -->
        <link href="logincss/elegant-icons-style.css" rel="stylesheet" />
        <link href="logincss/font-awesome.css" rel="stylesheet" />
        <!-- Custom styles -->
        <link href="logincss/style.css" rel="stylesheet">
        <link href="logincss/style-responsive.css" rel="stylesheet" />

    </head>

    <body class="login-img3-body">

        <div class="container">
            <form class="login-form" method="POST" action="login.java"> 
                <input type="hidden" name="command" id="command" value="auth"/>
                <div class="login-wrap">
                    <p class="login-img">Login</p>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon_profile"></i></span>
                        <input name="txtusername" type="text" class="form-control" placeholder="Username" autofocus>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                        <input name="txtpassword" type="password" class="form-control" placeholder="Password">
                    </div>
                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Login">
                    <input type="submit" class="btn btn-info btn-lg btn-block" type="submit" value="Clear" formaction=""/>
                </div>

                <div class="alert-dismissable alert-warning" >
                    <label class="form-control-static" name="alert" id="alert"></label>
                </div>
            </form>
        </div>
    </body>
</html>
