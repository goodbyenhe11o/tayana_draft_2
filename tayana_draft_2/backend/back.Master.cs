using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace tayana_draft_2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            AccessCheck();
            LoadImg();

        }

        protected void AccessCheck()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TayanaConnectionString"]
                .ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            string query = "SELECT * FROM TayanaUserTable WHERE username = @username";
            SqlCommand cmd = new SqlCommand(query, conn);

            conn.Open();
            cmd.Parameters.AddWithValue("username", Session["username"].ToString());

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr["isAdmin"].ToString().IndexOf("01", 0) != -1)
                {
                    Label1.Visible = true;
                }
                else
                {
                    Label1.Visible = false;
                }

                if (dr["isAdmin"].ToString().IndexOf("02", 0) != -1)
                {
                    Label2.Visible = true;
                }
                else
                {
                    Label2.Visible = false;
                }

                if (dr["isAdmin"].ToString().IndexOf("03", 0) != -1)
                {
                    Label3.Visible = true;
                }
                else
                {
                    Label3.Visible = false;
                }

                if (dr["isAdmin"].ToString().IndexOf("04", 0) != -1)
                {
                    Label4.Visible = true;
                }
                else
                {
                    Label4.Visible = false;
                }

            }

            conn.Close();
        }

    



    protected void btnLogout_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("Logout.aspx");
    }

    void LoadImg()
    {
        string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(config);
        SqlCommand cmd = new SqlCommand("SELECT * FROM TayanaUserTable WHERE UserName = @UserName", conn);

        cmd.Parameters.AddWithValue("@UserName", Session["username"].ToString());


        conn.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read() == true)
        {
            lbluserName.Text = "Welcome Back " + dr["Fname"].ToString() + "  " + dr["Sname"].ToString();
            imgEmployeeImage.ImageUrl = dr["Uimg"].ToString();
        }

        }
    }

}