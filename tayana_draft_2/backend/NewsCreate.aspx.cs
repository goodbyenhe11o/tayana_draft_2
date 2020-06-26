using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.backend
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (ckcontent.Value != null)
            {
                string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(config);

                string path = Server.MapPath("allFiles/");
                string name = FileUpload1.FileName; //don't add allFiles/
                if (FileUpload1.HasFile)
                {
                    FileUpload1.SaveAs(path + FileUpload1.FileName);
                }
                else
                {
                    uploadMessage.Text = "PLEASE UPLOAD YOUR IMAGE HERE";
                }

                string query = "INSERT INTO News (title, summary, pin, content, img) VALUES(@title, @summary, @pin, @content, @img)";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@title", NewsTitle.Text);
                cmd.Parameters.AddWithValue("@summary", NewsSummary.Text);
                cmd.Parameters.AddWithValue("@pin", RadioButtonList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@content", ckcontent.Value);
                cmd.Parameters.AddWithValue("@img", name);



                cmd.ExecuteNonQuery();
                conn.Close();


            }

            Response.Redirect("News.aspx");

        }
    }
}