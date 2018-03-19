<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Web.account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- 注册模块开始 -->
    <div class="row p30">
        <div class="col-lg-8">
            <!-- 左侧广告位 -->
            <img alt="" src="/assets/img/advertise/login-ban.gif" />
        </div>
        <div class="col-lg-4">
            <!-- 注册表单开始 -->
            <form role="form" action="register.aspx" method="post" class="login-form f14">
                <div class="form-group">
                    <label for="username">邮箱/用户名/已验证手机</label>
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
                    <label for="vcode">验证码</label><span id="msg" class="fr red-font fb unl"></span>
                    <div class="input-group">
                        <input type="text" class="form-control" name="vcode" placeholder="验证码" required="required" />
                        <span class="input-group-addon" style="padding: 0 2px; cursor: pointer">
                            <img id="vcode_img" src="/handler/vcode.ashx" data-src="/handler/vcode.ashx" width="100" height="32" alt="验证码" title="点击切换验证码">
                        </span>
                    </div>
                </div>
                <div class="checkbox f12">
                    <label>
                        <input name="checked" checked="checked" type="checkbox">
                        我已阅读并同意 &nbsp;<span class="blue-font"><a href="#">《用户注册协议》</a></span>
                    </label>

                </div>
                <input type="hidden" name="redirect" value="<%=Request.QueryString["redirect"] %>" />
                <button id="submit" type="button" class="btn btn-danger btn-block f16">立即注册</button>
              <%--  <p><span id="msg" class="f20 red-font"></span></p>--%>
            </form>
            <!-- 注册表单结束 -->
        </div>
    </div>
    <!-- 注册模块结束 -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        //点击切换验证码
        $('#vcode_img').on('click', function () {
            $(this).attr('src', $(this).data('src') + '?' + Math.random());
        });
        //异步提交表单到后台
        $("#submit").click(function () {
            if ($("input[type=checkbox]").attr('checked')) {
                var formData = $("form").serializeArray();
                $.post("Register.aspx", formData, function (data) {
                    if (data == "注册成功") {
                        window.location.href = "../index.aspx";
                    }
                    else {
                        $("#msg").html(data);
                        $("#msg").css("display", "block");
                        setTimeout(function () {
                            $("#msg").css("display", "none");//将图片的display属性设置为none
                        }, 3000);//设置三千毫秒即3秒
                    }
                })
            }
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
            $.post("Register.aspx", "checkname=" + username, function (data) {
                if (data == "用户名已存在") {
                    $("#msg").html(data);
                }
            })
        })
       
    </script>
</asp:Content>
