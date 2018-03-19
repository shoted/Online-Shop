using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using Web.Code;

namespace Web
{
    public partial class Focus : PageBase
    {
        ProductsBLL productsBLL = new ProductsBLL();
        protected List<Products> productList = new List<Products>();

        CartsBLL cartsBLL = new CartsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            string did = Request["did"];
            string chk = Request["chk"];
            string strProduct = CookieHelper.Get("list");
            //获取到的string的产品ID
            var sub = strProduct.Split('|').ToList<string>();
            //处理过不重复的ID
            var idList = new List<string>();
            //去掉重复
            foreach (var item in sub)
            {
                if (!idList.Contains(item))
                {
                    idList.Add(item);
                }
            }
            //删除
            if (idList.Contains(did))
            {
                idList.Remove(did);
            }
            if (Request["delete"] == "删除选中的商品")
            {
                var delStr = chk.Split(',');
                DeleteFocus(idList, delStr);
            }
            if (Request["add"] == "添加到购物车")
            {
                if (CurrentUser == null)
                {
                    Login();
                }
                var addStr = chk.Split(',');
                CartsBLL cartsBLL = new CartsBLL();
                for (int i = 0; i < addStr.Length; i++)
                {
                    AddCart(addStr[i].ToInt32());
                }
                DeleteFocus(idList, addStr);            
            }

            //根据ID查询产品 剔除不存在的产品ID
            strProduct = "";
            foreach (var item in idList)
            {
                Products products = productsBLL.QuerySingle(item.ToInt32(0));
                if (products != null)
                {
                    productList.Add(products);
                    strProduct += item + "|";
                }
            }
            //去掉后面多余的一个  | 
            if (!string.IsNullOrEmpty(strProduct))
            {
                strProduct = strProduct.Substring(0, strProduct.Length - 1);
            }
            //更新 cookie
            CookieHelper.Set("list", strProduct, DateTime.Now.AddDays(15));
            if (Request["add"] == "添加到购物车")
            {
                Response.Redirect("Cart.aspx");
            }

        }

        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="idList"></param>
        /// <param name="delStr"></param>
        private static void DeleteFocus(List<string> idList, string[] delStr)
        {
            for (int i = 0; i < delStr.Length; i++)
            {
                if (idList.Contains(delStr[i]))
                {
                    idList.Remove(delStr[i]);
                }
            }
        }

        /// <summary>
        /// 添加购物车
        /// </summary>
        /// <param name="item"></param>
        private void AddCart(int item)
        {
            // 执行添加购物车逻辑
            if (item == 0)
            {
                NotFound();
                return;
            }

            // 判断商品是否存在
            var exist = productsBLL.QuerySingle(item);
            if (exist == null)
            {
                NotFound();
                return;
            }
            // 有商品 判断当前商品是否在购物车中存在
            // 查询用户的购物车
            var userCart = cartsBLL.QueryList(-1, -1, new { userId = CurrentUser.userId }, "cartId");
            // 查询用户购物车是否存在该商品
            var cartExist = userCart.ToList<Carts>().Find(p => p.productId == item);
            if (cartExist == null)
            {
                // 没有
                cartExist = new Shop.Model.Carts();
                cartExist.productId = item;
                cartExist.productCount = 1;
                cartExist.userId = CurrentUser.userId;
                cartExist.addTime = DateTime.Now;
                cartsBLL.Insert(cartExist);

            }
            else
            {
                //有
                cartExist.productCount += 1;
                cartsBLL.Update(cartExist);
            }


        }
    }
}