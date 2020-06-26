using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.backend
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {

                    string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection(config);

                    string getID = Request.QueryString["id"]; //get the datakey from the field of news.aspx
                    string query = $"SELECT * FROM YachtInfo where id={getID}";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        TextBox1.Text = dr["Name"].ToString();
                        ckcontent1.Text = dr["OverviewContent"].ToString();
                        ckcontent.Text = dr["OverviewDimension"].ToString();
                        //Literal1.Text = dr["Files"].ToString();
                        RadioButtonList1.SelectedValue = dr["Newbuilding"].ToString();
                    }
                    conn.Close();
                }
            }
        }


        protected void btnSave_OnClick(object sender, EventArgs e)
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

            if (Request.QueryString["id"] != null)
            {

                string getID = Request.QueryString["id"]; //get the datakey from the field of news.aspx
                string query = $"UPDATE YachtInfo SET Name=@Name, OverviewContent=@OverviewContent, OverviewDimension=@OverviewDimension , Files=@Files, Newbuilding=@Newbuilding WHERE id={getID}";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@OverviewContent", ckcontent1.Text);
                cmd.Parameters.AddWithValue("@OverviewDimension", ckcontent.Text);
                cmd.Parameters.AddWithValue("@Files", name);
                cmd.Parameters.AddWithValue("@Newbuilding", RadioButtonList1.SelectedItem.Value);

                //cmd.Parameters.AddWithValue("@preview", name);
                cmd.ExecuteNonQuery();


                conn.Close();
            }
            else if (Request.QueryString["id"] == null)
            {
                string query =
                    "INSERT INTO YachtInfo (Name, OverviewContent, OverviewDimension, Files, Newbuilding) VALUES (@Name, @OverviewContent,@OverviewDimension ,@Files, @Newbuilding)";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@OverviewContent", ckcontent1.Text);
                cmd.Parameters.AddWithValue("@OverviewDimension", ckcontent.Text);
                cmd.Parameters.AddWithValue("@Files", name);
                cmd.Parameters.AddWithValue("@Newbuilding", RadioButtonList1.SelectedItem.Value);
                //cmd.Parameters.AddWithValue("@preview", name);
                cmd.ExecuteNonQuery();


                conn.Close();
            }

            Response.Redirect("YachtInfo.aspx");
        }

        protected void btnReturn_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("YachtInfo.aspx");
        }
    }
}