using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Web.Script.Serialization;

namespace Web.www.Ajax
{
    public partial class Ajax : System.Web.UI.Page
    {
        FocusProductsBLL bll = new FocusProductsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request["type"];
            if (type == "get")
            {
                int index = Request["index"].ToInt32(1);
                int size = Request["size"].ToInt32(8);
                var data = bll.QueryList(index, size, null, "focusProductId");
                int totalPage = (int)Math.Ceiling((double)bll.QueryCount(null) / size);

                ////----------------------json序列化----------------------
                //JsonSerializer jsonSerializer = new JsonSerializer();
                //jsonSerializer.Serialize(new StringWriter(), data);
                ////-----------------------------------------------------

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                string strData = serializer.Serialize(new { jsonData = data, pager = totalPage });
                Response.Write(strData);
                Response.End();
            }
            if (type == "del")
            {
                int id = Request["id"].ToInt32();
                bll.Delete(id);
                Response.End();
            }
            if (type == "add")
            {
                FocusProducts focus = new FocusProducts();
                focus.productId = Request["p"].ToInt32();
                focus.userId = Request["u"].ToInt32();
                focus.addTime = DateTime.Now;
                bll.Insert(focus);
                Response.End();
            }
            if (type == "edit")
            {
                var foucs = bll.QuerySingle(Request["f"].ToInt32());
                foucs.productId = Request["p"].ToInt32();
                foucs.userId = Request["u"].ToInt32();
                bll.Update(foucs);
                Response.End();
            }
        }
    }
}