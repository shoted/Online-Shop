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
    public partial class CategoryList : AdminPage
    {
        CategoriesBLL categoriesBLL = new CategoriesBLL();
        protected IEnumerable<Categories> categories = new List<Categories>();
        protected Categories category = new Categories();
        protected IEnumerable<Categories> parent = new List<Categories>();
        protected int id;
        protected string js;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request["slt"].ToInt32();
            int deleteid = Request["deleteid"].ToInt32(0);
            if (deleteid != 0)
            {
                categoriesBLL.Delete(deleteid);
                js = "window.location.href='CategoryList.aspx?slt="+Request["save"].ToInt32()+"'";
                
            }
            if (id == 0)
            {
                categories = categoriesBLL.QueryList(-1, -1, null, "catId", false);
            }
            else
            {
                categories = categoriesBLL.QueryList(-1, -1, new { catParentID = id }, null, false);
            }
            parent = categoriesBLL.QueryList(-1, -1, new { catParentID = 0 }, null, false);
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