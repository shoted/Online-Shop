<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="AdminList.aspx.cs" Inherits="Web.www.AdminList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <nav>
        <i class="Hui-iconfont"></i> <a class="maincolor" href="Welcome.aspx">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">管理员列表</span>
        <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>

    <div class=" Hui-article pt-10">
        <article class="cl pd-20">
            <table class="table table-border table-bordered table-bg mt-10" style="width:500px;">
                <thead>
                    <tr>
                        <th colspan="4" scope="col" class="f-20">管理员列表<a class="btn btn-primary radius r" onclick="layer_show('添加管理员','AdminAdd.aspx','','500')">添加</a></th>
                    </tr>
                    <tr class="text-c">
                        <th ><a href="AdminList.aspx?orderby=Id&page=<%=page %>&desc=<%=desc==0?1:0 %>">管理员ID</a></th>
                        <th ><a href="AdminList.aspx?orderby=LoginId&page=<%=page %>&desc=<%=desc==0?1:0 %>">用户名</a></th>
                        <th >密码</th>
                        <th >操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%if (admins.Any())
                        {
                            foreach (var item in admins)
                            {%>
                    <tr class="text-c">
                        <td><%=item.Id %></td>
                        <td><%=item.LoginId %></td>
                        <td>************</td> 
                        <td class="f-14 product-brand-manage">
                            <a onclick="layer_show('编辑管理员','AdminEdit.aspx?eid=<%=item.Id %>','','500')" href="javascript:;" title="编辑"><i class="Hui-iconfont"></i></a>
                            <a class="ml-5" href="AdminList.aspx?did=<%=item.Id %>" onclick="return confirm('确定删除?')" title="删除"><i class="Hui-iconfont"></i></a>
                        </td>
                    </tr>
                    <% }
                        } %>
                </tbody>
            </table>
            <div class="list-pagination pull-left ">
                <%=Shop.CommonHelper.PagerHelper.RenderPager("/www/AdminList.aspx?orderby="+orderby+"&desc="+desc+"&page=@",pageCount,page,3) %>
            </div>
        </article>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
