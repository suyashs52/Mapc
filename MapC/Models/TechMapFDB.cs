using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MapC.Models
{
    public class TechMapFDB
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;

        public void TechMapFList()
        {
           

        }

        internal DataTable FillList(int id, string country = "")
        {
            try
            {
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("TechMapF", Cnxn);
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

    public class TechMapFCollection : Dictionary<int, TechMapF>
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;

        public TechMapFCollection()
        { }
        public TechMapFCollection(int id)
        {
            try
            {
                TechMapF mmf;

                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("TechMapF", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    SqlDataReader dr = sc.ExecuteReader();
                    while (dr.Read())
                    {
                        mmf = new TechMapF();
                        mmf.ID = Formatting.ConvertNullToInt32(dr["ID"]);
                        mmf.Country = Formatting.ConvertNullToString(dr["Country"]);
                        mmf.AccountName = Formatting.ConvertNullToString(dr["AccountName"]);
                        mmf.BrandName = Formatting.ConvertNullToString(dr["BrandName"]);
                        mmf.Tier = Formatting.ConvertNullToString(dr["Tier"]);
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
}