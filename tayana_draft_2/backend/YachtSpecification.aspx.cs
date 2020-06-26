using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.backend
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(config);

                string getID = Request.QueryString["id"]; //get the datakey 
                string query = $"SELECT * FROM YachtInfo where id={getID}";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    tbSpecification.Text = dr["Specification"].ToString();
               
                }
                conn.Close();

            }
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {

            string config = System.Web.Configuration.WebConfigurationManager
                .ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            string getID = Request.QueryString["id"];
            string query = $"UPDATE YachtInfo SET Specification=@Specification WHERE id={getID}";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Specification", tbSpecification.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("YachtInfo.aspx");
        }


        protected void btnReturn_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("YachtInfo.aspx");
        }
    }
}