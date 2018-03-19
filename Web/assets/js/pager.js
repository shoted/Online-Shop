function renderPager(format, totalPages, current, showCount, ulContainerClass, activeLiClass, separator) {
    var tempFormats = format.split(separator);
    // url 前缀
    var prefix = tempFormats[0];
    // url 后缀
    var suffix = tempFormats.length > 1 ? tempFormats[1] : '';
    // var totalPages = Math.Max((totalCount + pageSize - 1) / pageSize, 1); //总页数
    // 左右区间
    var region = Math.floor(showCount / 2.0);
    // 开始页码数
    var beginNum = current - region <= 0 ? 1 : current - region;
    // 结束页码数
    var endNum = beginNum + showCount;
    if (endNum > totalPages) {
        endNum = totalPages + 1;
        beginNum = endNum - showCount;
        beginNum = beginNum < 1 ? 1 : beginNum;
    }
    var pager = '<ul class="' + ulContainerClass + '">\r\n';
    if (current != 1) {
        pager += '\t<li><a href="' + prefix + 1 + suffix + '">首页</a></li>\r\n';
        pager += '\t<li><a href="' + prefix + (current - 1) + suffix + '">上一页</a></li>\r\n';
    }
    if (beginNum != 1) {
        pager += '\t<li><span>&hellip;</span></li>\r\n';
    }
    for (var i = beginNum; i < endNum; i++) {
        if (i != current) {
            pager += '\t<li><a href="' + prefix + i + suffix + '">' + i + '</a></li>\r\n';
            //pager.AppendFormat("", i, prefix, suffix);
        }
        else {
            pager += '\t<li class="active"><span>' + current + '</span></li>\r\n';
            //pager.AppendFormat("", current);
        }
    }
    if (endNum != totalPages + 1) {
        pager += '\t<li><span>&hellip;</span></li>\r\n';
    }
    if (current != totalPages) {
        pager += '\t<li><a href="' + prefix + (current + 1) + suffix + '">下一页</a></li>\r\n';
        pager += '\t<li><a href="' + prefix + totalPages + suffix + '">末页</a></li>\r\n';
        //pager.AppendFormat("", current + 1, prefix, suffix);
    }
    pager += '</ul>';
    return pager;
}