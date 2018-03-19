<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pager.aspx.cs" Inherits="Web.www.Ajax.Pager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../assets/css/style.css" rel="stylesheet" />
    <link href="/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../assets/lib/jqueryui/css/ui-lightness/jquery-ui-1.10.4.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <div class="container mt100">
        <a class="btn btn-danger" id="add"><span class="glyphicon glyphicon-plus"></span>添加 </a>
        <table style="width: 100%; height: 300px;" class="table table-bordered table-hover table-responsive table-condensed">
            <thead>
                <tr style="vertical-align: top">
                    <th>ID</th>
                    <th>用户ID</th>
                    <th>产品ID</th>
                    <th>时间</th>
                    <th>操作</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <div id="dialog">
        <form id="f" class="form-inline" role="form">
            <p>
                用户id: 
                    <input type="text" name="uid" value="" class="form-control" />
                <input type="hidden" name="type" value="" />
                <input type="hidden" name="fid" value="" />
            </p>

            <p>
                产品id:
                <input type="text" name="pid" value="" class="form-control" />
            </p>
            <p>
                <input type="button" name="sub" value="保存" class="btn btn-danger" />
            </p>
        </form>
    </div>
    <div class="pager"></div>
    <script src="../../assets/lib/H-ui/lib/jquery/1.9.1/jquery.js"></script>
    <script src="../../assets/lib/pagination/jquery.twbsPagination.js"></script>
    <script src="../../assets/lib/jqueryui/js/jquery-ui-1.10.4.js"></script>
    <script src="../../assets/js/datapattern.js"></script>
    <script>

        $("#dialog").hide();

        //加载数据
        LoadData(1);
        AddOrEditFocus();
        //加载分页标签
        $.get("Pager.aspx", "total=0", function (data) {
            $('.pager').twbsPagination({
                currentPage: 1,
                totalPages: data,
                first: "首页",
                last: "未页",
                prev: '上一页',
                next: '下一页',
                startPage: 1,
                visiblePages: 5, //解决当totalPages小于visiblePages页码变负值的bug
                version: '1.1',
                onPageClick: function (data, page) {
                    $('tbody tr').remove();
                    LoadData(page);
                },

                error: function () {
                    return;
                }
            });
        })


        //-------------------方法-----------------------------------------
        //(方法)加载当前页数据
        function LoadData(page) {
            $("tbody").html("");
            var strHtml = '';
            $.getJSON("Pager.aspx", "type=get&index=" + page, function (data, page) {
                for (var i = 0; i < data.jsonData.length; i++) {
                    strHtml += '<tr>';
                    strHtml += '<td>' + data.jsonData[i].focusProductId + '</td>';
                    strHtml += '<td>' + data.jsonData[i].userId + '</td> ';
                    strHtml += '<td>' + data.jsonData[i].productId + '</td>';
                    strHtml += '<td>' + new Date(eval(data.jsonData[i].addTime.substring(6, 19))).pattern('yyyy-MM-dd hh:mm:ss') + '</td>';
                    strHtml += '<td><a href="javascript:void(0)" type=edit fid=' + data.jsonData[i].focusProductId + ' >edit</a></td>';
                    strHtml += '<td><a href="javascript:void(0)" type=del fid=' + data.jsonData[i].focusProductId + '>del</a></td>';
                    strHtml += '</tr>';
                }
                $('tbody').append(strHtml);
                BindEditEvent();
                BindAddEvent();
                //绑定CRUD方法
                DeleteFocus();


            })
        }

        //(方法)绑定编辑事件
        function BindEditEvent() {
            $('a[type=edit]').click(function () {
                $("#dialog").dialog();
                var id = $(this).attr('fid');
                $.getJSON("Pager.aspx", { fid: id, type: 'getsingle' }, function (data) {
                    $("input[name=uid]").val(data.userId);
                    $("input[name=pid]").val(data.productId);
                    $("input[name=fid]").val(data.focusProductId);
                    $("input[name=type]").val("edit");

                })
            })
        }
        //(方法)绑定添加事件
        function BindAddEvent() {
            $("#add").click(function () {
                $("#dialog").dialog();
                $("input[name=uid]").val("");
                $("input[name=pid]").val("");
                $("input[name=fid]").val("");
                $("input[name=type]").val("add");
            })
        }

        //(方法)增加或修改方法
        function AddOrEditFocus() {
            $('input[name=sub]').click(function () {
                var formdata = $('form').serializeArray();
                $.get("Pager.aspx", formdata, function (data) {
                    if (data == "ok") {
                        $("#dialog").dialog('close');
                        LoadData(1);
                    }
                })
            })
        }

        //(方法)删除方法
        function DeleteFocus() {
            $("a[type=del]").click(function () {
                if (confirm('确定删除?')) {
                    var id = $(this).attr("fid");
                    $.get("Pager.aspx", { type: "del", fid: id }, function (data) {
                        LoadData(1);
                    })
                }
            })
        }


        //-------------------方法--------------------------------
    </script>
</body>
</html>
