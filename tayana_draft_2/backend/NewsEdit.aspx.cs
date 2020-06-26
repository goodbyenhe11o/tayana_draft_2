using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace tayana_draft_2.backend
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(config);

                string getID = Request.QueryString["id"]; //get the datakey from the field of news.aspx
                string query = $"SELECT * FROM News where id={getID}";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    title.Text = dr["title"].ToString();
                    summary.Text = dr["summary"].ToString();
                    ckcontent.Text= dr["content"].ToString();
                }
                conn.Close();

            }

        }



        protected void BtnSave_OnClick(object sender, EventArgs e)
        {
            if (ckcontent.Text != null)
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
                string getID = Request.QueryString["id"]; //get the datakey from the field of news.aspx
                string query = $"UPDATE News SET title=@title, pin=@pin, summary=@summary, content=@content, img=@img WHERE id={getID}";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@title", title.Text);
                cmd.Parameters.AddWithValue("@pin", RadioButtonList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@summary", summary.Text);
                cmd.Parameters.AddWithValue("@content", ckcontent.Text);
                cmd.Parameters.AddWithValue("@img", name);
                cmd.ExecuteNonQuery();


                conn.Close();
            }

            Response.Redirect("News.aspx");

        }

        protected void btnReturn_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("News.aspx");
        }
    }
}