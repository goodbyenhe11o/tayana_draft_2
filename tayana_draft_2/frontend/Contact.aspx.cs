using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana_draft_2.frontend
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetYacht();
            }
        }
        void SetYacht()
        {
            string config = WebConfigurationManager.ConnectionStrings["tayanaConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(config);
            SqlCommand cmd = new SqlCommand($"select id, Name from YachtInfo where Name is not null", conn);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);//將adapter存入datatable
            ddlYachtName.DataSource = dt;
            ddlYachtName.DataBind();
            conn.Close();
        }

        protected void btnSubmit_OnClick(object sender, ImageClickEventArgs e)
        {
            bool SendStatus = SendEmail(tbName.Text);
            if (SendStatus)
            {
                //if all fields have value then send successfully
                //Response.Write("<script>alert('SUCCESSFULLY SENT')</script>");
                tbName.Text = "";
                tbPhone.Text = "";
                tbMail.Text = "";
                tbComment.Text = "";
                Response.Redirect("ContactRedirectTrue.aspx");
            }
            else
            {
                //send failed 
                Response.Redirect("ContactRedirectFalse.aspx");
                lbMessage.Text = "SENT FAILED";
            }
        }

        public bool SendEmail(string subject)
        {

            //string MessageBody = "Name:" + tbName.Text + "<br>" +
            //                     "Email:" + tbMail.Text + "<br>" +
            //                     "Phone:" + tbPhone.Text + "<br>" +
            //                     "Country:" + ddlCountry.Text + "<br>" +
            //                     "Yacht Model:" + ddlYachtName.Text+ "<br>" +
            //                     "Comments:" + tbComment.Text + "<br>";

            string body = File.ReadAllText(Server.MapPath("/frontend/Email.html"));
            body = body.Replace("@Name", tbName.Text).Replace("@Email", tbMail.Text).Replace("@Phone", tbPhone.Text)
                .Replace("@Continent", ddlCountry.SelectedValue).Replace("@YachtModel",ddlYachtName.SelectedValue).Replace("@Comments", tbComment.Text);

            try
            {
                //MAILER
                MailAddress from = new MailAddress("goodbye.n.hello.again@gmail.com", "SENDER: ");
                //RECIPIENTS, MULTIPLE RECIPIENTS ALLOWED 
                MailAddress to = new MailAddress("goodbye.n.hello.again@gmail.com");
                MailMessage message = new MailMessage(from, to);

                message.Subject = $"An email from {tbName.Text}";
                message.SubjectEncoding = System.Text.Encoding.UTF8;
                message.Body = body/* MessageBody*/;
                message.BodyEncoding = System.Text.Encoding.UTF8;
                message.IsBodyHtml = true; //if it's html

                //msg.Attachments.Add(new Attachment(@"D:\test2.docx"));  //attachment
                //msg.Priority = MailPriority.High; 

                

                //設定smtp sever及port
                SmtpClient myMail = new SmtpClient("smtp.gmail.com", 587);
                myMail.Credentials = new System.Net.NetworkCredential("goodbye.n.hello.again@gmail.com", "tobey1011"); //填入帳密
                myMail.EnableSsl = true; //ssl打開，寄信時加密(gmail預設開啟驗證)

                myMail.Send(message); 
                myMail.Dispose(); //傳送結束訊息給smtp
                message.Dispose(); //釋放Mailmessage所使用的所有資源

                return true; //成功


            }
            catch (Exception ex)
            {
                return false;
              
            }


        }

        static public void doJavaScript(string JavaScript)
        {
            string script = "";
            string key = Guid.NewGuid().ToString();
            script += JavaScript;
            ((Page)HttpContext.Current.CurrentHandler).ClientScript.RegisterStartupScript(typeof(string), key, script, true);
        }

    }
}