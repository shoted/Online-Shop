<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Layout.Master" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="Web.member.Comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <%if (orderDetail != null && orderDetail.Any())
            {
                foreach (var item in orderDetail)
                {
        %>
        <div class="table">
            <table class="table-bordered table-hover" width="100%">
                <tbody>
                    <tr>
                        <td class="tr-title">商品名</td>
                        <td class="tr-title">商品编号</td>
                        <td class="tr-title">商品价格</td>
                        <td class="tr-title">商品数量</td>
                    </tr>
                    <tr>
                        <td class="tr-list"><a href="../detail.aspx?item=<%=item.productId %>"><%=item.productName %></a></td>
                        <td class="tr-list"><%=item.productId %></td>
                        <td class="tr-list"><%=item.productPrice %></td>
                        <td class="tr-list"><%=item.productCount %></td>
                    </tr>
                    <tr>
                        <td colspan="4" class=" tr-list form-group">
                            <textarea name="comment" style="resize: none; height: 200px;" class="f20   form-control " placeholder="评论" wrap="hard"></textarea>
                            <input type="hidden" name="d" value="<%=item.orderDetailId %>" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class=" tr-list">
                            <input type="submit" name="name" class="btn btn-danger" value="评价" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%
                }
            }
        %>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        $(":submit").click(function () {
            var comment = $(this).parents("table").find("textarea").val();
            var d = $(this).parents("table").find(":hidden").val();
     
            $.ajax({
                type: "POST",
                url: "Comment.aspx",
                data: { content: comment, oid:"<%=oid%>",did:d},
                dataType: "html",
                success: function (data) {
                    if (data == "ok") {
                        alert("评论成功");
                        window.location.reload();
                    }
                },
                error: function () {
                    alert("评论失败了");
                }
            })
        })
    </script>
</asp:Content>
