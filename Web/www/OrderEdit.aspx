<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="OrderEdit.aspx.cs" Inherits="Web.www.OrderEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="table">
        <p class="red-font ">提示信息:<%=msg %></p>
        <form action="OrderEdit.aspx" method="post">
            <table class="table   table-bg">
                <tbody>
                    <tr>
                        <td>订单编号:(不可修改)</td>
                        <td>
                            <input type="text" name="oid" class="input-text disabled" value="<%=oid %>" readonly="readonly" />
                        </td>
                    </tr>
                    <tr>
                        <td>用户ID:(不可修改)</td>
                        <td>
                            <input type="text" name="uid" value="<%=orders.userId %>" readonly="readonly" class="input-text disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td>总价格:</td>
                        <td>
                            <input type="text" class="input-text" name="totalprice" value="<%=orders.totalPrice %>" required="required" /></td>
                    </tr>
                    <tr>
                        <td>付款价格:</td>
                        <td>
                            <input type="text" class="input-text" name="payprice" value="<%=orders.payPrice %>" required="required" /></td>
                    </tr>
                    <tr>
                        <td>付款状态:</td>
                        <td>
                            <select class="select-default" name="sltpay">
                                <option value="0" <%=orders.payStatus==0?"selected":"" %>>未付款</option>
                                <option value="1" <%=orders.payStatus==1?"selected":"" %>>已付款</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>订单状态:</td>
                        <td>
                            <select class="select-default" name="sltorder">
                                <option value="0" <%=orders.orderStatus==0?"selected":"" %>>未付款</option>
                                <option value="1" <%=orders.orderStatus==1?"selected":"" %>>未发货</option>
                                <option value="2" <%=orders.orderStatus==2?"selected":"" %>>未收货</option>
                                <option value="3" <%=orders.orderStatus==3?"selected":"" %>>未评价</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>付款时间:(不可修改)</td>
                        <td>
                            <input type="text" name="paytime" class="input-text disabled" value="<%=RequestHelper.ChangePayTime(orders.payTime) %>" readonly="readonly" />
                        </td>
                    </tr>
                    <tr>
                        <td>换货单号:</td>
                        <td>
                            <input type="button" name="exchange" value="换货" class="btn btn-default" /></td>
                    </tr>
                    <tr>
                        <td>退货单号:</td>
                        <td>
                            <input type="button" name="returned" value="退货" class="btn btn-default" />
                    </tr>
                    <tr>
                        <td>优惠宝:(不可修改)</td>
                        <td>
                            <input type="text" name="ostone" value="<%=orders.useStone %>" readonly="readonly" class="input-text disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td>地址:</td>
                        <td>
                            <textarea class=" textarea" required="required"><%=orders.postAddress %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>备注:</td>
                        <td>
                            <textarea class="textarea" name="remark"><%=orders.orderRemark %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="choose" value="修改" class="btn btn-danger" />

                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>    

        <%=js%>
</script>
</asp:Content>
