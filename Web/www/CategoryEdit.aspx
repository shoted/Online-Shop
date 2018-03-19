<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="CategoryEdit.aspx.cs" Inherits="Web.www.CategoryEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form action="CategoryEdit.aspx" method="post">
        <p class="red-font fb">提示信息:<%=msg%></p>
        <table class="table table-border table-bordered table-bg  mt-30">
         
            <tr>
                <td>请输入分类名:</td>
                <td>
                    <input type="hidden"  name="catid"   value="<%=categories.catId %>" />
                    <input type="text" class="input-text f-20" name="catname" value="<%=categories.catName %>" required="required" /></td>
            </tr>
            <tr>
                <td>请选择主分类</td>
                <td>
                    <select name="slt" class="select-category w-200 f-20 ">
                    <option value="0">修改主分类</option>
                        <% foreach (var item in parent)
                            {%>
                         <option value="<%=item.catId %>" <%=categories.catParentID==item.catId?"selected":"" %> > <%=item.catName %></option>
                        <%
                            }%>
                    </select>
                </td>
            </tr>
            <tr>
                <td>请输入描述:(可空)</td>
                <td>
                    <input type="text" class="input-text f-20" name="catdesc" value="<%=categories.catDesc %>" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="choose" value="修改分类" class="btn btn-danger" />
                    <input type="button" name="btn" class="btn btn-default" value="关闭" /></td>
            </tr>
        </table>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        $(function () {
            <%=js%>
        })
    </script>
</asp:Content>
