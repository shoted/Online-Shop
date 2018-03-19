using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Web.Script.Serialization;

namespace Web.www.Ajax
{
    public partial class Pager : System.Web.UI.Page
    {
        FocusProductsBLL bll = new FocusProductsBLL();
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取页码
            if (Request["total"] == "0")
            {
                int total = bll.QueryCount(null);
                double page = Math.Ceiling(total / 48.0);
                Response.Write(page);
                Response.End();
            }
            //获取当前页码数据
            if (Request["type"] == "get")
            {
                int index = Request["index"].ToInt32(1);
                int size = Request["size"].ToInt32(48);
                var data = bll.QueryList(index, size, null, "focusProductId");
                int totalPage = (int)Math.Ceiling((double)bll.QueryCount(null) / size);

                ////----------------------json序列化----------------------
                //JsonSerializer jsonSerializer = new JsonSerializer();
                //jsonSerializer.Serialize(new StringWriter(), data);
                ////-----------------------------------------------------


                string strData = serializer.Serialize(new { jsonData = data, pager = totalPage });
                Response.Write(strData);
                Response.End();
            }

            //查询单个
            if (Request["type"] == "getsingle")
            {
                int id = Request["fid"].ToInt32();
                var single = bll.QuerySingle(id);
                Response.Write(serializer.Serialize(single));
                Response.End();
            }

            //编辑操作
            if (Request["type"] == "edit")
            {
                int id = Request["fid"].ToInt32();
                var focus = bll.QuerySingle(id);
                focus.productId = Request["pid"].ToInt32();
                focus.userId = Request["uid"].ToInt32();
                bll.Update(focus);
                Response.Write("ok");
                Response.End();
            }

            //添加操作
            if (Request["type"] == "add")
            {
                FocusProducts focus = new FocusProducts();
                focus.userId = Request["uid"].ToInt32();
                focus.productId = Request["pid"].ToInt32();
                focus.addTime = DateTime.Now;
                bll.Insert(focus);
                Response.Write("ok");
                Response.End();
            }

            //删除操作
            if (Request["type"] == "del")
            {
                int id = Request["fid"].ToInt32();
                bll.Delete(id);
                Response.Write("ok");
                Response.End();
            }
        }
    }
}