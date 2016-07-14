using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MapC.Models;
namespace MapC.Ajax
{
    /// <summary>
    /// Summary description for GetMarketList
    /// </summary>
    public class GetMarketList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Result = string.Empty;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            try
            {
                int ID = Formatting.ConvertNullToInt32(context.Request["ID"]);
                if (ID < 0) {
                    string TmmTId = (-ID).ToString();
                    Tmmt tm = new Tmmt(970, TmmTId);
                    if (tm.ID > 0)
                    {
                        sb.Append("[{");
                        sb.Append("\"TmmtDate\" : \"" +  tm.TmmtDate.ToString("dd/MM/yyyy") + "\",");
                        sb.Append("\"LookuptoTmmCountryT\" : \"" + tm.LookuptoTmmCountryT + "\",");
                        sb.Append("\"LookuptoTmmAcountT\" : \"" + tm.LookuptoTmmAcountT + "\",");
                        sb.Append("\"LookuptoTmmAccountTypeT\" : \"" + tm.LookuptoTmmAccountTypeT + "\",");
                        sb.Append("\"ProductionCapacityMT\" : \"" + tm.ProductionCapacityMT + "\",");
                        sb.Append("\"ActualTotalProduction\" : \"" + tm.ActualTotalProduction + "\",");
                        sb.Append("\"TotalMarketShare\" : \"" + tm.TotalMarketShare + "\",");
                        sb.Append("\"EnzymaticYN\" : \"" + tm.EnzymaticYN + "\",");
                        sb.Append("\"LookuptoTmmBrandName\" : \"" + tm.LookuptoTmmBrandName + "\",");
                        sb.Append("\"LookuptoTmmEnzymeSupplierT\" : \"" + tm.LookuptoTmmEnzymeSupplierT + "\",");
                        sb.Append("\"LookuptoTmmProductT\" : \"" + tm.LookuptoTmmProductT + "\",");
                        sb.Append("\"TmmEnzymeName\" : \"" + tm.TmmEnzymeName + "\",");
                        sb.Append("\"LookuptoTmmTierT\" : \"" + tm.LookuptoTmmTierT + "\",");
                        sb.Append("\"EnzymeDosage\" : \"" + tm.EnzymeDosage + "\",");
                        sb.Append("\"PriceEnzymeSolutionkg\" : \"" + tm.PriceEnzymeSolutionkg + "\",");
                        sb.Append("\"BrandProdMTY\" : \"" + tm.BrandProdMTY + "\",");
                        sb.Append("\"MarketShare\" : \"" + tm.MarketShare + "\",");
                        sb.Append("\"EnzymeSalesPotentialMT\" : \"" + tm.EnzymeSalesPotentialMT + "\",");
                        sb.Append("\"EnzymeSalesMT\" : \"" + tm.EnzymeSalesMT + "\",");
                        sb.Append("\"RetailPriceKg\" : \"" + tm.RetailPriceKg + "\",");
                        sb.Append("\"CurrencyName\" : \"" + tm.CurrencyName + "\",");
                        sb.Append("\"TurnOverPotential\" : \"" + tm.TurnOverPotential + "\",");
                        sb.Append("\"RetailPriceEurKg\" : \"" + tm.RetailPriceEurKg + "\",");
                        sb.Append("\"ExchangeRateLocalEUR\" : \"" + tm.ExchangeRateLocalEUR + "\",");
                        sb.Append("\"EnzymeSpendMT\" : \"" + tm.EnzymeSpendMT + "\",");
                        sb.Append("\"ProductionCostMT\" : \"" + tm.ProductionCostMT + "\",");
                        sb.Append("\"Comments2\" : \"" + tm.Comments2 + "\",");
                        sb.Append("\"Comments1\" : \"" + tm.Comments1 + "\",");
                        sb.Append("}]");
                    }
                    else sb.Append("{}");

                }
                else if (ID > 0 && ID!=1000)
                {
                    Tmmt tm = new Tmmt();
                    tm.ID = Formatting.ConvertNullToInt32(context.Request["ID"]);
                    tm.TmmtDate = Formatting.ConvertNullToDateTime(context.Request["TmmtDate"]);
                    tm.LookuptoTmmCountryT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmCountryT"]);
                    tm.LookuptoTmmAcountT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmAcountT"]);
                    tm.LookuptoTmmAccountTypeT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmAccountTypeT"]);
                    tm.ProductionCapacityMT = Formatting.ConvertNullToDecimal(context.Request["ProductionCapacityMT"]);
                    tm.ActualTotalProduction = Formatting.ConvertNullToDecimal(context.Request["ActualTotalProduction"]);
                    tm.TotalMarketShare = Formatting.ConvertNullToDecimal(context.Request["TotalMarketShare"]);
                    tm.EnzymaticYN = Formatting.ConvertNullToString(context.Request["EnzymaticYN"]);
                    tm.LookuptoTmmBrandName = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmBrandName"]);
                    tm.LookuptoTmmEnzymeSupplierT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmEnzymeSupplierT"]);
                    tm.LookuptoTmmProductT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmProductT"]);
                    tm.TmmEnzymeName = Formatting.ConvertNullToInt32(context.Request["TmmEnzymeName"]);
                    tm.LookuptoTmmTierT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmTierT"]);
                    tm.EnzymeDosage = Formatting.ConvertNullToDecimal(context.Request["EnzymeDosage"]);
                    tm.PriceEnzymeSolutionkg = Formatting.ConvertNullToDecimal(context.Request["PriceEnzymeSolutionkg"]);
                    tm.BrandProdMTY = Formatting.ConvertNullToDecimal(context.Request["BrandProdMTY"]);
                    tm.MarketShare = Formatting.ConvertNullToDecimal(context.Request["MarketShare"]);
                    tm.EnzymeSalesPotentialMT = Formatting.ConvertNullToDecimal(context.Request["EnzymeSalesPotentialMT"]);
                    tm.EnzymeSalesMT = Formatting.ConvertNullToDecimal(context.Request["EnzymeSalesMT"]);
                    tm.RetailPriceKg = Formatting.ConvertNullToDecimal(context.Request["RetailPriceKg"]);
                    tm.CurrencyName = Formatting.ConvertNullToString(context.Request["CurrencyName"]);
                    tm.TurnOverPotential = Formatting.ConvertNullToDecimal(context.Request["TurnOverPotential"]);
                    tm.RetailPriceEurKg = Formatting.ConvertNullToDecimal(context.Request["RetailPriceEurKg"]);
                    tm.ExchangeRateLocalEUR = Formatting.ConvertNullToDecimal(context.Request["ExchangeRateLocalEUR"]);
                    tm.EnzymeSpendMT = Formatting.ConvertNullToDecimal(context.Request["EnzymeSpendMT"]);
                    tm.ProductionCostMT = Formatting.ConvertNullToDecimal(context.Request["ProductionCostMT"]);
                    tm.Comments2 = Formatting.ConvertNullToString(context.Request["Comments2"]);
                    tm.Comments1 = Formatting.ConvertNullToString(context.Request["Comments1"]);
                    tm.Save(960);

                    sb.Append("Success@@Save Successfully..");
                }
                else if (ID ==0)
                {
                    Tmmt tm = new Tmmt();
                   
                    tm.TmmtDate = Formatting.ConvertNullToDateTime(context.Request["TmmtDate"]);
                    tm.LookuptoTmmCountryT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmCountryT"]);
                    tm.LookuptoTmmAcountT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmAcountT"]);
                    tm.LookuptoTmmAccountTypeT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmAccountTypeT"]);
                    tm.ProductionCapacityMT = Formatting.ConvertNullToDecimal(context.Request["ProductionCapacityMT"]);
                    tm.ActualTotalProduction = Formatting.ConvertNullToDecimal(context.Request["ActualTotalProduction"]);
                    tm.TotalMarketShare = Formatting.ConvertNullToDecimal(context.Request["TotalMarketShare"]);
                    tm.EnzymaticYN = Formatting.ConvertNullToString(context.Request["EnzymaticYN"]);
                    tm.LookuptoTmmBrandName = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmBrandName"]);
                    tm.LookuptoTmmEnzymeSupplierT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmEnzymeSupplierT"]);
                    tm.LookuptoTmmProductT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmProductT"]);
                    tm.TmmEnzymeName = Formatting.ConvertNullToInt32(context.Request["TmmEnzymeName"]);
                    tm.LookuptoTmmTierT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmTierT"]);
                    tm.EnzymeDosage = Formatting.ConvertNullToDecimal(context.Request["EnzymeDosage"]);
                    tm.PriceEnzymeSolutionkg = Formatting.ConvertNullToDecimal(context.Request["PriceEnzymeSolutionkg"]);
                    tm.BrandProdMTY = Formatting.ConvertNullToDecimal(context.Request["BrandProdMTY"]);
                    tm.MarketShare = Formatting.ConvertNullToDecimal(context.Request["MarketShare"]);
                    tm.EnzymeSalesPotentialMT = Formatting.ConvertNullToDecimal(context.Request["EnzymeSalesPotentialMT"]);
                    tm.EnzymeSalesMT = Formatting.ConvertNullToDecimal(context.Request["EnzymeSalesMT"]);
                    tm.RetailPriceKg = Formatting.ConvertNullToDecimal(context.Request["RetailPriceKg"]);
                    tm.CurrencyName = Formatting.ConvertNullToString(context.Request["CurrencyName"]);
                    tm.TurnOverPotential = Formatting.ConvertNullToDecimal(context.Request["TurnOverPotential"]);
                    tm.RetailPriceEurKg = Formatting.ConvertNullToDecimal(context.Request["RetailPriceEurKg"]);
                    tm.ExchangeRateLocalEUR = Formatting.ConvertNullToDecimal(context.Request["ExchangeRateLocalEUR"]);
                    tm.EnzymeSpendMT = Formatting.ConvertNullToDecimal(context.Request["EnzymeSpendMT"]);
                    tm.ProductionCostMT = Formatting.ConvertNullToDecimal(context.Request["ProductionCostMT"]);
                    tm.Comments2 = Formatting.ConvertNullToString(context.Request["Comments2"]);
                    tm.Comments1 = Formatting.ConvertNullToString(context.Request["Comments1"]);
                    tm.Save(955);

                    sb.Append("Success@@Save Successfully..");
                }
                else
                {
                    MarketMapFCollection mmfc = new MarketMapFCollection(1000);
                    
                    if (mmfc.Count > 0)
                    {
                        sb.Append("[");
                        foreach (MarketMapF mmf in mmfc.Values)
                        {
                            sb.Append("{\"ID\" : \"" + mmf.ID + "\",");
                            sb.Append("\"Country\" : \"" + mmf.Country + "\",");
                            sb.Append("\"AccountName\" : \"" + System.Uri.EscapeDataString(mmf.AccountName) + "\",");
                            sb.Append("\"CustomerType\" : \"" + mmf.CustomerType + "\",");
                            sb.Append("\"BrandName\" : \"" + mmf.BrandName + "\",");
                            sb.Append("\"EnzymesUsed\" : \"" + mmf.EnzymesUsed + "\"},");
                        }
                        sb.Append("]");
                    }
                    else sb.Append("{}");
                }
                Result = sb.ToString();
            }
            catch(Exception ex)
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