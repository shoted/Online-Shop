using Shop.BLL;
using Shop.Model;
using System;
using System.Web;
using Web.code;

namespace Web.www
{
    public partial class AdminAdd : AdminPage
    {
        protected string js;
        protected string msg;

        Admins admins = new Admins();
        protected AdminsBLL adminsBLL = new AdminsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestHelper.IsPostBack(Request))
            {
                admins.LoginId = Request["uname"];
                if (adminsBLL.QueryCount(new { LoginId = admins.LoginId }) > 0)
                {
                    msg = "用户名已经存在";
                    return;
                }
                admins.LoginPwd = Request["upwd"].Trim().Md5();

                if (adminsBLL.Insert(admins) > 0)
                {
                    msg = "添加成功";
                    js = LayerClose();
                    return;
                }
                msg = "添加失败";
            }
        }
    }
}