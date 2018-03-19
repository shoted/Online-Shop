using Shop.BLL;
using System;
using System.Collections.Generic;

namespace Web.shared
{
    public partial class Cat : System.Web.UI.UserControl
    {

        CategoriesBLL bll = new CategoriesBLL();

        protected IEnumerable<Shop.Model.Categories> Categories { get; set; }

        protected Action<int> RenderCategory { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Categories = bll.QueryList(-1, 0, null,"catId");
        }
    }
}