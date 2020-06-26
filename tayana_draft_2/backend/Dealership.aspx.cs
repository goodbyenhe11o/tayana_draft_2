using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace tayana_draft_2.backend
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }

        }

       

        protected void LoadData()
        {

            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            string query = "SELECT * FROM Dealership";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            conn.Close();

        }



        protected void GridView1_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            conn.Open();

            string sq = $"DELETE FROM Dealership WHERE id=@id";
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            SqlCommand cmd = new SqlCommand(sq, conn);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Dealership.aspx");
        }

        protected void btnSearch_OnClick(object sender, EventArgs e)
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);

            if (tbSearch.Text != null)
            {

                // OR (summary LIKE '%' + summary + '%') OR (content LIKE '%' + content + '%')"
                string query = $"SELECT * FROM News WHERE (title LIKE '%' + @title + '%') AND  (summary LIKE '%' + @summary + '%') OR (content LIKE '%' + @content + '%')";

                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@title", tbSearch.Text);
                cmd.Parameters.AddWithValue("@summary", tbSearch.Text);
                cmd.Parameters.AddWithValue("@content", tbSearch.Text);
                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "title");

                GridView2.DataSource = ds;
                GridView2.DataBind();
                conn.Close();

                GridView1.Visible = false;

            }
        }


        protected void btnSearchTime_OnClick(object sender, EventArgs e)
        {
            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            string start = tbStart.Text;
            string end = tbEnd.Text;

            string query = $"SELECT * FROM Dealership WHERE initdate BETWEEN '{start}' AND DATEADD(day, 1, '{end}')";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@initdate", tbStart.Text);
            cmd.Parameters.AddWithValue("@end", tbEnd.Text);
            cmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "initdate");

            GridView2.DataSource = ds;
            GridView2.DataBind();
            conn.Close();

            GridView1.Visible = false;
        }


        protected void btnCreate_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("DealerCreate.aspx");
        }
    }
}