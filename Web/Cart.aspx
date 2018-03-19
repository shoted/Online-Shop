<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Web.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
        <%if (CurrentUser == null) { Response.Redirect("account/login.aspx"); } %>
        <% if (CartList != null && CartList.Any())
            { %>
        <!-- 购物车开始 -->
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10">我的购物车</div>
                <div class="cart-content">
                    <table width="100%" border="0" id="tab" class="table-hover">
                        <tbody>
                            <tr>

                                <td class="tr-title">商品名称</td>
                                <td class="tr-title">金额</td>
                                <td class="tr-title">积分</td>
                                <td class="tr-title">优惠</td>
                                <td class="tr-title">数量</td>
                                <td class="tr-title">操作</td>
                            </tr>
                            <% foreach (var item in CartList)
                                { %>
                            <tr>

                                <td class="tr-list">
                                    <a href="detail.aspx?item=<%=item.productId %>">
                                        <img class="pull-left" alt="" src="<%= item.productIMG %>" />
                                        <div class="summary blue-font vm"><%= item.productName %></div>
                                    </a>
                                </td>
                                <td class="tr-list">￥<b class="orange-font"><%= item.productPrice.ToString("0.00") %></b></td>
                                <td class="tr-list"><b><%=item.productStone %></b></td>
                                <td class="tr-list">减￥0.00</td>
                                <td class="tr-list">
                                    <span class="ui-spinner">
                                        <input class="text_box" type="text" value="<%= item.productCount %>" autocomplete="off" onkeyup="CheckValue(this)" onblur="setTotal();update(this,<%=item.cartId %>,<%=item.userId %>,this.value);">
                                        <a class="ui-spinner-button ui-spinner-up add" tabindex="-1" onclick="update(this,<%=item.cartId %>,<%=item.userId %>,<%=item.productCount %>,'add')"></a>
                                        <a class="ui-spinner-button ui-spinner-down reduce" tabindex="-1" onclick="update(this,<%=item.cartId %>,<%=item.userId %>,<%=item.productCount %>,'reduce')"></a>
                                    </span>
                                </td>
                                <td width="8%" class="tr-list bule-font"><a href="/handler/DeleteCart.ashx?item=<%=item.cartId%>" onclick="return confirm('确定删除?')">删除</a></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-12 main-show mb10">
                <div class="p10">

                    <div class="show-right pull-right tr">
                        <div class=""><b class="totalCount"></b>件商品 总计：￥<span class="totalPrice"></span></div>
                        <div class="">返现：-￥0.00</div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="total tr"><b>总计（不含运费）：</b> <i class="orange-font f20 tit-family pr10">￥<b class="totalPrice"></b></i></div>

            </div>
            <div class="pull-right">
                <a href="javascript:history.go(-1)" type="button" class="btn btn-addcart btn-lg mr20">继续购物</a>
                <a href="confirm.aspx?from=cart" type="button" class="btn btn-danger btn-lg mr20">去结算</a>
            </div>
        </div>
        <!-- 购物车结束 -->
        <% }
            else
            { %>
        <!-- 购物车为空开始 -->
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10">我的购物车</div>
                <div class="cart-content p30">
                    <div class="pull-left empty-img">
                        <img alt="" src="assets/img/empty-cart.jpg" />
                    </div>
                    <div class="pull-right empty-text tit-family">
                        您的购物车中还没有商品，您现在可以<br />
                        <b class="f14">马上去 <i><a href="List.aspx?item=77">挑选商品</a></i>， 或者查查 <i><a href="/member/myorder.aspx">我的订单</a></i></b>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- 购物车为空结束 -->
        <% } %>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script type="text/javascript">
        //防止数量文本框内有非数字值
        function CheckValue(obj) {
            var v = obj.value.replace(/[^\d]/g, '');
            if (v == '' || v == 'NaN') {
                obj.value = "1";
            }
            else {
                obj.value = v;
            }
        }

        //计算总金额
        function setTotal() {
            var sum = 0;
            var count = 0;
            $("#tab tr").each(function () {
                if (!isNaN(parseInt($(this).find('input[class*=text_box]').val()))) {
                    sum += parseInt($(this).find('input[class*=text_box]').val()) * parseFloat($(this).find('.orange-font').text());
                    count += parseInt($(this).find('input[class*=text_box]').val());
                }
            });
            $(".totalPrice").html(sum.toFixed(2));
            $(".totalCount").html(count);

        }
        setTotal();

        //异步更新购物车
        function update(obj, cid, user, pcount, select) {
            var json = { id: cid, userid: user, count: pcount, type: select };
            $.post("/handler/cartUpdate.ashx", json, function (data) {
                if (data > 0) {
                    $(obj).parent().find("input[type=text]").val(data);
                    setTotal();
                }
            })
        }
    </script>
</asp:Content>
