using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.shared
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        public bool IsIndex { get; set; }
        public string Login { get; set; }
        public IEnumerable<Shop.Model.Carts> list = null;
        public Shop.BLL.CartsBLL serviceCart = new Shop.BLL.CartsBLL();
        public Shop.BLL.UsersBLL usersBLL = new Shop.BLL.UsersBLL();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}