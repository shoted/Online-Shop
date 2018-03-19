using Shop.BLL;
using Shop.CommonHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Web.handler
{
    /// <summary>
    /// DeleteAddress 的摘要说明
    /// </summary>
    public class DeleteAddress : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int postid = context.Request["postid"].ToInt32();
            if (postid == 0)
            {
                context.Response.Redirect("../member/MyAddress.aspx");
            }
            AddressBLL addressBLL = new AddressBLL();
            addressBLL.Delete(postid);
            context.Response.Redirect("../member/MyAddress.aspx");
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