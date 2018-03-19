using Shop.BLL;
using Shop.Model;
using System;
using System.Web;

namespace Web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected string msg;
        protected string username;
        protected string password;

        AdminsBLL adminsBLL = new AdminsBLL();
        Admins admins = new Admins();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestHelper.IsPostBack(this.Request))
            {
                username = Request["username"];
                password = Request["password"];
                if (password!=null)
                {
                    password = password.Md5();
                }
                if (adminsBLL.Login(username,password,out admins,out msg))
                {
                    Session["admin"] = admins;
                    Response.Redirect("index.aspx");
                }
            }
        }
    }
}