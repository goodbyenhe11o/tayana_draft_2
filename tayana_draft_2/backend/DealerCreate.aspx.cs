using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.backend
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (ckcontent.Text != null)
            {
                string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"]
                    .ConnectionString;
                SqlConnection conn = new SqlConnection(config);

                string path = Server.MapPath("allFiles/");
                string name = FileUpload1.FileName;
                if (FileUpload1.HasFile)
                {
                    FileUpload1.SaveAs(path + FileUpload1.FileName);

                    string query =
                        "INSERT INTO Dealership (Continent, DealerName, Dcontent, Img) VALUES(@Continent,@DealerName, @Dcontent, @Img)";
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@Continent", continent.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@DealerName",
                        DealerName.Text);
                    cmd.Parameters.AddWithValue("@Dcontent", ckcontent.Text);
                    cmd.Parameters.AddWithValue("@Img", name);
                    cmd.ExecuteNonQuery();
                    conn.Close();

                }
            }

            Response.Redirect("Dealership.aspx");
        }
    }
}