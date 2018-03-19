<%@ Page Title="" Language="C#" MasterPageFile="~/shared/AdminLayout.Master" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="Web.admin.CategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <nav class="breadcrumb">
        <i class="Hui-iconfont"></i> <a href="index.aspx" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">分类列表</span>
        <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class=" Hui-article ">
        <article class="cl pd-20">
            <div class="form">
                <form action="CategoryList.aspx" method="post" class="form">
                    <span class="f-20 c-red">请选择一级分类:</span>
                    <select name="slt" id="slt" class="select-category w-200 f-20 ">
                        <option value="0">所有</option>
                        <%foreach (var item in parent)
                            {%>
                        <option value="<%=item.catId %>" <%=id==item.catId?"selected":"" %>><%=item.catName %></option>
                        <%
                            } %>
                    </select>
                </form>
            </div>
            <table class="table table-border table-bordered table-bg w-1000">
                <thead>
                    <tr>
                        <th colspan="7" scope="col" class="f-20">分类列表<a  class="btn btn-danger r" onclick="add()">添加</a></th>
                    </tr>
                    <tr class="text-c">
                        <th>ID</th>
                        <th>分类名</th>
                        <th>父分类名</th>
                        <th>描述</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var item in categories)
                        {%>
                    <tr class="text-c">
                        <td><%=item.catId %></td>
                        <td><%=item.catName %></td>
                        <td><%=GetParentName( item.catParentID )%></td>
                        <td><%=item.catDesc %></td>
                        <td class="f-14 product-brand-manage">
                            <a  onclick="product_brand_edit('品牌编辑','codeing.html','1')" href="javascript:;" title="编辑"><i class="Hui-iconfont"></i></a>
                            <a  class="ml-5" onclick="active_del(this,'10001')" <%=item.catParentID==0?"style='display:none'":"" %> href="654.aspx" title="删除"><i class="Hui-iconfont"></i></a>
                        </td>
                    </tr>
                    <%
                        } %>
                </tbody>
            </table>
        </article>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
   <script src="../assets/js/LinkOpen.js"></script>
    <script>    
        $("#slt").change(function () {
            $("form").submit();
        })
        function add() {
            OpenDiv("CategoryAdd.aspx","", 600, 350);
        }
    </script>
</asp:Content>
