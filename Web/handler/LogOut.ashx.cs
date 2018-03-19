using Shop.CommonHelper;
using System.Web;

namespace Web.handler
{
    /// <summary>
    /// Logout 的摘要说明
    /// </summary>
    public class Logout : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Session.Abandon();
            CookieHelper.Remove("yhm");
            CookieHelper.Remove("mm");
            context.Response.Write("ok");
            context.Response.End();
            //context.Response.Redirect("../Index.aspx");
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