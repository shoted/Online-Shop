using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Code;

namespace Web
{
    public partial class Order : PageBase
    {
        int useStone;
        protected decimal money;
        protected string outmsg;
        protected string orderId;
        protected string remark;
        protected string from;
        protected int productId;
        protected int productCount;
        int defaultId;

        OrdersBLL ordersBLL = new OrdersBLL();
        Orders orders ;
        AddressBLL addressBLL = new AddressBLL();
        protected Address address;
        protected string postName;
        protected string postPhone;
        protected string postAddress;
        protected int payStatus;

        OrderDetailBLL detailBLL = new OrderDetailBLL();
        ProductsBLL productsBLL = new ProductsBLL();
        public IEnumerable<Shop.Model.OrderDetail> info = new List<Shop.Model.OrderDetail>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser == null)
            {
                Login();
            }

            if (Request.IsPostBack())
            {
                useStone = Request["usestone"].ToInt32(0);
                defaultId = Request["defaultid"].ToInt32(0);
                //地址处理
                if (defaultId != 0)  //数据库中的地址
                {
                    address = addressBLL.QuerySingle(defaultId);
                    if (address == null)
                    {
                        return;
                    }
                    postName = address.postName;
                    postPhone = address.postPhone;
                    postAddress = address.postAddress;
                }
                else    //地址为新建地址
                {
                    postName = Request["name"];
                    postPhone = Request["mobile"];
                    postAddress = Request["address"];
                    Address tmp = new Address();
                    tmp.postName = postName;
                    tmp.postPhone = postPhone;
                    tmp.postAddress = postAddress;
                    tmp.userId = CurrentUser.userId;
                    addressBLL.Insert(tmp);
                }

                remark = Request["remark"] ?? "";
                from = Request["from"];
                productId = Request["productId"].ToInt32();
                productCount = Request["productCount"].ToInt32();
                //从详情页
                if (from.Equals("detail"))
                {
                    if (ordersBLL.CreateorderDetail(CurrentUser.userId, postName, postPhone, postAddress, remark, productId, productCount, useStone, out money, out orderId))
                    {
                        outmsg = " 订单生成成功 -------------> 订单编号: " + orderId;
                        payStatus = ordersBLL.QuerySingle(orderId.ToInt32()) == null ? 0 : ordersBLL.QuerySingle(orderId.ToInt32()).payStatus;
                    }
                    else
                    {
                        outmsg = " 订单生成失败 -------------> <a href='index.aspx'>返回首页</a>";
                        return;
                    }
                }
                //从购物车
                else if (from.Equals("cart"))
                {
                    if (ordersBLL.CreateOrder(CurrentUser.userId, postName, postPhone, postAddress, remark, useStone, out money, out orderId))
                    {
                        outmsg = " 订单生成成功 -------------> 订单编号: " + orderId;
                        payStatus = ordersBLL.QuerySingle(orderId.ToInt32()) == null ? 0 : ordersBLL.QuerySingle(orderId.ToInt32()).payStatus;
                    }
                    else
                    {
                        outmsg = " 订单生成失败 -------------> <a href='index.aspx'>返回首页</a>";
                        return;
                    }
                }
                info = detailBLL.QueryList(-1, -1, new { orderId = orderId }, "orderDetailId", false);
                if (info == null || !info.Any())
                {
                    NotFound();
                }
            }
            else  //从我的订单中提交过来
            {
                orderId = Request["orderid"];
                orders = ordersBLL.QuerySingle(orderId.ToInt32());
                if (orders==null)
                {
                    NotFound();
                }
                info = detailBLL.QueryList(-1, -1, new { orderId = orderId }, "orderDetailId", false);
                if (info == null || !info.Any())
                {
                    NotFound();
                }
                money = orders.payPrice;
                payStatus = orders.payStatus;
                string[] arrAddress = orders.postAddress.Split(',');
                if (arrAddress!=null)
                {
                    postName = arrAddress[0];
                    postPhone = arrAddress[1];
                    postAddress = arrAddress[2];
                    remark = orders.orderRemark;
                }
            }
        }

        protected string GetProductIMG(int id)
        {
            Products product = productsBLL.QuerySingle(id);
            if (product != null)
            {
                return product.productIMG;
            }
            return "";
        }
    }
}