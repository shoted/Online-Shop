using Shop.CommonHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.shared
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        /// <summary> 
        /// 获取IP地址 
        /// </summary> 
        public static string IPAddress
        {
            get
            {
                string userIP;
                // HttpRequest Request = HttpContext.Current.Request; 
                HttpRequest Request = HttpContext.Current.Request; // ForumContext.Current.Context.Request; 
                                                                   // 如果使用代理，获取真实IP 
                if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != "")
                    userIP = Request.ServerVariables["REMOTE_ADDR"];
                else
                    userIP = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (userIP == null || userIP == "")
                    userIP = Request.UserHostAddress;
                return userIP;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
             string s= Request["name"];
            Response.Write(s);
            if (RequestHelper.IsPostBack(Request))
            {
                Response.Write(CookieHelper.Get("list"));
                Response.End();
            }
        }
    }
}