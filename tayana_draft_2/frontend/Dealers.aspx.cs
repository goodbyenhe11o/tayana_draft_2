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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                CheckCrumb();

            }

        }

        protected void LoadData()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"]
                .ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            string getID = Request.QueryString["id"];

            if (getID != null)
            {
                string query = $"SELECT * FROM Dealership WHERE  continent= {getID}";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                rpDealers.DataSource = ds;
                rpDealers.DataBind();
                conn.Close();
            }
            else if (getID == null)
            {
                string query = $"SELECT * FROM Dealership WHERE continent = 1";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                rpDealers.DataSource = ds;
                rpDealers.DataBind();
                conn.Close();
            }
        }


        void CheckCrumb()
        {
            string getID = Request.QueryString["id"];
            if (getID == "1")
            {
                lrCrumb.Text = "USA";
                lrCrumbContinent.Text = "USA";
            }
            else if (getID == "2")
            {
                lrCrumb.Text = "ASIA";
                lrCrumbContinent.Text = "ASIA";
            }
            else if (getID == "3")
            {
                lrCrumb.Text = "EUROPE";
                lrCrumbContinent.Text = "EUROPE";
            }
            else if (getID == "4")
            {
                lrCrumb.Text = "NORTH AMERICA";
                lrCrumbContinent.Text = "NORTH AMERICA";
            }
            else if (getID == "5")
            {
                lrCrumb.Text = "CENTRAL AMERICA";
                lrCrumbContinent.Text = "CENTRAL AMERICA";
            }
            else if (getID == "6")
            {
                lrCrumb.Text = "SOUTH AMERICA";
                lrCrumbContinent.Text = "SOUTH AMERICA";
            }
            else if (getID == "7")
            {
                lrCrumb.Text = "AFRICA";
                lrCrumbContinent.Text = "AFRICA";
            }
            else if (getID == "8")
            {
                lrCrumb.Text = "OCEANIA";
                lrCrumbContinent.Text = "OCEANIA";
            }
            else
            {
                lrCrumb.Text = "USA";
                lrCrumbContinent.Text = "USA";
            }
        }
    }
}
