using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace tayana_draft_2.backend
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;

            //if (HttpContext.Current.User.Identity.IsAuthenticated)
            //{
            //    username.Text = HttpContext.Current.User.Identity.Name;
            //}
            //else
            //{
            //    FormsAuthentication.RedirectToLoginPage();

            //}

            //HttpCookie cookie = new HttpCookie("username");
            //cookie.Value = username.Text.Trim();
            //cookie.Expires = DateTime.MaxValue;
            //HttpContext.Current.Response.Cookies.Add(cookie);
            //HttpCookie ck_d = Request.Cookies["username"];
            //if (Request.Cookies["username"] != null)
            //{
            //    lblErrorMessage.Text = "Your current login ID: " + Request.Cookies["username"].Value;
            //}

        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            string query = "SELECT COUNT(1) FROM TayanaUserTable WHERE username=@username AND password=@password";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@username", username.Text);
            cmd.Parameters.AddWithValue("@password", password.Text);

            cmd.ExecuteNonQuery();

            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count == 1)
            {
                Session["username"] = username.Text.Trim();
                Session.Timeout = 60;
                Response.Redirect("Content_Cut.aspx");
            }
            else
            {
                lblErrorMessage.Visible = true;
            }
            conn.Close();
        }
    }
}