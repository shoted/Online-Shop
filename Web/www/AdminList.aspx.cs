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
    public partial class AdminList : AdminPage
    {
        protected int page;
        protected int size;
        protected int pageCount;
        protected int desc;
        protected string orderby;

        AdminsBLL adminsBLL = new AdminsBLL();
        protected IEnumerable<Admins> admins;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region 删除
            int did = Request["did"].ToInt32(-1);
            if (did != -1)
            {
                var tmp = adminsBLL.QuerySingle(did);
                if (tmp != null)
                {
                    adminsBLL.Delete(tmp.Id);
                }
            }
            #endregion

            page = Request["page"].ToInt32(1);
            size = Request["size"].ToInt32(10);
            desc = Request["desc"].ToInt32(1);
            orderby = Request["orderby"] ?? "Id";
            pageCount = (int)Math.Ceiling((double)adminsBLL.QueryCount(null) / size);
            admins = adminsBLL.QueryList(page, size, null, orderby, Convert.ToBoolean(desc));
        }
    }
}