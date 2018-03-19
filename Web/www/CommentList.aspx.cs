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
    public partial class CommentList : AdminPage
    {
        protected IEnumerable<Comments> comments;
        CommentsBLL commentsBLL = new CommentsBLL();
        ProductsBLL productsBLL = new ProductsBLL();
        UsersBLL usersBLL = new UsersBLL();

        protected int page;
        protected int size;
        protected int totalCount;
        protected int total;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsPostBack())
            {
                string chk = Request["chk"];
                if (string.IsNullOrEmpty(chk))
                {
                    return;
                }
                string[] delArray = chk.Split(',');
                
                foreach (var item in delArray)
                {
                    commentsBLL.Delete(item.ToInt32());
                }
            }
            page = Request["page"].ToInt32(1);
            size = Request["size"].ToInt32(10);
            total = commentsBLL.QueryCount(null);
            totalCount = (int)Math.Ceiling(total * 1.0 / size);
            comments = commentsBLL.QueryList(page, size, null, null);
        }

        protected string GetProductName(int id) => productsBLL.QuerySingle(id) == null ? "" : productsBLL.QuerySingle(id).productName;
        protected string GetUserName(int id) => usersBLL.QuerySingle(id) == null ? "" : usersBLL.QuerySingle(id).userName;
    }
}