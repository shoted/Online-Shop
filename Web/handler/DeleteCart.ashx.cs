using Shop.CommonHelper;
using System.Web;

namespace Shop.Web.handler
{
    /// <summary>
    /// DeleteCart 的摘要说明
    /// </summary>
    public class DeleteCart : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";

            int productId = context.Request["item"].ToInt32(-1);
            BLL.CartsBLL cartsBLL   = new  BLL.CartsBLL();
            if (cartsBLL.Delete(productId) > 0)
            {
                context.Response.Redirect("../cart.aspx");
            }
            else
            {
                throw new HttpException(404, "Not Found");
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