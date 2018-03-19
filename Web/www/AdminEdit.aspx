<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="AdminEdit.aspx.cs" Inherits="Web.www.AdminEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="table">
        <p class="red-font fb">提示信息:<%=msg %></p>
        <form action="AdminEdit.aspx" method="post">
            <table class="table   table-bg">
                <tbody>
                    <tr>
                        <td>管理员ID:(不可修改)</td>
                        <td>
                            <input type="text" name="eid" class="input-text disabled" readonly="readonly" value="<%=admins.Id %>" /></td>
                    </tr>
                    <tr>
                        <td>用户名:</td>
                        <td>
                            <input type="text" class="input-text" name="uname" value="<%=admins.LoginId %>"  required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>用户密码:</td>
                        <td>
                            <input type="password" class="input-text" name="upwd" value="<%=admins.LoginPwd %>"  required="required"/>
                            <input type="hidden" name="oldpwd" value="<%=admins.LoginPwd %>" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="choose" value="修改" class="btn btn-danger" />
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
