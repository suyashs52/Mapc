using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MapC.Models
{
    public class BatelleFDB
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
        internal DataTable FillList(int id, string country = "")
        {
            try
            {
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
    public class BatelleMapCollection : Dictionary<int, Batelle>
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;

        public BatelleMapCollection()
        { }
        public BatelleMapCollection(int id)
        {
            try
            {
                Batelle mmf;
                int count = 0;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.Add("@inputKey", SqlDbType.Int);
                    sc.Parameters["@inputKey"].Value = id;
                    sc.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                    sc.Parameters["@status"].Direction = ParameterDirection.Output;
                    Cnxn.Open();
                    SqlDataReader dr = sc.ExecuteReader();

                    while (dr.Read())
                    {
                         
                        mmf = new Batelle();
                        mmf.ID = Formatting.ConvertNullToString(dr["ID"]);
                        mmf.Producer = Formatting.ConvertNullToString(dr["Producer"]);
                        mmf.Brand = Formatting.ConvertNullToString(dr["Brand"]);
                        mmf.Country = Formatting.ConvertNullToString(dr["Country"]);
                        mmf.Year = Formatting.ConvertNullToString(dr["Year"]);
                        
                        this.Add(++count, mmf);
                    }
                    dr.Close();
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

    }
}