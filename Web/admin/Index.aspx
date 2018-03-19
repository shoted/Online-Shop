﻿<%@ Page Title="" Language="C#" MasterPageFile="~/shared/AdminLayout.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web.admin.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <nav class="breadcrumb">
            <i class="Hui-iconfont"></i> <a href="/" class="maincolor">首页</a>
            <span class="c-999 en">&gt;</span>
            <span class="c-666">我的桌面</span>
            <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
        </nav>
        <div class="Hui-article">
            <article class="cl pd-20">
                <p class="f-20 text-success">
                    欢迎使用
				<span class="f-14">TaoBao</span>
                    后台管理系统！
                </p>
                
                <p>登录IP：<%=RequestHelper.IPAddress %> 登录时间：<%=DateTime.Now %></p>
                <table class="table table-border table-bordered table-bg">
                    <thead>
                        <tr>
                            <th colspan="7" scope="col">信息统计</th>
                        </tr>
                        <tr class="text-c">
                            <th>统计</th>
                            <th>资讯库</th>
                            <th>图片库</th>
                            <th>产品库</th>
                            <th>用户</th>
                            <th>管理员</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="text-c">
                            <td>总数</td>
                            <td>92</td>
                            <td>9</td>
                            <td>0</td>
                            <td>8</td>
                            <td>20</td>
                        </tr>
                        <tr class="text-c">
                            <td>今日</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>

                    </tbody>
                </table>
                <table class="table table-border table-bordered table-bg mt-20">
                    <thead>
                        <tr>
                            <th colspan="2" scope="col">服务器信息</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th width="30%">服务器计算机名</th>
                            <td><span id="lbServerName">http://127.0.0.1/</span></td>
                        </tr>
                        <tr>
                            <td>服务器IP地址</td>
                            <td>192.168.1.1</td>
                        </tr>
                    </tbody>
                </table>
            </article>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
