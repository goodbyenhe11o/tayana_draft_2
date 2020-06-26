using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using HtmlAgilityPack;

namespace tayana_draft_2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string webtext = GetContent("https://w3c.hexschool.com/category/blog");
            HtmlDocument htmlDocument = new HtmlDocument();
            htmlDocument.LoadHtml(webtext);
            HtmlNode node = htmlDocument.DocumentNode.SelectSingleNode("/html/body/main/div/div/div/div/article[1]/div[1]/a");
            Literal1.Text = node.InnerText;
        }
        private static string GetContent(string Url)
        {
            try //程式主執行區或可能發生錯誤的地方
            {
                
                var request = System.Net.WebRequest.Create(Url);  // Create a request for the URL.
                request.ContentType = "charset=utf-8";
                string text;
                var response = (System.Net.HttpWebResponse)request.GetResponse();
                using (var sr = new StreamReader(response.GetResponseStream()))
                {
                    text = sr.ReadToEnd();
                }
                return text;
            }
            catch (Exception) //例外的處理方法，如秀出警告
            {
                return string.Empty;
            }
        }
    }
}