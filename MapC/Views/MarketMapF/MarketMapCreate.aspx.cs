using MapC.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MapC.Views.MarketMapF
{
    public partial class MarketMapCreate : System.Web.UI.Page
    {
        MarketMapFDB mmf = new Models.MarketMapFDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    FillCountry();
                    FillAccount();
                    FillAccountType();
                    FillBrandName();
                    FillProductType();
                    FillTier();
                    FillEnzymeSupplier();
                    FillEnzymeUsed();
                }
            }

            catch
            {

            }

        }

        void FillCountry()
        {
            try
            {
                DataTable dt;
                dt = mmf.FillList(900);
                if (dt != null)
                {
                    country.DataSource = dt;
                    country.DataTextField = dt.Columns[1].ColumnName;
                    country.DataValueField = dt.Columns[0].ColumnName;
                    country.DataBind();
                }

            }
            catch
            {

            }

        }
        void FillAccountType()
        {
            try
            {
                DataTable dt;
                dt = mmf.FillList(800);
                if (dt != null)
                {
                    accountType.DataSource = dt;
                    accountType.DataTextField = dt.Columns[1].ColumnName;
                    accountType.DataValueField = dt.Columns[0].ColumnName;
                    accountType.DataBind();
                }
            }
            catch
            {

            }
        }
        void FillAccount()
        {
            try
            {
                DataTable dt;
                dt = mmf.FillList(700);
                if (dt != null)
                {
                    account.DataSource = dt;
                    account.DataTextField = dt.Columns[1].ColumnName;
                    account.DataValueField = dt.Columns[0].ColumnName;
                    account.DataBind();
                }
            }
            catch
            {

            }
        }
        void FillBrandName()
        {
            try
            {
                DataTable dt;
                dt = mmf.FillList(600);
                if (dt != null)
                {
                    brandName.DataSource = dt;
                    brandName.DataTextField = dt.Columns[1].ColumnName;
                    brandName.DataValueField = dt.Columns[0].ColumnName;
                    brandName.DataBind();
                }
            }
            catch
            {

            }
        }
        void FillProductType()
        {
            try
            {
                DataTable dt;
                dt = mmf.FillList(550);
                if (dt != null)
                {
                    productType.DataSource = dt;
                    productType.DataTextField = dt.Columns[1].ColumnName;
                    productType.DataValueField = dt.Columns[0].ColumnName;
                    productType.DataBind();
                }
            }
            catch
            {

            }
        }
        void FillTier()
        {
            try
            {
                DataTable dt;
                dt = mmf.FillList(400);
                if (dt != null)
                {
                    tier.DataSource = dt;
                    tier.DataTextField = dt.Columns[1].ColumnName;
                    tier.DataValueField = dt.Columns[0].ColumnName;
                    tier.DataBind();
                }
            }
            catch
            {

            }
        }
        void FillEnzymeSupplier()
        {
            try
            {
                DataTable dt;
                dt = mmf.FillList(350);
                if (dt != null)
                {
                    enzymeSupplier.DataSource = dt;
                    enzymeSupplier.DataTextField = dt.Columns[1].ColumnName;
                    enzymeSupplier.DataValueField = dt.Columns[0].ColumnName;
                    enzymeSupplier.DataBind();
                }
            }
            catch
            {

            }
        }
        void FillEnzymeUsed()
        {
            try
            {
                DataTable dt;
                dt = mmf.FillList(300);
                if (dt != null)
                {
                    enzymeUsed.DataSource = dt;
                    enzymeUsed.DataTextField = dt.Columns[1].ColumnName;
                    enzymeUsed.DataValueField = dt.Columns[0].ColumnName;
                    enzymeUsed.DataBind();
                }
            }
            catch
            {

            }
        }

    }
}