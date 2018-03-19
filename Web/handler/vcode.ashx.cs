using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using Shop.CommonHelper;

namespace Shop.Web.handler
{
    /// <summary>
    /// 验证码
    /// </summary>
    public class vcode : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            // 画布  画笔  和  素材
            var vcode = CaptchaHelper.CreateRandomCode(4);
            context.Session["user_vcode"] = vcode;
            var img = CaptchaHelper.DrawImage(vcode, 20, Color.White);
            context.Response.ContentType = "image/gif";
            context.Response.BinaryWrite(img);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}