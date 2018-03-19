using Shop.BLL;
using Shop.Model;
using System;
using System.Web.UI;

namespace Web.shared
{
    public partial class WebForm2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            



            if (Request["type"]!=null)
            {
                AdminsBLL adminsBLL = new AdminsBLL();
                adminsBLL.Insert(new { loginid="14",loginpwd= "15" });
                UsersBLL usersBLL = new UsersBLL();
                usersBLL.Insert(new  Users{  userName = "14", userPassword = "15" });
                Response.Write("ok");
                Response.End();
            }
        }

      
    }
}