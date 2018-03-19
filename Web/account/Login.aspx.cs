using Model;
using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Web;

namespace Web.account
{
    public partial class Login : System.Web.UI.Page
    {
        protected string Username { get; set; }
        protected string Password { get; set; }
        protected string Message { get; set; }

        protected string url { get; set; }
        private UsersBLL usersBLL = new UsersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            url = Request["rdt"];
            if (string.IsNullOrEmpty(url))
            {
                url = "http://"+Request.Url.Host+":" +Request.Url.Port+ "/index.aspx";
            }
            if (Request.IsPostBack())
            {
                UserLogin();
            }
        }

        private void UserLogin()
        {
            // 接收参数
            Username = Request["username"].Trim();
            Password = Request["password"];
            var vcode = Request["vcode"].Trim();
            var isRemember = Request["checked"] != null;

            // 参数校验
            if (string.IsNullOrEmpty(Username) || string.IsNullOrEmpty(Password))
            {
                Message = "用户名或密码为空！";
                Response.Write(Message);
                Response.End();
            }

            // 校验验证码
            var session = Session["user_vcode"];
            if (session == null || vcode != session.ToString())
            {
                Message = "验证码错误！";
                Response.Write(Message);
                Response.End();
            }

            Users user;
            LoginResult res = usersBLL.Login(Username, Password, out user);
            switch (res)
            {
                case LoginResult.用户名不存在:
                case LoginResult.密码错误:
                    Message = "用户名或密码错误！";
                    Response.Write(Message);
                    Response.End();
                    break;
                case LoginResult.用户已被冻结:
                    Message = "用户状态异常！";
                    Response.Write(Message);
                    Response.End();
                    break;
                case LoginResult.登录成功:
                    Session["current_user"] = user.userId;
                    if (isRemember)
                    {
                        // 处理记住我
                        //HttpCookie c1 = new HttpCookie("ysb");
                        //c1.Value = Username;
                        //HttpCookie c2 = new HttpCookie("yssb");
                        //c2.Value = user.Password;
                        //Response.Cookies.Add(c1);
                        //Response.Cookies.Add(c2);
                        CookieHelper.Set("yhm", Username, DateTime.Now.AddDays(7));
                        CookieHelper.Set("mm", user.userPassword, DateTime.Now.AddDays(7));
                    }
                    Message = "登录成功";
                    Response.Write(Message);
                    Response.End();
                    break;
            }
        }
    }
}