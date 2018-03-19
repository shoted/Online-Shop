<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="Web.confirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- 购物车开始 -->
    <%="" %>
    <form action="order.aspx" method="post">
        <%if (address.Any())
            {
        %>
        <div class="row">
            <div class="cart-title f16 tit-family pl10 mt10">收货人信息 <a class="pull-right f16 cart-title btn-info mr15" href="member/MyAddress.aspx">地址管理</a></div>
            <table border="0" id="tab" class="mt30 table-bordered table-hover" width="100%">
                <tbody>
                    <tr>
                        <td class="tr-title w100 ">选择</td>
                        <td class="tr-title w100 ">收件人姓名</td>
                        <td class="tr-title w200 ">收件人电话</td>
                        <td class="tr-title ">收件人地址</td>
                    </tr>
                    <%if (address != null && address.Any())
                        {
                            foreach (var item in address)
                            {%>
                    <tr style="cursor: pointer;">
                        <td class="tr-list">
                            <input type="radio" name="defaultid" id="<%=item.postId %>" value="<%=item.postId %>" <%=address.First().postId==item.postId?"checked":"" %> />
                            <label for="<%=item.postId %>">选择</label></td>
                        <td class="tr-list"><%=item.postName %></td>
                        <td class="tr-list"><%=item.postPhone %></td>
                        <td class="tr-list"><%=item.postAddress %></td>
                    </tr>
                    <%}
                        } %>
                </tbody>
            </table>
        </div>
        <%  }
            else
            {  %>
        <div class="row">
            <div class="cart-title f16 tit-family pl10 mt10">收货人信息 <a class="pull-right f16 cart-title btn-info mr15" href="member/MyAddress.aspx">地址管理</a></div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="name" value="" placeholder="姓名" required="required">
                </div>
            </div>
            <div class="form-group">
                <label for="mobile" class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="" name="mobile" placeholder="联系电话" required="required">
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="address" value="" placeholder="地址" required="required">
                </div>
            </div>
        </div>
        <%
            }%>
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10">商品清单</div>
                <div class="cart-content">
                    <table width="100%" border="0">
                        <tbody>
                            <tr>
                                <td width="45%" class="tr-title">商品名称</td>
                                <td width="7%" class="tr-title">积分</td>
                                <td width="12%" class="tr-title">金额</td>
                                <td width="11%" class="tr-title">优惠</td>
                                <td width="12%" class="tr-title">数量</td>
                            </tr>
                            <%-- 从购物车提交 --%>
                            <%if (CartList != null)
                                {
                                    foreach (var item in CartList)
                                    {%>
                            <tr>
                                <td width="45%" class="tr-list">
                                    <a href="detail.aspx?item=<%=item.productId %>">
                                        <img class="pull-left" alt="" src="<%=item.productIMG %>"></a>
                                    <div class="summary blue-font"><a href="detail.aspx?item=<%=item.productId %>"><%=item.productName %></a></div>
                                </td>
                                <td width="7%" class="tr-list"><b><%=item.productStone %></b></td>
                                <td width="12%" class="tr-list"><b class="orange-font">￥<%=item.productPrice.ToString("0.00") %></b></td>
                                <td width="11%" class="tr-list">减￥0.00</td>
                                <td width="12%" class="tr-list"><%=item.productCount %></td>
                            </tr>
                            <%  }
                                } %>
                            <%-- 从物品详细页提交 --%>
                            <%else
                                {%>
                            <tr>
                                <td width="45%" class="tr-list">
                                    <a href="detail.aspx?item=<%=products.productId %>">
                                        <img class="pull-left" alt="" src="<%=products.productIMG %>"></a>
                                    <div class="summary blue-font"><a href="detail.aspx?item=<%=products.productId %>"><%=products.productName %></a></div>
                                </td>
                                <td width="7%" class="tr-list"><b><%=products.productStone %></b></td>
                                <td width="12%" class="tr-list"><b class="orange-font">￥<%=products.productPrice.ToString("0.00") %></b></td>
                                <td width="11%" class="tr-list">减￥0.00</td>
                                <td width="12%" class="tr-list"><%=Amount %></td>
                                <input type="hidden" name="productId" value="<%=products.productId %>" />
                                <input type="hidden" name="productCount" value="<%=Amount %>" />
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-12 main-show mb10">
                <div class="p10 pr">
                    <div class="pull-left show-right">
                        <textarea name="remark" style="resize: none" class="f20 w300 h200" placeholder="备注" wrap="hard"></textarea>
                    </div>
                    <div class="show-right pull-right tr">
                        <div class=""><b class="orange-font"><%=count %></b> 件商品 总计：￥<%=total.ToString("0.00") %></div>
                        <div class="">返现：-￥0.00</div>
                    </div>
                    <%if (users.userStone > 0)
                        {
                    %>
                    <div class="pa" style="bottom: 0px; right: 0px;">
                        <input type="checkbox" name="usestone" value="1" id="usestone" />
                        <label for="usestone">
                            使用<%=users.userStone %>优惠宝,优惠<%=users.userStone/100.0 %>元</label>
                    </div>
                    <%
                        } %>

                    <div class="clearfix"></div>
                </div>
                <div class="total tr">
                    <b>总计（不含运费）：</b> <i class="orange-font f20 tit-family pr10" id="total"><%=total.ToString("0.00") %></i>
                    <input type="hidden" name="totalprice" value="<%=total.ToString("0.00") %>" />
                </div>
            </div>
            <div class="pull-right">
                <a href="javascript:history.go(-1)" type="button" class="btn btn-addcart btn-lg mr20">返回</a>
                <input type="hidden" name="from" value="<%=from %>" />
                <input type="submit" class="btn btn-danger btn-lg mr20" value="立即支付">
            </div>
        </div>
    </form>
    <!-- 购物车为空结束 -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        //是否使用积分宝
        $("#usestone").change(function () {
            var total = parseFloat($("input[name=totalprice]").val());
            var tmp;
            if ($("#usestone").is(":checked")) {
                if (total > parseFloat("<%=users.userStone/100.0%>")) {
                    tmp = total - parseFloat("<%=users.userStone/100.0%>");
                }
                else {
                    tmp = 0;
                }
            }
            else {
                tmp = total;
            }
            $("#total").html(tmp.toFixed(2));
        });
        //

        $("tr").slice(1).click(function () {

            // 找到checkbox对象
            var chks = $("input[type='radio']", this);
            var tag = $(this).attr("tag");
            if (tag != "selected") {
                // 之前已选中，设置为未选中

                chks.prop("checked", true);
            } else {
                // 之前未选中，设置为选中

                chks.prop("checked", false);
            }
        });
    </script>
</asp:Content>
