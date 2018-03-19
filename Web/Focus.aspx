<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Focus.aspx.cs" Inherits="Web.Focus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
        <%
            if (productList != null && productList.Any())
            {
        %>
        <!-- 收藏开始 -->
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10" style="background-color: #29bbbb">我的收藏</div>
                <div class="cart-content ">
                    <table width="100%" border="0" id="tab">
                        <tbody>
                            <tr>
                                <td class="tr-title">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" id="theadInp" checked="checked" />全选</label>
                                    </div>
                                </td>
                                <td class="tr-title">商品名称</td>
                                <td class="tr-title">积分</td>
                                <td class="tr-title">金额</td>
                                <td class="tr-title">优惠</td>
                                <td class="tr-title">操作</td>
                            </tr>
                            <%
                                foreach (var item in productList)
                                {
                            %>
                            <tr>
                                <td class="tr-list">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="chk" value="<%=item.productId %>" checked="checked" /></label>
                                    </div>
                                </td>
                                <td class="tr-list">
                                    <a href="detail.aspx?item=<%=item.productId %>">
                                        <img class="pull-left" alt="" src="<%= item.productIMG %>" />
                                        <div class="summary blue-font vm"><%= item.productName %></div>
                                    </a>
                                </td>
                                <td class="tr-list"><b><%=item.productStone %></b></td>
                                <td class="tr-list">￥<b class="orange-font"><%= item.productPrice.ToString("0.00") %></b>
                                </td>
                                <td class="tr-list">减￥0.00</td>

                                <td class="tr-list bule-font"><a href="Focus.aspx?did=<%=item.productId %>" onclick="return confirm('确定删除?')">删除</a></td>
                            </tr>
                            <% 
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-12 main-show mb10">
                <div class="p10">
                    <div class="show-left pull-left">
                        <i class="icon-main icon-fork"></i>
                        <input type="submit" name="delete" value="删除选中的商品" class="link" />
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="pull-right">
                <a href="List.aspx?cat=77" type="button" class="btn btn-addcart btn-lg mr20">继续购物</a>
                <input type="submit" class="btn btn-danger btn-lg mr20" name="add" value="添加到购物车" />
            </div>
        </div>
        <!-- 收藏结束 -->
        <% 
            }
            else
            {
        %>
        <!-- 收藏为空开始 -->
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10" style="background-color: #29bbbb">我的收藏</div>
                <div class="cart-content p30">
                    <div class="pull-left empty-img">
                        <img alt="" src="assets/img/empty-cart.jpg" />
                    </div>
                    <div class="pull-right empty-text tit-family">
                        您的收藏中还没有商品，您现在可以<br />
                        <b class="f14">马上去 <i><a href="List.aspx?cat=77">挑选商品</a></i>， 或者查查 <i><a href="/member/myorder.aspx">我的订单</a></i></b>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- 收藏为空结束 -->
        <% 
            }
        %>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>    
        $("#theadInp").on('click', function () {
            $("tbody input:checkbox").prop("checked", $(this).prop('checked'));
        })
        $("tbody input:checkbox").on('click', function () {
            //当选中的长度等于checkbox的长度的时候,就让控制全选反选的checkbox设置为选中,否则就为未选中
            if ($("tbody input:checkbox").length === $("tbody input:checked").length) {
                $("#theadInp").prop("checked", true);
            } else {
                $("#theadInp").prop("checked", false);
            }
        })
    </script>
</asp:Content>
