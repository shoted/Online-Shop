using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Code;

namespace Web.member
{
    public partial class Comment : PageBase
    {
        OrdersBLL ordersBLL = new OrdersBLL();
        OrderDetailBLL detailBLL = new OrderDetailBLL();
        protected IEnumerable<Shop.Model.OrderDetail> orderDetail;
        protected int oid;

        CommentsBLL commentsBLL = new CommentsBLL();
        Comments comment = new Comments();
        Shop.Model.OrderDetail detail = new Shop.Model.OrderDetail();
        Orders orders;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (CurrentUser == null)
            {
                Login();
            }
            //查询订单
            oid = Request["oid"].ToInt32();
            orders = ordersBLL.QuerySingle(new { userid = CurrentUser.userId, orderid = oid });
            if (oid == 0 && orders == null)
            {
                NotFound();
            }
            //post提交，ajax异步执行
            if (Request.IsPostBack())
            {
                string content = Request["content"];
                //查询订单详细
                int did = Request["did"].ToInt32();
                detail = detailBLL.QuerySingle(new { orderid = oid, orderDetailId = did });
                if (detail == null)
                {
                    Response.Write("???");
                    Response.End();
                }
                if (detail.commentId != 0)
                {
                    Response.Write("已经评论过了");
                    Response.End();
                }
                //评论表中插入一条评论
                comment.commentContent = content;
                comment.addTime = DateTime.Now;
                comment.productId = detail.productId;
                comment.status = CurrentUser.userId;
                int insertid = commentsBLL.Insert(comment);
                if (insertid < 0)
                {
                    Response.Write("???");
                    Response.End();
                }
                //将评论ID给订单详细，更新数据库
                detail.commentId = insertid;
                detailBLL.Update(detail);

                Response.Write("ok");
                Response.End();
            }
            //查询订单详细
            orderDetail = detailBLL.QueryList(-1, -1, new { orderid = oid }, "orderdetailid");
            //筛选出评论ID为0的详细订单，就是没有被评论的详细订单
            orderDetail = orderDetail.ToList().FindAll(p => p.commentId == 0);
            //详细订单中不存在为0的订单，表示评论已经完成，将订单状态改为4
            if (!orderDetail.Any())
            {
                orders.orderStatus = 4;
                ordersBLL.Update(orders);
                Response.Redirect("Myorder.aspx?slt=3");
            }
        }
    }
}