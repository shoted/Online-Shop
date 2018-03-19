using Shop.CommonHelper;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.SessionState;

namespace Web.handler
{
    /// <summary>
    /// Shutdown 的摘要说明
    /// </summary>
    public class Shutdown : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Session["current_user"] == null)
            {
                context.Response.Write("???");
                context.Response.End();
            }
            if (SqlHelper.ExecuteNonQuery("P_Shutdown", CommandType.StoredProcedure, new SqlParameter("@userid", SqlDbType.Int) { Value = context.Session["current_user"] }) > 0)
            {
                context.Session.Abandon();
                context.Response.Write("ok");
                context.Response.End();
            }

            context.Response.Write("???");
            context.Response.End();

        }

        public bool IsReusable => false;
    }
}