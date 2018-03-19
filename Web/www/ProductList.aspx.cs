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
    public partial class ProductList : AdminPage
    {
        protected int page;
        protected int size;
        protected int pageCount;
        protected int desc;
        protected string orderby;
        protected string keyword;
        protected int slt;
        protected IEnumerable<Products> products = new List<Products>();
        ProductsBLL productsBLL = new ProductsBLL();

        CategoriesBLL categoriesBLL = new CategoriesBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            #region 删除产品操作
            int deleteid = Request["deleteid"].ToInt32(0);
            if (deleteid != 0)
            {
                productsBLL.Delete(deleteid);
            }
            #endregion

            #region 修改状态
            int status = Request["status"].ToInt32(-1);
            if (status == 0)
            {
                int sid = Request["sid"].ToInt32();
                Products tmp = productsBLL.QuerySingle(sid);
                if (tmp != null)
                {
                    tmp.productStatus = 1;
                    productsBLL.Update(tmp);
                }
            }
            if (status == 1)
            {
                int sid = Request["sid"].ToInt32();
                Products tmp = productsBLL.QuerySingle(sid);
                if (tmp != null)
                {
                    tmp.productStatus = 0;
                    productsBLL.Update(tmp);
                }
            }
            #endregion

            keyword = Request["keyword"];
            page = Request["page"].ToInt32(1);
            size = Request["size"].ToInt32(15);
            desc = Request["desc"].ToInt32(1);
            orderby = Request["orderby"] ?? "productId";
            if (string.IsNullOrEmpty(keyword))
            {
                pageCount = (int)Math.Ceiling(productsBLL.QueryCount(null) / size * 1.0);
                products = productsBLL.QueryList(page, size, null, orderby, Convert.ToBoolean(desc));
            }
            else
            {
                slt = Request["slt"].ToInt32(-1);
                if (slt == 1)
                {
                    products = productsBLL.QueryList(-1, -1, new { productId = keyword.ToInt32(0) }, "");
                    pageCount = productsBLL.QueryCount(new { productId = keyword.ToInt32(0) });
                }
                else
                {
                    string where = "%" + keyword + "%";
                    products = productsBLL.SearchProduct(page, size, new { productName = where }, orderby, Convert.ToBoolean(desc));
                    var tmp = productsBLL.SearchProduct(-1, -1, new { productName = where }, orderby);
                    if (tmp != null)
                    {
                        pageCount = tmp.Count();
                    }
                    pageCount = (int)Math.Ceiling((double)pageCount / size);
                }

            }

        }

        protected string GetCatName(int catid)
        {
            Categories tmp = categoriesBLL.QuerySingle(new { catid });
            if (tmp != null)
            {
                return tmp.catName;
            }
            return "";
        }

        protected string GetProductStatus(int status)
        {
            switch (status)
            {
                case 0: return "已下架";
                case 1: return "已上架";
                default: return "";

            }
        }
    }
}