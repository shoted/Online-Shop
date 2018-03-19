<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="CategoryAdd.aspx.cs" Inherits="Web.www.CategoryAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <form action="CategoryAdd.aspx" method="post">
        <div id="tab" class="HuiTab">
            <p class="red-font f20">提示信息:<%=msg %></p>
            <div class="tabBar clearfix"><span>添加子分类</span><span>添加主分类</span></div>
            <div class="tabCon">
                <table class="table table-border table-bordered table-bg  mt-30 ">
                    <thead>
                        <tr>
                            <th colspan="2">添加子分类</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>请选择主分类:</td>
                            <td>
                                <select class="select-category  f-20" name="slt">
                                    <%if (categories.Any<Shop.Model.Categories>())
                                        {
                                            foreach (var item in categories)
                                            {%>
                                    <option value="<%=item.catId %>" <%=item.catId==id?"selected":"" %>><%=item.catName %></option>
                                    <%
                                            }
                                        } %>
                                    <option value="0">添加主分类</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>请输入子分类名:</td>
                            <td>
                                <input type="text" class="input-text" name="catname" value="" required="required" /></td>
                        </tr>
                        <tr>
                            <td>请输入描述:(可空)</td>
                            <td>
                                <input type="text" class="input-text" name="catdesc" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="choose" value="添加子分类" class="btn btn-danger" />
                                <input type="button" name="btn" class="btn btn-default" value="关闭" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="tabCon">
                <table class="table table-border table-bordered table-bg  mt-30">
                    <thead>
                        <tr>
                            <th colspan="2">添加主分类</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>请输入主分类名:</td>
                        <td>
                            <input type="text" class="input-text" name="catparent" value="" /></td>
                    </tr>
                    <tr>
                        <td>请输入描述:(可空)</td>
                        <td>
                            <input type="text" class="input-text" name="parentdesc" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="choose" value="添加主分类" class="btn btn-danger" />
                            <input type="button" name="btn" class="btn btn-default" value="关闭" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>    
        $("#tab").Huitab("#tab .tabBar span", "#tab .tabCon", "current", "click", "1")
        $(":button").click(function () {
            window.parent.location.reload();
            var index = parent.layer.getFrameIndex(window.name); parent.layer.close(index);

        })
        $(function () {
            <%=js%>
        })
    </script>

</asp:Content>
