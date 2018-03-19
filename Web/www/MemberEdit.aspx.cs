using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Web;
using Web.code;

namespace Web.www
{
    public partial class MemberEdit : AdminPage
    {
        protected int eid;
        protected string js;
        protected string msg;

        protected Users users;
        UsersBLL usersBLL = new UsersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            eid = Request["eid"].ToInt32();
            users = usersBLL.QuerySingle(eid);
            if (users == null)
            {
                users = new Users();
                return;
            }
            if (RequestHelper.IsPostBack(this.Request))
            {
                users.userName = Request["uname"];
                
                if (Request["upwd"] != Request["oldpwd"])
                {
                    users.userPassword = Request["upwd"].Md5();
                }
                users.userStatus = Request["sltstatus"].ToInt32();
                users.userStone = Request["ustone"].ToInt32();
                if (usersBLL.Update(users) > 0)
                {
                    msg = "修改成功";
                    js = LayerClose();
                    return;
                }
                msg = "修改失败";
            }
        }
    }
}