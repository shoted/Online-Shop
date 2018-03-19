using Shop.BLL;
using Shop.CommonHelper;
using Shop.Model;
using System;
using System.Web;
using Web.Code;

namespace Web.member
{
    public partial class MyAddressEdit : PageBase
    {
        int id;
        protected Address address;
        AddressBLL addressBLL = new AddressBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser==null)
            {
                Login();
            }
            id = Request["id"].ToInt32();
            address = addressBLL.QuerySingle(id);
            if (address == null)
            {
                address = new Address();
                return;
            }

            if (RequestHelper.IsPostBack(Request))
            {
                address.postName = Request["name"];
                address.postPhone = Request["mobile"];
                address.postAddress = Request["address"];
                address.userId = CurrentUser.userId;
                if (addressBLL.Update(address) > 0)
                {
                    Response.Redirect("MyAddress.aspx");
                }
            }
        }
    }
}