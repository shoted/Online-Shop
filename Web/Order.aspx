<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Web.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="cart-title f16 tit-family pl10 mt10">订单信息 ------------><%=outmsg %></div>
        <div class="form-group">
            <label for="name" class="col-sm-2 f20 control-label">姓名</label>
            <div class="col-sm-10">
                <i class="form-control f14"><b><%=postName %></b></i>
            </div>
        </div>
        <div class="form-group">
            <label for="mobile" class="col-sm-2 f20 control-label">联系电话</label>
            <div class="col-sm-10">
                <i class="form-control f14"><b><%=postPhone %></b></i>
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 f20 control-label">地址</label>
            <div class="col-sm-10">
                <i class="form-control f14"><b><%=postAddress %></b></i>
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 f20 control-label">备注</label>
            <div class="col-sm-10">
                <i class="form-control f14"><b><%=remark %></b></i>
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 f20 control-label ">支付金额</label>
            <div class="col-sm-10">
                <%-- <input type="text" disabled="disabled" value="<%=" $1235 " %>" class="form-control" id="money" placeholder="地址">--%>
                <i class="orange-font f20 tit-family pr10">￥<b class="totalPrice"><%=money.ToString("0.00") %></b></i>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="cart-title f16 tit-family pl10 mt10">商品信息</div>
            <div class="table">
                <div class="cart-content">
                    <table width="100%" border="0" id="tab" class=" table-bordered">
                        <tbody>
                            <tr>
                                <td class="tr-title">图片</td>
                                <td class="tr-title">商品名</td>
                                <td class="tr-title">商品编号</td>
                                <td class="tr-title">商品价格</td>
                                <td class="tr-title">商品数量</td>

                            </tr>
                            <%
                                if (info != null && info.Any())
                                {
                                    foreach (var item in info)
                                    {
                            %>
                            <tr>
                                <td class="tr-list"><a href="../detail.aspx?item=<%=item.productId %>">
                                    <img src="<%=GetProductIMG(item.productId) %>" /></a></td>
                                <td class="tr-list"><a href="../detail.aspx?item=<%=item.productId %>"><%=item.productName %></a></td>
                                <td class="tr-list"><%=item.productId %></td>
                                <td class="tr-list"><%=item.productPrice.ToString("0.00") %></td>
                                <td class="tr-list"><%=item.productCount %></td>

                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <form action="/" method="post">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10">支付方式</div>
                <div class="panel panel-body">
                    <strong>请选择支付方式:</strong>
                    <hr />
                    <input type="hidden" name="money" value="<%=money %>" />
                    <input type="hidden" name="orderId" value="<%=orderId %>" />
                    <input type="radio" name="pay" checked="checked" id="yl" value="" />
                    <label for="yl">
                        <img src="assets/img/unionpay.gif" alt="银联支付" /></label>
                    <hr />
                    <input type="radio" name="pay" id="zfb" value="" />
                    <label for="zfb">
                        <img src="assets/img/y_zfb.gif" alt="支付宝支付" /></label>
                </div>
                <div class="pull-right">
                    <a type="button" class="btn btn-danger btn-lg mr20" href="PayResult.aspx?orderid=<%=orderId %>&paystatus=<%=payStatus %>">去付款</a>
                </div>
            </div>
        </form>


    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
