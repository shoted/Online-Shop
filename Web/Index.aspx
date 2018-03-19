﻿<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- 第一行 轮播广告 开始 -->
    <div class="row first lazy">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div id="focus_carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#focus_carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#focus_carousel" data-slide-to="1" class=""></li>
                    <li data-target="#focus_carousel" data-slide-to="2" class=""></li>
                    <li data-target="#focus_carousel" data-slide-to="3" class=""></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="assets/img/advertise/focus-ban-3.jpg" />
                    </div>
                    <div class="item">
                        <img src="assets/img/advertise/focus-ban-5.jpg" />
                    </div>
                    <div class="item">
                        <img src="assets/img/advertise/focus-ban-6.jpg" />
                    </div>
                    <div class="item">
                        <img src="assets/img/advertise/focus-ban-3.jpg" />
                    </div>
                </div>
                <a class="left carousel-control" href="#focus_carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                <a class="right carousel-control" href="#focus_carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
            <div id="topic_scroll" class="topic-scroll slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <ul class="topic-list">
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-3.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-3.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-3.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-3.jpg" /></a></li>
                        </ul>
                    </div>
                    <div class="item">
                        <ul class="topic-list">
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-5.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-5.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-5.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-5.jpg" /></a></li>
                        </ul>
                    </div>
                    <div class="item">
                        <ul class="topic-list">
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-6.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-6.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-6.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="assets/img/advertise/focus-ban-6.jpg" /></a></li>
                        </ul>
                    </div>
                </div>
                <a class="left carousel-control" href="#topic_scroll" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
                <a class="right carousel-control" href="#topic_scroll" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="mb10">
                <img alt="" src="assets/img/advertise/ad-right-1.jpg" />
            </div>
            <div class="mb10">
                <img alt="" src="assets/img/advertise/ad-right-2.jpg" />
            </div>
            <div class="mb10">
                <img alt="" src="assets/img/advertise/ad-right-3.jpg" />
            </div>
            <div class="mb10">
                <img alt="" src="assets/img/advertise/ad-right-4.jpg" />
            </div>
            <div>
                <img alt="" src="assets/img/advertise/ad-right-5.jpg" />
            </div>
        </div>
    </div>
    <!-- 第一行 轮播广告 结束 -->

    <!-- 促销模块开始 -->
    <div class="row mb10 lazy">
        <div class="col-lg-12">
            <ul class="nav-orange nav-justified" id="myTab">
                <li class="active"><a href="#special" data-toggle="tab">特价产品</a></li>
                <li><a href="#new" data-toggle="tab">新品上架</a></li>
                <li><a href="#hot" data-toggle="tab">热评商品</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="special">
                    <ul class="listbar">
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="new">
                    <ul class="listbar">
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="hot">
                    <ul class="listbar">
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 促销模块结束 -->

    <!-- 楼层1 节日促销开始 -->
    <div class="row mb10 lazy">
        <div class="col-lg-2">
            <div class="floor-title floor-bb-1 floor-text"><i class="icon-main icon-floor-1 pull-left mt10"></i>情人节推荐</div>
            <div class="floor-show">
                <img src="assets/img/advertise/floor-1.jpg">
            </div>
        </div>
        <div class="col-lg-10">
            <div class="floor-title floor-bb-1 tr f12"><a href="">未过期的活动名称</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">春节活动</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">免运费活动</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">更多&gt;&gt;</a></div>
            <div class="floor-product">
                <ul class="listbar-2">
                    <li><a href="">
                        <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                        <div class="summary mt20"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                    </li>
                    <li><a href="">
                        <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                        <div class="summary mt20"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                    </li>
                    <li><a href="">
                        <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                        <div class="summary mt20"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                    </li>
                    <li><a href="">
                        <img alt="" class="center-block" src="assets/img/advertise/ad-2.jpg"></a>
                        <div class="summary mt20"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 楼层1 节日促销结束 -->

    <!-- 楼层2 我是美女开始 -->
    <div class="row mt10 lazy">
        <div class="col-lg-2">
            <div class="floor-title floor-bb-2 floor-text"><i class="icon-main icon-floor-2 pull-left mt10"></i>我是美女</div>
            <div class="floor-brand">
                <ul class="brand-list">
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                </ul>
                <a href="">
                    <img class="position" src="assets/img/advertise/floor-2.jpg"></a>
            </div>
        </div>
        <div class="col-lg-8">
            <ul class="nav floor-tabs tabs-border-1 tab-bg-1" id="floor-fir-tab">
                <li class="active"><a href="#fol-fir-1" data-toggle="tab">上装</a></li>
                <li><a href="#fol-fir-2" data-toggle="tab">下装</a></li>
                <li><a href="#fol-fir-3" data-toggle="tab">包包</a></li>
                <li><a href="#fol-fir-4" data-toggle="tab">配饰</a></li>
                <li><a href="#fol-fir-5" data-toggle="tab">内衣</a></li>
                <li><a href="#fol-fir-6" data-toggle="tab">鞋子</a></li>
                <li><a href="#fol-fir-7" data-toggle="tab">护肤</a></li>
                <li><a href="#fol-fir-8" data-toggle="tab">彩妆</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="fol-fir-1">
                    <ul class="listbar-3">
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="fol-fir-2">
                    <ul class="listbar-3">
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="fol-fir-3">3</div>
                <div class="tab-pane" id="fol-fir-4">4</div>
                <div class="tab-pane" id="fol-fir-5">5</div>
                <div class="tab-pane" id="fol-fir-6">6</div>
                <div class="tab-pane" id="fol-fir-7">7</div>
                <div class="tab-pane" id="fol-fir-8">8</div>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="floor-title floor-bb-2 tr f12"><a href="">更多&gt;&gt;</a></div>
            <div class="floor-ad">
                <img src="assets/img/advertise/floor-r-1.jpg">
            </div>
        </div>
    </div>
    <!-- 楼层2 我是美女结束 -->

    <!-- 楼层3 我是帅哥开始 -->
    <div class="row mt10 lazy">
        <div class="col-lg-2">
            <div class="floor-title floor-bb-3 floor-text"><i class="icon-main icon-floor-3 pull-left mt10"></i>我是帅哥</div>
            <div class="floor-brand">
                <ul class="brand-list">
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                </ul>
                <a href="">
                    <img class="position" src="assets/img/advertise/floor-2.jpg"></a>
            </div>
        </div>
        <div class="col-lg-8">
            <ul class="nav floor-tabs tabs-border-2 tab-bg-2" id="floor-sec-tab">
                <li class="active"><a href="#fol-sec-1" data-toggle="tab">上装</a></li>
                <li><a href="#fol-sec-2" data-toggle="tab">下装</a></li>
                <li><a href="#fol-sec-3" data-toggle="tab">包包</a></li>
                <li><a href="#fol-sec-4" data-toggle="tab">配饰</a></li>
                <li><a href="#fol-sec-5" data-toggle="tab">内衣</a></li>
                <li><a href="#fol-sec-6" data-toggle="tab">鞋子</a></li>
                <li><a href="#fol-sec-7" data-toggle="tab">护肤</a></li>
                <li><a href="#fol-sec-8" data-toggle="tab">彩妆</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="fol-sec-1">
                    <ul class="listbar-3">
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="fol-sec-2">2</div>
                <div class="tab-pane" id="fol-sec-3">3</div>
                <div class="tab-pane" id="fol-sec-4">4</div>
                <div class="tab-pane" id="fol-sec-5">5</div>
                <div class="tab-pane" id="fol-sec-6">6</div>
                <div class="tab-pane" id="fol-sec-7">7</div>
                <div class="tab-pane" id="fol-sec-8">8</div>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="floor-title floor-bb-3 tr f12"><a href="">更多&gt;&gt;</a></div>
            <div class="floor-ad">
                <img src="assets/img/advertise/floor-r-1.jpg">
            </div>
        </div>
    </div>
    <!-- 楼层3 我是帅哥结束 -->

    <!-- 楼层4 妈咪宝贝开始 -->
    <div class="row mt10 lazy">
        <div class="col-lg-2">
            <div class="floor-title floor-bb-4 floor-text"><i class="icon-main icon-floor-4 pull-left mt10"></i>妈咪宝贝</div>
            <div class="floor-brand">
                <ul class="brand-list">
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                </ul>
                <a href="">
                    <img class="position" src="assets/img/advertise/floor-2.jpg"></a>
            </div>
        </div>
        <div class="col-lg-8">
            <ul class="nav floor-tabs tabs-border-3 tab-bg-3" id="floor-thi-tab">
                <li class="active"><a href="#fol-thi-1" data-toggle="tab">上装</a></li>
                <li><a href="#fol-thi-2" data-toggle="tab">下装</a></li>
                <li><a href="#fol-thi-3" data-toggle="tab">包包</a></li>
                <li><a href="#fol-thi-4" data-toggle="tab">配饰</a></li>
                <li><a href="#fol-thi-5" data-toggle="tab">内衣</a></li>
                <li><a href="#fol-thi-6" data-toggle="tab">鞋子</a></li>
                <li><a href="#fol-thi-7" data-toggle="tab">护肤</a></li>
                <li><a href="#fol-thi-8" data-toggle="tab">彩妆</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="fol-thi-1">
                    <ul class="listbar-3">
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="fol-thi-2">2</div>
                <div class="tab-pane" id="fol-thi-3">3</div>
                <div class="tab-pane" id="fol-thi-4">4</div>
                <div class="tab-pane" id="fol-thi-5">5</div>
                <div class="tab-pane" id="fol-thi-6">6</div>
                <div class="tab-pane" id="fol-thi-7">7</div>
                <div class="tab-pane" id="fol-thi-8">8</div>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="floor-title floor-bb-4 tr f12"><a href="">更多&gt;&gt;</a></div>
            <div class="floor-ad">
                <img src="assets/img/advertise/floor-r-1.jpg">
            </div>
        </div>
    </div>
    <!-- 楼层4 妈咪宝贝结束 -->

    <!-- 楼层5 户外达人开始 -->
    <div class="row mt10 lazy">
        <div class="col-lg-2">
            <div class="floor-title floor-bb-5 floor-text"><i class="icon-main icon-floor-5 pull-left mt10"></i>户外达人</div>
            <div class="floor-brand">
                <ul class="brand-list">
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                </ul>
                <a href="">
                    <img class="position" src="assets/img/advertise/floor-2.jpg"></a>
            </div>
        </div>
        <div class="col-lg-8">
            <ul class="nav floor-tabs tabs-border-4 tab-bg-4" id="floor-fou-tab">
                <li class="active"><a href="#fol-fou-1" data-toggle="tab">上装</a></li>
                <li><a href="#fol-fou-2" data-toggle="tab">下装</a></li>
                <li><a href="#fol-fou-3" data-toggle="tab">包包</a></li>
                <li><a href="#fol-fou-4" data-toggle="tab">配饰</a></li>
                <li><a href="#fol-fou-5" data-toggle="tab">内衣</a></li>
                <li><a href="#fol-fou-6" data-toggle="tab">鞋子</a></li>
                <li><a href="#fol-fou-7" data-toggle="tab">护肤</a></li>
                <li><a href="#fol-fou-8" data-toggle="tab">彩妆</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="fol-fou-1">
                    <ul class="listbar-3">
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="fol-fou-2">2</div>
                <div class="tab-pane" id="fol-fou-3">3</div>
                <div class="tab-pane" id="fol-fou-4">4</div>
                <div class="tab-pane" id="fol-fou-5">5</div>
                <div class="tab-pane" id="fol-fou-6">6</div>
                <div class="tab-pane" id="fol-fou-7">7</div>
                <div class="tab-pane" id="fol-fou-8">8</div>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="floor-title floor-bb-5 tr f12"><a href="">更多&gt;&gt;</a></div>
            <div class="floor-ad">
                <img src="assets/img/advertise/floor-r-1.jpg">
            </div>
        </div>
    </div>
    <!-- 楼层5 户外达人结束 -->

    <!-- 楼层6 数码达人开始 -->
    <div class="row mt10 lazy">
        <div class="col-lg-2">
            <div class="floor-title floor-bb-6 floor-text"><i class="icon-main icon-floor-6 pull-left mt10"></i>数码达人</div>
            <div class="floor-brand">
                <ul class="brand-list">
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    <li><a href="">
                        <img src="assets/img/advertise/brand-1.jpg"></a></li>
                </ul>
                <a href="">
                    <img class="position" src="assets/img/advertise/floor-2.jpg"></a>
            </div>
        </div>
        <div class="col-lg-8">
            <ul class="nav floor-tabs tabs-border-5 tab-bg-5" id="floor-fif-tab">
                <li class="active"><a href="#fol-fif-1" data-toggle="tab">上装</a></li>
                <li><a href="#fol-fif-2" data-toggle="tab">下装</a></li>
                <li><a href="#fol-fif-3" data-toggle="tab">包包</a></li>
                <li><a href="#fol-fif-4" data-toggle="tab">配饰</a></li>
                <li><a href="#fol-fif-5" data-toggle="tab">内衣</a></li>
                <li><a href="#fol-fif-6" data-toggle="tab">鞋子</a></li>
                <li><a href="#fol-fif-7" data-toggle="tab">护肤</a></li>
                <li><a href="#fol-fif-8" data-toggle="tab">彩妆</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="fol-fif-1">
                    <ul class="listbar-3">
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary mt5">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</div>
                            <div class="price"><b>¥96</b></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="fol-fif-2">2</div>
                <div class="tab-pane" id="fol-fif-3">3</div>
                <div class="tab-pane" id="fol-fif-4">4</div>
                <div class="tab-pane" id="fol-fif-5">5</div>
                <div class="tab-pane" id="fol-fif-6">6</div>
                <div class="tab-pane" id="fol-fif-7">7</div>
                <div class="tab-pane" id="fol-fif-8">8</div>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="floor-title floor-bb-6 tr f12"><a href="">更多&gt;&gt;</a></div>
            <div class="floor-ad">
                <img src="assets/img/advertise/floor-r-1.jpg">
            </div>
        </div>
    </div>
    <!-- 楼层6 数码达人结束 -->

    <!-- 最新晒单模块开始 -->
    <div class="row mt10 lazy">
        <div class="col-lg-4">
            <div class="mod-title mod-bb-1 mod-text"><i class="icon-main icon-mod-1 pull-left"></i><span class="pull-right f12"><a href="">更多&gt;</a></span>最新晒单</div>
            <div class="mod-wrap">
                <ul class="listbar-4">
                    <li>
                        <div class="pull-left mod-posi-div">
                            <i class="icon-main mod-posi-i icon-mod-show pull-left"></i><a href="">
                                <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                        </div>
                        <div class="green-font summary"><a href="">富士拍立得mini7s 粉蓝白色相机套装 立拍得 粉蓝白色相机套装 立拍得 正品</a></div>
                        <div class="summary gray-font">相机好像是米白色，不是那种纯白色，今天收到用了，……</div>
                    </li>
                    <li>
                        <div class="pull-left mod-posi-div">
                            <i class="icon-main mod-posi-i icon-mod-show pull-left"></i><a href="">
                                <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                        </div>
                        <div class="green-font summary"><a href="">富士拍立得mini7s 粉蓝白色相机套装 立拍得 粉蓝白色相机套装 立拍得 正品</a></div>
                        <div class="summary gray-font">相机好像是米白色，不是那种纯白色，今天收到用了，……</div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="mod-title mod-bb-2 mod-text"><i class="icon-main icon-mod-2 pull-left"></i><span class="pull-right f12"><a href="">更多&gt;</a></span>热门商品</div>
            <div class="mod-wrap">
                <ul class="listbar-4">
                    <li>
                        <div class="pull-left mod-posi-div">
                            <i class="icon-main mod-posi-i icon-mod-hot pull-left"></i><a href="">
                                <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                        </div>
                        <div class="yellow-font summary"><a href="">富士拍立得mini7s 粉蓝白色相机套装 立拍得 粉蓝白色相机套装 立拍得 正品</a></div>
                        <div class="summary gray-font">相机好像是米白色，不是那种纯白色，今天收到用了，……</div>
                    </li>
                    <li>
                        <div class="pull-left mod-posi-div">
                            <i class="icon-main mod-posi-i icon-mod-hot pull-left"></i><a href="">
                                <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                        </div>
                        <div class="yellow-font summary"><a href="">富士拍立得mini7s 粉蓝白色相机套装 立拍得 粉蓝白色相机套装 立拍得 正品</a></div>
                        <div class="summary gray-font">相机好像是米白色，不是那种纯白色，今天收到用了，……</div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="mod-title mod-bb-3 mod-text"><i class="icon-main icon-mod-3 pull-left"></i>大家在省</div>
            <div class="mod-wrap">
                <ul class="listbar-4">
                    <li>
                        <div class="pull-left mod-posi-div">
                            <a href="">
                                <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                        </div>
                        <div class="summary"><a href="">富士拍立得mini7s 粉蓝白色相机套装 立拍得 粉蓝白色相机套装 立拍得 正品</a></div>
                        <div class="summary gray-font">相机好像是米白色，不是那种纯白色，今天收到用了，……</div>
                    </li>
                    <li>
                        <div class="pull-left mod-posi-div">
                            <a href="">
                                <img alt="" class="center-block" src="assets/img/advertise/ad-1.jpg"></a>
                        </div>
                        <div class="summary"><a href="">富士拍立得mini7s 粉蓝白色相机套装 立拍得 粉蓝白色相机套装 立拍得 正品</a></div>
                        <div class="summary gray-font">相机好像是米白色，不是那种纯白色，今天收到用了，……</div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 最新晒单模块结束 -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
