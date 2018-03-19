using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using Web.Code;

namespace Web
{
    public partial class Cart : PageBase
    {
        protected IEnumerable<Shop.Model.CartInfo> CartList { get; set; }

        CartsBLL cartsBLL = new CartsBLL();
        CartInfoBLL InfoBLL = new CartInfoBLL();
        ProductsBLL productsBLL = new ProductsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //CookieHelper.Set("user_carts", "[{\"BookId\":\"4995\",\"Count\":\"1\"},{\"BookId\":\"4996\",\"Count\":\"2\"}]", DateTime.Now.AddDays(10));
            if (CurrentUser==null)
            {
                Login(Request.Url.ToString());
            }
            var item = Request["item"];
            if (CurrentUser != null)
            {
                if (!string.IsNullOrEmpty(item))
                {
                    // 添加购物车
                    AddCart(item.ToInt32());
                }

                // 代码执行顺序
                CartList = InfoBLL.QueryList(-1, -1, new { userId = CurrentUser.userId }, "cartId", true);
                
            }
            else
            {
                // 离线购物车
            }
        }

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
                cartExist = new Carts
                {
                    productId = item,
                    productCount = 1,
                    userId = CurrentUser.userId,
                    addTime = DateTime.Now
                };
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