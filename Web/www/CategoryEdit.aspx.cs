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
    public partial class CategoryEdit : AdminPage
    {
        protected int catid;
        protected Categories categories = new Categories();
        CategoriesBLL categoriesBLL = new CategoriesBLL();
        protected IEnumerable<Categories> parent = new List<Categories>();
        protected string msg;
        protected string js;

        protected void Page_Load(object sender, EventArgs e)
        {
            catid = Request["catid"].ToInt32(0);
            if (catid != 0)
            {
                categories = categoriesBLL.QuerySingle(catid);
            }
            parent = categoriesBLL.QueryList(-1, -1, new { catParentID = 0 }, null, false);
            if (RequestHelper.IsPostBack(this.Request))
            {
                categories.catName = Request["catname"];
                categories.catDesc = Request["catdesc"] ?? "";
                categories.catParentID = Request["slt"].ToInt32();
                if (categoriesBLL.Update(categories) > 0)
                {
                    msg = "修改成功";
                    js = "window.parent.location.href='CategoryList.aspx?slt=" + Request["slt"].ToInt32() + "'; var index = parent.layer.getFrameIndex(window.name); parent.layer.close(index); ";
                    msg = js;
                    return;
                }
                msg = "修改失败";
            }
        }
    }
}