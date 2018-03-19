using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.code;

namespace Web.www
{
    public partial class ProductAdd : AdminPage
    {
        protected string msg;
        protected string js;
        protected IEnumerable<Categories> categories = new List<Categories>();
        CategoriesBLL categoriesBLL = new CategoriesBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            categories = categoriesBLL.QueryList(-1, -1, null, "", false);
            if (RequestHelper.IsPostBack(Request))
            {
                ProductsBLL productsBLL = new ProductsBLL();
                Products products = new Products
                {
                    productName = Request["pname"],
                    productPrice = Request["pprice"].ToDecimal(),
                    productDecribe = Request["pdesc"],
                    productDetail = Request["pdetail"],
                    productInventory = Request["pinventory"].ToInt32(),
                    productStatus = 1,
                    productStone = Request["pstone"].ToInt32(),
                    categoryId = Request["slt"].ToInt32(),
                    productIMG = IMGSave("file-2"),
                    add_time = DateTime.Now,
                };
                if ( productsBLL.Insert(products)>0)
                {
                    msg = "上架成功";
                    js = LayerClose();
                    return;
                }
                msg = "上架失败";

            }
        }

    }
}