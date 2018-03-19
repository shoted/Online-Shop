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
    public partial class AdminEdit : AdminPage
    {
        protected int eid;
        protected string js;
        protected string msg;

        protected Admins admins;
        AdminsBLL adminsBLL = new AdminsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            eid = Request["eid"].ToInt32();
            admins = adminsBLL.QuerySingle(eid);
            if (admins == null)
            {
                admins = new Admins();
                return;
            }
            if (RequestHelper.IsPostBack(this.Request))
            {
                admins.LoginId = Request["uname"];
                
                if (Request["upwd"] != Request["oldpwd"])
                {
                    admins.LoginPwd = Request["upwd"].Md5();
                }
                
                if (adminsBLL.Update(admins) > 0)
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