<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="Web.www.OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <nav>
        <i class="Hui-iconfont"></i> <a class="maincolor" href="Welcome.aspx">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">分类列表</span>
        <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="form">
        <form action="OrderList.aspx" method="post" class="form">
            <span class="f-20 c-red">请选择订单种类:</span>
            <select name="slt" id="slt" class=" select-default f-20 " style="display:inline">
                <option value="-1" <%=slt==-1?"selected":"" %> >所有</option>
                <option value="0" <%=slt==0?"selected":"" %>>待付款</option>
                <option value="1" <%=slt==1?"selected":"" %>>待发货</option>
                <option value="2" <%=slt==2?"selected":"" %>>待收货</option>
                <option value="3" <%=slt==3?"selected":"" %>>待评价</option>
            </select>

        </form>
    </div>
    <br />
    <%foreach (var item in orders)
        {%>
    <div id="tab" class="HuiTab mb-30 ">
        <div class="tabBar clearfix table-bordered">
            <span><a class="c-white" onclick="layer_show('订单详细','OrderEdit.aspx?oid=<%=item.orderId %>','','750')">订单编号:<%=item.orderId %></a></span>
            <b style="display: inline-block; font-weight: bold; height: 30px; line-height: 30px; padding: 0 15px;">地址---><%=item.postAddress %></b>
            <b style="display: inline-block; font-weight: bold; height: 30px; line-height: 30px; padding: 0 15px;">备注---><%=item.orderRemark %></b>
            <a class="r btn btn-primary" href="OrderList.aspx?oid=<%=item.orderId %>&slt=<%=slt %>&page=<%=index %>" <%=item.orderStatus==1?"":"disabled='disabled'" %>>发货</a>
            <a class="r btn btn-danger mr-50" href="OrderList.aspx?deleteid=<%=item.orderId %>&slt=<%=slt %>" onclick="return confirm('确认删除?')">删除</a>
        </div>
        <div class="tabCon">
            <table class="table table-bg ">
                <tr class=" tr-title">
                    <th>下单时间</th>
                    <th>用户ID</th>
                    <th>价格</th>

                    <th>付款状态</th>
                    <th>订单状态</th>

                    <th>付款时间</th>
                    <th>换货单号</th>
                    <th>退货单号</th>
                    <th>优惠宝</th>
                </tr>
                <tr>
                    <td><%=item.addTime %></td>
                    <td><%=item.userId %></td>
                    <td><%=item.totalPrice.ToString("0.00") %></td>

                    <td><%=RequestHelper.ChangePayStatus( item.payStatus )%></td>
                    <td class="<%=item.orderStatus==1?"red-font fb unl":"" %>"><%=RequestHelper.ChangeOrderSta( item.orderStatus) %></td>

                    <td><%=RequestHelper.ChangePayTime( item.payTime) %></td>
                    <td><%=RequestHelper.ChangeStone( item.exchangeOrderId )%></td>
                    <td><%=RequestHelper.ChangeStone( item.returnOrderId )%></td>
                    <td><%=RequestHelper.ChangeStone( item.useStone )%></td>

                </tr>
            </table>

            <table class="table table-border table-bordered table-bg  table-hover" style="width: 800px;">
                <tr class="tr-title  ">
                    <th class="w100">商品编号</th>
                    <th>商品名</th>
                    <th class="w100">商品数量</th>
                    <th class="w100">商品价格</th>
                </tr>

                <%if (GetOrderDetail(item.orderId).Any<Shop.Model.OrderDetail>())
                    {
                        foreach (var i in GetOrderDetail(item.orderId))
                        {%>
                <tr>
                    <td><%=i.productId %></td>
                    <td><%=i.productName %></td>
                    <td><%=i.productCount %></td>
                    <td><%=i.productPrice.ToString("0.00") %></td>
                </tr>
                <%}

                    } %>
            </table>
        </div>

    </div>
    <%
        } %>
    <div class="list-pagination pull-right ">
        <%=Shop.CommonHelper.PagerHelper.RenderPager("OrderList.aspx?slt="+slt+"&page=@",totalCount,index,7) %>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>    
        $(".HuiTab").Huitab(".HuiTab .tabBar span", ".HuiTab .tabCon", "current", "click", "1")
        $("#slt").change(function () {
            $("form").submit();
        })
    </script>
</asp:Content>
