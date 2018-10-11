using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data.SqlClient;
namespace AclXraySample
{
    public partial class Setup : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            XmlNodeList list = GetConnectionData();
            if (list == null || list.Count == 0 )
            {
                Response.Write("Database information not found. If you are running this for the first time pleasure run setup wizard.");
            }
        }

        protected void btnCreateConfig_Click(object sender, EventArgs e)
        {

            string path = Server.MapPath("~/Web.Config");
            XmlDocument doc = GetXMLDOC();
            XmlNodeList list = GetConnectionData();
            bool isNew = false;

            XmlNode node;
            isNew = list.Count == 0;
            if (isNew)
            {
                node = doc.CreateNode(XmlNodeType.Element, "add", null);
                XmlAttribute attribute = doc.CreateAttribute("name");
                attribute.Value = "aclxrayConnectionString";
                node.Attributes.Append(attribute);

                attribute = doc.CreateAttribute("connectionString");
                attribute.Value = "";
                node.Attributes.Append(attribute);

                attribute = doc.CreateAttribute("providerName");
                attribute.Value = "System.Data.SqlClient";
                node.Attributes.Append(attribute);
            }
            else
            {
                node = list[0];
            }
            string conString = node.Attributes["connectionString"].Value;
            SqlConnectionStringBuilder conStringBuilder = new SqlConnectionStringBuilder(conString);
            conStringBuilder.InitialCatalog = txtBoxDBname.Text;
            conStringBuilder.DataSource = txtBoxDBname.Text;
            conStringBuilder.IntegratedSecurity = false;
            conStringBuilder.UserID = txtBoxDBUser.Text;
            conStringBuilder.Password = txtBoxDBUserPwd.Text;
            node.Attributes["connectionString"].Value = conStringBuilder.ConnectionString;
            if (isNew)
            {
                doc.DocumentElement.SelectNodes("connectionStrings")[0].AppendChild(node);
            }
            doc.Save(path);
        }

        protected XmlDocument GetXMLDOC()
        {
            string path = Server.MapPath("~/Web.Config");
            XmlDocument doc = new XmlDocument();
            doc.Load(path);
            return doc;
        }

        protected XmlNodeList GetConnectionData()
            {

            XmlDocument webConfigDoc = GetXMLDOC();
            XmlNodeList list = webConfigDoc.DocumentElement.SelectNodes(string.Format("connectionStrings/add[@name='aclxrayConnectionString1']"));
            return list;

            }

        protected void rbtnSelectDBType_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (rbtnSelectDBType.SelectedIndex)
            {
                case 0: { WizardAzure.Visible = true; break; };
                case 1: { WizardLocal.Visible = true; break; };
            }
            
        }
    }
    }
