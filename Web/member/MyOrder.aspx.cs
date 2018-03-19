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
    public partial class MyOrder : PageBase
    {
        OrdersBLL ordersBLL = new OrdersBLL();
        protected IEnumerable<Orders> orders;
        IEnumerable<Orders> orderAll;
        protected int index;
        protected int size;
        protected int totalPage;
        protected int slt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser == null)
            {
                Login();
            }
            int oid = Request["oid"].ToInt32(0);
            if (oid != 0)
            {
                Orders tmp = ordersBLL.QuerySingle(oid);
                if (tmp != null)
                {
                    if (tmp.userId == CurrentUser.userId)
                    {
                        tmp.orderStatus = 3;
                        ordersBLL.Update(tmp);
                    }
                }
            }
            index = Request["page"].ToInt32(1);
            size = Request["size"].ToInt32(5);
            slt = Request["slt"].ToInt32(-1);
            if (slt == -1)
            {
                totalPage = (int)Math.Ceiling((double)ordersBLL.QueryCount(new { UserId = CurrentUser.userId }) / size);
                orders = ordersBLL.QueryList(index, size, new { userId = CurrentUser.userId }, "orderId", true);
                return;
            }
            orderAll = ordersBLL.QueryList(-1, -1, new { userId = CurrentUser.userId }, "orderId", true);
            if (orderAll == null)
            {
                return;
            }
            orders = orderAll.ToList().FindAll(p => p.orderStatus == slt);

        }

        protected string GetStatusLink(int status, int orderid)
        {
            switch (status)
            {
                case 0:
                    return "<a href='../order.aspx?orderid=" + orderid + "&slt=" + slt + "' class='btn btn-default'>去付款</a>";
                case 1:
                    return "<a href='javascript:void(0)' onclick=\"alert('催单成功,将尽快发货')\" class='btn btn-default'>催发货</a>";
                case 2:
                    return "<a href='Myorder.aspx?oid=" + orderid + "&slt=" + slt + "' class='btn btn-default'>确认收货</a>";
                case 3:
                    return "<a href='Comment.aspx?oid="+orderid+"' class='btn btn-default'>去评价</a>";
                case 4:
                    return "已完成";
                default:
                    return "";

            }

        }

    }
}