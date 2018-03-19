(function ($) {
    $.fn.mailAutoComplete = function (options) {
        var defaults = {
            boxClass: "mailListBox", //澶栭儴box鏍峰紡
            listClass: "mailListDefault", //榛樿鐨勫垪琛ㄦ牱寮�
            focusClass: "mailListFocus", //鍒楄〃閫夋牱寮忎腑
            markCalss: "mailListHlignt", //楂樹寒鏍峰紡
            zIndex: 1,
            autoClass: true, //鏄惁浣跨敤鎻掍欢鑷甫class鏍峰紡
            mailArr: ["qq.com", "gmail.com", "126.com", "163.com", "hotmail.com", "yahoo.com", "yahoo.com.cn", "live.com", "sohu.com", "sina.com"], //閭欢鏁扮粍
            textHint: false, //鏂囧瓧鎻愮ず鐨勮嚜鍔ㄦ樉绀轰笌闅愯棌
            hintText: "",
            focusColor: "#333",
            blurColor: "#999"
        };
        var settings = $.extend({}, defaults, options || {});

        //椤甸潰瑁呰浇CSS鏍峰紡
        if (settings.autoClass && $("#mailListAppendCss").size() === 0) {
            $('<style id="mailListAppendCss" type="text/css">.mailListBox{border:1px solid #369; background:#fff; font:12px/20px Arial;}.mailListDefault{padding:0 5px;cursor:pointer;white-space:nowrap;}.mailListFocus{padding:0 5px;cursor:pointer;white-space:nowrap;background:#369;color:white;}.mailListHlignt{color:red;}.mailListFocus .mailListHlignt{color:#fff;}</style>').appendTo($("head"));
        }
        var cb = settings.boxClass, cl = settings.listClass, cf = settings.focusClass, cm = settings.markCalss; //鎻掍欢鐨刢lass鍙橀噺
        var z = settings.zIndex, newArr = mailArr = settings.mailArr, hint = settings.textHint, text = settings.hintText, fc = settings.focusColor, bc = settings.blurColor;
        //鍒涘缓閭欢鍐呴儴鍒楄〃鍐呭
        $.createHtml = function (str, arr, cur) {
            var mailHtml = "";
            if ($.isArray(arr)) {
                $.each(arr, function (i, n) {
                    if (i === cur) {
                        mailHtml += '<div class="mailHover ' + cf + '" id="mailList_' + i + '"><span class="' + cm + '">' + str + '</span>@' + arr[i] + '</div>';
                    } else {
                        mailHtml += '<div class="mailHover ' + cl + '" id="mailList_' + i + '"><span class="' + cm + '">' + str + '</span>@' + arr[i] + '</div>';
                    }
                });
            }
            return mailHtml;
        };
        //涓€浜涘叏灞€鍙橀噺
        var index = -1, s;
        $(this).each(function () {
            var that = $(this), i = $(".justForJs").size();
            if (i > 0) { //鍙粦瀹氫竴涓枃鏈
                return;
            }
            var w = that.outerWidth(), h = that.outerHeight(); //鑾峰彇褰撳墠瀵硅薄锛堝嵆鏂囨湰妗嗭級鐨勫楂�
            //鏍峰紡鐨勫垵濮嬪寲
            that.wrap('<span style="display:inline-block;position:relative;"></span>')
                .before('<div id="mailListBox_' + i + '" class="justForJs ' + cb + '" style="min-width:' + w + 'px;_width:' + w + 'px;position:absolute;left:-6000px;top:' + h + 'px;z-index:' + z + ';"></div>');
            var x = $("#mailListBox_" + i), liveValue; //鍒楄〃妗嗗璞�
            that.focus(function () {
                //鐖舵爣绛剧殑灞傜骇
                $(this).css("color", fc).parent().css("z-index", z);
                //鎻愮ず鏂囧瓧鐨勬樉绀轰笌闅愯棌
                if (hint && text) {
                    var focus_v = $.trim($(this).val());
                    if (focus_v === text) {
                        $(this).val("");
                    }
                }
                //閿洏浜嬩欢
                $(this).keyup(function (e) {
                    s = v = $.trim($(this).val());
                    if (/@/.test(v)) {
                        s = v.replace(/@.*/, "");
                    }
                    if (v.length > 0) {
                        //濡傛灉鎸夐敭鏄笂涓嬮敭
                        if (e.keyCode === 38) {
                            //鍚戜笂
                            if (index <= 0) {
                                index = newArr.length;
                            }
                            index--;
                        } else if (e.keyCode === 40) {
                            //鍚戜笅
                            if (index >= newArr.length - 1) {
                                index = -1;
                            }
                            index++;
                        } else if (e.keyCode === 13) {
                            //鍥炶溅
                            if (index > -1 && index < newArr.length) {
                                //濡傛灉褰撳墠鏈夋縺娲诲垪琛�
                                $(this).val($("#mailList_" + index).text());
                            }
                        } else {
                            if (/@/.test(v)) {
                                index = -1;
                                //鑾峰緱@鍚庨潰鐨勫€�
                                //s = v.replace(/@.*/, "");
                                //鍒涘缓鏂板尮閰嶆暟缁�
                                var site = v.replace(/.*@/, "");
                                newArr = $.map(mailArr, function (n) {
                                    var reg = new RegExp(site);
                                    if (reg.test(n)) {
                                        return n;
                                    }
                                });
                            } else {
                                newArr = mailArr;
                            }
                        }
                        x.html($.createHtml(s, newArr, index)).css("left", 0);
                        if (e.keyCode === 13) {
                            //鍥炶溅
                            if (index > -1 && index < newArr.length) {
                                //濡傛灉褰撳墠鏈夋縺娲诲垪琛�
                                x.css("left", "-6000px");
                            }
                        }
                    } else {
                        x.css("left", "-6000px");
                    }
                }).blur(function () {
                    if (hint && text) {
                        var blur_v = $.trim($(this).val());
                        if (blur_v === "") {
                            $(this).val(text);
                        }
                    }
                    $(this).css("color", bc).unbind("keyup").parent().css("z-index", 0);
                    x.css("left", "-6000px");

                });
                //榧犳爣缁忚繃鍒楄〃椤逛簨浠�
                //榧犳爣缁忚繃
                $(".mailHover").live("mouseover", function () {
                    index = Number($(this).attr("id").split("_")[1]);
                    liveValue = $("#mailList_" + index).text();
                    x.children("." + cf).removeClass(cf).addClass(cl);
                    $(this).addClass(cf).removeClass(cl);
                });
            });

            x.bind("mousedown", function () {
                that.val(liveValue);
            });
        });
    };

})(jQuery);



