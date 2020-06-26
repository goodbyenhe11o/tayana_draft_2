using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace tayana_draft_2.backend
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                {
                    LoadData();
                }
            }
        }


        protected void GridView1_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
                {
                    string config = System.Web.Configuration.WebConfigurationManager
                        .ConnectionStrings["tayanaConnectionString"]
                        .ConnectionString;
                    SqlConnection conn = new SqlConnection(config);
                    conn.Open();

                    string sq = $"DELETE FROM TayanaUserTable WHERE Userid=@Userid";
                    int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
                    SqlCommand cmd = new SqlCommand(sq, conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("MemberDel.aspx.aspx");
                }

                protected void LoadData()
                {
                    string config = System.Web.Configuration.WebConfigurationManager
                        .ConnectionStrings["tayanaConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection(config);
                    string query = "SELECT * FROM TayanaUserTable";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    conn.Close();
                }

            }
        }
        