<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="MyAddressAdd.aspx.cs" Inherits="Web.member.MyAddressAdd" %>

<%@ Register Src="~/member/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <h3 class="member-tit f16 fb tit-family"><a href="MemberCenter.aspx">我的淘宝</a>><b><a href="MyAddress.aspx">我的地址</a>>添加地址</b></h3>
    </div>
    <div class="row">
        <!-- 左边栏 -->
        <uc1:SideBar runat="server" ID="SideBar" />
        <!-- 内容部分开始 -->
        <div id="content" class="col-lg-10">
            <form action="MyAddressAdd.aspx" method="post" class="form-inline">
                <div class="cart-title f16 tit-family pl10 mt10">添加地址</div>
                <p>
                    <label for="name" class=" w100" >姓名:</label>

                    <input type="text" class="form-control  w500" name="name" value="" placeholder="姓名" required="required">
                </p>
                <p>
                    <label for="mobile" class="w100" >联系电话:</label>

                    <input type="text" class="form-control " value="" name="mobile" placeholder="联系电话" required="required">
                </p>
                <p>
                    <label for="address" class="w100" >地址:</label>
                    <textarea class="form-control " rows="5" cols="50" name="address" placeholder="地址" required="required"></textarea>
                   
                </p>

                <div class="pull-right btn">
                    <input type="submit" class="btn btn-danger btn-lg mt50 " name="sub" value="添加" />
                </div>
            </form>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
