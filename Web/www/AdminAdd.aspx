<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="AdminAdd.aspx.cs" Inherits="Web.www.AdminAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div class="table">
        <p class="red-font fb">提示信息:<%=msg %></p>
        <form action="AdminAdd.aspx" method="post">
            <table class="table   table-bg">
                <tbody>
                    
                    <tr>
                        <td>用户名:</td>
                        <td>
                            <input type="text" class="input-text" name="uname" value="" required="required" />
                        </td>
                    </tr>
                    <tr>
                        <td>用户密码:</td>
                        <td>
                            <input type="password" class="input-text" name="upwd" value="" required="required"/>
                          
                        </td>
                    </tr>    
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="choose" value="添加" class="btn btn-danger" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        <%=js%>
    </script>
</asp:Content>
