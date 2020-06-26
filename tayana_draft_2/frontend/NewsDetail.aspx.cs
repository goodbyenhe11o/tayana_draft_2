using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.frontend
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDataYacht();
            LoadTitle();
        }


        void LoadTitle()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"]
                .ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            string getID = Request.QueryString["id"];
            if (getID != null)
            {
                string query = $"SELECT * FROM News where id={getID}";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblTitle.Text = dr["title"].ToString();
                }

                conn.Close();
            }
        }
        void LoadDataYacht()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"]
                .ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            string getID = Request.QueryString["id"];

            if (getID != null)
            {
                string query = $"SELECT * FROM News WHERE id={getID}";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();

                da.Fill(ds);
                rpLayout.DataSource = ds;
                rpLayout.DataBind();
                conn.Close();

            }

            

        }

    }
}