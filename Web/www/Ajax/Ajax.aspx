<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajax.aspx.cs" Inherits="Web.www.Ajax.Ajax" EnableViewState="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../assets/css/style.css" rel="stylesheet" />
    <link href="/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style>
        td {
            border: 1px solid #00ff21;
        }
    </style>
</head>
<body>
    <div>
        <input type="button" name="name" value="add" onclick="divtoggle()" />
        <div id="divadd" style="width: 300px; height: 150px; background-color: #0ff; padding: 20px;">
            <p>
                用户ID:
                    <input type="text" name="uid" value="" required="required" />
            </p>
            <p>
                产品ID:
                    <input type="text" name="pid" value="" required="required" />
            </p>
            <input type="hidden" name="type" value="" />
            <input type="hidden" name="fid" value="" />
            <input type="hidden" name="index" value="" />

            <input type="button" name="name" value="OKOKOK" onclick="additem()" />
        </div>
    </div>
    <table width="600px" height="300px">
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
    <div id="pager"></div>
    <script src="../../assets/lib/H-ui/lib/jquery/1.9.1/jquery.js"></script>
    <script src="../../assets/lib/pagination/jquery.twbsPagination.js"></script>
    <script src="../../assets/js/pager.js"></script>

    <script type="text/javascript">
        $("#divadd").hide();
        var index = 1;

        //加载数据
        function load(index) {
            $('input[name=index]').val(index);
            $('tbody tr').remove();
            $('a, .btn').remove();
            var strHtml = '';
            $.getJSON("Ajax.aspx", "type=get&index=" + index, function (data) {
                for (var i = 0; i < data.jsonData.length; i++) {
                    strHtml += '<tr>';
                    strHtml += '<td>' + data.jsonData[i].focusProductId + '</td>';
                    strHtml += '<td>' + data.jsonData[i].userId + '</td> ';
                    strHtml += '<td>' + data.jsonData[i].productId + '</td>';
                    strHtml += '<td>' + data.jsonData[i].addTime + '</td>';
                    strHtml += '<td><a href="javascript:void(0)" onclick="edititem(' + data.jsonData[i].focusProductId + ',' + data.jsonData[i].userId + ',' + data.jsonData[i].productId + ')">edit</a></td>';
                    strHtml += '<td><a href="javascript:void(0)" onclick="deleteitem(' + data.jsonData[i].focusProductId + ')">del</a></td>';
                    strHtml += '</tr>';
                }
                $('tbody').append(strHtml);
                strHtml = "<div class='list- pagination pull- right '>";
                strHtml += renderPager("javascript:void(0)?type=get&index=@", data.pager, 1, 7, "pagination", "active", "@");
                strHtml += "</div>";
                alert(strHtml);
                $("#pager").html(strHtml);
            })
        }
        load(index);

        //删除
        function deleteitem(id) {
            $.get("Ajax.aspx", "type=del&id=" + id, function (data) {
                load($('input[name=index]').val());
            })
        }
        //显示或隐藏div
        function divtoggle() {
            if ($("#divadd").is(':hidden')) {
                $("#divadd").show();
            } else {
                $("#divadd").hide();
            }
            $("#divadd input[type=hidden]").val("add");
            $("input[name=uid]").val("");
            $("input[name=pid]").val("");
        }
        //添加或编辑
        function additem() {
            var uid = $("input[name=uid]").val();
            var pid = $("input[name=pid]").val();
            var tid = $("input[name=type]").val();
            var fid = $("input[name=fid]").val();
            $.get("Ajax.aspx", { u: uid, p: pid, type: tid, f: fid }, load);
            $("#divadd").hide();
        }
        //显示编辑div
        function edititem(fid, uid, pid) {
            $("input[name=uid]").val(uid);
            $("input[name=pid]").val(pid);
            $("input[name=fid]").val(fid);
            $("input[name=type]").val("edit");
            if ($("#divadd").is(':hidden')) {
                $("#divadd").show();
            }
        }


    </script>
</body>
</html>



