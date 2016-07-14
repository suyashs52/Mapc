using MapC.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MapC.Ajax
{
    /// <summary>
    /// Summary description for GetAccountBrand
    /// </summary>
    public class GetAccountBrand : IHttpHandler
    {
       

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Result = string.Empty;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            try
            {
                int ID = Formatting.ConvertNullToInt32(context.Request["ID"]);
                if (ID == -1000)
                {
                    string TmmTId = (-ID).ToString();
                    //Tmmt tm = new Tmmt(970, TmmTId);
                    MarketMapFDB mmf = new Models.MarketMapFDB();
                    DataTable dt;
                    dt = mmf.FillList(700);
                    if (dt!=null && dt.Rows.Count > 0)
                    {
                        sb.Append("[");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            sb.Append("{\"ID\" : \"" + dt.Rows[i][0] + "\",");
                            sb.Append("\"AccountName\" : \"" + dt.Rows[i]["AccountName"] + "\"},");
                        }
                            
                        sb.Append("]");

                    }
                    else sb.Append("{}");
                   
                }
                else if (ID == -2000)
                {
                    string TmmTId = (-ID).ToString();
                    //Tmmt tm = new Tmmt(970, TmmTId);
                    MarketMapFDB mmf = new Models.MarketMapFDB();
                    DataTable dt;
                    dt = mmf.FillList(900);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        sb.Append("[");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            sb.Append("{\"ID\" : \"" + dt.Rows[i][0] + "\",");
                            sb.Append("\"Country\" : \"" + dt.Rows[i]["Country"] + "\"},");
                        }

                        sb.Append("]");

                    }
                    else sb.Append("{}");

                }
                else if (ID < 0) {
                    string TmmTId = (-ID).ToString();
                    AccountBrandCollection abc = new AccountBrandCollection(985, TmmTId + "");
                    if (abc.Count > 0)
                    {
                        sb.Append("[");
                        foreach (Tmmt tm in abc.Values)
                        {
                            sb.Append("{\"LookuptoTmmCountryT\" : \"" + tm.LookuptoTmmCountryT + "\",");
                            sb.Append("\"TmmtDate\" : \"" + tm.TmmtDate + "\",");
                            sb.Append("\"AccountName\" : \"" + tm.Comments1 + "\",");
                            sb.Append("\"ProductionCapacityMT\" : \"" + tm.ProductionCapacityMT + "\",");
                            sb.Append("\"TotalMarketShare\" : \"" + tm.TotalMarketShare + "\",");
                            sb.Append("\"BrandName\" : \"" + tm.Comments2 + "\",");
                            sb.Append("\"ProductType\" : \"" + tm.Commets3 + "\",");
                            sb.Append("\"BrandProdMTY\" : \"" + tm.BrandProdMTY + "\",");
                            sb.Append("\"EnzymesUsed\" : \"" + tm.Comments4 + "\"},");


                        }
                       
                        sb.Append("]");
                    }
                    else sb.Append("{}");
                
                }
                else
                {
                    AccountBrandCollection abc = new AccountBrandCollection(980, ID + "");

                    if (abc.Count > 0)
                    {
                        sb.Append("[");
                        foreach (Tmmt tm in abc.Values)
                        {
                            sb.Append("{\"TmmtDate\" : \"" + tm.TmmtDate.ToString("dd/MM/yyyy") + "\",");
                            sb.Append("\"BrandName\" : \"" + tm.Commets3 + "\",");
                            sb.Append("\"ProductType\" : \"" + tm.Comments4 + "\",");
                            sb.Append("\"BrandProdMTY\" : \"" + tm.BrandProdMTY + "\",");
                            sb.Append("\"MarketShare\" : \"" + tm.MarketShare + "\",");
                            sb.Append("\"ProductionCostMT\" : \"" + tm.ProductionCostMT + "\",");
                            sb.Append("\"RetailPriceEurKg\" : \"" + tm.RetailPriceEurKg + "\",");
                            sb.Append("\"Comments1\" : \"" + tm.Comments1 + "\",");
                            sb.Append("\"EnzymaticYN\" : \"" + tm.EnzymaticYN + "\",");
                            sb.Append("\"EnzymesUsed\" : \"" + tm.Comments5 + "\",");
                            sb.Append("\"EnzymeSalesMT\" : \"" + tm.EnzymeSalesMT + "\",");
                            sb.Append("\"EnzymeDosage\" : \"" + tm.EnzymeDosage + "\",");
                            sb.Append("\"EnzymeSalesPotentialMT\" : \"" + tm.EnzymeSalesPotentialMT + "\",");
                            sb.Append("\"PriceEnzymeSolutionkg\" : \"" + tm.PriceEnzymeSolutionkg + "\",");
                            sb.Append("\"TurnOverPotential\" : \"" + tm.TurnOverPotential + "\",");
                            sb.Append("\"EnzymeSpendMT\" : \"" + tm.EnzymeSpendMT + "\",");
                            sb.Append("\"Comments2\" : \"" + tm.Comments2 + "\"},");

                        }
                        sb.Append("]");
                    }
                    else sb.Append("{}");
                }
                Result = sb.ToString();
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