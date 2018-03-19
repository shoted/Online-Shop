using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.code;

namespace Web.www
{
    public partial class MemberAdd : AdminPage
    {
        protected string js;
        protected string msg;

        Users users = new Users();
        UsersBLL usersBLL = new UsersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestHelper.IsPostBack(Request))
            {
                users.userName = Request["uname"];
                if (usersBLL.QueryCount(new { userName = users.userName }) > 0)
                {
                    msg = "用户名已经存在";
                    return;
                }
                users.userPassword = Request["upwd"].Trim().Md5();
                users.userStatus = Request["sltstatus"].ToInt32();
                users.userStone = Request["ustone"].ToInt32();
                users.add_time = DateTime.Now;
                users.last_time = DateTime.Now;
                if (usersBLL.Insert(users) > 0)
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