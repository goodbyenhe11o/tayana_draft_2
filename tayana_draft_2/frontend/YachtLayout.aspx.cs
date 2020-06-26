﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.frontend
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                LoadDataYacht();
                LoadDataLR();

                string getID = Request.QueryString["id"];
                if (Request.QueryString["id"] != null)
                {
                    aOverview.HRef = $"YachtOverview.aspx?id={getID}";
                    aLayout.HRef = $"YachtLayout.aspx?id={getID}";
                    aSpecification.HRef = $"YachtSpecification.aspx?id={getID}";
                }


            }

        }

        void LoadData()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            string query = "SELECT * FROM YachtInfo";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

            conn.Close();
        }

        void LoadDataYacht()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            string getID = Request.QueryString["id"];

            if (getID != null)
            {
                string query = $"SELECT * FROM YachtLayout WHERE Yid={getID}";
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

        void LoadDataLR()
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"]
                .ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            string getID = Request.QueryString["id"];
            if (getID != null)
            {
                string query = $"SELECT * FROM YachtInfo where id= 6";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lbYachtName.Text = dr["Name"].ToString() + dr["Newbuilding"].ToString();
                    lrCrumb.Text = dr["Name"].ToString();
                }

                conn.Close();
            }
        }
    }
}