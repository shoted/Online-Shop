<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="MyAddressEdit.aspx.cs" Inherits="Web.member.MyAddressEdit" %>

<%@ Register Src="~/member/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <h3 class="member-tit f16 fb tit-family"><a href="MemberCenter.aspx">我的淘宝</a>><b><a href="MyAddress.aspx">我的地址</a>>编辑地址</b></h3>
    </div>
    <div class="row">
        <!-- 左边栏 -->
        <uc1:SideBar runat="server" ID="SideBar" />
        <!-- 内容部分开始 -->
        <div id="content" class="col-lg-10">
            <form action="MyAddressEdit.aspx" method="post">
                <div class="cart-title f16 tit-family pl10 mt10">添加地址</div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label ">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" value="<%=address.postName %>" placeholder="姓名" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label for="mobile" class="col-sm-2 control-label ">联系电话</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="<%=address.postPhone %>" name="mobile" placeholder="联系电话" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label for="address" class="col-sm-2 control-label ">地址</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="address" value="<%=address.postAddress %>" placeholder="地址" required="required">
                    </div>
                </div>

                <div class="pull-right btn">
                    <input type="hidden" name="id" value="<%=address.postId %>" />
                    <input type="submit" class="btn btn-danger btn-lg mt50 " name="sub" value="保存" />
                </div>
            </form>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
