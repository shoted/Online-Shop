<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Web.member.ChangePassword" %>
<%@ Register Src="~/member/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <h3 class="member-tit f16 fb tit-family"><a href="MemberCenter.aspx" class="active" target="memcenter">我的淘宝</a></h3>
    </div>
    <div class="row">
        <!-- 左边栏 -->
        <uc1:SideBar runat="server" ID="SideBar" />
        <!-- 内容部分开始 -->
        <div id="content" class="col-lg-3">
            <form  method="post" action="ChangePassword.aspx" >
                    <div class="form-group">
                        <label for="username">旧密码</label>
                        <input type="password" class="form-control " name="oldpassword" id="oldpassword" placeholder="旧密码" required="required">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="密码" required="required">
                    </div>
                    <div class="form-group">
                        <label for="confirm">确认密码</label>
                        <input type="password" class="form-control" name="confirm" id="confirm" placeholder="确认密码" required="required">
                    </div>
                    <button type="submit" class="btn btn-danger btn-block f16">立即修改</button>
                <h3 class="red-font"><%=msg %></h3>
                </form>
           
            

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
