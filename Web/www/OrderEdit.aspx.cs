using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Web;
using Web.code;

namespace Web.www
{
    public partial class OrderEdit : AdminPage
    {
        protected string msg;
        protected Orders orders;
        protected string js;

        OrdersBLL ordersBLL = new OrdersBLL();
        OrderDetailBLL detailBLL = new OrderDetailBLL();
        protected int oid;

        protected void Page_Load(object sender, EventArgs e)
        {
            oid = Request["oid"].ToInt32();
            orders = ordersBLL.QuerySingle(oid);
            if (orders == null)
            {
                orders = new Orders();
            }

            if (RequestHelper.IsPostBack(Request))
            {
                Orders tmp = ordersBLL.QuerySingle(oid);
                if (tmp != null)
                {
                    tmp.totalPrice = Request["totalprice"].ToDecimal();
                    tmp.payPrice = Request["payprice"].ToDecimal();
                    tmp.payStatus = Request["sltpay"].ToInt32();
                    tmp.orderStatus = Request["sltorder"].ToInt32();
                    tmp.orderRemark = Request["remark"];
                    if (ordersBLL.Update(tmp) > 0)
                    {
                        msg = "订单修改成功";
                        js = LayerClose();
                        return;
                    }
                }
                msg = "订单修改失败";

            }
        }
    }
}