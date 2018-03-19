using Shop.BLL;
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
    public partial class MemberCenter : PageBase
    {
        protected string msg;
        protected int orderState1;
        protected int orderState2;
        protected int orderState3;
        protected int orderState4;
        protected int orderState5;
        protected int orderCount;
        protected int stone;

        OrdersBLL ordersBLL = new OrdersBLL();
        IEnumerable<Orders> orders = new List<Orders>();
        UsersBLL usersBLL = new UsersBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser == null)
            {
                Login();
            }
            stone = usersBLL.QuerySingle(new { userId = CurrentUser.userId }).userStone;
            msg = Request["msg"];
            orders = ordersBLL.QueryList(-1, -1, new { CurrentUser.userId }, "orderId", true);
            if (orders == null)
            {
                return;
            }
            foreach (Orders item in orders)
            {
                CountOrders(item);
            }
            orderCount = orders.Count<Orders>();
        }

        private void CountOrders(Orders item)
        {
            switch (item.orderStatus)
            {
                case 0: orderState1++; break;
                case 1: orderState2++; break;
                case 2: orderState3++; break;
                case 3: orderState4++; break;
                case 4: orderState5++; break;
                default:
                    break;
            }
        }
    }
}