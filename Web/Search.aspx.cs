using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using Web.Code;

namespace Web
{
    public partial class Search : PageBase
    {
        protected IEnumerable<Products> products;
        ProductsBLL productsBLL = new ProductsBLL();
        string where;

        protected int page;
        protected int size;
        protected int pageCount;
        protected int desc;
        protected string orderby;
        protected int totalCount;
        protected string words;
        protected string key;

        protected void Page_Load(object sender, EventArgs e)
        {
            words = Request["q"];
            if (string.IsNullOrEmpty(words))
            {
                return;
            }
            where = "%" + words + "%";
            page = Request["page"].ToInt32(1);
            size = Request["size"].ToInt32(10);
            desc = Request["desc"].ToInt32(0);
            orderby = Request["orderby"] ?? "add_time";
            products = productsBLL.SearchProduct(page, size, new { productName = where }, orderby ,Convert.ToBoolean(desc));
            var tmp = productsBLL.SearchProduct(-1, -1, new { productName = where }, orderby);
            if (tmp != null)
            {
                totalCount = tmp.Count();
            }
            pageCount = (int)Math.Ceiling((double)totalCount / size);
        }
    }
}