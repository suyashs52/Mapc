using MapC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MapC.Ajax
{
    /// <summary>
    /// Summary description for MarketListDropListSave
    /// </summary>
    public class MarketListDropListSave : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Result = string.Empty;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            try
            {
                int ID = Formatting.ConvertNullToInt32(context.Request["ID"]);
                string Param = Formatting.ConvertNullToString(context.Request["SaveParam"]);
                string Value = System.Uri.UnescapeDataString(Formatting.ConvertNullToString(context.Request["SaveValue"]));
                string NewValue = Formatting.ConvertNullToString(context.Request["NewValue"]);
                string DelValue = Formatting.ConvertNullToString(context.Request["DelValue"]);
                string Column = "";
                Tmmt tm = new Tmmt();

                if (Param == "country")
                {
                    Param = "TmmCountryT";
                    Column = "Country";
                }
                else if (Param == "account")
                {
                    Param = "TmmAcountT";
                    Column = "AccountName";
                }
                else if (Param == "accounttype")
                {
                    Param = "TmmAccountTypeT";
                    Column = "CustomerType";
                }
                else if (Param == "brandname")
                {
                    Param = "TmmBrandNameT";
                    Column = "BrandName";
                }
                else if (Param == "producttype")
                {
                    Param = "TmmProductTypeT";
                    Column = "ProductType";
                }
                else if (Param == "tier")
                {
                    Param = "TmmTierT";
                    Column = "Tier";
                }
                else if (Param == "enzymesupplier")
                {
                    Param = "TmmEnzymeSupplierT";
                    Column = "EnzymeSupplier";
                }
                else if (Param == "enzymeused")
                {
                    Param = "TmmEnzymeUsedT";
                    Column = "EnzymesUsed";
                }
                else if (Param == "enzymesolutionname")
                {
                    Param = "EnzDataT";
                    Column = "EnzymeName";
                }

                if (ID == 0 )
                {
                    tm.DropListSave(0, Param, Column, Value);
                }
                else
                {
                     if( DelValue=="true")  tm.DropListSave(ID, Param, "Del", Value);
                    if( NewValue=="true")  tm.DropListSave(0, Param, Column, Value);
                    else if (DelValue == "false") tm.DropListSave(ID, Param, Column, Value);
                }
                Result = "Success@@Save Successfully!";
               
            }
            catch (Exception ex)
            {
                Result = "Error@@" + ex.Message;
            }
            finally
            {
                context.Response.Clear();
                context.Response.Write(Result);
                context.Response.Flush();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}