using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;


namespace AclXraySample
{
    public partial class Enterprisereport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MasterBox_CheckedChanged(object sender, EventArgs e)
        {
            if(MasterBox.Checked)
            {
                foreach (ListItem item in CheckBoxListObjectType.Items)
                {
                    item.Selected = true;
                }
            }
            else
            {
                foreach (ListItem item in CheckBoxListObjectType.Items)
                {
                    item.Selected = false;
                }
            }
        }

        protected void RadioButtonListSearchOptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            int _selectedIndex = RadioButtonListSearchOptions.SelectedIndex;



            switch (_selectedIndex)
            {
                case 0: LabelBoxSearch.Text = "Enter SamAccountName:"; break;
                case 1: LabelBoxSearch.Text = "Enter Servername:"; break;
                case 2: LabelBoxSearch.Text = "Enter SID:"; break;
            }
        }

        protected void ButtonShowAccess_Click(object sender, EventArgs e)
        {

        }
    }

    
   
}