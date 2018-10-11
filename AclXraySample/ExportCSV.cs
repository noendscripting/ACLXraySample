using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace AclXraySample
{
    public class ExportCSV
    {

        public void GetFile(DataTable dtDataToExport, string Filename)
        {
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "text/plain";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename="+ Filename + ".csv;");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dtDataToExport.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dtDataToExport.Rows)
            {
                string linetext = null;
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                foreach (string field in fields)
                {
                    string newvalue = null; 
                    if (field.IndexOfAny(new char[] { '"', ',' }) != -1)
                    {
                        newvalue = string.Format("\"{0}\"", field.Replace("\"", "\"\""));
                        linetext += newvalue + ",";
                    }
                    else
                    {
                        linetext += field + ",";
                    }

                 
                }
                sb.AppendLine(linetext);
            }

            // the most easy way as you have type it
            HttpContext.Current.Response.Write(sb.ToString());


            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
    }
}