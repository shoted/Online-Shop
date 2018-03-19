<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cat.ascx.cs" Inherits="Web.shared.Cat" %>
<%
    int count = 0;
    RenderCategory = parentId =>
    {
%>
<ul <%= parentId==0?"id=\"categories\" class=\"dropdown-menu\"":"class=\"sub-item\"" %>>
    <% 
        foreach (var item in Categories)
        {
            if (item.catParentID == parentId)
            {
                // 有子类
    %>
    <li>
        <a href="<%="/list.aspx?cat="+(item.catId)%>">
            <%if (parentId == 0)
                {%><i class="icon-main icon-<%=count++ %>"></i><%}%><%= item.catName %></a>
        <% RenderCategory(item.catId); %>
    </li>
    <%
            }
        }
    %>
</ul>
<%
    };
%>
<% RenderCategory(0); %>