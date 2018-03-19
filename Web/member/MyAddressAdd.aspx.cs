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
    public partial class MyAddressAdd : PageBase
    {
        Address address = new Address();
        AddressBLL addressBLL = new AddressBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser==null)
            {
                Login();
            }
            if (!RequestHelper.IsPostBack(Request))
            {
                return;
            }
            address.postName = Request["name"];
            address.postPhone = Request["mobile"];
            address.postAddress = Request["address"];
            address.userId = CurrentUser.userId;
            address.addTime = DateTime.Now;

            if (addressBLL.Insert(address)>0)
            {
                Response.Redirect("MyAddress.aspx");
            }
            

        }
    }
}