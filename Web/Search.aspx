<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Web.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="list-item-title">
        <div class="sort-left pull-left pl10">
            <span>排序：</span>
            <a href="/Search.aspx?orderby=productPrice&q=<%=words%>&desc=<%=desc==0?1:0%>" class="<%=orderby=="productPrice"?"active":"" %>">价格 <% if (orderby == "productPrice"){%><span class="glyphicon glyphicon-arrow-<%=desc==0?"up":"down" %>"></span> <%}%></a>
            <a href="/Search.aspx?orderby=add_time&q=<%=words %>" class="<% =orderby=="add_time"?"active":""%>">上架时间</a>
        </div>
        <div class="sort-right pull-right">
            <span><b class="red-font mr10">共<%= totalCount %>件商品</b> <b class="red-font"><%= page %></b>/<%= pageCount %></span>
        </div>
    </div>
    <div class="row">
        <div class="item-pro-list mt10">
            <div class="pro-list-show">
                <ul class="lazy">
                    <% 
                        if (products != null && products.Any())
                        {
                            foreach (var item in products)
                            {
                    %>
                    <li>
                        <a class="link" target="_blank" href="/detail.aspx?item=<%=item.productId %>">
                            <img class="center-block" alt="" src="/assets/img/grey.png" data-original="<%=item.productIMG %>" /></a>
                        <div class="summary"><a href="/detail.aspx?item=<%=item.productId %>"><%= item.productName %></a></div>
                        <div class="price"><b>￥<%= item.productPrice.ToString("0.00") %></b></div>
                        <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="#">已有215人评价</a></div>
                        <a class="btn btn-default btn-xs" href="/cart.aspx?item=<%=item.productId %>">加入购物车</a>
                        <button type="button" class="btn btn-default btn-xs">收藏</button>
                    </li>
                    <%
                            }
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
    <div class="list-pagination pull-right  pagination">
        <%=Shop.CommonHelper.PagerHelper.RenderPager("/Search.aspx?orderby="+orderby+"&desc="+desc+"&q="+words+"&page=@",pageCount,page,7) %>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="/assets/lib/lazyload/jquery.lazyload.js"></script>
    <script>
        $('.lazy img').lazyload();
    </script>
</asp:Content>
