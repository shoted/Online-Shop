<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="MemberEdit.aspx.cs" Inherits="Web.www.MemberEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="table">
        <p class="red-font fb">提示信息:<%=msg %></p>
        <form action="MemberEdit.aspx" method="post">
            <table class="table   table-bg">
                <tbody>
                    <tr>
                        <td>用户ID:(不可修改)</td>
                        <td>
                            <input type="text" name="eid" class="input-text disabled" readonly="readonly" value="<%=users.userId %>" /></td>
                    </tr>
                    <tr>
                        <td>用户名:</td>
                        <td>
                            <input type="text" class="input-text" name="uname" value="<%=users.userName %>" required="required" />
                        </td>
                    </tr>
                    <tr>
                        <td>用户密码:</td>
                        <td>
                            <input type="password" class="input-text" name="upwd" value="<%=users.userPassword %>" required="required" />
                            <input type="hidden" name="oldpwd" value="<%=users.userPassword %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>用户优惠宝:</td>
                        <td>
                            <input type="text" class="input-text" name="ustone" value="<%=users.userStone %>" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>用户状态:</td>
                        <td>
                            <select class="select-default" style="display: inline" name="sltstatus">
                                <option value="0" <%=users.userStatus==0?"selected":"" %>>冻结</option>
                                <option value="1" <%=users.userStatus==1?"selected":"" %>>正常</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>注册时间:(不可修改)</td>
                        <td>
                            <input type="text" name="addtime" class="input-text disabled" value="<%=users.add_time %>" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td>上次登录时间:(不可修改)</td>
                        <td>
                            <input type="text" name="lasttime" class="input-text disabled" value="<%=users.last_time %>" readonly="readonly" /></td>
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
