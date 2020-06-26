using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CKFinder.Connector;

namespace tayana_draft_2.backend
{
    public partial class WebForm17 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_OnClick(object sender, EventArgs e)
        {
            string config = System.Web.Configuration.WebConfigurationManager
                .ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            string path = Server.MapPath("allFiles/");

            if (FileUpload1.HasFile)
            {
                string ext = Path.GetExtension(FileUpload1.FileName);
                if (ext == ".jpg" || ext == ".png")
                {
                    FileUpload1.SaveAs(path + FileUpload1.FileName);
                }
                else
                {
                    uploadMessage.Text = "PLEASE UPLOAD .JPG / .PNG FILE";
                }

                string name = "Images/" + FileUpload1.FileName;
                string query = "UPDATE TayanaUserTable SET Uimg = @Uimg WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@UserName", Session["Username"].ToString());
                cmd.Parameters.AddWithValue("@Uimg", name);
                cmd.ExecuteNonQuery();
                conn.Close();

            }
            else
            {
                uploadMessage.Text = "SELECT A FILE TO UPLOAD";
            }

            Response.Redirect("Profile.aspx");
        }


        protected void btnUpdateDetails_OnClick(object sender, EventArgs e)
        {
            if (txtFname.Text != null && txtSname.Text != null && txtEmail.Text != null)
            {
                string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(config);
                string query = "UPDATE TayanaUserTable SET Fname = @Fname, Sname = @Sname, Email = @Email WHERE username = @username";
                SqlCommand cmd = new SqlCommand(query, conn);
                
                conn.Open();
                cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
                cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
                cmd.Parameters.AddWithValue("@Sname", txtSname.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                cmd.ExecuteNonQuery();
                conn.Close();

                lblErrorMessage.Text = "YOU HAVE SUCCESSFULLY UPDATED THE DETAILS";
            }
            else
            {
                lblErrorMessage.Text = "INPUT THE FIELD TO UPDATE";
            }

            Response.Redirect("Profile.aspx");
        }

        protected void btnConfirmUpload_OnClick(object sender, EventArgs e)
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);


            if (txtPassword.Text != null || txtCpassword.Text != null)
            {
                if (txtPassword.Text.Equals(txtCpassword.Text))
                {
                    string queryP = "UPDATE TayanaUserTable SET Password = @Password WHERE username = @username";
                    SqlCommand cmd = new SqlCommand(queryP, conn);

                    conn.Open();
                    cmd.Parameters.AddWithValue("@UserName", Session["username"].ToString());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@CPassword", txtCpassword.Text);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    lblErrorMessage.Text = "YOUR PASSWORD HAS BEEN UPDATED";
                }
                else
                {
                    lblErrorMessage.Text = "PLEASE TALLY YOUR PASSWORDS";
                }

            }
            else
            {
                lblErrorMessage.Text = "ENTER PASSWORD TO BE UPDATED";
            }
            //System.Threading.Thread.Sleep(1000);
            Response.Redirect("Profile.aspx");
        }
    }

}

