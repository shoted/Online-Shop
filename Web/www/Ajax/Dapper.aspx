<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dapper.aspx.cs" Inherits="Web.www.Ajax.dapper" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../assets/css/style.css" rel="stylesheet" />
    <link href="/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../assets/lib/jqueryui/css/ui-lightness/jquery-ui-1.10.4.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="col-lg-4 ">
            <!-- 登录表单开始 -->
            <form role="form" action="register.aspx" method="post" id="sign" class="login-form f14 ">
                <div class="form-group">
                    <p id="msg" class=" red-font fb">&nbsp; </p>
                </div>
                <div class="form-group ">
                    <label for="username">邮箱/用户名/手机</label>
                    <a id="validate" class="fr alert-warning disabled "><span class="glyphicon glyphicon-lock"></span>验证</a>
                    <input type="text" class="form-control" name="username" value="" placeholder="邮箱/用户名/已验证手机" required="required" />        
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control" name="password" placeholder="密码" required="required" />
                </div>
                <div class="form-group">
                    <label for="confirm">确认密码</label>
                    <input type="password" class="form-control" name="confirm" placeholder="确认密码" required="required" />
                </div>
                <div class="form-group">
                    <label for="vcode">验证码</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="code" placeholder="验证码" required="required" />
                        <span class="input-group-addon" style="padding: 0 2px; cursor: pointer">
                            <img id="vcode_img" src="/handler/vcode.ashx" data-src="/handler/vcode.ashx" width="100" height="32" alt="验证码" title="点击切换验证码" />
                        </span>
                        <input type="hidden" name="type" value="sign" />
                    </div>
                </div>
                <div class="checkbox f12">
                    <label>
                        <input name="checked" checked="checked" type="checkbox" />
                        我已阅读并同意 &nbsp;<span class="blue-font"><a href="#">《用户注册协议》</a></span>
                    </label>
                </div>
                <button id="submit" type="button" class="btn btn-danger btn-block f16">立即注册</button>
            </form>

            <div id="dialog">
                <form id="f" class="form-inline" role="form">
                    <p>
                        请输入邮箱中的验证码:
                    </p>
                    <p>
                        <input type="text" name="vcode" value="" class="form-control" />
                        <span class="fr"><b class="btn btn-danger" id="send">重发</b></span>
                    </p>
                    <p>
                        <input type="hidden" name="type" value="mail" />
                        <input type="button" name="sub" value="保存" class="btn btn-danger" />
                    </p>
                </form>
            </div>
            <!-- 登录表单结束 -->
        </div>
    </div>


    <script src="../../assets/lib/H-ui/lib/jquery/1.9.1/jquery.js"></script>
    <script src="../../assets/lib/pagination/jquery.twbsPagination.js"></script>
    <script src="../../assets/lib/jqueryui/js/jquery-ui-1.10.4.js"></script>
    <script src="../../assets/lib/cookie/jquery.cookie.js"></script>
    <script>
        //隐藏dialog
        $("#dialog").hide();
        $("input[type=password]").attr("readonly", true);
        $("input[name=code]").attr("readonly", true);
        $("#validate").hide();
       
        //重新发送邮件
        $("#send").click(function () {
            $.post("Dapper.aspx", "type=send&username=" + $("input[name=username]").val(), function (data) {
                alert("已发送");
            })
        })
        //验证邮件验证码是否相同
        $("input[name=sub]").click(function () {
            var formData = $("#f").serializeArray();
            $.post("Dapper.aspx", formData, function (data) {
                if (data == "ok") {
                    alert("验证通过");
                    $("#dialog").dialog("close");
                    $.cookie("vcode", null, { path: "/", expiress: -1 })
                }
                else {
                    alert("手残???");
                }
            })

        })
        //点击切换验证码
        $('#vcode_img').on('click', function () {
            var $this = $(this);
            $this.attr('src', $this.data('src') + '?' + Math.random());
        });

        //异步提交注册表单
        $("#validate").click(function () {
            var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
            if (reg.test($("input[name=username]").val())) {
                var formData = $("#sign").serializeArray();
                $.post("Dapper.aspx", formData, function (data) {
                    if (data == "ok") {
                        $("#dialog").dialog();
                        $("#dialog").show();
                    }
                    else {
                        $("#msg").html(data);
                        $("#msg").css("display", "block");
                        setTimeout(function () {
                            $("#msg").css("display","none");//将图片的display属性设置为none
                        }, 3000);//设置三千毫秒即3秒
                    }
                })
            }
        })

        //异步提交表单到后台
        $("#submit").click(function () {
            var formData = $("form").serializeArray();
            $.post("Login.aspx", formData, function (data) {
                if (data == "登录成功") {
                    //history.go(-1);
                    //window.location.reload();
                    self.location = document.referrer;
                }
                else {
                    $("#msg").html(data);
                }
            })
        })

        //按enter触发提交表单
        $(document).keyup(function (event) {
            if (event.keyCode == 13) {
                $("#submit").trigger("click");
            }
        });

        //用户名文本框失去焦点时,查询用户名是否存在
        $("input[name=username]").blur(function () {
            var username = $(this).val();
            $.post("../../account/Register.aspx", "checkname=" + username, function (data) {
                if (data == "用户名已存在") {
                    $("#msg").html(data);
                    setTimeout(function () {
                        $("#msg").css("display","none");//将图片的display属性设置为none
                    }, 1000);//设置三千毫秒即3秒
                }
            })
        })

        //检验邮箱格式是否正确
        $("input[name=username]").keydown(function () {
            var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
            isok = reg.test($("input[name=username]").val());
            if (!isok) {
                $("#msg").html("邮箱格式不正确");
                $("#validate").hide();
            }
            else {
                $("#msg").html(" &nbsp;");
                $("#validate").show();
                
            }
        })
    </script>
</body>

</html>
