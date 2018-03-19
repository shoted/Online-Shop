<%@ Page Title="" Language="C#" MasterPageFile="~/shared/AdminLayout.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Web.shared.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <a href="webform2.aspx?type=insert" class="btn btn-danger">insert</a>

    <button class="btn btn-danger">ajax</button>
    <a href="http://www.baidu.com" class="btn" style="display: none">baidu\</a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="foot" runat="server">
    <script>

        $("button").click(function () {
            $.ajax({
                async: true,
                url: "webform2.aspx",
                dataType: "script",
                data: {},
                type: "POST",
                success: function () {
                    alert("success");
                },
                error: function () {
                    alert("??");
                }
            })
        })
    </script>
</asp:Content>
