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
    public partial class MyAddress : PageBase
    {
        protected IEnumerable<Address> address = new List<Address>();
        AddressBLL addressBLL = new AddressBLL();
        protected string msg;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser==null)
            {
                Login();
            }
            msg = Request["msg"];
            address = addressBLL.QueryList(-1, 20, new { CurrentUser.userId }, "postId");
            
        }
    }
}