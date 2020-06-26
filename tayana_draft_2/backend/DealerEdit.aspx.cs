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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(config);

                string getID = Request.QueryString["id"]; //get the datakey from the field of dealership.aspx
                string query = $"SELECT * FROM Dealership where id={getID}";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtDealerName.Text = dr["DealerName"].ToString();
                    ckcontent.Text = dr["Dcontent"].ToString();
                    TextBox1.Text = dr["Img"].ToString();
                }
                conn.Close();

            }
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (ckcontent.Text != null)
            {
                string config = System.Web.Configuration.WebConfigurationManager
                    .ConnectionStrings["tayanaConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(config);

                string path = Server.MapPath("allFiles/");
                string name = FileUpload1.FileName;
                if (FileUpload1.HasFile)
                {
                    FileUpload1.SaveAs(path + FileUpload1.FileName);
                }
                string getID = Request.QueryString["id"]; //get the datakey from the field of news.aspx
                string query = $"UPDATE Dealership SET DealerName=@DealerName, Dcontent=@Dcontent, Img=@Img  WHERE id={getID}";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@DealerName", txtDealerName.Text);
                cmd.Parameters.AddWithValue("@Dcontent", ckcontent.Text);
                cmd.Parameters.AddWithValue("@Img", FileUpload1.FileName);
                //cmd.Parameters.AddWithValue("@preview", name);
                cmd.ExecuteNonQuery();


                conn.Close();
            }

            Response.Redirect("Dealership.aspx");
        }
    }
}