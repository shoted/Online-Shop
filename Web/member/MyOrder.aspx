<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="Web.member.MyOrder" %>

<%@ Register Src="~/member/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <h3 class="member-tit f16 fb tit-family"><a href="MemberCenter.aspx">我的淘宝</a>><b class="active">订单中心</b></h3>
    </div>
    <div class="row">
        <!-- 左边栏 -->
        <uc1:SideBar runat="server" ID="SideBar" />
        <!-- 内容部分开始 -->
        <div id="content" class="col-lg-10">

            <div class="table">
                <div class="cart-title f16 tit-family pl10 mt10">我的订单</div>
                <form action="MyOrder.aspx" method="post">
                    <select class=" form-control w200 mt15 ml15" name="slt">
                        <option value="-1" <%=slt==-1?"selected":"" %>>所有订单</option>
                        <option value="0" <%=slt==0?"selected":"" %>>待付款</option>
                        <option value="1" <%=slt==1?"selected":"" %>>待发货</option>
                        <option value="2" <%=slt==2?"selected":"" %>>待收货</option>
                        <option value="3" <%=slt==3?"selected":"" %>>待评价</option>
                        <option value="4" <%=slt==4?"selected":"" %>>已完成</option>
                    </select>
                </form>
                <div>
                    <%if (orders != null && orders.Any())
                        {
                            foreach (var item in orders)
                            {%>
                    <table width="100%" border="0" id="tab" class="mt30 table-bordered">
                        <tbody>
                            <tr>
                                <td class="tr-title w200 text-center">订单编号</td>
                                <td class="tr-title w100 text-center">订单价格</td>
                                <td class="tr-title w200 text-center">订单时间</td>
                                <td class="tr-title text-center">收件地址</td>
                                <td class="tr-title w100 text-center">状态</td>
                                <td class="tr-title w100 text-center">操作</td>
                            </tr>
                            <tr>
                                <td class="tr-list unl text-center"><a href="myorderDetail.aspx?item=<%=item.orderId %>"><%=item.orderId %></a></td>
                                <td class="tr-list text-center"><%=item.payPrice.ToString("0.00") %></td>
                                <td class="tr-list text-center"><%=item.addTime %></td>
                                <td class="tr-list"><%=item.postAddress %></td>
                                <td class="tr-list text-center">
                                    <% = GetStatusLink(item.orderStatus,item.orderId) %>
                                </td>
                                <td class="tr-list"><a href="../handler/DeleteOrder.ashx?userid=<%=CurrentUser.userId %>&orderid=<%=item.orderId %>" <%=(item.orderStatus==3||item.orderStatus==0)?"":"disabled"%> onclick="return confirm('确定删除?无法撤销')" class="btn btn-danger">删除订单</a></td>
                            </tr>
                        </tbody>
                    </table>
                    <%
                            }
                        }%>
                </div>
            </div>
            <div class="list-pagination pull-right">

                <%/*= PagerHelper.RenderPager("/list-"+Category.Id+"-"+(int)SortType+"-@.aspx",TotalPages,PageIndex,7)*/ %>
                <%--http://localhost:49905/list.aspx?cat=77&sort=4&page=1--%>
                <%=Shop.CommonHelper.PagerHelper.RenderPager("myorder.aspx?slt="+slt+"&page=@",totalPage,index,7) %>
            </div>



        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        $(".form-control").change(function () {
            $("form").submit();
        })
    </script>
</asp:Content>
