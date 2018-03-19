<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
    <script src="../assets/lib/jquery/jquery-1.11.0.min.js"></script>
    <link href="../assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../assets/lib/bootstrap/js/bootstrap.min.js"></script>
    <link href="../assets/css/style.css" rel="stylesheet" />
    <style type="text/css">
        body {
            background: url('../assets/img/bg-mbl.jpg') no-repeat;
            background-size: cover;
        }
        .form {
            background: rgba(255,255,255,0.2);
            width: 500px;
            margin: 120px auto;
        }
        /*阴影*/
        .fa {
            display: inline-block;
            top: 27px;
            left: 6px;
            position: relative;
            color: #ccc;
        }
        input[type="text"], input[type="password"] {
            padding-left: 26px;
        }
        .checkbox {
            padding-left: 21px;
        }
    </style>
</head>
<body>
    <form action="Login.aspx" method="post">
        <div class="container">
            <div class="form row">
                <div class="form-horizontal col-md-offset-3" id="login_form">
                    <h3 class="form-title">淘宝网后台管理系统</h3>
                    <div class="col-md-9">
                        <div class="form-group">
                            <i class="fa glyphicon glyphicon-user" aria-hidden="true"></i>
                            <input class="form-control required" type="text" placeholder="用户名" id="username" name="username" value="<%=username %>" autofocus="autofocus" maxlength="20" />
                        </div>
                        <div class="form-group">
                            <i class="fa glyphicon glyphicon-lock center-block" aria-hidden="true"></i>
                            <input class="form-control required" type="password" placeholder="密码" id="password" name="password" value="" maxlength="20" />
                        </div>
                        <div class="form-group">
                            <label class="checkbox">
                                <input type="checkbox" name="remember" value="1" />记住我
                            </label>
                        </div>
                        <div class="form-group col-md-offset-9">
                            <b style="color: red"><%=msg %></b>
                            <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                            <a type="button" href="#" class="btn btn-success pull-right mr30">注册</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
