<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="PayResult.aspx.cs" Inherits="Web.PayResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="meb-content ">
                <%if (pay)
                    {
                %>
                <p class="text-center mt100 f20 red-font"><span class="glyphicon glyphicon glyphicon-send"></span>付款成功,订单将尽快发送到您手上</p>
                <p class="text-center"><a href="member/MyOrder.aspx?slt=1" class="unl  f20 fb">查看订单</a></p>
                <%
                    }
                    else
                    {
                %>
                <p class="text-center mt100 f20 red-font"><span class="glyphicon glyphicon glyphicon-send"></span>付款失败,订单状态错误</p>
                <p class="text-center"><a href="member/MyOrder.aspx?slt=0" class="unl  f20 fb">查看订单</a></p>
                <%
                    }
                %>
            </div>

        </div>
        <div class="col-lg-4"></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
