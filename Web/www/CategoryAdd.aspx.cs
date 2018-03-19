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
    public partial class CategoryAdd : AdminPage
    {
        protected string msg;
        protected string js;
        protected IEnumerable<Categories> categories;
        CategoriesBLL categoriesBLL = new CategoriesBLL();
        protected int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request["slt"].ToInt32();
            categories = categoriesBLL.QueryList(-1, -1, new { catParentID = 0 }, null, false);
            if (categories == null)
            {
                categories = new List<Categories>();
            }
            if (RequestHelper.IsPostBack(this.Request))
            {
                string choose = Request["choose"];
                if (choose == "添加子分类")
                {
                    Categories model = new Categories();
                    model.catName = Request["catname"];
                    Categories tmp = new Categories();
                    tmp = categoriesBLL.QuerySingle(new { catName = model.catName });
                    if (tmp != null)
                    {
                        msg = "分类名不能重复";
                        return;
                    }
                    model.catParentID = id;
                    model.catDesc = Request["catdesc"] ?? "";
                    categoriesBLL.Insert(model);

                }
                else if (choose == "添加主分类")
                {
                    Categories model = new Categories();
                    model.catName = Request["catparent"];
                    Categories tmp = new Categories();
                    tmp = categoriesBLL.QuerySingle(new { catName = model.catName });
                    if (tmp != null)
                    {
                        msg = "分类名不能重复";
                        return;
                    }
                    model.catParentID = 0;
                    model.catDesc = Request["parentdesc"] ?? "";
                    categoriesBLL.Insert(model);
                }
                msg = "添加成功";
                js = LayerClose();
            }
        }
    }
}