using Shop.BLL;
using Shop.CommonHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.handler
{
    /// <summary>
    /// DeleteOrder 的摘要说明
    /// </summary>
    public class DeleteOrder : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int userid = context.Request["userid"].ToInt32();
            int orderid = context.Request["orderid"].ToInt32();
            if (userid == 0 || orderid == 0)
            {
                context.Response.Redirect("../member/MyOrder.aspx");
            }
            OrdersBLL ordersBLL = new OrdersBLL();
            ordersBLL.DeleteOrder(userid, orderid);
            context.Response.Redirect("../member/MyOrder.aspx");
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