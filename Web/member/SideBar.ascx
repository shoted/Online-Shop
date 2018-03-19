<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBar.ascx.cs" Inherits="Web.member.SideBar" %>

    <div id="sidebar" class="col-lg-2">
                <div class="widget mb10">
                    <div class="panel-group" id="accordion">
                        <div class="panel">
                            <div class="panel-title">
                                <h5 class="fb pl10">
                                    <i class="pull-right m10 icon-main icon-up"></i><a data-toggle="collapse" data-parent="#accordion" href="#collapse-1">相关分类</a>
                                </h5>
                            </div>
                            <div id="collapse-1" class="panel-collapse collapse in">
                                <div class="meb-left-list">
                                    <ul>
                                        <li><a href="myorder.aspx" >我的订单</a></li>
                                        <li><a href="../cart.aspx">我的购物车</a></li>
                                        <li><a href="#">我的评价</a></li>
                                        <li><a href="#">我的晒单</a></li>
                                        <li><a href="../Focus.aspx">我的收藏</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-title">
                                <h5 class="fb pl10">
                                    <i class="pull-right m10 icon-main icon-up"></i><a data-toggle="collapse" data-parent="#accordion" href="#collapse-2">账户中心</a>
                                </h5>
                            </div>
                            <div id="collapse-2" class="panel-collapse collapse in">
                                <div class="meb-left-list">
                                    <ul>
                                        <li><a href="#">编辑个人信息</a></li>
                                        <li><a href="ChangePassword.aspx">修改密码</a></li>
                                        <li><a href="MyAddress.aspx">地址簿管理</a></li>
                                        <li><a href="#">我的积分</a></li>
                                        <li><a href="#">我的优惠宝</a></li>
                                        <li><a href="#">我的优惠券</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-title">
                                <h5 class="fb pl10">
                                    <i class="pull-right m10 icon-main icon-up"></i><a data-toggle="collapse" data-parent="#accordion" href="#collapse-3">客户服务</a>
                                </h5>
                            </div>
                            <div id="collapse-3" class="panel-collapse collapse ">
                                <div class="meb-left-list">
                                    <ul>
                                        <li><a href="#">退换货申请</a></li>
                                        <li><a href="#">投诉反馈</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
