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
    public partial class ProductEdit : AdminPage
    {
        protected string msg;
        protected string js;
        protected IEnumerable<Categories> categories;
        CategoriesBLL categoriesBLL = new CategoriesBLL();
        ProductsBLL productsBLL = new ProductsBLL();
        protected Products products = new Products();
        protected int pid;


        protected void Page_Load(object sender, EventArgs e)
        {
            int pid = Request["pid"].ToInt32();
            products = productsBLL.QuerySingle(pid);
            if (products == null)
            {
                products = new Products();
            }
            categories = categoriesBLL.QueryList(-1, -1, null, "", false);
            if (RequestHelper.IsPostBack(Request))
            {
                Products tmp = productsBLL.QuerySingle(pid);
                if (tmp != null)
                {
                    tmp.productName = Request["pname"];
                    tmp.categoryId = Request["slt"].ToInt32();
                    tmp.productPrice = Request["pprice"].ToDecimal();
                    tmp.productInventory = Request["pinventory"].ToInt32();
                    tmp.productStone = Request["pstone"].ToInt32();
                    tmp.productDecribe = Server.UrlDecode(Request["pdesc"]);
                    tmp.productDetail = Server.UrlDecode(Request["pdetail"]);
                    if (!string.IsNullOrEmpty(IMGSave("file-2")))
                    {
                        tmp.productIMG = IMGSave("file-2");
                    }
                    if (productsBLL.Update(tmp) > 0)
                    {
                        js = LayerClose();
                        msg = "修改成功";
                        return;
                    }
                }
                msg = "修改失败";
            }
        }



    }
}