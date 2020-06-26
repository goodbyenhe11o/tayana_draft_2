using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.backend
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string config = WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
                    SqlConnection cn = new SqlConnection(config);
                    SqlCommand cm = new SqlCommand($"select * from YachtLayout where Yid = {Request.QueryString["id"]}", cn);
                    cn.Open();
                    SqlDataReader rd = cm.ExecuteReader();
                    rpLayout.DataSource = rd;
                    rpLayout.DataBind();
                    cn.Close();
                }
            }
        }


       

        protected void rpLayout_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName.Equals("delCmd"))
            {
                foreach (RepeaterItem item in rpLayout.Items)
                {
                    if (((CheckBox)item.FindControl("cb")).Checked)
                    {
                        int num = Int32.Parse(((HiddenField)item.FindControl("HiddenField1")).Value);
                        string config = WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
                        SqlConnection conn = new SqlConnection(config);
                        SqlCommand cmd = new SqlCommand($"delete from YachtLayout where Yid = {num}", conn);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            Response.Redirect($"YachtLayout.aspx?id={Request.QueryString["id"]}");
        }


        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];

            string config = WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            if (fuLayout01.HasFile)
            {
                foreach (var postedFile in fuLayout01.PostedFiles)
                {
                    if (postedFile.ContentType == "image/jpeg" || postedFile.ContentType == "image/png")
                    {

                        string path = @"allFiles/";
                        string fileName = Path.GetFileName(postedFile.FileName);
                        string GetDate = DateTime.Now.ToString("yyMMddhhmmss");
                        fileName = GetDate + fileName;
                        string checkpath = path + fileName;
                        postedFile.SaveAs(Server.MapPath(checkpath));


                        SqlCommand cmd =
                            new SqlCommand($"INSERT INTO YachtLayout (Yid, Img) VALUES(@Yid,@Img)", conn);
                        cmd.Parameters.AddWithValue("@Yid", id);
                        cmd.Parameters.AddWithValue("@Img", checkpath);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                    }
                    else
                    {
                        lbPictureResult.Text = "UPLOAD IMAGES WITH ONLY JPEG/ JPG";
                        lbPictureResult.ForeColor = Color.Crimson;
                    }


                }
                Response.Redirect($"YachtLayout.aspx?id={id}");
            }
            else
            {
                lbPictureResult.Text = "UPLOAD YOUR FILES";
                lbPictureResult.ForeColor = Color.Crimson;

            }
        }

        protected void btnReturn_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("YachtInfo.aspx");
        }
    }
}