using Model;
using Shop.BLL;
using System;
using System.Web;

namespace Web.account
{
    public partial class Register : System.Web.UI.Page
    {

        UsersBLL usersBLL = new UsersBLL();

        protected string Message { get; set; }
        string login;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 当前是否回发
            if (Request.IsPostBack()) // IsPostBack 是基于__VIEWSTATE
            {
                string checkName = Request["checkname"];
                if (!string.IsNullOrEmpty(checkName) && usersBLL.QueryCount(new { userName = checkName }) > 0)
                {
                    Message = "用户名已存在";
                    Response.Write(Message);
                    Response.End();
                }

                PostBack();
            }
        }

        private void PostBack()
        {
            // 1.采集表单
            login = Request["username"];
            string password = Request["password"];
            string confirm = Request["confirm"];
            string vcode = Request["vcode"];
            bool isChecked = Request["checked"] != null;

            if (!isChecked)
            {
                Message = "请勾选许可协议";
                Response.Write(Message);
                Response.End();
            }

            // 2.参数校验
            if (string.IsNullOrEmpty(login) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(vcode))
            {
                Message = "用户名或密码不能为空";
                Response.Write(Message);
                Response.End();
            }
            if (password != confirm)
            {
                Message = "密码不一致";
                Response.Write(Message);
                Response.End();
            }
            // 3.验证码校验
            var session = Session["user_vcode"];
            if (session == null)
            {
                Message = "验证码过期了";
                Response.Write(Message);
                Response.End();
            }
            var sessionCode = session.ToString();
            if (sessionCode != vcode)
            {
                Message = "验证码错误";
                Response.Write(Message);
                Response.End();
            }
            // 4.调用业务方法
            var res = usersBLL.Register(login, password, out Shop.Model.Users user);
            switch (res)
            {
                case RegisterResult.用户名已存在:
                    Message = "用户名已存在";
                    Response.Write(Message);
                    Response.End();
                    break;
                case RegisterResult.注册成功:
                    Message = "注册成功";
                    //Response.Redirect(redirect);
                    Session["current_user"] = user.userId;
                    Response.Write(Message);
                    Response.End();
                    break;
                case RegisterResult.注册失败:
                    Message = "注册失败";
                    Response.Write(Message);
                    Response.End();
                    break;
            }
        }

    }
}