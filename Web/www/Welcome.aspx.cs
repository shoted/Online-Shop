using Shop.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.code;

namespace Web.www
{
    public partial class Welcome : AdminPage
    {
        protected int category;
        protected int order;
        protected int orderWait;
        protected int product;
        protected int comment;
        protected int user;
        protected int admins;

        CategoriesBLL categoriesBLL = new CategoriesBLL();
        OrdersBLL ordersBLL = new OrdersBLL();
        ProductsBLL productsBLL = new ProductsBLL();
        CommentsBLL commentsBLL = new CommentsBLL();
        UsersBLL usersBLL = new UsersBLL();
        AdminsBLL adminsBLL = new AdminsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            category = categoriesBLL.QueryCount(null);
            order = ordersBLL.QueryCount(null);
            orderWait = ordersBLL.QueryCount(new { orderStatus = 1 });
            product = productsBLL.QueryCount(null);
            comment = commentsBLL.QueryCount(null);
            user = usersBLL.QueryCount(null);
            admins = adminsBLL.QueryCount(null);
            admin = new Shop.Model.Admins();
            admin.Id = 1;
        }
    }
}