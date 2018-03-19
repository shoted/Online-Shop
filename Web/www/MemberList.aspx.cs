using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using Web.code;

namespace Web.www
{
    public partial class MemberList : AdminPage
    {
        protected int page;
        protected int size;
        protected int pageCount;
        protected int desc;
        protected string orderby;
        protected string strWhere;

        protected IEnumerable<Users> users = new List<Users>();
        UsersBLL usersBLL = new UsersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            #region 冻结
            int uid = Request["uid"].ToInt32(-1);
            if (uid != -1)
            {
                var tmp = usersBLL.QuerySingle(uid);
                if (tmp != null)
                {
                    tmp.userStatus = tmp.userStatus == 0 ? 1 : 0;
                    usersBLL.Update(tmp);
                }
            }
            #endregion

            #region 删除
            int did = Request["did"].ToInt32(-1);
            if (did != -1)
            {
                var tmp = usersBLL.QuerySingle(did);
                if (tmp != null)
                {
                    usersBLL.Delete(tmp.userId);
                }
            }
            #endregion

            page = Request["page"].ToInt32(1);
            size = Request["size"].ToInt32(10);
            desc = Request["desc"].ToInt32(1);
            orderby = Request["orderby"] ?? "userId";
            strWhere = Request["keyword"];
            object where = null;
            pageCount = (int)Math.Ceiling((double)usersBLL.QueryCount(null) / size);
            if (!string.IsNullOrEmpty(strWhere))
            {
                where = new { userid = strWhere };
                pageCount = 1;
            }

            users = usersBLL.QueryList(page, size, where, orderby, Convert.ToBoolean(desc));
        }

        protected string ChangeUserStatus(int status)
        {
            return status == 0 ? "冻结" : "正常";
        }
    }
}