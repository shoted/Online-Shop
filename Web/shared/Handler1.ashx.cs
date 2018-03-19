using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Web.shared
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string id = context.Request["id"];
            string name = context.Request["name"];
            JavaScriptSerializer js = new JavaScriptSerializer();
            var student = new { Id = id, Name = name};
            string s= js.Serialize(student);
            context.Response.Write(s);
            
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