var api = null;
try {
    api = frameElement.api;
} catch (e) {
    throw new DOMException;
}
function getAbsoluteUrl(url) {
    var a = document.createElement('A');
    a.href = url;  // 设置相对路径给Image, 此时会发送出请求
    url = a.href;  // 此时相对路径已经变成绝对路径
    return url;
}
var toAbsURL = function (url) { var div = document.createElement('div'); div.innerHTML = '<a href="' + url.replace(/"/g, '%22') + '"/>'; return div.firstChild.href; };
var resultZindex = 1976;
function getParentzIndex() {


    try {
        if (null !== this.api) {
            resultZindex = this.api.opener.config.zIndex + 1;
        }

    } catch (e) {
        resultZindex = resultZindex + 1;
    }
}
// 打开层
function OpenDiv(url, code, width, height) {
    var abcd123 = toAbsURL(url);
    getParentzIndex();
    $.dialog(
        {
            content: 'url:' + abcd123,
            width: parseInt(width),
            height: parseInt(height),
            //title:title,
            lock: true,
            zIndex: resultZindex
        });
}
//打开心浏览器
function OpenWin(url, width, height) {
    window.open(url, "", "height=" + height + ",width=" + width + ",status=no,toolbar=no,menubar=no,location=no,resizable=yes,scrollbars=yes");
}

function CloseMe1() {

    if (parent === this.window) { return window.close(); } else { return CloseDiv(); }
}
function CloseDiv1() {

    if (parent === this.window) { return window.close(); } else {
        try {
            api.close();
        } catch (e) {
            api.opener.close();
        }

    }

}
// 关闭层
function CloseDiv() {
    setTimeout(CloseDiv1, 50);
}
// 关闭层
function CloseMe() {
    setTimeout(CloseMe1, 50);
}
// 获取父页面
function GetOpenerWin() { if (parent === this.window) { return opener; } else { return api.opener; } }


function DragTableCell(TableId) {
    //按需求配置     
    $('table#' + TableId).bestTable({
        isDrog: true, //不允许拖动表头宽度  
        oddtrBackgroundColor: '', //改变odd背景色
        isEditor: false,
        isEffect: true, //关闭鼠标滑动特效     
        isEditorNewColor: false //编辑完成后不改变背景色     
    });
}


function ParentWindowAutoIFrameHeight(IframeId) {
    $("#" + IframeId).load(function () {
        var mainheight = $(this).contents().find("body").height() + 30;
        $(this).height(mainheight);
    });
}


function IFrameContentWindowAutoIFrameHeight(IframeId) {
    $(window.parent.document).find("#" + IframeId).load(function () {
        var main = $(window.parent.document).find("#" + IframeId);
        var thisheight = $(document).height() + 30;
        main.height(thisheight);
    });
}

function CustomOpen(url, code, title, width, height) {
    var abcd123 = toAbsURL(url);
    getParentzIndex();
    $.dialog(
        {
            content: 'url:' + abcd123,
            width: parseInt(width),
            height: parseInt(height),
            title: title,
            lock: true,
            zIndex: resultZindex
        });
}

function showWin(url) {
    var win;
    win = window.open(url, '', 'width=750,height=500,scrollbars=1,left=0,top=0,resizable=1');
    win.focus();
}

function Refresh(url) {
    window.location(url);
}

