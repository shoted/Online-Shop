<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Web.shared.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row col-lg-12">
        <img src="../assets/img/error.jpg" width="1168px" usemap="#map" alt="Alternate Text" />
        <map id="map" name="map">
            <area shape="rect" coords="428,200,565,250" href="../index.aspx" alt="返回首页" /> 
            <area shape="rect" coords="600,200,740,250" href="javascript:history.go(-1)" alt="后退一步" />
        </map>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
