using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System.Collections.Generic;
using System.Web;

namespace Web.handler
{
    /// <summary>
    /// Sign 的摘要说明
    /// </summary>
    public class Sign : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            int id = context.Request["userid"].ToInt32();
            UsersBLL usersBLL = new UsersBLL();
            Users users = usersBLL.QuerySingle(id);
            List<int> userids = context.Application.Get("userids") as List<int>;

            if (userids == null)
            {
                userids = new List<int>();
            }
            if (userids.Contains(id) && id != 0)
            {
                context.Response.Write("已经签过到了");
                context.Response.End();
            }
            if (users == null)
            {
                context.Response.End();
            }
            users.userStone += 10;
            if (usersBLL.Update(users) > 0)
            {
                userids.Add(id);
                context.Application.Lock();
                context.Application.Add("userids", userids);
                context.Application.UnLock();
                context.Response.Write("签到成功");
            }
            else
            {
                context.Response.Write("签到失败");
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