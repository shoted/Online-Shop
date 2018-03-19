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
    public partial class confirm : PageBase
    {
        public IEnumerable<Shop.Model.CartInfo> CartList { get; set; }
        public decimal total { get; set; }
        public int count;
        int Id;
        CartInfoBLL InfoBLL = new CartInfoBLL();

        public int productId { get; set; }
        public int Amount { get; set; }
        public Products products { get; set; }
        public ProductsBLL productsBLL = new ProductsBLL();

        protected Users users;
        protected UsersBLL usersBLL = new UsersBLL();

        protected IEnumerable<Address> address = new List<Address>();
        AddressBLL addressBLL = new AddressBLL();

        protected string from;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser == null)
            {
                Login();
            }
            from = Request["from"];
            if (string.IsNullOrEmpty(from))
            {
                //Response.Write(from);
                NotFound();
            }
            address = addressBLL.QueryList(-1, -1, new { userId = CurrentUser.userId }, "isDefault", true);
            users = usersBLL.QuerySingle(CurrentUser.userId);
            if (!Request.IsPostBack())
            {
                //购物车提交
                if (CurrentUser != null)
                {
                    Id = Convert.ToInt32(CurrentUser.userId);
                }
                CartList = InfoBLL.QueryList(1, 20, new { userId = Id }, "cartId", false);
                if (CartList == null)
                {
                    NotFound();
                }
                foreach (var item in CartList)
                {
                    total += item.productPrice * item.productCount;
                    count += item.productCount;
                }
            }
            else
            {
                //详细页提交
                productId = Request["id"].ToInt32();
                Amount = Request["amount"].ToInt32();
                products = productsBLL.QuerySingle(productId);
                if (products == null)
                {
                    NotFound();
                }
                total = products.productPrice * Amount;
                count = Amount;
            }

        }
    }
}