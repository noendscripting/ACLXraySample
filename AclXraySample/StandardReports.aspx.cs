using System;
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


namespace AclXraySample
{
    public partial class StandardReports : System.Web.UI.Page
    {
        

        int LastIndext = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        //protected void Unnamed_SelectedIndexChanged(object sender, EventArgs e)
        //{
            
        //        BindGridview(RadioButtonListReportList.SelectedIndex);
          


        //   LastIndext = RadioButtonListReportList.SelectedIndex;
   


        //}


        //private void BindGridview(int queryID, string FilterExpression=" ")
        //{
        //    gvDataSource.SelectCommand = getQuery(RadioButtonListReportList.SelectedIndex);
        //    if (!string.IsNullOrEmpty(FilterExpression))
        //    {
        //        gvDataSource.FilterExpression = FilterExpression;
        //    }
        //    GridViewResults.DataSource = gvDataSource;
        //    GridViewResults.DataBind();
        //    GridViewResults.Visible = true;

        //}





        //protected void GridViewResults_RowCreated(object sender, GridViewRowEventArgs e)
        //{

            
        //    if (e.Row.RowIndex == 0)
        //    {
        //        int queryOption = RadioButtonListReportList.SelectedIndex;
        //        DataTable dt = ((DataView)gvDataSource.Select(DataSourceSelectArguments.Empty)).Table;
        //        //GridViewRow gvrRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
        //        //GridView gvTemp = (GridView)sender;

        //        for (int columnIndex = 0; columnIndex <= GridViewResults.HeaderRow.Cells.Count - 1; columnIndex++)
        //        {

        //            foreach (Control gvControl in GridViewResults.HeaderRow.Cells[columnIndex].Controls)
        //            {
        //                if (gvControl.GetType() == (typeof(DropDownList)))
        //                {
                            
        //                    string columnName = gvControl.ID;
        //                    DataTable dtUnique = dt.DefaultView.ToTable(true, columnName);
        //                    DropDownList dd = (DropDownList)gvControl;
        //                    dd.DataSource = dtUnique;
        //                    dd.ID = columnName;
        //                    dd.DataValueField = columnName;
        //                    dd.AutoPostBack = false;
        //                    dd.DataBind();
        //                    dd.Items.Insert(0,"ALL");
        //                    string selectedValue = SetValue(dd.ID);
        //                    dd.ClearSelection();
        //                    dd.SelectedValue = selectedValue; 
        //                    dd.Visible = true;
                            
        //                    //dd.SelectedIndexChanged +=(EventHandler)DDfilter_SelectedIndexChanged;
        //                    //gvDataSource.FilterParameters.Add(columnName, dd.SelectedValue.ToString());

        //                }


        //            }
        //        }
        //        //gvTemp.Controls[0].Controls.AddAt(1, gvrRow);
        //    }
            
        //}

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

        
        
        private static string getQuery(int id)
        {
            switch (id)
            {
                case 0: return "SELECT * FROM AdminCountReport";
                //case 1: selectedQuery = "SELECT L.ServerFqdn,  L.SidCount, T.Name, T.Authority,  T.ObjectClass, T.SamAccountName, T.DistinguishedName, L.ObjectSID, T.ModifiedDate, T.WhenCreated, T.WhenChanged  FROM t_user_tokens L JOIN Trustees T ON L.ObjectSID = T.Sid Where LEN(L.ObjectSid) > '20' ORDER BY T.Name, T.Authority"; break;
                default: return null;
            }

        }

        //protected void btnClearFilter_Click(object sender, EventArgs e)
        //{
        //    ViewState["Filters"] = null;
        //    BindGridview(RadioButtonListReportList.SelectedIndex);

        //}

        protected void GridViewResults_DataBound(object sender, EventArgs e)
        {
            //DataTable dt = ((DataView)gvDataSource.Select(DataSourceSelectArguments.Empty)).Table;
            GridViewRow gvrRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
            GridView gvTemp = (GridView)sender;
            for (int columnIndex = 0; columnIndex <= gvTemp.HeaderRow.Cells.Count - 1; columnIndex++)
            {

                string columnName = gvTemp.HeaderRow.Cells[columnIndex].Text;
                List<string> uniqueList = gvTemp.Rows
                       .OfType<GridViewRow>()
                       .Where(x => x.Cells[columnIndex].Text != null)
                       .Select(x => x.Cells[columnIndex].Text)
                       .Distinct()
                       .ToList();
                //DataTable dtUnique = dt.DefaultView.ToTable(true, columnName);
                DropDownList dd = new DropDownList();
                //dd.DataSource = dtUnique;
                dd.ID = columnName;
                //dd.DataValueField = columnName;
                dd.DataSource = uniqueList;
                dd.AutoPostBack = false;
                dd.DataBind();
                dd.Items.Insert(0, "ALL");
                string selectedValue = SetValue(dd.ID);
                dd.ClearSelection();
                dd.SelectedValue = selectedValue;
                dd.Visible = true;
                TableCell tCell = new TableCell();
                tCell.Controls.Add(dd);
                gvrRow.Cells.Add(tCell);

            }
            gvTemp.Controls[0].Controls.AddAt(1, gvrRow);
        }
        
    }
}