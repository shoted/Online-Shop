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
    public partial class OrderList : AdminPage
    {
        protected IEnumerable<Orders> orders;
        OrdersBLL ordersBLL = new OrdersBLL();
        OrderDetailBLL detailBLL = new OrderDetailBLL();

        protected int index;
        protected int size = 5;
        protected int totalCount;

        protected int oid;
        protected int slt;
        protected int deleteid;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region 发货
            oid = Request["oid"].ToInt32(0);
            if (oid != 0)
            {
                Orders tmp = ordersBLL.QuerySingle(oid);
                if (tmp != null)
                {
                    tmp.orderStatus = 2;
                    tmp.payTime = DateTime.Now;
                    ordersBLL.Update(tmp);
                }
            }
            #endregion

            #region 删除
            deleteid = Request["deleteid"].ToInt32(0);
            if (deleteid != 0)
            {
                Orders tmp = ordersBLL.QuerySingle(deleteid);
                if (tmp != null)
                {
                    ordersBLL.DeleteOrder(tmp.userId, tmp.orderId);
                }
            }
            #endregion

            slt = Request["slt"].ToInt32(-1);
            var where = new { orderStatus = slt };
            if (slt==-1)
            {
                where = null; 
            }
            index = Request["page"].ToInt32(1);
            totalCount = (int)Math.Ceiling((double)ordersBLL.QueryCount(where) / size);
            orders = ordersBLL.QueryList(index, size, where, "orderId", true);
        }

        protected IEnumerable<OrderDetail> GetOrderDetail(int orderid)
        {
            return detailBLL.QueryList(-1, -1, new { orderId = orderid }, "") ?? new List<OrderDetail>();
        }


    }
}