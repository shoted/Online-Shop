<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Web.www.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <nav>
        <form action="ProductList.aspx" method="post">
            <i class="Hui-iconfont"></i> <a href="Welcome.aspx">首页</a>
            <span class="c-999 en">&gt;</span>
            <span class="c-666">产品列表</span>
            <span class="ml100" >
                <select class="input-text" style="display: inline; width: 100px;" name="slt">
                    <option value="0" <%=slt==0?"selected":"" %>>搜商品名</option>
                    <option value="1" <%=slt==1?"selected":"" %>>搜商品ID</option>
                </select>
                <input type="text" name="keyword" value="<%=keyword %>" class="input-text" style="display: inline; width: 500px;" />
                <input type="submit" name="name" class="btn btn-primary" value="搜索" />

            </span>
            <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
        </form>
    </nav>

    <div class=" Hui-article ">
        <article class="cl pd-20">
            <table class="table table-border table-bordered table-bg w-1000 mt-10">
                <thead>
                    <tr>
                        <th colspan="10" scope="col" class="f-20">产品列表<a class="btn btn-primary radius r" onclick="layer_show('添加产品','ProductAdd.aspx','','750')">添加</a></th>
                    </tr>
                    <tr class="text-c">
                        <th class="w100"><a href="ProductList.aspx?orderby=productId&page=<%=page %>&desc=<%=desc==0?1:0 %>&keyword=<%=keyword %>&slt=<%=slt %>">产品编号</a></th>
                        <th class=""><a href="ProductList.aspx?orderby=productId&page=<%=page %>&desc=<%=desc==0?1:0 %>&keyword=<%=keyword %>&slt=<%=slt %>">产品名称</a></th>
                        <th class="w100"><a href="ProductList.aspx?orderby=categoryId&page=<%=page %>&desc=<%=desc==0?1:0 %>&keyword=<%=keyword %>&slt=<%=slt %>">产品分类</a></th>
                        <th class="w100"><a href="ProductList.aspx?orderby=productPrice&page=<%=page %>&desc=<%=desc==0?1:0 %>&keyword=<%=keyword %>&slt=<%=slt %>">产品价格</a></th>
                        <th class="w400">产品图片</th>
                        <th class="w100"><a href="ProductList.aspx?orderby=productInventory&page=<%=page %>&desc=<%=desc==0?1:0 %>&keyword=<%=keyword %>&slt=<%=slt %>">产品库存</a></th>
                        <th class="w200"><a href="ProductList.aspx?orderby=add_time&page=<%=page %>&desc=<%=desc==0?1:0 %>&keyword=<%=keyword %>&slt=<%=slt %>">上架时间</a></th>
                        <th class="w100"><a href="ProductList.aspx?orderby=productStatus&page=<%=page %>&desc=<%=desc==0?1:0 %>&keyword=<%=keyword %>&slt=<%=slt %>">产品状态</a></th>
                        <th class="w100"><a href="ProductList.aspx?orderby=productStone&page=<%=page %>&desc=<%=desc==0?1:0 %>&keyword=<%=keyword %>&slt=<%=slt %>">产品积分</a></th>
                        <th class="w100">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var item in products)
                        {%>
                    <tr class="text-c">
                        <td><%=item.productId %></td>
                        <td><%=item.productName %></td>
                        <td><%=GetCatName(item.categoryId) %></td>
                        <td><%=item.productPrice.ToString("0.00")%></td>
                        <td><%=item.productIMG %></td>
                        <td><%=item.productInventory %></td>
                        <td><%=item.add_time.ToString() %></td>
                        <td><a href="ProductList.aspx?status=<%=item.productStatus %>&sid=<%=item.productId %>&keyword=<%=keyword %>&page=<%=page %>&orderby=<%=orderby %>&desc=<%=desc %>&slt=<%=slt %>" class="btn <%=item.productStatus==1?"btn-primary":"btn-danger" %>"><%=GetProductStatus(item.productStatus)%></a> </td>
                        <td><%=item.productStone %></td>
                        <td class="f-14 product-brand-manage">
                            <a onclick="layer_show('编辑产品','ProductEdit.aspx?pid=<%=item.productId %>','','750')" href="javascript:;" title="编辑"><i class="Hui-iconfont"></i></a>
                            <a class="ml-5" href="ProductList.aspx?deleteid=<%=item.productId %>&keyword=<%=keyword %>&page=<%=page %>&orderby=<%=orderby %>&desc=<%=desc %>" onclick="return confirm('确定删除?')" title="删除"><i class="Hui-iconfont"></i></a>
                        </td>
                    </tr>
                    <%
                        } %>
                </tbody>
            </table>
            <div class="list-pagination pull-right ">
                <%=Shop.CommonHelper.PagerHelper.RenderPager("/www/ProductList.aspx?orderby="+orderby+"&desc="+desc+"&keyword="+keyword+"&page=@",pageCount,page,30) %>
            </div>
        </article>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
