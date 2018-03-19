<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="MyAddress.aspx.cs" Inherits="Web.member.MyAddress" %>

<%@ Register Src="~/member/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <h3 class="member-tit f16 fb tit-family"><a href="MemberCenter.aspx">我的淘宝</a>><b>我的地址</b></h3>
    </div>
    <div class="row">
        <!-- 左边栏 -->
        <uc1:SideBar runat="server" ID="SideBar" />
        <!-- 内容部分开始 -->
        <form action="../handler/SaveAddress.ashx" method="post">
            <div id="content" class="col-lg-10">
                <div class="table">
                    <div class="cart-title f16 tit-family pl10 mt10">我的地址管理</div>
                    <div class="alert-danger"><a type="button" class="btn  btn-lg" href="MyAddressAdd.aspx">添加地址</a></div>
                    <table border="0" id="tab" class="mt30 table-bordered table-hover" width="100%">
                        <tbody>
                            <tr>
                                <td class="tr-title w100 ">设为默认</td>
                                <td class="tr-title w100 ">收件人姓名</td>
                                <td class="tr-title w200 ">收件人电话</td>
                                <td class="tr-title ">收件人地址</td>
                                <td class="tr-title w70 ">操作</td>
                                <td class="tr-title w70 ">操作</td>
                            </tr>
                            <%if (address.Any<Shop.Model.Address>())
                                {
                                    foreach (var item in address)
                                    {%>
                            <tr>
                                <td class="tr-list">
                                    <input type="radio" onclick="saveaddress(<%=CurrentUser.userId%>,<%=item.postId%>)" name="defaultid" id="<%=item.postId %>" value="<%=item.postId %>" <%=item.isDefault==1?"checked":"" %> />

                                    <label for="<%=item.postId %>" class="btn btn-default">选择</label></td>
                                <td class="tr-list"><%=item.postName %></td>
                                <td class="tr-list"><%=item.postPhone %></td>
                                <td class="tr-list"><%=item.postAddress %></td>
                                <td class="tr-list text-center"><a href="MyAddressEdit.aspx?id=<%=item.postId %>" class="btn btn-collect">编辑</a></td>
                                <td class="tr-list text-center"><a href="../handler/DeleteAddress.ashx?postid=<%=item.postId %>" onclick="return confirm('确定删除?无法撤销')" class="btn btn-danger">删除</a></td>
                            </tr>
                            <%}
                                } %>
                        </tbody>
                    </table>
                    <p class="f16 red-font"><%=msg %></p>
                </div>

            </div>
        </form>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>   
        function saveaddress(uid, aid) {
            $.post("../handler/SaveAddress.ashx", { defaultid: aid, userid: uid }, function () {

            })
        }


    </script>
</asp:Content>
