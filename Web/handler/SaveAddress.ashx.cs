using Shop.BLL;
using Shop.CommonHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.handler
{
    /// <summary>
    /// SaveAddress 的摘要说明
    /// </summary>
    public class SaveAddress : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            int defaultid = context.Request["defaultid"].ToInt32();
            int userid = context.Request["userid"].ToInt32();
            if (defaultid==0||userid==0)
            {
                context.Response.Redirect("../member/MyAddress.aspx");
            }
            AddressBLL addressBLL = new AddressBLL();
            if (addressBLL.AddressDefault(defaultid,userid))
            {
                context.Response.Write("保存成功");
            }
            else
            {
                context.Response.Write("保存失败");
            }
            
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