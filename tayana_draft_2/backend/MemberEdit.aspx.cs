using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.backend
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
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
    



    protected void btnConfirmUpload_OnClick(object sender, EventArgs e)
    {
        throw new NotImplementedException();
    }

    protected void btnUpdateDetails_OnClick(object sender, EventArgs e)
    {
        if (txtFname.Text != null && txtSname.Text != null && txtEmail.Text != null)
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"]
                .ConnectionString;
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

    void LoadData()
    {
        string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(config);
        string getID = Request.QueryString["id"];
        string query = $"SELECT* FROM TayanaUserTable WHERE id = { getID}";
      
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtFname.Text = dr["FName"].ToString();
            txtSname.Text = dr["Sname"].ToString();
            txtEmail.Text = dr["Email"].ToString();
            txtPassword.Text = dr["Password"].ToString();
            txtCpassword.Text = dr["CPassword"].ToString();
      
        }
        conn.Close();
        }
}

}
    

