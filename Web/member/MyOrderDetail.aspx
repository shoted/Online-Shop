<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="MyOrderDetail.aspx.cs" Inherits="Web.member.OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <h3 class="member-tit f16 fb tit-family"><a href="MemberCenter.aspx">我的淘宝</a>><a href="MyOrder.aspx">订单中心</a>><b class=" active">订单详细</b></h3>
    </div>
    <div class="table">
        <div class="cart-title f16 tit-family pl10 mt10">订单编号----><%=id %></div>
        <div class="cart-content">
            <table width="100%" border="0" id="tab">
                <tbody>
                    <tr>
                        <td class="tr-title">图片</td>
                        <td class="tr-title">商品名</td>
                        <td class="tr-title">商品编号</td>
                        <td class="tr-title">商品价格</td>
                        <td class="tr-title">商品数量</td>
                        <%
                            if (CouldReturn)
                            {
                        %>
                        <td class="tr-title">申请售后</td>
                        <%
                            }
                        %>
                    </tr>
                    <%foreach (var item in info)
                        {%>
                    <tr>
                        <td class="tr-list"><a href="../detail.aspx?item=<%=item.productId %>">
                            <img src="<%=GetProductIMG(item.productId) %>" /></a></td>
                        <td class="tr-list"><a href="../detail.aspx?item=<%=item.productId %>"><%=item.productName %></a></td>
                        <td class="tr-list"><%=item.productId %></td>
                        <td class="tr-list"><%=item.productPrice.ToString("0.00") %></td>
                        <td class="tr-list"><%=item.productCount %></td>
                        <%
                            if (CouldReturn)
                            {
                        %>
                        <td class="tr-list"><a class="btn btn-danger" href="MyOrderDetail.aspx">退货</a> </td>
                        <%
                            }
                        %>
                    </tr>
                    <%  } %>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
