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
    public partial class Ckeditor_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
       
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
           
            string path = Server.MapPath("allFiles/");
            string name = "allFiles/" + FileUpload1.FileName;
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(path + FileUpload1.FileName);
            }

            string query = "INSERT INTO ckeditor ([Content], CFile) VALUES(@Content, @CFile)";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Content", ckcontent.Value);
            cmd.Parameters.AddWithValue("@CFile", name);
            cmd.ExecuteNonQuery();
            conn.Close();

                
        }


    }
}