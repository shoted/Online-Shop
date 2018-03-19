<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="CommentList.aspx.cs" Inherits="Web.www.CommentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <nav >
        <i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span> 管理员列表 
        <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont"></i></a>
    </nav>
    <div class="Hui-article">
        <form action="CommentList.aspx" method="post">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <input type="submit" name="del" value="批量删除" class="btn btn-danger radius" />
                    <a href="CommentList.aspx" class="btn btn-danger radius">添加</a>
                </span>
                <span class="r">共有数据：<strong><%=total %></strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg">
                <thead>
                    <tr>
                        <th scope="col" colspan="9">员工列表</th>
                    </tr>
                    <tr class="text-c">
                        <th width="25">
                            <input type="checkbox" name="" value=""></th>
                        <th width="40">ID</th>
                        <th>内容</th>
                        <th width="160">时间</th>
                        <th width="300">产品名</th>
                        <th width="100">评论人</th>

                        <th width="100">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%if (comments != null && comments.Any())
                        {
                            foreach (var item in comments)
                            {
                    %>
                    <tr class="text-c">
                        <td>
                            <input type="checkbox" value="<%=item.commentId %>" name="chk"></td>
                        <td><%=item.commentId %></td>
                        <td><%=item.commentContent %></td>
                        <td><%=item.addTime %></td>
                        <td><%=GetProductName(item.productId) %></td>
                        <td><%=GetUserName(item.status) %></td>
                        <td class="td-manage">
                            <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-add.html','1','800','500')" class="ml-5" style="text-decoration: none"><i class="Hui-iconfont"></i></a>
                            <a title="删除" href="javascript:;" onclick="admin_del(this,'1')" class="ml-5" style="text-decoration: none"><i class="Hui-iconfont"></i></a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </form>
        <div class="list-pagination pull-right ">
            <%=Shop.CommonHelper.PagerHelper.RenderPager("/www/CommentList.aspx?page=@",totalCount,page,3) %>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
