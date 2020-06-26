using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2
{
    public partial class SiteNew : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logoutBtn_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Logout.aspx");
        }
    }
}