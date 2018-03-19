<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Web.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- 列表页部分开始 -->
    <div class="row">
        <!-- 面包屑导航开始 -->
        <div class="col-lg-12">
            <ol class="breadcrumb bg-none">
                <li><a href="index.aspx">首页</a></li>
                <li><a href="list.aspx?cat=31"><%=ParentName %></a></li>
                <li class="active"><%=Category.catName %></li>
            </ol>
        </div>
        <!-- 面包屑导航结束 -->
    </div>
    <div class="row">
        <!-- 左边栏开始 -->
        <div id="sidebar" class="col-lg-2">
            <!-- 相关分类模块 -->
            <div class="widget mb10">
                <h5 class="widget-tit pl10 fb">相关分类</h5>
                <div class="panel-group" id="accordion">
                    <div class="panel">
                        <div class="panel-title">
                            <h5 class="fb pl10">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">书籍</a>
                            </h5>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-list">
                                <ul>
                                    <li><a href="list.aspx?cat=75">C/C++</a></li>
                                    <li><a href="list.aspx?cat=76">Java</a></li>
                                    <li><a href="list.aspx?cat=77">ASP.NET</a></li>
                                    <li><a href="list.aspx?cat=78">JSP</a></li>
                                    <li><a href="list.aspx?cat=97">VB</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-title">
                            <h5 class="fb pl10">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">手机</a>
                            </h5>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse ">
                            <div class="panel-list">
                                <ul>
                                    <li><a href="list.aspx?cat=71">苹果</a></li>
                                    <li><a href="list.aspx?cat=70">三星</a></li>
                                    <li><a href="list.aspx?cat=73">华为</a></li>
                                    <li><a href="list.aspx?cat=69">小米</a></li>
                                    <li><a href="list.aspx?cat=98">魅族</a></li>
                                    <li><a href="list.aspx?cat=99">努比亚</a></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-title">
                            <h5 class="fb pl10">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">运动配件</a>
                            </h5>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-list">
                                <ul>
                                    <li><a href="">CPU</a></li>
                                    <li><a href="">声卡/扩展卡</a></li>
                                    <li><a href="">刻录机/光驱</a></li>
                                    <li><a href="">主板</a></li>
                                    <li><a href="">刻录机/光驱</a></li>
                                    <li><a href="">声卡/扩展卡</a></li>
                                    <li><a href="">刻录机/光驱</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 商品推荐 -->
            <div class="widget mb10">
                <h5 class="widget-tit pl10 fb">热门商品推荐</h5>
                <ul class="widget-list-3">
                    <li>
                        <a href="">
                            <img class="center-block" alt="" src="/assets/img/advertise/ad-2.jpg" /></a>
                        <div class="summary"><a href="">美的（Midea） MRO102C-4 反渗透 净水机</a></div>
                        <div class="price"><b class="f18">￥799</b> <span class="f12 ml10 red-font"><i class="icon-lower mr10">直降</i>已优惠 ￥481</span></div>
                    </li>

                </ul>
            </div>
            <!-- 浏览记录推荐 -->
            <div class="widget mb10">
                <h5 class="widget-tit pl10 fb">根据浏览记录为您推荐</h5>
                <ul class="widget-list-3">
                    <li>
                        <a href="">
                            <img class="center-block" alt="" src="/assets/img/advertise/ad-2.jpg" /></a>
                        <div class="summary tc"><span class="f12 ml10 red-font">%9会买 ：</span><a href="">美的（Midea） MRO102C-4 反渗透 净水机</a></div>
                        <div class="price tc"><b class="f18">￥799</b> </div>
                    </li>
                </ul>
                <div class="blue-font p10 pull-right"><a href="">查看更多推荐</a></div>
                <div class="clearfix"></div>
            </div>
            <!-- 浏览记录 -->
            <div class="widget mb10">
                <h5 class="widget-tit pl10 fb"><span class="pull-right f12 pr10 gray-font"><a href="">清除</a></span>浏览记录</h5>
                <ul class="widget-list-2">
                    <li>
                        <div class="w-list-product">
                            <a href="">
                                <img class="pull-left" alt="" src="assets/img/advertise/ad-1.jpg" /></a>
                            <div class="summary"><a href="#">阿迪达斯adidas女鞋跑步鞋-G61326</a></div>
                            <div class="price"><b>¥96</b></div>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
        <!-- 左边栏结束 -->
        <!-- 内容区域开始 -->
        <div id="content" class="col-lg-10">
            <div class="item-recommend">
                <div class="list-item-title pl10 f14 tit-family "><i class="icon-main icon-recom mr5"></i>热卖推荐</div>
                <div class="recommend-list">
                    <ul>
                        <li>
                            <a href="">
                                <img alt="" class="pull-left center-block" src="/assets/img/advertise/ad-2.jpg" /></a>
                            <div class="summary"><a href="">安踏Anta男鞋跑步鞋-11245507-4</a></div>
                            <div class="price"><b>¥227.00</b></div>
                            <button type="button" class="btn btn-danger btn-xs">立即抢购</button>
                        </li>
                        <li>
                            <a href="">
                                <img alt="" class="pull-left center-block" src="/assets/img/advertise/ad-2.jpg" /></a>
                            <div class="summary"><a href="">安踏Anta男鞋跑步鞋-11245507-4</a></div>
                            <div class="price"><b>¥227.00</b></div>
                            <button type="button" class="btn btn-danger btn-xs">立即抢购</button>
                        </li>
                        <li>
                            <a href="">
                                <img alt="" class="pull-left center-block" src="/assets/img/advertise/ad-2.jpg" /></a>
                            <div class="summary"><a href="">安踏Anta男鞋跑步鞋-11245507-4</a></div>
                            <div class="price"><b>¥227.00</b></div>
                            <button type="button" class="btn btn-danger btn-xs">立即抢购</button>
                        </li>
                        <li>
                            <a href="">
                                <img alt="" class="pull-left center-block" src="/assets/img/advertise/ad-2.jpg" /></a>
                            <div class="summary"><a href="">安踏Anta男鞋跑步鞋-11245507-4</a></div>
                            <div class="price"><b>¥227.00</b></div>
                            <button type="button" class="btn btn-danger btn-xs">立即抢购</button>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="item-pro-list mt10">
                <div class="list-item-title">
                    <div class="sort-left pull-left pl10">
                        <span>排序：</span>
                        <%--<a href="">销量 <span class="glyphicon glyphicon-arrow-down"></span></a>--%>
                        <% var isPriceSort = (sortType == Web.Code.SortType.PriceAsc || sortType == Web.Code.SortType.PriceDesc); %>

                        <a href="/list.aspx?cat=<%= Category.catId %>&sort=<%=sortType==Web.Code.SortType.PriceAsc?2:1  %>&page=1" <%= isPriceSort?" class=\"active\"":string.Empty %>>价格 <%if (isPriceSort)
                                                                                                                                                                                              { %><span class="glyphicon glyphicon-arrow-<%= sortType==Web.Code.SortType.PriceAsc?"up":"down" %>"></span><%} %></a>
                        <%-- <a href="">评论数 <span class="glyphicon glyphicon-arrow-down"></span></a>--%>
                        <a href="/list.aspx?cat=<%= Category.catId %>&sort=4&page=1" <%= (sortType==Web.Code.SortType.OnsaleDesc)?" class=\"active\"":string.Empty %>>上架时间</a>
                    </div>
                    <div class="sort-right pull-right">
                        <span><b class="red-font mr10">共<%= TotalCount %>件商品</b> <b class="red-font"><%= PageIndex %></b>/<%= TotalPages %></span>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="pro-list-show">
                    <ul class="lazy">
                        <%
                            if (Products != null && Products.Any())
                            {
                                foreach (var item in Products)
                                {
                        %>
                        <li>
                            <a class="link" href="/detail.aspx?item=<%=item.productId %>">
                                <img class="center-block" alt="" src="/assets/img/grey.png" data-original="<%=item.productIMG %>" /></a>
                            <div class="summary"><a href="/detail.aspx?item=<%=item.productId %>"><%= item.productName %></a></div>
                            <div class="price"><b>￥<%= item.productPrice.ToString("0.00") %></b></div>
                            <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="#">有99评价</a></div>
                            <a class="btn btn-default btn-xs" href="/cart.aspx?item=<%=item.productId %>">加入购物车</a>
                            <button type="button" class="btn btn-default btn-xs" onclick="add(<%=item.productId %>);">收藏</button>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
            <div class="list-pagination pull-right  pagination">
                <%-- <ul class="pagination">
                    <li class="previous disabled"><a href="?">&laquo;&laquo;</a></li>
                    <li class="disabled"><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&raquo;</a></li>
                    <li class="next"><a href="#">&raquo;&raquo;</a></li>
                </ul>--%>
                <%/*= PagerHelper.RenderPager("/list-"+Category.Id+"-"+(int)SortType+"-@.aspx",TotalPages,PageIndex,7)*/ %>
                <%--http://localhost:49905/list.aspx?cat=77&sort=4&page=1--%>
                <%=Shop.CommonHelper.PagerHelper.RenderPager("/list.aspx?cat="+Category.catId+"&sort="+(int)sortType+"&page=@",TotalPages,PageIndex,7) %>
            </div>
        </div>
        <!-- 内容区域结束 -->
    </div>
    <!-- 列表页部分结束 -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="/assets/lib/lazyload/jquery.lazyload.js"></script>
    <script>
        $('.lazy img').lazyload();
        function add(id) {
            if (typeof (id) != 'undefined') {
                var tmp = $.cookie('list');
                tmp += '|' + id;
                var expiresDate = new Date();
                expiresDate.setTime(expiresDate.getDate() + (15 * 24 * 60 * 60 * 1000));
                $.cookie('list', tmp, { expires: 15 });
                alert("收藏成功");
            }
        }
    </script>
</asp:Content>
