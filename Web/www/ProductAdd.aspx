<%@ Page Title="" Language="C#" MasterPageFile="~/shared/Link.Master" AutoEventWireup="true" CodeBehind="ProductAdd.aspx.cs" Inherits="Web.www.ProductAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../assets/lib/ckeditor/ckeditor.js"></script>
    <script src="../assets/lib/ckeditor/styles.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="table">
        <p class="red-font ">提示信息:<%=msg %></p>
        <form action="ProductAdd.aspx" method="post" enctype="multipart/form-data">
            <table class="table   table-bg">
                <thead>
                    <tr>
                        <th colspan="2">添加产品</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>请输入产品名称:</td>
                        <td>
                            <input type="text" name="pname" class="input-text" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td>请选择分类:</td>
                        <td>
                            <select class="select-category  f-20" name="slt">
                                <%if (categories.Any<Shop.Model.Categories>())
                                    {
                                        foreach (var item in categories)
                                        {%>
                                <option value="<%=item.catId %>"><%=item.catName %></option>
                                <%
                                        }
                                    } %>
                            </select></td>
                    </tr>
                    <tr>
                        <td>请输入产品价格:</td>
                        <td>
                            <input type="text" class="input-text" name="pprice" value=""  required="required"/></td>
                    </tr>
                    <tr>
                        <td>请输入产品图片</td>
                        <td>
                            <div class="formControls col-xs-8 col-sm-9">
                                <span class="btn-upload form-group">
                                    <input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly="" nullmsg="请添加附件！" style="width: 200px">
                                    <a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont"></i> 浏览文件</a>
                                    <input type="file" multiple="" name="file-2" accept="image/*" class="input-file valid">
                                </span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>请输入产品库存</td>
                        <td>
                            <input type="text" name="pinventory" class="input-text" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td>请输入产品积分</td>
                        <td>
                            <input type="text" name="pstone" class="input-text" value="" required="required" /></td>
                    </tr>
                    <tr>
                        <td>请输入产品描述</td>
                        <td>
                            <textarea name="pdesc" id="txtdesc" cols="" rows="" class="textarea valid" placeholder="说点什么...最少输入10个字符" ></textarea>
                    </tr>
                    <tr>
                        <td>请输入产品细节</td>
                        <td>
                            <textarea name="pdetail" id="txtdetail" cols="" rows="" class="textarea valid" placeholder="说点什么...最少输入10个字符" ></textarea>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <input type="submit" name="choose" value="上架" class="btn btn-danger" />

                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        CKEDITOR.replace('txtdesc');
        CKEDITOR.replace('txtdetail');
        $(function () {
            $(":file").change(function () {
                var fileName = $(this).val();
                var fileExt = fileName.substr(fileName.lastIndexOf('.'));
                if (fileExt == '.jpg' || fileExt == '.jpeg' || fileExt == '.bmp' || fileExt == '.gif' || fileExt == '.png') {
                    return true;
                }
                else {
                    alert("选择的文件不合法");
                    $(this).val('');
                }
            })

            $(":submit").click(function () {
                CKEDITOR.instances.txtdesc.setData(encodeURI(CKEDITOR.instances.txtdesc.getData()));
                CKEDITOR.instances.txtdetail.setData(encodeURI(CKEDITOR.instances.txtdetail.getData()));
                
            })
            //$(":submit").click(function () {
            //    var fileName = $(':file').val();
            //    if (fileName == '') {
            //        alert('请选择文件');
            //        $(':file').focus();
            //        return false;
            //    }
            //})
        })
        <%=js%>
</script>
</asp:Content>
