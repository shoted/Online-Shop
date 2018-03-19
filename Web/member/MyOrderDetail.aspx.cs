using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Code;

namespace Web.member
{
    public partial class OrderDetail : PageBase
    {
        OrderDetailBLL orderDetailBLL = new OrderDetailBLL();
        ProductsBLL productsBLL = new ProductsBLL();
        protected IEnumerable<Shop.Model.OrderDetail> info = new List<Shop.Model.OrderDetail>();

        protected int id;
        protected bool CouldReturn=false;

        
        OrdersBLL ordersBLL = new OrdersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser==null)
            {
                Login();
            }
            id = Request["item"].ToInt32(0);
            info = orderDetailBLL.QueryList(-1,-1,new { orderId=id},"orderDetailId",false);
            if (info == null)
            {
                NotFound();
            }
            var orders = ordersBLL.QuerySingle(id);
            if (orders!=null&&orders.orderStatus>0)
            {
                CouldReturn = true;
            }
        }

        protected string GetProductIMG(int id)
        {
            Products product= productsBLL.QuerySingle(id);
            if (product!=null)
            {
                return product.productIMG;
            }
            return "";
        }
    }
}