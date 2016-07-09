using MapC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MapC.Ajax
{
    /// <summary>
    /// Summary description for GetTechList
    /// </summary>
    public class GetTechList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Result = string.Empty;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            try
            {
                 int ID = Formatting.ConvertNullToInt32(context.Request["ID"]);
                 if (ID < 0)
                 {
                     string TmmTId = (-ID).ToString();
                     Tmmt tm = new Tmmt();
                     tm.TmmtTech(970, TmmTId);
                     if (tm.ID > 0)
                     {
                         sb.Append("[{");
                         sb.Append("\"ID\" : \"" + tm.ID + "\",");
                         sb.Append("\"Alcalinity\" : \"" + tm.Alcalinity + "\",");
                         sb.Append("\"AMLAS\" : \"" + tm.AMLAS + "\",");
                         sb.Append("\"AMNA\" : \"" + tm.AMNA + "\",");
                         sb.Append("\"AMSoap\" : \"" + tm.AMSoap + "\",");
                         sb.Append("\"BatelleData\" : \"" + tm.BatelleData + "\",");
                         sb.Append("\"Bleachactiveoxygen\" : \"" + tm.Bleachactiveoxygen + "\",");
                         sb.Append("\"Carbonate\" : \"" + tm.Carbonate + "\",");
                         sb.Append("\"Carbonates\" : \"" + tm.Carbonates + "\",");
                         sb.Append("\"Comments4\" : \"" + tm.Comments4 + "\",");
                         sb.Append("\"Comments5\" : \"" + tm.Comments5 + "\",");
                         sb.Append("\"Commets3\" : \"" + tm.Commets3 + "\",");
                         sb.Append("\"DosageDetergentgLwash\" : \"" + tm.DosageDetergentgLwash + "\",");
                         sb.Append("\"EnzymeCosts\" : \"" + tm.EnzymeCosts + "\",");
                         sb.Append("\"EnzymeDosageStudy\" : \"" + tm.EnzymeDosageStudy + "\",");
                         sb.Append("\"EnzymeSolutionName\" : \"" + tm.EnzymeSolutionName + "\",");
                         sb.Append("\"Field10\" : \"" + tm.Field10 + "\",");
                         sb.Append("\"Field6\" : \"" + tm.Field6 + "\",");
                         sb.Append("\"Field7\" : \"" + tm.Field7 + "\",");
                         sb.Append("\"Field8\" : \"" + tm.Field8 + "\",");
                         sb.Append("\"Field9\" : \"" + tm.Field9 + "\",");
                         sb.Append("\"FormulationCost\" : \"" + tm.FormulationCost + "\",");
                         sb.Append("\"Glycerine\" : \"" + tm.Glycerine + "\",");
                         sb.Append("\"Linktochemicalanalysis\" : \"" + tm.Linktochemicalanalysis + "\",");
                         sb.Append("\"LinktoWPreport\" : \"" + tm.LinktoWPreport + "\",");
                         sb.Append("\"LookuptoTmmAccountTypeT\" : \"" + tm.LookuptoTmmAccountTypeT + "\",");
                         sb.Append("\"LookuptoTmmAcountT\" : \"" + tm.LookuptoTmmAcountT + "\",");
                         sb.Append("\"LookuptoTmmBrandName\" : \"" + tm.LookuptoTmmBrandName + "\",");
                         sb.Append("\"LookuptoTmmCountryT\" : \"" + tm.LookuptoTmmCountryT + "\",");
                         sb.Append("\"LookuptoTmmEnzymeSupplierT\" : \"" + tm.LookuptoTmmEnzymeSupplierT + "\",");
                         sb.Append("\"LookuptoTmmProductT\" : \"" + tm.LookuptoTmmProductT + "\",");
                         sb.Append("\"LookuptoTmmTierT\" : \"" + tm.LookuptoTmmTierT + "\",");
                         sb.Append("\"OpticalBrigthener\" : \"" + tm.OpticalBrigthener + "\",");
                         sb.Append("\"PHDetergent\" : \"" + tm.PHDetergent + "\",");
                         sb.Append("\"Silicate\" : \"" + tm.Silicate + "\",");
                         sb.Append("\"STPPsodiumsalt\" : \"" + tm.STPPsodiumsalt + "\",");
                         sb.Append("\"Swatch10\" : \"" + tm.Swatch10 + "\",");
                         sb.Append("\"Swatch6\" : \"" + tm.Swatch6 + "\",");
                         sb.Append("\"Swatch7\" : \"" + tm.Swatch7 + "\",");
                         sb.Append("\"Swatch8\" : \"" + tm.Swatch8 + "\",");
                         sb.Append("\"Swatch9\" : \"" + tm.Swatch9 + "\",");
                         sb.Append("\"TAEDcontent\" : \"" + tm.TAEDcontent + "\",");
                         sb.Append("\"Talc\" : \"" + tm.Talc + "\",");
                         sb.Append("\"TFM\" : \"" + tm.TFM + "\",");
                         sb.Append("\"TmmtDate\" : \"" + tm.TmmtDate.ToString("dd/MM/yyyy") + "\",");
                         sb.Append("\"Water\" : \"" + tm.Water + "\",");
                         sb.Append("\"WaterHardnessdH\" : \"" + tm.WaterHardnessdH + "\",");
                         sb.Append("\"WPCFTCS06\" : \"" + tm.WPCFTCS06 + "\",");
                         sb.Append("\"WPCFTCS28\" : \"" + tm.WPCFTCS28 + "\",");
                         sb.Append("\"WPCFTKCH141\" : \"" + tm.WPCFTKCH141 + "\",");
                         sb.Append("\"WPEMPA116\" : \"" + tm.WPEMPA116 + "\",");
                         sb.Append("\"WPTemperature\" : \"" + tm.WPTemperature + "\",");
                         sb.Append("\"WPType\" : \"" + tm.WPType + "\",");
                         sb.Append("\"WPWFK20PF\" : \"" + tm.WPWFK20PF + "\",");
                         sb.Append("\"Zeolites\" : \"" + tm.Zeolites + "\",");

                         sb.Append("}]");
                     }
                     else sb.Append("{}");

                 }
                 else if (ID > 0 && ID != 1000)
                 {
                     Tmmt tm = new Tmmt();
                     tm.ID = Formatting.ConvertNullToInt32(context.Request["ID"]);
                     tm.Alcalinity = Formatting.ConvertNullToDecimal(context.Request["Alcalinity"]);
                     tm.AMLAS = Formatting.ConvertNullToDecimal(context.Request["AMLAS"]);
                     tm.AMNA = Formatting.ConvertNullToDecimal(context.Request["AMNA"]);
                     tm.AMSoap = Formatting.ConvertNullToDecimal(context.Request["AMSoap"]);
                     tm.BatelleData = Formatting.ConvertNullToString(context.Request["BatelleData"]);
                     tm.Bleachactiveoxygen = Formatting.ConvertNullToDecimal(context.Request["Bleachactiveoxygen"]);
                     tm.Carbonate = Formatting.ConvertNullToDecimal(context.Request["Carbonate"]);
                     tm.Carbonates = Formatting.ConvertNullToDecimal(context.Request["Carbonates"]);
                     tm.Comments4 = Formatting.ConvertNullToString(context.Request["Comments4"]);
                     tm.Comments5 = Formatting.ConvertNullToString(context.Request["Comments5"]);
                     tm.Commets3 = Formatting.ConvertNullToString(context.Request["Commets3"]);
                     tm.DosageDetergentgLwash = Formatting.ConvertNullToDecimal(context.Request["DosageDetergentgLwash"]);
                     tm.EnzymeCosts = Formatting.ConvertNullToDecimal(context.Request["EnzymeCosts"]);
                     tm.EnzymeDosageStudy = Formatting.ConvertNullToDecimal(context.Request["EnzymeDosageStudy"]);
                     tm.EnzymeSolutionName = Formatting.ConvertNullToDecimal(context.Request["EnzymeSolutionName"]);
                     tm.Field10 = Formatting.ConvertNullToDecimal(context.Request["Field10"]);
                     tm.Field6 = Formatting.ConvertNullToDecimal(context.Request["Field6"]);
                     tm.Field7 = Formatting.ConvertNullToDecimal(context.Request["Field7"]);
                     tm.Field8 = Formatting.ConvertNullToDecimal(context.Request["Field8"]);
                     tm.Field9 = Formatting.ConvertNullToDecimal(context.Request["Field9"]);
                     tm.FormulationCost = Formatting.ConvertNullToDecimal(context.Request["FormulationCost"]);
                     tm.Glycerine = Formatting.ConvertNullToDecimal(context.Request["Glycerine"]);
                     tm.Linktochemicalanalysis = Formatting.ConvertNullToString(context.Request["Linktochemicalanalysis"]);
                     tm.LinktoWPreport = Formatting.ConvertNullToString(context.Request["LinktoWPreport"]);
                     tm.LookuptoTmmAccountTypeT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmAccountTypeT"]);
                     tm.LookuptoTmmAcountT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmAcountT"]);
                     tm.LookuptoTmmBrandName = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmBrandName"]);
                     tm.LookuptoTmmCountryT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmCountryT"]);
                     tm.LookuptoTmmEnzymeSupplierT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmEnzymeSupplierT"]);
                     tm.LookuptoTmmProductT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmProductT"]);
                     tm.LookuptoTmmTierT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmTierT"]);
                     tm.OpticalBrigthener = Formatting.ConvertNullToDecimal(context.Request["OpticalBrigthener"]);
                     tm.PHDetergent = Formatting.ConvertNullToDecimal(context.Request["PHDetergent"]);
                     tm.Silicate = Formatting.ConvertNullToDecimal(context.Request["Silicate"]);
                     tm.STPPsodiumsalt = Formatting.ConvertNullToDecimal(context.Request["STPPsodiumsalt"]);
                     tm.Swatch10 = Formatting.ConvertNullToString(context.Request["Swatch10"]);
                     tm.Swatch6 = Formatting.ConvertNullToString(context.Request["Swatch6"]);
                     tm.Swatch7 = Formatting.ConvertNullToString(context.Request["Swatch7"]);
                     tm.Swatch8 = Formatting.ConvertNullToString(context.Request["Swatch8"]);
                     tm.Swatch9 = Formatting.ConvertNullToString(context.Request["Swatch9"]);
                     tm.TAEDcontent = Formatting.ConvertNullToDecimal(context.Request["TAEDcontent"]);
                     tm.Talc = Formatting.ConvertNullToDecimal(context.Request["Talc"]);
                     tm.TFM = Formatting.ConvertNullToDecimal(context.Request["TFM"]);
                     tm.TmmtDate = Formatting.ConvertNullToDateTime(context.Request["TmmtDate"]);
                     tm.Water = Formatting.ConvertNullToDecimal(context.Request["Water"]);
                     tm.WaterHardnessdH = Formatting.ConvertNullToDecimal(context.Request["WaterHardnessdH"]);
                     tm.WPCFTCS06 = Formatting.ConvertNullToDecimal(context.Request["WPCFTCS06"]);
                     tm.WPCFTCS28 = Formatting.ConvertNullToDecimal(context.Request["WPCFTCS28"]);
                     tm.WPCFTKCH141 = Formatting.ConvertNullToDecimal(context.Request["WPCFTKCH141"]);
                     tm.WPEMPA116 = Formatting.ConvertNullToDecimal(context.Request["WPEMPA116"]);
                     tm.WPTemperature = Formatting.ConvertNullToDecimal(context.Request["WPTemperature"]);
                     tm.WPType = Formatting.ConvertNullToString(context.Request["WPType"]);
                     tm.WPWFK20PF = Formatting.ConvertNullToDecimal(context.Request["WPWFK20PF"]);
                     tm.Zeolites = Formatting.ConvertNullToDecimal(context.Request["Zeolites"]);
                     tm.SaveTech(960);

                     sb.Append("Success@@Save Successfully..");
                 }
                 else if (ID == 0)
                 {
                     Tmmt tm = new Tmmt();
                     tm.Alcalinity = Formatting.ConvertNullToDecimal(context.Request["Alcalinity"]);
                     tm.AMLAS = Formatting.ConvertNullToDecimal(context.Request["AMLAS"]);
                     tm.AMNA = Formatting.ConvertNullToDecimal(context.Request["AMNA"]);
                     tm.AMSoap = Formatting.ConvertNullToDecimal(context.Request["AMSoap"]);
                     tm.BatelleData = Formatting.ConvertNullToString(context.Request["BatelleData"]);
                     tm.Bleachactiveoxygen = Formatting.ConvertNullToDecimal(context.Request["Bleachactiveoxygen"]);
                     tm.Carbonate = Formatting.ConvertNullToDecimal(context.Request["Carbonate"]);
                     tm.Carbonates = Formatting.ConvertNullToDecimal(context.Request["Carbonates"]);
                     tm.Comments4 = Formatting.ConvertNullToString(context.Request["Comments4"]);
                     tm.Comments5 = Formatting.ConvertNullToString(context.Request["Comments5"]);
                     tm.Commets3 = Formatting.ConvertNullToString(context.Request["Commets3"]);
                     tm.DosageDetergentgLwash = Formatting.ConvertNullToDecimal(context.Request["DosageDetergentgLwash"]);
                     tm.EnzymeCosts = Formatting.ConvertNullToDecimal(context.Request["EnzymeCosts"]);
                     tm.EnzymeDosageStudy = Formatting.ConvertNullToDecimal(context.Request["EnzymeDosageStudy"]);
                     tm.EnzymeSolutionName = Formatting.ConvertNullToDecimal(context.Request["EnzymeSolutionName"]);
                     tm.Field10 = Formatting.ConvertNullToDecimal(context.Request["Field10"]);
                     tm.Field6 = Formatting.ConvertNullToDecimal(context.Request["Field6"]);
                     tm.Field7 = Formatting.ConvertNullToDecimal(context.Request["Field7"]);
                     tm.Field8 = Formatting.ConvertNullToDecimal(context.Request["Field8"]);
                     tm.Field9 = Formatting.ConvertNullToDecimal(context.Request["Field9"]);
                     tm.FormulationCost = Formatting.ConvertNullToDecimal(context.Request["FormulationCost"]);
                     tm.Glycerine = Formatting.ConvertNullToDecimal(context.Request["Glycerine"]);
                     tm.Linktochemicalanalysis = Formatting.ConvertNullToString(context.Request["Linktochemicalanalysis"]);
                     tm.LinktoWPreport = Formatting.ConvertNullToString(context.Request["LinktoWPreport"]);
                     tm.LookuptoTmmAccountTypeT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmAccountTypeT"]);
                     tm.LookuptoTmmAcountT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmAcountT"]);
                     tm.LookuptoTmmBrandName = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmBrandName"]);
                     tm.LookuptoTmmCountryT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmCountryT"]);
                     tm.LookuptoTmmEnzymeSupplierT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmEnzymeSupplierT"]);
                     tm.LookuptoTmmProductT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmProductT"]);
                     tm.LookuptoTmmTierT = Formatting.ConvertNullToInt32(context.Request["LookuptoTmmTierT"]);
                     tm.OpticalBrigthener = Formatting.ConvertNullToDecimal(context.Request["OpticalBrigthener"]);
                     tm.PHDetergent = Formatting.ConvertNullToDecimal(context.Request["PHDetergent"]);
                     tm.Silicate = Formatting.ConvertNullToDecimal(context.Request["Silicate"]);
                     tm.STPPsodiumsalt = Formatting.ConvertNullToDecimal(context.Request["STPPsodiumsalt"]);
                     tm.Swatch10 = Formatting.ConvertNullToString(context.Request["Swatch10"]);
                     tm.Swatch6 = Formatting.ConvertNullToString(context.Request["Swatch6"]);
                     tm.Swatch7 = Formatting.ConvertNullToString(context.Request["Swatch7"]);
                     tm.Swatch8 = Formatting.ConvertNullToString(context.Request["Swatch8"]);
                     tm.Swatch9 = Formatting.ConvertNullToString(context.Request["Swatch9"]);
                     tm.TAEDcontent = Formatting.ConvertNullToDecimal(context.Request["TAEDcontent"]);
                     tm.Talc = Formatting.ConvertNullToDecimal(context.Request["Talc"]);
                     tm.TFM = Formatting.ConvertNullToDecimal(context.Request["TFM"]);
                     tm.TmmtDate = Formatting.ConvertNullToDateTime(context.Request["TmmtDate"]);
                     tm.Water = Formatting.ConvertNullToDecimal(context.Request["Water"]);
                     tm.WaterHardnessdH = Formatting.ConvertNullToDecimal(context.Request["WaterHardnessdH"]);
                     tm.WPCFTCS06 = Formatting.ConvertNullToDecimal(context.Request["WPCFTCS06"]);
                     tm.WPCFTCS28 = Formatting.ConvertNullToDecimal(context.Request["WPCFTCS28"]);
                     tm.WPCFTKCH141 = Formatting.ConvertNullToDecimal(context.Request["WPCFTKCH141"]);
                     tm.WPEMPA116 = Formatting.ConvertNullToDecimal(context.Request["WPEMPA116"]);
                     tm.WPTemperature = Formatting.ConvertNullToDecimal(context.Request["WPTemperature"]);
                     tm.WPType = Formatting.ConvertNullToString(context.Request["WPType"]);
                     tm.WPWFK20PF = Formatting.ConvertNullToDecimal(context.Request["WPWFK20PF"]);
                     tm.Zeolites = Formatting.ConvertNullToDecimal(context.Request["Zeolites"]);
                     tm.SaveTech(955);
                     sb.Append("Success@@Save Successfully..");
                 }
                 else
                 {
                     TechMapFCollection mmfc = new TechMapFCollection(1000);

                     if (mmfc.Count > 0)
                     {
                         sb.Append("[");
                         foreach (TechMapF mmf in mmfc.Values)
                         {
                             sb.Append("{\"ID\" : \"" + mmf.ID + "\",");
                             sb.Append("\"Country\" : \"" + mmf.Country + "\",");
                             sb.Append("\"AccountName\" : \"" + System.Uri.EscapeDataString(mmf.AccountName) + "\",");
                             sb.Append("\"BrandName\" : \"" + mmf.BrandName + "\",");
                             sb.Append("\"Tier\" : \"" + mmf.Tier + "\"},");
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