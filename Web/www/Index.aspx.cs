using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.code;

namespace Web.www
{
    public partial class WebForm1 : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsPostBack())
            {
                Session.Abandon();
                Response.Write("ok");
                Response.End();
            }
        }
    }
}