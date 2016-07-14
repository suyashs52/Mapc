using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MapC.Models
{
    public class Tmmt
    {
        #region "varDeclare"
        public int ID;
        public DateTime TmmtDate;
        public decimal ProductionCapacityMT;
        public decimal ActualTotalProduction;
        public decimal TotalMarketShare;
        public decimal BrandProdMTY;
        public decimal MarketShare;
        public decimal ProductionCostMT;
        public string Comments1;
        public decimal RetailPriceKg;
        public string CurrencyName;
        public decimal ExchangeRateLocalEUR;
        public decimal RetailPriceEurKg;
        public string EnzymaticYN;
        public decimal EnzymeSalesMT;
        public decimal EnzymeDosage;
        public decimal EnzymeSalesPotentialMT;
        public decimal PriceEnzymeSolutionkg;
        public decimal TurnOverPotential;
        public decimal EnzymeSpendMT;
        public string Comments2;
        public decimal EnzymeSolutionName;
        public decimal EnzymeDosageStudy;
        public string WPType;
        public decimal WPTemperature;
        public decimal DosageDetergentgLwash;
        public decimal WaterHardnessdH;
        public decimal PHDetergent;
        public decimal WPCFTCS28;
        public decimal WPWFK20PF;
        public decimal WPCFTCS06;
        public decimal WPEMPA116;
        public decimal WPCFTKCH141;
        public string Swatch6;
        public decimal Field6;
        public string Swatch7;
        public decimal Field7;
        public string Swatch8;
        public decimal Field8;
        public string Swatch9;
        public decimal Field9;
        public string Swatch10;
        public decimal Field10;
        public string Commets3;
        public string LinktoWPreport;
        public decimal AMLAS;
        public decimal AMSoap;
        public decimal AMNA;
        public decimal Bleachactiveoxygen;
        public decimal STPPsodiumsalt;
        public decimal Zeolites;
        public decimal Carbonates;
        public decimal TAEDcontent;
        public decimal OpticalBrigthener;
        public string Linktochemicalanalysis;
        public decimal FormulationCost;
        public decimal EnzymeCosts;
        public string Comments4;
        public string LinktoingredientWeb;
        public string BatelleData;
        public decimal Silicate;
        public decimal Carbonate;
        public decimal Talc;
        public decimal TFM;
        public decimal Glycerine;
        public decimal Water;
        public decimal Alcalinity;
        public string Comments5;
        public int LookuptoTmmCountryT;
        public int LookuptoTmmAcountT;
        public int LookuptoTmmAccountTypeT;
        public int LookuptoTmmProductT;
        public int LookuptoTmmBrandName;
        public int LookuptoTmmTierT;
        public int LookuptoTmmEnzymeSupplierT;
        public int TmmEnzymeName;
        #endregion
        public Tmmt() { }
        public Tmmt(int id, string tmmtId = "0")
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("MarketMapF", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add("@country", SqlDbType.VarChar);
                    sc.Parameters["@country"].Value = tmmtId;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    SqlDataReader dr = sc.ExecuteReader();
                    while (dr.Read())
                    {
                        //    mmf = new MarketMapF();
                        //    mmf.ID = Formatting.ConvertNullToInt32(dr["ID"]);
                        //    mmf.Country = Formatting.ConvertNullToString(dr["Country"]);
                        //    mmf.AccountName = Formatting.ConvertNullToString(dr["AccountName"]);
                        //    mmf.CustomerType = Formatting.ConvertNullToString(dr["CustomerType"]);
                        //    mmf.BrandName = Formatting.ConvertNullToString(dr["BrandName"]);
                        //    mmf.EnzymesUsed = Formatting.ConvertNullToString(dr["EnzymesUsed"]);
                        //    this.Add(mmf.ID, mmf);
                        ID = Formatting.ConvertNullToInt32(dr["ID"]);
                        TmmtDate = Formatting.ConvertNullToDateTime(dr["TmmtDate"]);
                        LookuptoTmmCountryT = Formatting.ConvertNullToInt32(dr["LookuptoTmmCountryT"]);
                        LookuptoTmmAcountT = Formatting.ConvertNullToInt32(dr["LookuptoTmmAcountT"]);
                        LookuptoTmmAccountTypeT = Formatting.ConvertNullToInt32(dr["LookuptoTmmAccountTypeT"]);
                        ProductionCapacityMT = Formatting.ConvertNullToDecimal(dr["ProductionCapacityMT"]);
                        ActualTotalProduction = Formatting.ConvertNullToDecimal(dr["ActualTotalProduction"]);
                        TotalMarketShare = Formatting.ConvertNullToDecimal(dr["TotalMarketShare"]);
                        EnzymaticYN = Formatting.ConvertNullToString(dr["EnzymaticYN"]);
                        LookuptoTmmBrandName = Formatting.ConvertNullToInt32(dr["LookuptoTmmBrandName"]);
                        LookuptoTmmEnzymeSupplierT = Formatting.ConvertNullToInt32(dr["LookuptoTmmEnzymeSupplierT"]);
                        LookuptoTmmProductT = Formatting.ConvertNullToInt32(dr["LookuptoTmmProductT"]);
                        TmmEnzymeName = Formatting.ConvertNullToInt32(dr["TmmEnzymeName"]);
                        LookuptoTmmTierT = Formatting.ConvertNullToInt32(dr["LookuptoTmmTierT"]);
                        EnzymeDosage = Formatting.ConvertNullToDecimal(dr["EnzymeDosage"]);
                        PriceEnzymeSolutionkg = Formatting.ConvertNullToDecimal(dr["PriceEnzymeSolutionkg"]);
                        BrandProdMTY = Formatting.ConvertNullToDecimal(dr["BrandProdMTY"]);
                        MarketShare = Formatting.ConvertNullToDecimal(dr["MarketShare"]);
                        EnzymeSalesPotentialMT = Formatting.ConvertNullToDecimal(dr["EnzymeSalesPotentialMT"]);
                        EnzymeSalesMT = Formatting.ConvertNullToDecimal(dr["EnzymeSalesMT"]);
                        RetailPriceKg = Formatting.ConvertNullToDecimal(dr["RetailPriceKg"]);
                        CurrencyName = Formatting.ConvertNullToString(dr["CurrencyName"]);
                        TurnOverPotential = Formatting.ConvertNullToDecimal(dr["TurnOverPotential"]);
                        RetailPriceEurKg = Formatting.ConvertNullToDecimal(dr["RetailPriceEurKg"]);
                        ExchangeRateLocalEUR = Formatting.ConvertNullToDecimal(dr["ExchangeRateLocalEUR"]);
                        EnzymeSpendMT = Formatting.ConvertNullToDecimal(dr["EnzymeSpendMT"]);
                        ProductionCostMT = Formatting.ConvertNullToDecimal(dr["ProductionCostMT"]);
                        Comments2 = Formatting.ConvertNullToString(dr["Comments2"]);
                        Comments1 = Formatting.ConvertNullToString(dr["Comments1"]);


                    }
                    dr.Close();
                    sc.Dispose();
                    Cnxn.Close();
                    int status = Formatting.ConvertNullToInt32(sc.Parameters["@status"].Value);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void TmmtTech(int id, string tmmtId = "0")
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("TechMapF", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add("@country", SqlDbType.VarChar);
                    sc.Parameters["@country"].Value = tmmtId;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    SqlDataReader dr = sc.ExecuteReader();
                    while (dr.Read())
                    {
                        ID = Formatting.ConvertNullToInt32(dr["ID"]);
                        Alcalinity = Formatting.ConvertNullToDecimal(dr["Alcalinity"]);
                        AMLAS = Formatting.ConvertNullToDecimal(dr["AMLAS"]);
                        AMNA = Formatting.ConvertNullToDecimal(dr["AMNA"]);
                        AMSoap = Formatting.ConvertNullToDecimal(dr["AMSoap"]);
                        BatelleData = Formatting.ConvertNullToString(dr["BatelleData"]);
                        Bleachactiveoxygen = Formatting.ConvertNullToDecimal(dr["Bleachactiveoxygen"]);
                        Carbonate = Formatting.ConvertNullToDecimal(dr["Carbonate"]);
                        Carbonates = Formatting.ConvertNullToDecimal(dr["Carbonates"]);
                        Comments4 = Formatting.ConvertNullToString(dr["Comments4"]);
                        Comments5 = Formatting.ConvertNullToString(dr["Comments5"]);
                        Commets3 = Formatting.ConvertNullToString(dr["Commets3"]);
                        DosageDetergentgLwash = Formatting.ConvertNullToDecimal(dr["DosageDetergentgLwash"]);
                        EnzymeCosts = Formatting.ConvertNullToDecimal(dr["EnzymeCosts"]);
                        EnzymeDosageStudy = Formatting.ConvertNullToDecimal(dr["EnzymeDosageStudy"]);
                        EnzymeSolutionName = Formatting.ConvertNullToDecimal(dr["EnzymeSolutionName"]);
                        Field10 = Formatting.ConvertNullToDecimal(dr["Field10"]);
                        Field6 = Formatting.ConvertNullToDecimal(dr["Field6"]);
                        Field7 = Formatting.ConvertNullToDecimal(dr["Field7"]);
                        Field8 = Formatting.ConvertNullToDecimal(dr["Field8"]);
                        Field9 = Formatting.ConvertNullToDecimal(dr["Field9"]);
                        FormulationCost = Formatting.ConvertNullToDecimal(dr["FormulationCost"]);
                        Glycerine = Formatting.ConvertNullToDecimal(dr["Glycerine"]);
                        Linktochemicalanalysis = Formatting.ConvertNullToString(dr["Linktochemicalanalysis"]);
                        LinktoWPreport = Formatting.ConvertNullToString(dr["LinktoWPreport"]);
                        LookuptoTmmAccountTypeT = Formatting.ConvertNullToInt32(dr["LookuptoTmmAccountTypeT"]);
                        LookuptoTmmAcountT = Formatting.ConvertNullToInt32(dr["LookuptoTmmAcountT"]);
                        LookuptoTmmBrandName = Formatting.ConvertNullToInt32(dr["LookuptoTmmBrandName"]);
                        LookuptoTmmCountryT = Formatting.ConvertNullToInt32(dr["LookuptoTmmCountryT"]);
                        LookuptoTmmEnzymeSupplierT = Formatting.ConvertNullToInt32(dr["LookuptoTmmEnzymeSupplierT"]);
                        LookuptoTmmProductT = Formatting.ConvertNullToInt32(dr["LookuptoTmmProductT"]);
                        LookuptoTmmTierT = Formatting.ConvertNullToInt32(dr["LookuptoTmmTierT"]);
                        OpticalBrigthener = Formatting.ConvertNullToDecimal(dr["OpticalBrigthener"]);
                        PHDetergent = Formatting.ConvertNullToDecimal(dr["PHDetergent"]);
                        Silicate = Formatting.ConvertNullToDecimal(dr["Silicate"]);
                        STPPsodiumsalt = Formatting.ConvertNullToDecimal(dr["STPPsodiumsalt"]);
                        Swatch10 = Formatting.ConvertNullToString(dr["Swatch10"]);
                        Swatch6 = Formatting.ConvertNullToString(dr["Swatch6"]);
                        Swatch7 = Formatting.ConvertNullToString(dr["Swatch7"]);
                        Swatch8 = Formatting.ConvertNullToString(dr["Swatch8"]);
                        Swatch9 = Formatting.ConvertNullToString(dr["Swatch9"]);
                        TAEDcontent = Formatting.ConvertNullToDecimal(dr["TAEDcontent"]);
                        Talc = Formatting.ConvertNullToDecimal(dr["Talc"]);
                        TFM = Formatting.ConvertNullToDecimal(dr["TFM"]);
                        TmmtDate = Formatting.ConvertNullToDateTime(dr["TmmtDate"]);
                        Water = Formatting.ConvertNullToDecimal(dr["Water"]);
                        WaterHardnessdH = Formatting.ConvertNullToDecimal(dr["WaterHardnessdH"]);
                        WPCFTCS06 = Formatting.ConvertNullToDecimal(dr["WPCFTCS06"]);
                        WPCFTCS28 = Formatting.ConvertNullToDecimal(dr["WPCFTCS28"]);
                        WPCFTKCH141 = Formatting.ConvertNullToDecimal(dr["WPCFTKCH141"]);
                        WPEMPA116 = Formatting.ConvertNullToDecimal(dr["WPEMPA116"]);
                        WPTemperature = Formatting.ConvertNullToDecimal(dr["WPTemperature"]);
                        WPType = Formatting.ConvertNullToString(dr["WPType"]);
                        WPWFK20PF = Formatting.ConvertNullToDecimal(dr["WPWFK20PF"]);
                        Zeolites = Formatting.ConvertNullToDecimal(dr["Zeolites"]);





                    }
                    dr.Close();
                    sc.Dispose();
                    Cnxn.Close();
                    int status = Formatting.ConvertNullToInt32(sc.Parameters["@status"].Value);
                }
            }
            catch
            {

            }
        }
        public void Save(int id)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 960)
                {
                    input = "TmmT SET TmmtDate='" + TmmtDate + "',LookuptoTmmCountryT='" + LookuptoTmmCountryT + "',LookuptoTmmAcountT='" + LookuptoTmmAcountT
                        + "',LookuptoTmmAccountTypeT='" + LookuptoTmmAccountTypeT + "',ProductionCapacityMT='" + ProductionCapacityMT + "',ActualTotalProduction='" + ActualTotalProduction
                        + "',TotalMarketShare='" + TotalMarketShare + "',EnzymaticYN='" + EnzymaticYN + "',LookuptoTmmBrandName='" + LookuptoTmmBrandName + "',LookuptoTmmEnzymeSupplierT='"
                        + LookuptoTmmEnzymeSupplierT + "',LookuptoTmmProductT='" + LookuptoTmmProductT + "',TmmEnzymeName='"
                        + TmmEnzymeName + "',LookuptoTmmTierT='" + LookuptoTmmTierT + "',EnzymeDosage='" + EnzymeDosage + "',PriceEnzymeSolutionkg='"
                        + PriceEnzymeSolutionkg + "',BrandProdMTY='" + BrandProdMTY + "',MarketShare='" + MarketShare + "',EnzymeSalesPotentialMT='"
                        + EnzymeSalesPotentialMT + "',EnzymeSalesMT='" + EnzymeSalesMT + "',RetailPriceKg='" + RetailPriceKg + "',CurrencyName='"
                        + CurrencyName + "',TurnOverPotential='" + TurnOverPotential + "',RetailPriceEurKg='" + RetailPriceEurKg
                        + "',ExchangeRateLocalEUR='" + ExchangeRateLocalEUR + "',EnzymeSpendMT='" + EnzymeSpendMT + "',ProductionCostMT='"
                        + ProductionCostMT + "',Comments2='" + Comments2 + "',Comments1='" + Comments1 + "'  WHERE ID=" + ID;
                }
                else if (id == 955)
                {
                    input = "TmmT  (TmmtDate,LookuptoTmmCountryT,LookuptoTmmAcountT,LookuptoTmmAccountTypeT,ProductionCapacityMT,ActualTotalProduction,TotalMarketShare,EnzymaticYN,LookuptoTmmBrandName,LookuptoTmmEnzymeSupplierT,LookuptoTmmProductT,TmmEnzymeName,LookuptoTmmTierT,EnzymeDosage,PriceEnzymeSolutionkg,BrandProdMTY,MarketShare,EnzymeSalesPotentialMT,EnzymeSalesMT,RetailPriceKg,CurrencyName,TurnOverPotential,RetailPriceEurKg,ExchangeRateLocalEUR,EnzymeSpendMT,ProductionCostMT,Comments2,Comments1) Values('"
                          + TmmtDate + "','" + LookuptoTmmCountryT + "','" + LookuptoTmmAcountT + "','" + LookuptoTmmAccountTypeT + "','" + ProductionCapacityMT + "','" + ActualTotalProduction + "', '" + TotalMarketShare + "', '" + EnzymaticYN + "','" + LookuptoTmmBrandName + "', '" + LookuptoTmmEnzymeSupplierT
                          + "', '" + LookuptoTmmProductT + "', '" + TmmEnzymeName + "', '" + LookuptoTmmTierT + "', '" + EnzymeDosage + "','" + PriceEnzymeSolutionkg + "', '" + BrandProdMTY + "','" + MarketShare + "', '" + EnzymeSalesPotentialMT + "','" + EnzymeSalesMT + "', '" + RetailPriceKg + "', '" + CurrencyName + "','" + TurnOverPotential + "','" + RetailPriceEurKg + "','" + ExchangeRateLocalEUR + "', '" + EnzymeSpendMT + "','" + ProductionCostMT + "','" + Comments2 + "', '" + Comments1 + "')";

                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("MarketMapF", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add("@country", SqlDbType.VarChar);
                    sc.Parameters["@country"].Value = input;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    sc.ExecuteNonQuery();


                    sc.Dispose();
                    Cnxn.Close();
                }
            }
            catch
            {

            }
            finally
            {

            }
        }
        public void SaveTech(int id)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 960)
                {
                    input = "TmmT SET Alcalinity='" + Alcalinity + "',AMLAS='" + AMLAS + "',AMNA='" + AMNA + "',AMSoap='" + AMSoap + "',BatelleData='" + BatelleData + "',Bleachactiveoxygen='" + Bleachactiveoxygen
                        + "',Carbonate='" + Carbonate + "',Carbonates='" + Carbonates + "',Comments4='" + Comments4 + "',Comments5='" + Comments5 + "',Commets3='" + Commets3 + "',DosageDetergentgLwash='" + DosageDetergentgLwash
                        + "',EnzymeCosts='" + EnzymeCosts + "',EnzymeDosageStudy='" + EnzymeDosageStudy + "',EnzymeSolutionName='" + EnzymeSolutionName + "',Field10='" + Field10 + "',Field6='" + Field6
                        + "',Field7='" + Field7 + "',Field8='" + Field8 + "',Field9='" + Field9 + "',FormulationCost='" + FormulationCost + "',Glycerine='" + Glycerine + "',Linktochemicalanalysis='" + Linktochemicalanalysis
                        + "',LinktoWPreport='" + LinktoWPreport + "',LookuptoTmmAccountTypeT='" + LookuptoTmmAccountTypeT + "',LookuptoTmmAcountT='" + LookuptoTmmAcountT + "',LookuptoTmmBrandName='" + LookuptoTmmBrandName
                        + "',LookuptoTmmCountryT='" + LookuptoTmmCountryT + "',LookuptoTmmEnzymeSupplierT='" + LookuptoTmmEnzymeSupplierT + "',LookuptoTmmProductT='" + LookuptoTmmProductT
                        + "',LookuptoTmmTierT='" + LookuptoTmmTierT + "',OpticalBrigthener='" + OpticalBrigthener + "',PHDetergent='" + PHDetergent + "',Silicate='" + Silicate + "',STPPsodiumsalt='" + STPPsodiumsalt
                        + "',Swatch10='" + Swatch10 + "',Swatch6='" + Swatch6 + "',Swatch7='" + Swatch7 + "',Swatch8='" + Swatch8 + "',Swatch9='" + Swatch9 + "',TAEDcontent='" + TAEDcontent + "',Talc='" + Talc
                        + "',TFM='" + TFM + "',TmmtDate='" + TmmtDate + "',Water='" + Water + "',WaterHardnessdH='" + WaterHardnessdH + "',WPCFTCS06='" + WPCFTCS06 + "',WPCFTCS28='" + WPCFTCS28
                        + "',WPCFTKCH141='" + WPCFTKCH141 + "',WPEMPA116='" + WPEMPA116 + "',WPTemperature='" + WPTemperature + "',WPType='" + WPType + "',WPWFK20PF='" + WPWFK20PF + "',Zeolites='" + Zeolites
                        + "' WHERE ID=" + ID;


                }
                else if (id == 955)
                {
                    input = "TmmT  (Alcalinity,AMLAS,AMNA,AMSoap,BatelleData,Bleachactiveoxygen,Carbonate,Carbonates,Comments4,Comments5,Commets3,DosageDetergentgLwash,EnzymeCosts,EnzymeDosageStudy,EnzymeSolutionName,Field10,Field6,Field7,Field8,Field9,FormulationCost,Glycerine,"
                              + "Linktochemicalanalysis,LinktoWPreport,LookuptoTmmAccountTypeT,LookuptoTmmAcountT,LookuptoTmmBrandName,LookuptoTmmCountryT,LookuptoTmmEnzymeSupplierT,LookuptoTmmProductT,LookuptoTmmTierT,OpticalBrigthener,PHDetergent,Silicate,STPPsodiumsalt,Swatch10,"
                              + "Swatch6,Swatch7,Swatch8,Swatch9,TAEDcontent,Talc,TFM,TmmtDate,Water,WaterHardnessdH,WPCFTCS06,WPCFTCS28,WPCFTKCH141,WPEMPA116,WPTemperature,WPType,WPWFK20PF,Zeolites) Values("
                              + "'" + Alcalinity + "','" + AMLAS + "','" + AMNA + "','" + AMSoap + "','" + BatelleData + "','" + Bleachactiveoxygen + "','" + Carbonate + "','" + Carbonates + "','" + Comments4
                              + "','" + Comments5 + "','" + Commets3 + "','" + DosageDetergentgLwash + "','" + EnzymeCosts + "','" + EnzymeDosageStudy + "','" + EnzymeSolutionName + "','" + Field10 + "','" + Field6
                              + "','" + Field7 + "','" + Field8 + "','" + Field9 + "','" + FormulationCost + "','" + Glycerine + "','" + Linktochemicalanalysis + "','" + LinktoWPreport + "','" + LookuptoTmmAccountTypeT
                              + "','" + LookuptoTmmAcountT + "','" + LookuptoTmmBrandName + "','" + LookuptoTmmCountryT + "','" + LookuptoTmmEnzymeSupplierT + "','" + LookuptoTmmProductT + "','" + LookuptoTmmTierT
                              + "','" + OpticalBrigthener + "','" + PHDetergent + "','" + Silicate + "','" + STPPsodiumsalt + "','" + Swatch10 + "','" + Swatch6 + "','" + Swatch7 + "','" + Swatch8 + "','" + Swatch9
                              + "','" + TAEDcontent + "','" + Talc + "','" + TFM + "','" + TmmtDate + "','" + Water + "','" + WaterHardnessdH + "','" + WPCFTCS06 + "','" + WPCFTCS28 + "','" + WPCFTKCH141 + "','" + WPEMPA116
                              + "','" + WPTemperature + "','" + WPType + "','" + WPWFK20PF + "','" + Zeolites + "')";

                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("TechMapF", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add("@country", SqlDbType.VarChar);
                    sc.Parameters["@country"].Value = input;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    sc.ExecuteNonQuery();


                    sc.Dispose();
                    Cnxn.Close();
                }
            }
            catch
            {
                throw;
            }
            finally
            {

            }
        }
        public void DropListSave(int id, string Param, string Column, string Value)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 0)
                {

                    input = Param + "(" + Column + ") Values('" + Value + "')";
                    id = 955;
                }
                else
                {
                    if (Column == "Del")
                    {
                        input = Param + " WHERE ID=" + id;
                        id = 956;
                    }
                    else
                    {
                        input = Param + " SET " + Column + "='" + Value + "' WHERE ID=" + id;
                        id = 960;
                    }

                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("MarketMapF", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add("@country", SqlDbType.VarChar);
                    sc.Parameters["@country"].Value = input;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    sc.ExecuteNonQuery();


                    sc.Dispose();
                    Cnxn.Close();
                }
            }
            catch
            {

            }
            finally
            {

            }
        }
    }
}