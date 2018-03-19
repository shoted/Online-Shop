<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Web.shared.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="caption">
        <a href="WebForm2.aspx">12315</a>
        <form action="WebForm1.aspx" method="get">
            <input type="checkbox" name="name" value="0" />0
            <input type="checkbox" name="name" value="1" />1
            <input type="checkbox" name="name" value="2" />2
            <input type="checkbox" name="name" value="3" />3
            <input type="checkbox" name="name" value="4" />4
            <input type="submit" name="name" value="okokok" />
        </form>
    </div>
    <div class="row">
        <button id="ajaxGet" class="btn btn-default">ajaxGet</button>
        <button id="ajaxPost" class="btn btn-default">ajaxPost</button>
        <button id="ajaxJson" class="btn btn-default">ajaxJson</button>

        <a href="Handler1.ashx" class="btn btn-danger">link</a>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        $.cookie('list', '1');
        $.cookie('list', '.');
        $.cookie('list', '2');
        $.cookie('list', '.');
        $.cookie('list', '3');

        $("#ajaxGet").click(function () {
            $.get("Handler1.ashx", "id=1&name=js", function (data) {
                alert(data);
            })
        })

        $("#ajaxPost").click(function () {
            $.post("Handler1.ashx", "id=2&name=cz", function (data) {
                alert(data);
            })
        })

        $("#ajaxJson").click(function () {
            $.getJSON("Handler1.ashx", { id: '3', name: 'xx' }, function (data) {
                alert(data.Id);
            })
        })
    </script>

</asp:Content>
