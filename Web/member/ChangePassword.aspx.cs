using Model;
using Shop.BLL;
using Shop.CommonHelper;
using System;
using System.Web;
using Web.Code;

namespace Web.member
{
    public partial class ChangePassword : PageBase
    {
        protected string msg;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser == null)
            {
                Login();
            }
            if (RequestHelper.IsPostBack(Request))
            {

                string oldPwd = Request["oldpassword"].Trim();
                string newPwd = Request["password"].Trim();
                string confirmPwd = Request["confirm"].Trim();
                UsersBLL usersBLL = new UsersBLL();
                ChangePwdResult result = usersBLL.ChangePwd(CurrentUser.userId, oldPwd, newPwd, confirmPwd);
                switch (result)
                {
                    case ChangePwdResult.旧密码错误:
                        msg = "旧密码错误";
                        break;
                    case ChangePwdResult.两次输入密码不一致:
                        msg = "两次输入密码不一致";
                        break;
                    case ChangePwdResult.修改成功:
                        msg = "修改成功";
                        Session.Clear();
                        CookieHelper.Clear();
                        Response.Redirect("../account/Login.aspx");
                        break;
                    case ChangePwdResult.用户不存在:
                        msg = "用户不存在";
                        break;
                    default:
                        break;
                }
            }
        }
    }
}