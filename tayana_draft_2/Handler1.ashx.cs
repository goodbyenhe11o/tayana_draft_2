using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace tayana_draft_2
{
    /// <summary>
    /// Handler1 的摘要描述
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json"; // check MIME type - ref MIME type MDN

            string config = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            string query = "SELECT * FROM TayanaUserTable WHERE username = @username";
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count > 0){
                string json = JsonConvert.SerializeObject(dt);
                context.Response.Write(json);
                //context.Response.WriteFile();
            }
            //else
            //{
            //    context.Response.ContentType("application/Json");
            //}


            context.Response.Write("Hello World");
        }



        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}