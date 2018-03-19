using System;
using Web.Code;
using Web.shared;

namespace Web
{
    public partial class Index : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Layout)Master).IsIndex = true;
        }
    }
}