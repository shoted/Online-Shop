<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="Web.www.CategoryList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <nav  class="">
        <i class="Hui-iconfont"></i> <a class="maincolor" href="Welcome.aspx">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">分类列表</span>
        <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class=" Hui-article pt-10">
        <article class="cl pd-20">
            <div class="form">
                <form action="CategoryList.aspx" method="post" class="form">
                    <span class="f-20 c-red">请选择一级分类:</span>
                    <select name="slt" id="slt" class="select-category w-200 f-20 " >
                        <option value="0">所有</option>
                        <%foreach (var item in parent)
                            {%>
                        <option value="<%=item.catId %>" <%=id==item.catId?"selected":"" %>><%=item.catName %></option>
                        <%
                            } %>
                    </select>
                    <input type="hidden" name="save" value="<%=id %>" />
                </form>
            </div>
            <table class="table table-border table-bordered table-bg w-1000 mt-10">
                <thead>
                    <tr>
                        <th colspan="5" scope="col" class="f-20">分类列表<a  class="btn btn-primary radius r" onclick="category_add('添加分类','CategoryAdd.aspx?slt=<%=id %>','','510')" >添加</a></th>
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
                            <a  onclick="layer_show('编辑分类','CategoryEdit.aspx?catid=<%=item.catId %>','','510')" href="javascript:;" title="编辑"><i class="Hui-iconfont"></i></a>
                            <a  class="ml-5"  <%=item.catParentID==0?"style='display:none'":"" %> href="CategoryList.aspx?deleteid=<%=item.catId %>&slt=<%=id %>" onclick="return confirm('确定删除?')" title="删除"><i class="Hui-iconfont"></i></a>
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
     <script>
      
         <%=js%>    
        $("#slt").change(function () {
            $("form").submit();
        })
         function category_add(title, url, w, h) {
             layer_show(title, url, w, h);
         }

    </script>
</asp:Content>
