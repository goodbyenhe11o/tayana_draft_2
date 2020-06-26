using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace tayana_draft_2.backend
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
            lblErrorMessage1.Visible = false;
        }

        protected void RegoSubmit(object sender, EventArgs e)
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            string Cmd = "SELECT * FROM TayanaUserTable WHERE username = @username";
            SqlCommand command = new SqlCommand(Cmd, conn);
            conn.Open();
            command.Parameters.AddWithValue("@Username", Session["username"].ToString());
            SqlDataReader datareader = command.ExecuteReader();

            datareader.Read();
            if (txtUsername.Text != datareader["username"].ToString())
            {
                datareader.Close();

                string query = "INSERT INTO TayanaUserTable (FName, SName, Email, UserName, Password, CPassword, isAdmin) VALUES (@txtFname, @txtSname, @txtEmail, @txtUserName, @txtPassword, @txtCpassword, @CheckBox1)";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@txtFname", txtFname.Text);
                cmd.Parameters.AddWithValue("@txtSname", txtSname.Text);
                cmd.Parameters.AddWithValue("@txtEmail", txtEmail.Text);
                cmd.Parameters.AddWithValue("@txtUserName", txtUsername.Text);
                cmd.Parameters.AddWithValue("@txtPassword", txtPassword.Text);
                cmd.Parameters.AddWithValue("@txtCpassword", txtCpassword.Text);
                cmd.Parameters.AddWithValue("@CheckBox1", GetCheck());

                cmd.ExecuteNonQuery();

                conn.Close();
                Response.Redirect(this.Request.Url.ToString());
            }
            else
            {
                Server.Transfer("rego.aspx");
                lblErrorMessage1.Text = "THE USERNAME HAS BEEN TAKEN, TRY A DIFFERENT ONE.";
            }
            Response.Redirect("Content_Cut.aspx");
        }

        protected string GetCheck()
        {
            string v = "";

            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected == true)
                {

                    if (v.Length > 0)
                    {
                        v += ",";
                    }

                    v += item.Value;

                }
            }
            return v;
        }


        protected void Button1_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Content_Cut.aspx");

        }
    }
}
