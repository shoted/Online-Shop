<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="Web.www.MemberList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <nav>
        <form action="MemberList.aspx" method="post">
        <i class="Hui-iconfont"></i> <a  class="maincolor" href="Welcome.aspx">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">用户列表</span>
        <span class="ml100">
            <input type="text" name="keyword" value="<%=strWhere %>" class="input-text" style="display: inline; width: 500px;" placeholder="根据ID搜索用户" />
                <input type="submit" name="name" class="btn btn-primary" value="搜索" />
        </span>
        <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></form>
    </nav>

    <div class=" Hui-article pt-10">
        <article class="cl pd-20">
            <table class="table table-border table-bordered table-bg  mt-10">
                <thead>
                    <tr>
                        <th colspan="9" scope="col" class="f-20">用户列表<a class="btn btn-primary radius r" onclick="layer_show('添加用户','MemberAdd.aspx','','500')">添加</a></th>
                    </tr>
                    <tr class="text-c">
                        <th ><a href="MemberList.aspx?orderby=userId&page=<%=page %>&desc=<%=desc==0?1:0 %>">用户ID</a></th>
                        <th class="w-300" ><a href="MemberList.aspx?orderby=userName&page=<%=page %>&desc=<%=desc==0?1:0 %>">用户名</a></th>
                        <th ><a href="MemberList.aspx?orderby=userStatus&page=<%=page %>&desc=<%=desc==0?1:0 %>">用户状态</a></th>
                        <th ><a href="MemberList.aspx?orderby=userStone&page=<%=page %>&desc=<%=desc==0?1:0 %>">用户优惠宝</a></th>
                        <th ><a href="MemberList.aspx?orderby=add_time&page=<%=page %>&desc=<%=desc==0?1:0 %>">注册时间</a></th>
                        <th ><a href="MemberList.aspx?orderby=last_time&page=<%=page %>&desc=<%=desc==0?1:0 %>">上次登录时间</a></th>
                        <th >操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%if (users.Any())
                        {
                            foreach (var item in users)
                            {%>
                    <tr class="text-c">
                        <td><%=item.userId %></td>
                        <td><%=item.userName %></td>
                        <td>
                            <a href="MemberList.aspx?uid=<%=item.userId %>&orderby=<%=orderby %>&page=<%=page %>&desc=<%=desc%>" class="btn <%=item.userStatus==1?"btn-default":"btn-danger" %>"><%=ChangeUserStatus(item.userStatus)%></a>
                        </td>
                        <td><%=item.userStone%></td>
                        <td><%=item.add_time %></td>
                        <td><%=item.last_time.ToChsStr() %></td>
                        <td class="f-14 product-brand-manage">
                            <a onclick="layer_show('编辑用户','MemberEdit.aspx?eid=<%=item.userId %>','','750')" href="javascript:;" title="编辑"><i class="Hui-iconfont"></i></a>
                            <a class="ml-5" href="MemberList.aspx?did=<%=item.userId %>" onclick="return confirm('确定删除?')" title="删除"><i class="Hui-iconfont"></i></a>
                        </td>
                    </tr>
                    <% }
                        } %>
                </tbody>
            </table>
            <div class="list-pagination pull-right ">
                <%=Shop.CommonHelper.PagerHelper.RenderPager("/www/MemberList.aspx?orderby="+orderby+"&desc="+desc+"&page=@",pageCount,page,3) %>
            </div>
        </article>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
