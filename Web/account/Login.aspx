<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- 登录模块开始 -->
    <div class="row p30">
        <div class="col-lg-8">
            <!-- 左侧广告位 -->
            <img alt="" src="/assets/img/advertise/login-ban.gif" />
        </div>
        <div class="col-lg-4">
            <!-- 登录表单开始 -->
            <form role="form" action="login.aspx" method="post" class="login-form f14">
                <div class="form-group">
                    <label for="username">邮箱/用户名/已验证手机</label>
                    <input type="text" class="form-control" name="username" placeholder="邮箱/用户名/已验证手机" value="<%= Username %>" required="required" />
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control" value="<%=Password %>" name="password" placeholder="密码" required="required" />
                </div>
                <div class="form-group">
                    <label for="vcode">验证码</label><span id="msg" class="fr red-font fb unl"></span>
                    <div class="input-group">
                        <input type="text" class="form-control" name="vcode" placeholder="验证码" required="required">
                        <span class="input-group-addon" style="padding: 0 2px; cursor: pointer">
                            <img id="vcode_img" src="/handler/vcode.ashx" data-src="/handler/vcode.ashx" width="100" height="32" alt="验证码" title="点击切换验证码">
                        </span>
                    </div>
                </div>
                <div class="checkbox f12">
                    <label>
                        <input name="checked" type="checkbox" checked="checked" />记住我</label>
                    <span class="pull-right"><a href="findme.aspx">忘记密码？</a>&nbsp;<a href="register.aspx">免费注册</a></span>
                </div>
                <button type="button" id="submit" class="btn btn-danger btn-block f16">登 录</button>
                <div class="f12 pt10">
                    合作登录：<i class="icon-main icon-cooper ml10"></i><a class="blue-font" href="#">QQ账号</a>
                </div>
            </form>
            <!-- 登录表单结束 -->
        </div>
    </div>
    <!-- 登录模块结束 -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>  
        //点击切换验证码
        $('#vcode_img').on('click', function () {
            var $this = $(this);
            $this.attr('src', $this.data('src') + '?' + Math.random());
        });

        //异步提交表单到后台
        $("#submit").click(function () {
            var formData = $("form").serializeArray();
            $.post("Login.aspx", formData, function (data) {
                if (data == "登录成功") {
                    //history.go(-1);
                    //window.location.reload();
                    window.location.href ='<%=url%>';

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

        //setTimeout(function () {
        //    $("#msg").css("display", "none");//将图片的display属性设置为none
        //}, 3000);//设置三千毫秒即3秒
    </script>

</asp:Content>
