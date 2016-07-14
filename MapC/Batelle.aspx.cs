using MapC.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MapC
{
    public partial class Batelle : System.Web.UI.Page
    {
        BatelleFDB mmf = new Models.BatelleFDB();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void caab_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void marketClick_Click(object sender, EventArgs e)
        {
            try
            {

                string country = hdnCountry.Value;
                if (country != string.Empty)
                {
                    DataTable dt;
                    dt = mmf.FillList(950, country);
                    if (dt != null)
                    {
                        DataRow dr = dt.NewRow();
                        dr[0] = "";
                        dr[1] = "Select";
                        dt.Rows.InsertAt(dr, 0);
                        caab.DataSource = dt;
                        caab.DataTextField = dt.Columns[1].ColumnName;
                        caab.DataValueField = dt.Columns[0].ColumnName;
                        caab.DataBind();
                    }
                    caab.Items.Insert(0, new ListItem("Select"));
                    caab.DataBind();

                }

            }
            catch
            {

            }
        }
    }
}