using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Text;
using System.Data;

namespace tayana_draft_2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //StringBuilder sb = new StringBuilder("<table><tr><th>資料年度</th><th>統計項目</th><th>稅目別</th><th>資料單位</th><th>值</th></tr><tr><td>");

            //XmlDocument xdoc = new XmlDocument();
            //xdoc.Load("https://data.kcg.gov.tw/dataset/9c1303df-2493-43ce-bb78-8686963f91b7/resource/a34eed92-8c03-4ae0-8273-bb09f489a928/download/xml76.xml");
            //XmlNode rootNode = xdoc.DocumentElement;

            //foreach (XmlNode childNode in rootNode.ChildNodes)
            //{
            //    foreach (XmlNode node in childNode.ChildNodes)
            //    {
            //        sb.Append($"<td>{node.InnerText}</td>");
            //    }
            //    sb.Append("</tr>");

            //}
            //sb.Append("</tr>");
            //XmlNode selectNode = xdoc.SelectSingleNode("DataCollection//各項稅捐徵課成本[3]"); //no need star
            //sb.Append("<tr>");
            //foreach (XmlNode node in selectNode.ChildNodes)
            //{
            //    sb.Append($"<td>{node.InnerText}</td>");
            //}
            //sb.Append("</tr>");
            //sb.Append("</table>");
            //Literal1.Text = sb.ToString();

            DataTable dt = new DataTable();
            dt.Columns.Add("資料年度", typeof(string));
            dt.Columns.Add("統計項目", typeof(string));
            dt.Columns.Add("稅目別", typeof(string));
            dt.Columns.Add("資料單位", typeof(string));
            dt.Columns.Add("值", typeof(string));
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load("https://data.kcg.gov.tw/dataset/9c1303df-2493-43ce-bb78-8686963f91b7/resource/a34eed92-8c03-4ae0-8273-bb09f489a928/download/xml76.xml");
            XmlNode rootNode = xdoc.DocumentElement;

            foreach (XmlNode childNode in rootNode.ChildNodes)
            {
                DataRow row = dt.NewRow();
                foreach (XmlNode node in childNode.ChildNodes)
                {
                    switch (node.Name)
                    {
                        case "資料年度":
                            row["資料年度"] = node.InnerText;
                            break;
                        case "統計項目":
                            row["統計項目"] = node.InnerText;
                            break;
                        case "稅目別":
                            row["稅目別"] = node.InnerText;
                            break;
                        case "資料單位":
                            row["資料單位"] = node.InnerText;
                            break;
                        case "值":
                            row["值"] = node.InnerText;
                            break;
                    }
                   
                }
                dt.Rows.Add(row);
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}