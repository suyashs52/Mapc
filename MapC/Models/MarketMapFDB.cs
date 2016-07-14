using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MapC.Models
{
    public class MarketMapFDB
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;

        public void MarketMapFList()
        {
            MarketMapF mmf;
           
        }

        internal DataTable FillList(int id,string country="")
        {
            try
            {
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("MarketMapF", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add("@country", SqlDbType.VarChar);
                    sc.Parameters["@country"].Value = country;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    SqlDataAdapter sd = new SqlDataAdapter(sc);
                    
                  //  DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                   
                    sd.Fill(dt);
                    return dt;

                }
            }
            catch
            {

            }
            return null;
        }
    }
    public class MarketMapFCollection : Dictionary<int, MarketMapF>
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;

        public MarketMapFCollection()
        { }
        public MarketMapFCollection(int id)
        {
            try
            {
                MarketMapF mmf;
               
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("MarketMapF", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    SqlDataReader dr = sc.ExecuteReader();
                    while (dr.Read())
                    {
                        mmf = new MarketMapF();
                        mmf.ID = Formatting.ConvertNullToInt32(dr["ID"]);
                        mmf.Country = Formatting.ConvertNullToString(dr["Country"]);
                        mmf.AccountName = Formatting.ConvertNullToString(dr["AccountName"]);
                        mmf.CustomerType = Formatting.ConvertNullToString(dr["CustomerType"]);
                        mmf.BrandName = Formatting.ConvertNullToString(dr["BrandName"]);
                        mmf.EnzymesUsed = Formatting.ConvertNullToString(dr["EnzymesUsed"]);
                        this.Add(mmf.ID, mmf);
                    }
                    dr.Close();
                    sc.Dispose();
                    Cnxn.Close();
                    int status = Formatting.ConvertNullToInt32(sc.Parameters["@status"].Value);
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
       
    }
    public class AccountBrandCollection : Dictionary<int, Tmmt>
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
        public AccountBrandCollection() { }
        public  AccountBrandCollection(int id,string Country="")
        {
            try
            {
                Tmmt tmmt;

                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("MarketMapF", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add("@country", SqlDbType.VarChar);
                    sc.Parameters["@country"].Value = Country;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    SqlDataReader dr = sc.ExecuteReader();
                    int count = 0;
                    if (id == 985) {
                        while (dr.Read())
                        {
                            tmmt = new Tmmt();
                            tmmt.LookuptoTmmCountryT = Formatting.ConvertNullToInt32(dr["LookuptoTmmCountryT"]);
                            tmmt.TmmtDate = Formatting.ConvertNullToDateTime(dr["TmmtDate"]);
                            tmmt.Comments1 = Formatting.ConvertNullToString(dr["AccountName"]);
                            tmmt.ProductionCapacityMT = Formatting.ConvertNullToDecimal(dr["ProductionCapacityMT"]);
                            tmmt.TotalMarketShare = Formatting.ConvertNullToDecimal(dr["TotalMarketShare"]);
                            tmmt.Comments2 = Formatting.ConvertNullToString(dr["BrandName"]);
                            tmmt.Commets3 = Formatting.ConvertNullToString(dr["ProductType"]);
                            tmmt.BrandProdMTY = Formatting.ConvertNullToDecimal(dr["BrandProdMTY"]);
                            tmmt.Comments4 = Formatting.ConvertNullToString(dr["EnzymesUsed"]);

                            this.Add(++count, tmmt);
                        }
                    
                    
                    }
                    else
                    {
                        while (dr.Read())
                        {
                            tmmt = new Tmmt();
                            tmmt.ID = Formatting.ConvertNullToInt32(dr["LookuptoTmmAcountT"]);
                            tmmt.TmmtDate = Formatting.ConvertNullToDateTime(dr["TmmtDate"]);
                            tmmt.Commets3 = Formatting.ConvertNullToString(dr["BrandName"]);
                            tmmt.Comments4 = Formatting.ConvertNullToString(dr["ProductType"]);
                            tmmt.BrandProdMTY = Formatting.ConvertNullToDecimal(dr["BrandProdMTY"]);
                            tmmt.MarketShare = Formatting.ConvertNullToDecimal(dr["MarketShare"]);
                            tmmt.ProductionCostMT = Formatting.ConvertNullToDecimal(dr["ProductionCostMT"]);
                            tmmt.RetailPriceEurKg = Formatting.ConvertNullToDecimal(dr["RetailPriceEurKg"]);
                            tmmt.Comments1 = Formatting.ConvertNullToString(dr["Comments1"]);
                            tmmt.EnzymaticYN = Formatting.ConvertNullToString(dr["EnzymaticYN"]);
                            tmmt.Comments5 = Formatting.ConvertNullToString(dr["EnzymesUsed"]);
                            tmmt.EnzymeSalesMT = Formatting.ConvertNullToDecimal(dr["EnzymeSalesMT"]);
                            tmmt.EnzymeDosage = Formatting.ConvertNullToDecimal(dr["EnzymeDosage"]);
                            tmmt.EnzymeSalesPotentialMT = Formatting.ConvertNullToDecimal(dr["EnzymeSalesPotentialMT"]);
                            tmmt.PriceEnzymeSolutionkg = Formatting.ConvertNullToDecimal(dr["PriceEnzymeSolutionkg"]);
                            tmmt.TurnOverPotential = Formatting.ConvertNullToDecimal(dr["TurnOverPotential"]);
                            tmmt.EnzymeSpendMT = Formatting.ConvertNullToDecimal(dr["EnzymeSpendMT"]);
                            tmmt.Comments2 = Formatting.ConvertNullToString(dr["Comments2"]);
                            this.Add(++count, tmmt);
                        }
                    }
                    dr.Close();
                    sc.Dispose();
                    Cnxn.Close();
                    int status = Formatting.ConvertNullToInt32(sc.Parameters["@status"].Value);
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
    }
}
