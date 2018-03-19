using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.admin
{
    public partial class CategoryList : System.Web.UI.Page
    {
        CategoriesBLL categoriesBLL = new CategoriesBLL();
        protected IEnumerable<Categories> categories = new List<Categories>();
        protected Categories category = new Categories();
        protected IEnumerable<Categories> parent = new List<Categories>();
        protected IEnumerable<Categories> children = new List<Categories>();
        protected int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request["slt"].ToInt32();
            if (id == 0)
            {
                categories = categoriesBLL.QueryList(-1, -1, null, "catId", false);
            }
            else
            {
                categories = categoriesBLL.QueryList(-1, -1, new { catParentID = id }, null, false);
            }

            parent = categoriesBLL.QueryList(-1, -1, new { catParentID = 0 }, null, false);
            children = categories.Except<Categories>(parent);
        }

        protected string GetParentName(int id)
        {
            category = categoriesBLL.QuerySingle(id);
            if (category != null)
            {
                return category.catName;
            }
            return "无";
        }
    }
}