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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLr();
                LoadDataRp();
                LoadDataRpSmall();
            }
        }

        void LoadLr()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"]
                .ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            string query = $"SELECT TOP 3 * FROM News ORDER BY pin DESC, initdate DESC ";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            da.Fill(ds);
            rpTopNews.DataSource = ds;
            rpTopNews.DataBind();
            conn.Close();
        }


        void LoadDataRp()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            
            string query = "SELECT * FROM Album ORDER BY id DESC";
            conn.Open();    
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            rpLargeImg.DataSource = ds;
            rpLargeImg.DataBind();

            conn.Close();
        }

        void LoadDataRpSmall()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            string query = "SELECT * FROM Album ORDER BY id DESC";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            rpSmallImg.DataSource = ds;
            rpSmallImg.DataBind();

            conn.Close();
        }




    }
}