using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using Web.Code;

namespace Web
{
    public partial class PayResult : PageBase
    {
        #region MyRegion

        protected int orderId;
        protected int payStatus;
        protected bool pay = false;

        protected Orders orders = new Orders();
        OrdersBLL ordersBLL = new OrdersBLL();

        UsersBLL usersBLL = new UsersBLL();

        IEnumerable<OrderDetail> orderDetail;
        OrderDetailBLL DetailBLL = new OrderDetailBLL();

        ProductsBLL productsBLL = new ProductsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            orderId = Request["orderid"].ToInt32();
            payStatus = Request["paystatus"].ToInt32();
            orders = ordersBLL.QuerySingle(orderId);
            if (orders == null)
            {
                NotFound();
            }
            if (orders.payStatus != payStatus)//  验证是否被修改订单信息
            {
                NotFound();
            }
            orders.orderStatus = 1;
            orders.payStatus = 1;
            orders.payTime = DateTime.Now;
            ordersBLL.Update(orders);   //更新订单状态
            orderDetail = DetailBLL.QueryList(-1, -1, new { orderId = orderId }, "");
            foreach (var item in orderDetail)
            {
                CurrentUser.userStone += GetProductStone(item.productId) * item.productCount;
            }
            usersBLL.Update(CurrentUser);   //更新用户积分
            pay = true;
        }

        private int GetProductStone(int productId)
        {
            return productsBLL.QuerySingle(productId) == null ? 0 : productsBLL.QuerySingle(productId).productStone;
        }

        #endregion
    }
}