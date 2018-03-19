<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="MemberCenter.aspx.cs" Inherits="Web.member.MemberCenter" %>

<%@ Register Src="~/member/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <h3 class="member-tit f16 fb tit-family"><b>我的淘宝</b></h3>
    </div>
    <div class="row">
        <!-- 左边栏 -->
        <uc1:SideBar runat="server" ID="SideBar" />
        <!-- 内容部分开始 -->
        <div id="content" class="col-lg-10">

            <div class="meb-avatar pull-left">
                <img alt="" src="../assets/img/avatar.png" />
            </div>
            <div class="meb-infor pull-right">
                <div class="meb-infor-title mb10"><b class="orange-font f14"><%=CurrentUser.userName %></b>&nbsp;&nbsp;欢迎您!</div>
                <div class="account-security mb10">
                    账户安全：<b class="orange-font">中级</b> <i class="icon-main icon-security-4"></i>
                    <i class="icon-main icon-phone-bright"></i>手机已验证 
                            <i class="icon-main icon-email-bright"></i>邮箱已验证 
                            <i class="icon-main icon-regular-bright"></i>正常
                </div>
                <div class="information">
                    <ul>
                        <li class="information-tit">优惠宝：</li>
                        <li class="information-show"><span class="pull-right"><a href="#">什么是优惠宝？</a></span>
                            <b id="stone"><%=stone%></b><b id="chstone">(=<%=(stone/100.0).ToString("0.00") %>元)</b></li>
                        <li class="information-tit">已完成：</li>
                        <li class="information-show"><a href="Myorder.aspx?slt=-1">全部订单(<%=orderCount %>)</a></li>
                        <li class="information-tit">待处理：</li>
                        <li class="information-show">
                            <a href="Myorder.aspx?slt=0">待付款(<%=orderState1 %>)</a> &nbsp;
                                    <a href="MyOrder.aspx?slt=1">待发货(<%=orderState2 %>)</a> &nbsp;
                                    <a href="MyOrder.aspx?slt=2">待收货(<%=orderState3 %>)</a> &nbsp;
                                    <a href="Myorder.aspx?slt=3">待评价(<%=orderState4 %>)</a> &nbsp;  
                                    <a href="MyOrder.aspx?slt=4">已完成(<%=orderState5 %>)</a>

                        </li>
                        <li class="information-tit">总积分：</li>
                        <li class="information-show"><span class="pull-right"><a href="#">积分规则</a></span><a href="#">0</a></li>
                        <li class="information-tit last-li">等级：</li>
                        <li class="information-show last-li">
                            <span class="pull-right">亲！签到可获得<b class="red-font f14">10</b>优惠宝
                                <a onclick="sign(this,<%=CurrentUser.userId %>)" class="btn btn-warning btn-xs">我要签到 </a>
                                <b id="msg" class="red-font f14"></b>
                            </span>
                            <a href="#">49</a>&nbsp;<i class="icon-main icon-level-1"></i></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>

        function sign(obj, id) {
            $.post("../handler/Sign.ashx", "userid=" + id, function (data) {
                if (data === '签到成功') {
                    $(obj).attr('disabled', true);

                    var stone = parseInt($("#stone").html());
                    stone += 10;
                    $("#stone").html(stone);
                    $("#chstone").html("(=" + stone / 100 + ")元");
                }
                $("#msg").html(data);
            })
        }
    </script>
</asp:Content>
