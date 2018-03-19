using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Web;
using System.Web.UI;

namespace Web.Code
{
    public class PageBase : Page
    {
        protected Users CurrentUser { get; set; }

        UsersBLL usersBLL = new UsersBLL();
        int id;

        protected override void OnInit(EventArgs e)
        {
            if (Session["current_user"] != null)
            {
                id = Convert.ToInt32(Session["current_user"]);
            }

            CurrentUser = usersBLL.QuerySingle(id);
            if (CurrentUser == null)
            {
                TryCookieLogin();
            }
            base.OnInit(e);
        }

        protected bool TryCookieLogin()
        {
            string Username = CookieHelper.Get("yhm");
            string Password = CookieHelper.Get("mm");
            usersBLL.CookieLogin(Username, Password, out Users user);
            if (user != null)
            {
                Session["current_user"] = user.userId;
                CurrentUser = user;
                return true;
            }
            return false;
        }

        protected void NotFound()
        {
            throw new HttpException(404, "NotFound");
        }

        protected void Login(string url="")
        {
            if (TryCookieLogin())
            {
                return;
            }
            Response.Redirect("~/account/login.aspx?rdt="+url);
        }
    }
}