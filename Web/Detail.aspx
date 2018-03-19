<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Web.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- 侧边栏开始  -->
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb bg-none">
                <li><a href="index.aspx">首页</a></li>
                <li><a href="list.aspx?cat=<%=categories.catParentID==0?categories.catId:categories.catParentID %>"><%= parentName%></a></li>
                <li><a href="list.aspx?cat=<%=categories.catId %>"><%=categories.catName %></a></li>
                <li class="active"><%=product.productName %></li>
            </ol>
        </div>
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
                        <div id="collapseTwo" class="panel-collapse collapse">
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
                    <li>
                        <a href="">
                            <img class="center-block" alt="" src="/assets/img/advertise/ad-2.jpg" /></a>
                        <div class="summary"><a href="">美的（Midea） MRO102C-4 反渗透 净水机</a></div>
                        <div class="price"><b class="f18">￥799</b> <span class="f12 ml10 red-font"><i class="icon-lower mr10">直降</i>已优惠 ￥481</span></div>
                    </li>
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
                                <img class="pull-left" alt="" src="" /></a>
                            <div class="summary"><a href="">阿迪达斯adidas女鞋跑步鞋-G61326</a></div>
                            <div class="price"><b>¥96</b></div>
                        </div>
                    </li>
                    <li>
                        <div class="w-list-product">
                            <a href="">
                                <img class="pull-left" alt="" src="" /></a>
                            <div class="summary"><a href="">阿迪达斯adidas女鞋跑步鞋-G61326</a></div>
                            <div class="price"><b>¥96</b></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 侧边栏开始  -->
        <!-- 右边内容开始 -->
        <div id="content" class="col-lg-10">
            <div class="item-meta">
                <h1 class="meta-tit"><%=product.productName %></h1>
                <div class="meta-situ">
                    <div class="meta-magnifier pull-left">
                        <img src="<%=product.productIMG %>" width="80%" />
                    </div>
                    <div class="meta-show pull-right">
                        <h2 class="meta-maintit"><%=product.productName %></h2>
                        <div class="meta-subtitle">满300返40,仅限一天哦</div>
                        <div class="meta-reveal mb10">
                            <ul>
                                <li class="reveal-tit">编号：</li>
                                <li class="reveal-sow"><%=product.productId %></li>
                                <li class="reveal-tit">市场价：</li>
                                <li class="reveal-sow rev-text-1">￥<%=(product.productPrice+30).ToString("0.00") %></li>
                                <li class="reveal-tit">市场价：</li>
                                <li class="reveal-sow rev-text-2">￥<%=product.productPrice.ToString("0.00") %> <b class="rev-text-3 ml10">优惠宝：<%=product.productStone %></b> <b class="rev-text-4 ml10"><a href="#">什么是优惠宝？</a></b></li>
                                <li class="reveal-tit">服    务：</li>
                                <li class="reveal-sow">由<b class="rev-text-3">淘宝</b>发货并提供帮助</li>
                                <li class="reveal-tit">商品评分：</li>
                                <li class="reveal-sow">
                                    <i class="icon-main icon-eva-5"></i>(已有2702人评价)
                                </li>
                            </ul>
                        </div>
                        <div style="border-bottom: 1px dotted #ccc;"></div>
                        <div class="meta-btn">
                            <form action="confirm.aspx" method="post">
                                <div class="quantity mb10">
                                    购买数量：
                            <span class="ui-spinner">
                                <input id="amount" name="amount" onkeyup="CheckValue(this)" type="text" value="1" aria-valuenow="0" autocomplete="off" required="required">
                                <input type="hidden" name="id" value="<%=product.productId %>" />
                                <input type="hidden" name="from" value="detail" />
                                <a id="add" class="ui-spinner-button ui-spinner-up" tabindex="-1"><span class="ui-icon">▲</span></a>
                                <a id="reduce" class="ui-spinner-button ui-spinner-down" tabindex="-1"><span class="ui-icon">▼</span></a></span>(库存<%=product.productInventory %>件)
                                </div>
                                <div class="button-group">
                                    <input type="submit" class="btn btn-danger btn-lg mr20" value="立即购买" />
                                    <a href="cart.aspx?item=<%=product.productId %>" type="button" class="btn btn-addcart btn-lg mr20"><i class="icon-main icon-addcart"></i>加入购物车</a>
                                    <button onclick="add(<%=product.productId %>)" type="button" class="btn btn-collect btn-lg"><i class="icon-main icon-like"></i>收藏</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
            <div class="item-detail">
                <ul class="nav nav-tabs detail-tabs" id="detail-tabs">
                    <li class="active"><a href="#intro" data-toggle="tab">商品介绍</a></li>
                    <li><a href="#review" data-toggle="tab">商品评价</a></li>
                    <li><a href="#after" data-toggle="tab">售后保障</a></li>
                </ul>
            </div>
            <div class="tab-pane active" id="intro">
                <p></p>
                <p><%=product.productDecribe %></p>
                <p><%=product.productDetail %></p>
                <p></p>
            </div>
            <div class="item-review" id="review">
                <div class="item-title"><span>商品评价</span></div>
                <div class="review-per">
                    <div class="rate">
                        <div>
                            78<span>%</span>
                        </div>
                        <br>
                        <span>好评度</span>
                    </div>
                    <div class="percent">
                        <dl>
                            <dt>好评<span>:78%</span></dt>
                            <dd>
                                <div style="width: 78%;">
                                </div>
                            </dd>
                        </dl>
                        <dl>
                            <dt>中评<span>:20%</span></dt>
                            <dd>
                                <div style="width: 20%;">
                                </div>
                            </dd>
                        </dl>
                        <dl>
                            <dt>差评<span>:1%</span></dt>
                            <dd>
                                <div style="width: 1%;">
                                </div>
                            </dd>
                        </dl>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="review-show mt15  p15">
                    <ul class="nav nav-tabs review-tabs" id="review-tabs">
                        <li class="active"><a href="#all-eva" data-toggle="tab">全部评价(4558)</a></li>
                        <li><a href="#good" data-toggle="tab">好评(1245)</a></li>
                        <li><a href="#general" data-toggle="tab">中评(2584)</a></li>
                        <li><a href="#poor" data-toggle="tab">差评(225)</a></li>
                    </ul>

                    <div class="tab-content p15">
                        <div class="tab-pane active" id="all-eva">
                            <%if (comments != null && comments.Any())
                                {
                                    foreach (var item in comments)
                                    {%>
                            <div class="rev-list">
                                <div class="user">
                                    <div class="user-avatar">
                                        <a href="#" target="_blank">
                                            <img alt="头像" src="assets/img/avatar.png" data-original="" style="display: inline;" /></a>
                                    </div>
                                    <div class="user-name">
                                        <a href="" target="_blank"><%=GetUserName(item.status) %></a>
                                    </div>
                                </div>
                                <div class="rev-item">
                                    <div class="rev-top">
                                        <i class="rev-star icon-main icon-eva-5"></i>
                                        <span class="rev-date"><%=item.addTime.ToString("yyyy年MM月dd") %></span>
                                    </div>
                                    <div class="rev-content">
                                       <%=item.commentContent %>
                                    </div>
                                </div>
                                <i class="corner icon-main icon-arrow"></i>
                            </div>
                            <% }
                                } %>
                        </div>
                        <div class="tab-pane" id="good">
                            <div class="rev-list">
                                <div class="user">
                                    <div class="user-avatar">
                                        <a href="" target="_blank">
                                            <img alt="唯***8" src="assets/img/avatar.png" data-original="" style="display: inline;" /></a>
                                    </div>
                                    <div class="user-name">
                                        <a href="" target="_blank">唯***8</a>
                                    </div>
                                </div>
                                <div class="rev-item">
                                    <div class="rev-top">
                                        <i class="rev-star icon-main icon-eva-5"></i><span class="rev-date">2014年01月15日</span>
                                    </div>
                                    <div class="rev-content">
                                        鞋子真的很靓，穿着挺舒服的，鞋码偏小点 平时穿42.5的 这次买的43的刚好 谢谢前面买家的意见
                                    </div>
                                </div>
                                <i class="corner icon-main icon-arrow"></i>
                            </div>
                        </div>
                        <div class="tab-pane" id="general">
                            <div class="rev-list">
                                <div class="user">
                                    <div class="user-avatar">
                                        <a href="" target="_blank">
                                            <img alt="唯***8" src="assets/img/avatar.png" data-original="" style="display: inline;" /></a>
                                    </div>
                                    <div class="user-name">
                                        <a href="" target="_blank">唯***8</a>
                                    </div>
                                </div>
                                <div class="rev-item">
                                    <div class="rev-top">
                                        <i class="rev-star icon-main icon-eva-5"></i><span class="rev-date">2014年01月15日</span>
                                    </div>
                                    <div class="rev-content">
                                        鞋子真的很靓，穿着挺舒服的，鞋码偏小点 平时穿42.5的 这次买的43的刚好 谢谢前面买家的意见
                                    </div>
                                </div>
                                <i class="corner icon-main icon-arrow"></i>
                            </div>
                        </div>
                        <div class="tab-pane" id="poor">
                            <div class="rev-list">
                                <div class="user">
                                    <div class="user-avatar">
                                        <a href="" target="_blank">
                                            <img alt="唯***8" src="assets/img/avatar.png" data-original="" style="display: inline;" /></a>
                                    </div>
                                    <div class="user-name">
                                        <a href="" target="_blank">唯***8</a>
                                    </div>
                                </div>
                                <div class="rev-item">
                                    <div class="rev-top">
                                        <i class="rev-star icon-main icon-eva-5"></i><span class="rev-date">2014年01月15日</span>
                                    </div>
                                    <div class="rev-content">
                                        鞋子真的很靓，穿着挺舒服的，鞋码偏小点 平时穿42.5的 这次买的43的刚好 谢谢前面买家的意见
                                    </div>
                                </div>
                                <i class="corner icon-main icon-arrow"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item-after" id="after">
                <div class="item-title"><span>售后保障</span></div>
                <div class="p15">
                    <p class="lh200">
                        <b>服务承诺： </b>
                        <br />
                        商城向您保证所售商品均为正品行货，自营商品自带机打发票，与商品一起寄送。凭质保证书及商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br />
                        <br />

                        注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                    </p>
                </div>
            </div>
            <div class="item-history">
                <div class="history-tit f14 fb pl10">根据您的浏览历史为您推荐</div>
                <ul class="history-list">
                    <li>
                        <img class="center-block" alt="" src="" width="165" />
                        <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price"><b>¥96</b></div>
                    </li>
                    <li>
                        <img class="center-block" alt="" src="" width="165" />
                        <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price"><b>¥96</b></div>
                    </li>
                    <li>
                        <img class="center-block" alt="" src="" width="165" />
                        <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price"><b>¥96</b></div>
                    </li>
                    <li>
                        <img class="center-block" alt="" src="" width="165" />
                        <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price"><b>¥96</b></div>
                    </li>
                    <li>
                        <img class="center-block" alt="" src="" width="165" />
                        <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price"><b>¥96</b></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 右边内容结束 -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        var s = parseInt($("#amount").val());
        $("#add").click(function () {
            s++;
            $("#amount").val(s);
        })
        $("#reduce").click(function () {
            if (s > 1) {
                s--;
            }
            $("#amount").val(s);
        })

        //防止用户输入不是数字
        function CheckValue(obj) {
            var v = obj.value.replace(/[^\d]/g, '');
            if (v == '' || v == 'NaN') {
                obj.value = "1";
            }
            else {
                obj.value = v;
            }
            if (obj.value ><%=product.productInventory%>) {
                obj.value = "1";

            }
        }

        //防止数量被修改为0
        $("form").submit(function () {

            if (parseInt($("#amount").val()) < 1) {
                $("#amount").val(1);
            }
        })

        //收藏
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
