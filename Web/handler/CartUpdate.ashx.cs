using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop.CommonHelper;

namespace Shop.Web.handler
{
    /// <summary>
    /// cartUpdate 的摘要说明
    /// </summary>
    public class cartUpdate : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            int cartid = context.Request["id"].ToInt32();
            int userid = context.Request["userid"].ToInt32();
            int count = context.Request["count"].ToInt32();
            string type = context.Request["type"];
            
            
            BLL.CartsBLL cartsBLL = new BLL.CartsBLL();
            Model.Carts cart = cartsBLL.QuerySingle(cartid);
            if (cart == null)
            {
                context.Response.Write("-1");
                context.Response.End();
            }
            if (cart.userId!=userid)
            {
                context.Response.Write("-1");
                context.Response.End();
            }
            if (type == "add")
            { 
                //执行添加操作
                cart.productCount++;
            }
            else if (type == "reduce")
            {
                //执行减少操作
                if (cart.productCount > 1)
                {
                    cart.productCount--;
                }
                else
                {
                    context.Response.Write("-1");
                    context.Response.End();
                }
            }
            else
            {
                //将数量修改为文本框失去焦点时的数量
                if (count > 0)
                {
                    cart.productCount = count;
                }

            }
            cartsBLL.Update(cart);
            context.Response.Write(cart.productCount);
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