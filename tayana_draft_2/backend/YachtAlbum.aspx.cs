using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.backend
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string config = WebConfigurationManager.ConnectionStrings["tayanaConnectionString"]
                        .ConnectionString;
                    SqlConnection cn = new SqlConnection(config);
                    SqlCommand cm = new SqlCommand($"select * from Album where Yid = {Request.QueryString["id"]}",
                        cn);
                    cn.Open();
                    SqlDataReader rd = cm.ExecuteReader();
                    rpLayout.DataSource = rd;
                    rpLayout.DataBind();
                    cn.Close();
                }
            }
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];

            string config = WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(config);
            if (yachtLayout.HasFile)
            {
                foreach (HttpPostedFile postedFile in yachtLayout.PostedFiles)
                {
                    if (postedFile.ContentType == "image/jpeg" || postedFile.ContentType == "image/png")
                    {

                        string savepath = @"allFiles/";
                        string fileName = Path.GetFileName(postedFile.FileName);
                        string GetDate = DateTime.Now.ToString("yyMMddhhmmss");
                        fileName = GetDate + fileName;
                        string pathtocheck = savepath + fileName;
                        postedFile.SaveAs(Server.MapPath(pathtocheck));

                        //get thumbnail from the larger img
                        //CSImg.GenerateThumbnailImage(fileName, postedFile.InputStream,pathtocheck,"SS",58);


                        SqlCommand cm =
                            new SqlCommand($"INSERT INTO Album (Yid, Img) VALUES(@Yid,@Img)", cn);
                        cm.Parameters.AddWithValue("@Yid", id);
                        cm.Parameters.AddWithValue("@Img", pathtocheck);

                        cn.Open();
                        cm.ExecuteNonQuery();
                        cn.Close();

                    }
                    else
                    {
                        lbPictureResult.Text = "UPLOAD FILES ONLY IN JPG OR PNG FORMAT";
                        lbPictureResult.ForeColor = Color.Crimson;
                    }


                }
                Response.Redirect($"YachtAlbum.aspx?id={id}");
            }
            else
            {
                lbPictureResult.Text = "UPLOAD YOUR FILES";
                lbPictureResult.ForeColor = Color.Crimson;

            }
        }


        protected void rpLayout_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("delCmd"))
            {

                foreach (RepeaterItem item in rpLayout.Items)
                {
                    if (((CheckBox) item.FindControl("cb")).Checked)
                    {
                        int num = Int32.Parse(((HiddenField) item.FindControl("HiddenField1")).Value);
                        string config = WebConfigurationManager.ConnectionStrings["tayanaConnectionString"]
                            .ConnectionString;
                        SqlConnection conn = new SqlConnection(config);
                        SqlCommand cm = new SqlCommand($"delete from Album where id = {num}", conn);
                        conn.Open();
                        cm.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                Response.Redirect($"YachtAlbum.aspx?id={Request.QueryString["id"]}");
            }
        }

        protected void btnReturn_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("YachtInfo.aspx");
        }

    }
}
