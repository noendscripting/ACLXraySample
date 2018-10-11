using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


namespace AclXraySample.ReportPages
{
    public partial class ADAdminCountReport : System.Web.UI.Page
    {
        Hashtable selectedFilters;
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }
        protected void DDfilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            Hashtable selectedFilters = new Hashtable();
            //gvDataSource.FilterParameters.Add(new ControlParameter("ServerFqdn", "ServerFqdn", "SelectedValue"));



            for (int columnIndex = 0; columnIndex <= gvADAdminCountReport.HeaderRow.Cells.Count - 1; columnIndex++)
            {


                foreach (Control gvControl in gvADAdminCountReport.HeaderRow.Cells[columnIndex].Controls)
                {
                    if (gvControl.GetType() == (typeof(DropDownList)))
                    {
                        DropDownList dd = (DropDownList)gvControl;
                        if (!(dd.SelectedValue == "ALL"))
                        {

                            selectedFilters.Add(dd.ID, "= '" + dd.SelectedValue + "'");
                            // gvDataSource.FilterExpression = ""+ gvControl.ID +" = ' '";
                            //selectedFilters.Add(dd.ID, "=' '");
                        }



                    }

                }
            }




            if (!(selectedFilters == null))
            {
                ViewState["Filters"] = selectedFilters;
            }
            //
            string gvFilter = CreateFilter(selectedFilters);
            gvADAdminCountReportDataSource.FilterExpression = gvFilter;
        
        }
    

        protected void gvADAdminCountReport_RowCreated(object sender, GridViewRowEventArgs e)
        {


            if (e.Row.RowIndex == 0)
            {
                //int queryOption = RadioButtonListReportList.SelectedIndex;
                DataTable dt = ((DataView)gvADAdminCountReportDataSource.Select(DataSourceSelectArguments.Empty)).Table;

                for (int columnIndex = 0; columnIndex <= gvADAdminCountReport.HeaderRow.Cells.Count - 1; columnIndex++)
                {

                    foreach (Control gvControl in gvADAdminCountReport.HeaderRow.Cells[columnIndex].Controls)
                    {
                        if (gvControl.GetType() == (typeof(DropDownList)))
                        {

                            string columnName = gvControl.ID;
                            DataTable dtUnique = dt.DefaultView.ToTable(true, columnName);
                            DropDownList dd = (DropDownList)gvControl;
                            dd.DataSource = dtUnique;
                            dd.ID = columnName;
                            dd.DataValueField = columnName;
                            dd.AutoPostBack = true;
                            dd.DataBind();
                            dd.Items.Insert(0, "ALL");
                            string selectedValue = SetValue(dd.ID);
                            dd.ClearSelection();
                            dd.SelectedValue = selectedValue;
                            dd.Visible = true;
                            dd.Width = 100;
                           //dd.SelectedIndexChanged +=(EventHandler)DDfilter_SelectedIndexChanged;
                            //gvDataSource.FilterParameters.Add(columnName, dd.SelectedValue.ToString());

                        }


                    }
                }
                //gvTemp.Controls[0].Controls.AddAt(1, gvrRow);
            }

        }
        protected string SetValue(string ddlName)
        {
            Hashtable filters = (Hashtable)ViewState["Filters"];
            if (filters != null)
            {
                if (filters.ContainsKey(ddlName))
                {


                    return filters[ddlName].ToString().Substring(3, filters[ddlName].ToString().Length - 4);

                }




            }
            return "ALL";
        }
        private string CreateFilter(Hashtable filter)
        {
            string args = " ";
            int i = 0;
            foreach (object key in filter.Keys)
            {
                if (i == 0)
                {
                    args = key.ToString() + filter[key].ToString();
                }
                else
                {
                    args += " AND " + key.ToString() + filter[key].ToString();
                }
                i++;
            }

            return args;

        }
        

        protected void btnClearFilter_Click(object sender, EventArgs e)
        {
            ViewState["Filters"] = null;
            gvADAdminCountReportDataSource.FilterExpression = "";
            gvADAdminCountReport.DataBind();
        }

        protected void btnExportData_Click(object sender, EventArgs e)
        {
            DataTable dt = ((DataView)gvADAdminCountReportDataSource.Select(DataSourceSelectArguments.Empty)).Table;
            string pageName = Path.GetFileNameWithoutExtension(Page.AppRelativeVirtualPath);
            ExportCSV exportmyCSV = new ExportCSV();
            exportmyCSV.GetFile(dt, pageName);

        }
    }
}