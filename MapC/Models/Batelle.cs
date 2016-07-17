using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MapC.Models
{
    public class Batelle
    {
        #region "variable"
        public decimal AlcInsol;
        public decimal AlcSol;
        public decimal AppDens;
        public decimal Bl;
        public String Brand;
        public decimal Bu;
        public decimal Ca;
        public String Country;
        public decimal DryRes;
        public decimal En;
        public decimal Fi;
        public decimal Fo;
        public decimal Hy;
        public String ID;
        public decimal Mi;
        public decimal OnTapDens;
        public String PenInd;
        public decimal pH;
        public decimal Po;
        public String ProdCode;
        public String Producer;
        public decimal So;
        public decimal Su;
        public String SubType;
        public String Type;
        public String Visc;
        public String Year;

        #endregion
        public Batelle() { }
        public Batelle(int id, string tmmtId = "0")
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
                        AlcInsol = Formatting.ConvertNullToDecimal(dr["AlcInsol"]);
                        AlcSol = Formatting.ConvertNullToDecimal(dr["AlcSol"]);
                        AppDens = Formatting.ConvertNullToDecimal(dr["AppDens"]);
                        Bl = Formatting.ConvertNullToDecimal(dr["Bl"]);
                        Brand = Formatting.ConvertNullToString(dr["Brand"]);
                        Bu = Formatting.ConvertNullToDecimal(dr["Bu"]);
                        Ca = Formatting.ConvertNullToDecimal(dr["Ca"]);
                        Country = Formatting.ConvertNullToString(dr["Country"]);
                        DryRes = Formatting.ConvertNullToDecimal(dr["DryRes"]);
                        En = Formatting.ConvertNullToDecimal(dr["En"]);
                        Fi = Formatting.ConvertNullToDecimal(dr["Fi"]);
                        Fo = Formatting.ConvertNullToDecimal(dr["Fo"]);
                        Hy = Formatting.ConvertNullToDecimal(dr["Hy"]);
                        ID = Formatting.ConvertNullToString(dr["ID"]);
                        Mi = Formatting.ConvertNullToDecimal(dr["Mi"]);
                        OnTapDens = Formatting.ConvertNullToDecimal(dr["OnTapDens"]);
                        PenInd = Formatting.ConvertNullToString(dr["PenInd"]);
                        pH = Formatting.ConvertNullToDecimal(dr["pH"]);
                        Po = Formatting.ConvertNullToDecimal(dr["Po"]);
                        ProdCode = Formatting.ConvertNullToString(dr["ProdCode"]);
                        Producer = Formatting.ConvertNullToString(dr["Producer"]);
                        So = Formatting.ConvertNullToDecimal(dr["So"]);
                        Su = Formatting.ConvertNullToDecimal(dr["Su"]);
                        SubType = Formatting.ConvertNullToString(dr["SubType"]);
                        Type = Formatting.ConvertNullToString(dr["Type"]);
                        Visc = Formatting.ConvertNullToString(dr["Visc"]);
                        Year = Formatting.ConvertNullToString(dr["Year"]);


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
        public void SaveGen(int id)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 960)
                {
                }
                else if (id == 955)
                {

                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
    public class BatSurfactantsT
    {
        #region "variable"
        public String AAA;
        public String AAB;
        public Decimal AAG;
        public String AAO;
        public String AB;
        public String ADHEB;
        public String ADMA;
        public String ADMBAC;
        public String ADMEAQ;
        public String ADMEBAC;
        public String AE;
        public String AEO;
        public String AEO_APG;
        public Decimal AEO_PO;
        public String AEO_PO_PEG;
        public String AEOS;
        public String AEOS_APEOS;
        public String Alpha_FAMES;
        public Decimal Amphoterics;
        public String AOS;
        public String APE;
        public String APE_AEO;
        public Decimal APED;
        public String APEOS;
        public String APG;
        public String AS_AEOS;
        public String AS_APEOS;
        public String ASs;
        public String ATMAC;
        public String ATMAEOC;
        public String BABS;
        public String BAPDA;
        public String Benzoic_deriv_;
        public String Brand;
        public Decimal Cationics;
        public String Country;
        public String Cyclodextr__Der_;
        public String Cyclodextrin;
        public String Cyclodextrine;
        public String DAAAQ;
        public String DADMAC;
        public String DEDEAQ;
        public String DETEAQ;
        public String DMADA;
        public String DMBAC;
        public String DMEBAC;
        public String EFME;
        public String EthylcaproicNa;
        public Decimal FAGA;
        public String FAME;
        public String Fatty_Alcohol;
        public String FFA;
        public String Fluorinated_cmpd;
        public String Fluoroc_tone;
        public String Glycine_deriv_;
        public String ID;
        public String Imidazoline_Der_;
        public String Isothiazolinone_der_;
        public String LAS;
        public String MEE;
        public String MES;
        public String NO;
        public Decimal NonIonics;
        public String Phthalimide_deriv_;
        public String POE_Sorbitan_Ester;
        public String Poly_Asparaginate;
        public String ProdCode;
        public String Producer;
        public String Sarkosyl;
        public String SAS;
        public Decimal Soaps;
        public String SubType;
        public String SulfoAcetate;
        public String Sulfobetaine;
        public Decimal Sulphates;
        public Decimal Sulphonates;
        public Decimal TMAC;
        public String tr_tr_muconic_acid_Na_salt;
        public String Type;
        public String Unknown;
        public String WAX;
        public String Year;


        #endregion

        public BatSurfactantsT() { }
        public BatSurfactantsT(int id, string tmmtId = "0")
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
                        AAA = Formatting.ConvertNullToString(dr["AAA"]);
                        AAB = Formatting.ConvertNullToString(dr["AAB"]);
                        AAG = Formatting.ConvertNullToDecimal(dr["AAG"]);
                        AAO = Formatting.ConvertNullToString(dr["AAO"]);
                        AB = Formatting.ConvertNullToString(dr["AB"]);
                        ADHEB = Formatting.ConvertNullToString(dr["ADHEB"]);
                        ADMA = Formatting.ConvertNullToString(dr["ADMA"]);
                        ADMBAC = Formatting.ConvertNullToString(dr["ADMBAC"]);
                        ADMEAQ = Formatting.ConvertNullToString(dr["ADMEAQ"]);
                        ADMEBAC = Formatting.ConvertNullToString(dr["ADMEBAC"]);
                        AE = Formatting.ConvertNullToString(dr["AE"]);
                        AEO = Formatting.ConvertNullToString(dr["AEO"]);
                        AEO_APG = Formatting.ConvertNullToString(dr["AEO_APG"]);
                        AEO_PO = Formatting.ConvertNullToDecimal(dr["AEO_PO"]);
                        AEO_PO_PEG = Formatting.ConvertNullToString(dr["AEO_PO_PEG"]);
                        AEOS = Formatting.ConvertNullToString(dr["AEOS"]);
                        AEOS_APEOS = Formatting.ConvertNullToString(dr["AEOS_APEOS"]);
                        Alpha_FAMES = Formatting.ConvertNullToString(dr["Alpha_FAMES"]);
                        Amphoterics = Formatting.ConvertNullToDecimal(dr["Amphoterics"]);
                        AOS = Formatting.ConvertNullToString(dr["AOS"]);
                        APE = Formatting.ConvertNullToString(dr["APE"]);
                        APE_AEO = Formatting.ConvertNullToString(dr["APE_AEO"]);
                        APED = Formatting.ConvertNullToDecimal(dr["APED"]);
                        APEOS = Formatting.ConvertNullToString(dr["APEOS"]);
                        APG = Formatting.ConvertNullToString(dr["APG"]);
                        AS_AEOS = Formatting.ConvertNullToString(dr["AS_AEOS"]);
                        AS_APEOS = Formatting.ConvertNullToString(dr["AS_APEOS"]);
                        ASs = Formatting.ConvertNullToString(dr["ASs"]);
                        ATMAC = Formatting.ConvertNullToString(dr["ATMAC"]);
                        ATMAEOC = Formatting.ConvertNullToString(dr["ATMAEOC"]);
                        BABS = Formatting.ConvertNullToString(dr["BABS"]);
                        BAPDA = Formatting.ConvertNullToString(dr["BAPDA"]);
                        Benzoic_deriv_ = Formatting.ConvertNullToString(dr["Benzoic_deriv_"]);
                        Brand = Formatting.ConvertNullToString(dr["Brand"]);
                        Cationics = Formatting.ConvertNullToDecimal(dr["Cationics"]);
                        Country = Formatting.ConvertNullToString(dr["Country"]);
                        Cyclodextr__Der_ = Formatting.ConvertNullToString(dr["Cyclodextr__Der_"]);
                        Cyclodextrin = Formatting.ConvertNullToString(dr["Cyclodextrin"]);
                        Cyclodextrine = Formatting.ConvertNullToString(dr["Cyclodextrine"]);
                        DAAAQ = Formatting.ConvertNullToString(dr["DAAAQ"]);
                        DADMAC = Formatting.ConvertNullToString(dr["DADMAC"]);
                        DEDEAQ = Formatting.ConvertNullToString(dr["DEDEAQ"]);
                        DETEAQ = Formatting.ConvertNullToString(dr["DETEAQ"]);
                        DMADA = Formatting.ConvertNullToString(dr["DMADA"]);
                        DMBAC = Formatting.ConvertNullToString(dr["DMBAC"]);
                        DMEBAC = Formatting.ConvertNullToString(dr["DMEBAC"]);
                        EFME = Formatting.ConvertNullToString(dr["EFME"]);
                        EthylcaproicNa = Formatting.ConvertNullToString(dr["EthylcaproicNa"]);
                        FAGA = Formatting.ConvertNullToDecimal(dr["FAGA"]);
                        FAME = Formatting.ConvertNullToString(dr["FAME"]);
                        Fatty_Alcohol = Formatting.ConvertNullToString(dr["Fatty_Alcohol"]);
                        FFA = Formatting.ConvertNullToString(dr["FFA"]);
                        Fluorinated_cmpd = Formatting.ConvertNullToString(dr["Fluorinated_cmpd"]);
                        Fluoroc_tone = Formatting.ConvertNullToString(dr["Fluoroc_tone"]);
                        Glycine_deriv_ = Formatting.ConvertNullToString(dr["Glycine_deriv_"]);
                        ID = Formatting.ConvertNullToString(dr["ID"]);
                        Imidazoline_Der_ = Formatting.ConvertNullToString(dr["Imidazoline_Der_"]);
                        Isothiazolinone_der_ = Formatting.ConvertNullToString(dr["Isothiazolinone_der_"]);
                        LAS = Formatting.ConvertNullToString(dr["LAS"]);
                        MEE = Formatting.ConvertNullToString(dr["MEE"]);
                        MES = Formatting.ConvertNullToString(dr["MES"]);
                        NO = Formatting.ConvertNullToString(dr["NO"]);
                        NonIonics = Formatting.ConvertNullToDecimal(dr["NonIonics"]);
                        Phthalimide_deriv_ = Formatting.ConvertNullToString(dr["Phthalimide_deriv_"]);
                        POE_Sorbitan_Ester = Formatting.ConvertNullToString(dr["POE_Sorbitan_Ester"]);
                        Poly_Asparaginate = Formatting.ConvertNullToString(dr["Poly_Asparaginate"]);
                        ProdCode = Formatting.ConvertNullToString(dr["ProdCode"]);
                        Producer = Formatting.ConvertNullToString(dr["Producer"]);
                        Sarkosyl = Formatting.ConvertNullToString(dr["Sarkosyl"]);
                        SAS = Formatting.ConvertNullToString(dr["SAS"]);
                        Soaps = Formatting.ConvertNullToDecimal(dr["Soaps"]);
                        SubType = Formatting.ConvertNullToString(dr["SubType"]);
                        SulfoAcetate = Formatting.ConvertNullToString(dr["SulfoAcetate"]);
                        Sulfobetaine = Formatting.ConvertNullToString(dr["Sulfobetaine"]);
                        Sulphates = Formatting.ConvertNullToDecimal(dr["Sulphates"]);
                        Sulphonates = Formatting.ConvertNullToDecimal(dr["Sulphonates"]);
                        TMAC = Formatting.ConvertNullToDecimal(dr["TMAC"]);
                        tr_tr_muconic_acid_Na_salt = Formatting.ConvertNullToString(dr["tr_tr_muconic_acid_Na_salt"]);
                        Type = Formatting.ConvertNullToString(dr["Type"]);
                        Unknown = Formatting.ConvertNullToString(dr["Unknown"]);
                        WAX = Formatting.ConvertNullToString(dr["WAX"]);
                        Year = Formatting.ConvertNullToString(dr["Year"]);

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
        public void Save(int id)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 960)
                {
                    input = "[BatSurfactantsT] SET AAA	='" + AAA + "',AAB='" + AAB + "',AAG='" + AAG + "',AAO='" + AAO + "',AB='" + AB + "',ADHEB='" + ADHEB + "',ADMA='" + ADMA + "',ADMBAC='" + ADMBAC + "',ADMEAQ='" + ADMEAQ
                        + "',ADMEBAC='" + ADMEBAC + "',AE='" + AE + "',AEO='" + AEO + "',AEO_APG='" + AEO_APG + "',AEO_PO='" + AEO_PO + "',AEO_PO_PEG='" + AEO_PO_PEG + "',AEOS='" + AEOS
                        + "',AEOS_APEOS='" + AEOS_APEOS + "',Alpha_FAMES='" + Alpha_FAMES + "',Amphoterics='" + Amphoterics + "',AOS='" + AOS + "',APE='" + APE + "',APE_AEO='" + APE_AEO + "',APED='" + APED
                        + "',APEOS='" + APEOS + "',APG='" + APG + "',AS_AEOS='" + AS_AEOS + "',AS_APEOS='" + AS_APEOS + "',ASs='" + ASs + "',ATMAC='" + ATMAC + "',ATMAEOC='" + ATMAEOC + "',BABS='" + BABS
                        + "',BAPDA='" + BAPDA + "',Benzoic_deriv_='" + Benzoic_deriv_ + "',Brand='" + Brand + "',Cationics='" + Cationics + "',Country='" + Country + "',Cyclodextr__Der_='" + Cyclodextr__Der_
                        + "',Cyclodextrin='" + Cyclodextrin + "',Cyclodextrine='" + Cyclodextrine + "',DAAAQ='" + DAAAQ + "',DADMAC='" + DADMAC + "',DEDEAQ='" + DEDEAQ + "',DETEAQ='" + DETEAQ
                        + "',DMADA='" + DMADA + "',DMBAC='" + DMBAC + "',DMEBAC='" + DMEBAC + "',EFME='" + EFME + "',EthylcaproicNa='" + EthylcaproicNa + "',FAGA='" + FAGA + "',FAME='" + FAME
                        + "',Fatty_Alcohol='" + Fatty_Alcohol + "',FFA='" + FFA + "',Fluorinated_cmpd='" + Fluorinated_cmpd + "',Fluoroc_tone='" + Fluoroc_tone + "',Glycine_deriv_='" + Glycine_deriv_
                        + "',ID='" + ID + "',Imidazoline_Der_='" + Imidazoline_Der_ + "',Isothiazolinone_der_='" + Isothiazolinone_der_ + "',LAS='" + LAS + "',MEE='" + MEE + "',MES='" + MES
                        + "',NO='" + NO + "',NonIonics='" + NonIonics + "',Phthalimide_deriv_='" + Phthalimide_deriv_ + "',POE_Sorbitan_Ester='" + POE_Sorbitan_Ester + "',Poly_Asparaginate='" + Poly_Asparaginate
                        + "',ProdCode='" + ProdCode + "',Producer='" + Producer + "',Sarkosyl='" + Sarkosyl + "',SAS='" + SAS + "',Soaps='" + Soaps + "',SubType='" + SubType + "',SulfoAcetate='" + SulfoAcetate
                        + "',Sulfobetaine='" + Sulfobetaine + "',Sulphates='" + Sulphates + "',Sulphonates='" + Sulphonates + "',TMAC='" + TMAC + "',tr_tr_muconic_acid_Na_salt='" + tr_tr_muconic_acid_Na_salt
                        + "',Type='" + Type + "',Unknown='" + Unknown + "',WAX='" + WAX + "',Year='" + Year + "' WHERE ID='" + ID + "'";
                }
                else if (id == 955)
                {
                    input = "BatSurfactantsT (AAA,AAB,AAG,AAO,AB,ADHEB,ADMA,ADMBAC,ADMEAQ,ADMEBAC,AE,AEO,AEO_APG,AEO_PO,AEO_PO_PEG,AEOS,EOS_APEOS,Alpha_FAMES,Amphoterics,AOS,APE,APE_AEO,APED,"
                            +"APEOS,APG,AS_AEOS,AS_APEOS,ASs,ATMAC,TMAEOC,BABS,BAPDA,Benzoic_deriv_,Brand,Cationics,Country,yclodextr__Der_,Cyclodextrin,Cyclodextrine,DAAAQ,"
                            +"DADMAC,DEDEAQ,DETEAQ,DMADA,DMBAC,DMEBAC,EFME,EthylcaproicNa,FAGA,FAME,atty_Alcohol,FFA,Fluorinated_cmpd,Fluoroc_tone,Glycine_deriv_,ID,"
                            +"Imidazoline_Der_,Isothiazolinone_der_,LAS,MEE,MES,NO,NonIonics,Phthalimide_deriv_,POE_Sorbitan_Ester,Poly_Asparaginate,ProdCode,Producer,Sarkosyl,"
                            +"SAS,Soaps,SubType,SulfoAcetate,Sulfobetaine,Sulphates,Sulphonates,TMAC,tr_tr_muconic_acid_Na_salt,Type,Unknown,WAX,Year) Values("
                            +"'"+AAA+ "','"+AAB+ "','"+AAG+ "','"+AAO+ "','"+AB+ "','"+ADHEB+ "','"+ADMA+ "','"+ADMBAC+ "','"+ADMEAQ+ "','"+ADMEBAC+ "','"+AE+ "','"+AEO+ "',"
                            + "'" + AEO_APG + "','" + AEO_PO + "','" + AEO_PO_PEG + "','" + AEOS + "','" + AEOS_APEOS + "','" + Alpha_FAMES + "','" + Amphoterics + "','" + AOS + "','" + APE + "','" + APE_AEO + "',"
                            +"'"+APED+ "','"+APEOS+ "','"+APG+ "','"+AS_AEOS+ "',"+AS_APEOS+ "','"+ASs+ "','"+ATMAC+ "','"+ATMAEOC+ "','"+BABS+ "','"+BAPDA+ "','"+Benzoic_deriv_+ "',"
                            +"'"+Brand+ "','"+Cationics+ "','"+Country+ "','"+Cyclodextr__Der_+ "','"+Cyclodextrin+ "','"+Cyclodextrine+ "','"+DAAAQ+ "','"+DADMAC+ "','"+DEDEAQ+ "',"
                            +"'"+DETEAQ+ "','"+DMADA+ "','"+DMBAC+ "','"+DMEBAC+ "','"+EFME+ "','"+EthylcaproicNa+ "','"+FAGA+ "','"+FAME+ "','"+Fatty_Alcohol+ "','"+FFA+ "','"+Fluorinated_cmpd+ "',"
                            +"'"+Fluoroc_tone+ "','"+Glycine_deriv_+ "','"+ID+ "','"+Imidazoline_Der_+ "','"+Isothiazolinone_der_+ "','"+LAS+ "','"+MEE+ "','"+MES+ "','"+NO+ "',"
                            +"'"+NonIonics+ "','"+Phthalimide_deriv_+ "','"+POE_Sorbitan_Ester+ "','"+Poly_Asparaginate+ "',"+ProdCode+ "','"+Producer+ "','"+Sarkosyl+ "','"+SAS+ "',"
                            +"'"+Soaps+ "','"+SubType+ "','"+SulfoAcetate+ "','"+Sulfobetaine+ "','"+Sulphates+ "','"+Sulphonates+ "','"+TMAC+ "','"+tr_tr_muconic_acid_Na_salt+ "','"+Type+ "',"
                            +"'"+Unknown+ "','"+WAX+ "','"+Year+ "')";
                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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

    public class BatPolymers
    {
        #region "variable"
        public Decimal Acry_Sulf_Copolymer;
        public String Brand;
        public Decimal Cellulose;
        public String Country;
        public Decimal DMDAAC_AM;
        public Decimal Guar_gum;
        public String ID;
        public Decimal PCA_Sulf_Terpolymer;
        public Decimal PCACopolymer;
        public Decimal PCAHomopolymer;
        public Decimal PCAsilicate_polymer;
        public Decimal PEG;
        public Decimal PEG_Carboxylate;
        public Decimal Polyamine_type;
        public Decimal Polyethylene_immine;
        public Decimal Polysulfonate;
        public Decimal Polyvinylalcohol;
        public String ProdCode;
        public String Producer;
        public Decimal PVP;
        public Decimal PVP_VI;
        public Decimal PVPNO;
        public Decimal SRP;
        public String SubType;
        public String Type;
        public Decimal Xanthan_Gum;
        public String Year;

        #endregion
        public BatPolymers() { }
        public BatPolymers(int id, string tmmtId = "0")
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
                        Acry_Sulf_Copolymer = Formatting.ConvertNullToDecimal(dr["Acry_Sulf_Copolymer"]);
                        Brand = Formatting.ConvertNullToString(dr["Brand"]);
                        Cellulose = Formatting.ConvertNullToDecimal(dr["Cellulose"]);
                        Country = Formatting.ConvertNullToString(dr["Country"]);
                        DMDAAC_AM = Formatting.ConvertNullToDecimal(dr["DMDAAC_AM"]);
                        Guar_gum = Formatting.ConvertNullToDecimal(dr["Guar_gum"]);
                        ID = Formatting.ConvertNullToString(dr["ID"]);
                        PCA_Sulf_Terpolymer = Formatting.ConvertNullToDecimal(dr["PCA_Sulf_Terpolymer"]);
                        PCACopolymer = Formatting.ConvertNullToDecimal(dr["PCACopolymer"]);
                        PCAHomopolymer = Formatting.ConvertNullToDecimal(dr["PCAHomopolymer"]);
                        PCAsilicate_polymer = Formatting.ConvertNullToDecimal(dr["PCAsilicate_polymer"]);
                        PEG = Formatting.ConvertNullToDecimal(dr["PEG"]);
                        PEG_Carboxylate = Formatting.ConvertNullToDecimal(dr["PEG_Carboxylate"]);
                        Polyamine_type = Formatting.ConvertNullToDecimal(dr["Polyamine_type"]);
                        Polyethylene_immine = Formatting.ConvertNullToDecimal(dr["Polyethylene_immine"]);
                        Polysulfonate = Formatting.ConvertNullToDecimal(dr["Polysulfonate"]);
                        Polyvinylalcohol = Formatting.ConvertNullToDecimal(dr["Polyvinylalcohol"]);
                        ProdCode = Formatting.ConvertNullToString(dr["ProdCode"]);
                        Producer = Formatting.ConvertNullToString(dr["Producer"]);
                        PVP = Formatting.ConvertNullToDecimal(dr["PVP"]);
                        PVP_VI = Formatting.ConvertNullToDecimal(dr["PVP_VI"]);
                        PVPNO = Formatting.ConvertNullToDecimal(dr["PVPNO"]);
                        SRP = Formatting.ConvertNullToDecimal(dr["SRP"]);
                        SubType = Formatting.ConvertNullToString(dr["SubType"]);
                        Type = Formatting.ConvertNullToString(dr["Type"]);
                        Xanthan_Gum = Formatting.ConvertNullToDecimal(dr["Xanthan_Gum"]);
                        Year = Formatting.ConvertNullToString(dr["Year"]);


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
        public void Save(int id)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 960)
                {
                    input = "[BatPolymersT] SET Acry_Sulf_Copolymer='" + Acry_Sulf_Copolymer + "',Brand='" + Brand + "',Cellulose='" + Cellulose + "',Country='" + Country + "',DMDAAC_AM='" + DMDAAC_AM + "',"
                            + "Guar_gum='" + Guar_gum + "',ID='" + ID + "',PCA_Sulf_Terpolymer='" + PCA_Sulf_Terpolymer + "',PCACopolymer='" + PCACopolymer + "',PCAHomopolymer='" + PCAHomopolymer + "',"
                            + "PCAsilicate_polymer='" + PCAsilicate_polymer + "',PEG='" + PEG + "',PEG_Carboxylate='" + PEG_Carboxylate + "',Polyamine_type='" + Polyamine_type + "',Polyethylene_immine='" + Polyethylene_immine + "',"
                            + "Polysulfonate='" + Polysulfonate + "',Polyvinylalcohol='" + Polyvinylalcohol + "',ProdCode='" + ProdCode + "',Producer='" + Producer + "',PVP='" + PVP + "',"
                            + "PVP_VI='" + PVP_VI + "',PVPNO='" + PVPNO + "',SRP='" + SRP + "',SubType='" + SubType + "',Type='" + Type + "',Xanthan_Gum='" + Xanthan_Gum + "',Year='" + Year + "' WHERE ID='"+ID+"'";

                                            }
                else if (id == 955)
                {
                    input = "BatPolymersT (Acry_Sulf_Copolymer,Brand,Cellulose,Country,DMDAAC_AM,Guar_gum,ID,PCA_Sulf_Terpolymer,PCACopolymer,PCAHomopolymer,PCAsilicate_polymer,PEG,"
                            + "PEG_Carboxylate,Polyamine_type,Polyethylene_immine,Polysulfonate,Polyvinylalcohol,ProdCode,Producer,VP,PVP_VI,PVPNO,SRP,SubType,Type,Xanthan_Gum,Year) Values("
                            + "'" + Acry_Sulf_Copolymer + "','" + Brand + "','" + Cellulose + "','" + Country + "','" + DMDAAC_AM + "','" + Guar_gum + "','" + ID + "','" + PCA_Sulf_Terpolymer + "','" + PCACopolymer + "',"
                            + "'" + PCAHomopolymer + "','" + PCAsilicate_polymer + "','" + PEG + "','" + PEG_Carboxylate + "','" + Polyamine_type + "','" + Polyethylene_immine + "','" + Polysulfonate + "',"
                            + "'" + Polyvinylalcohol + "','" + ProdCode + "','" + Producer + "','" + PVP + "','" + PVP_VI + "','" + PVPNO + "','" + SRP + "','" + SubType + "','" + Type + "','" + Xanthan_Gum + "','" + Year + "')";

                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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

    public class BatBleach
    {
        #region "variable"
        public Decimal Accelerator;
        public Decimal ActivatorNOBS;
        public Decimal ActivatorTAED;
        public Decimal ActiveOxygen;
        public Decimal Boron;
        public String Brand;
        public Decimal ChlorineBleach;
        public String Country;
        public Decimal H2O2;
        public String ID;
        public Decimal PAP;
        public Decimal PerCarb;
        public String ProdCode;
        public String Producer;
        public Decimal Sodium_Dichloroisocyanurate;
        public Decimal SPM;
        public Decimal SPT;
        public String SubType;
        public Decimal Trichloroisocyanuric_Acid;
        public String Type;
        public String Year;
        public Decimal Zinc_Phthalocyanine_Sulphonate;
        public Decimal Zn_PhS;

        #endregion
        public BatBleach() { }
        public BatBleach(int id, string tmmtId = "0")
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
                        Accelerator = Formatting.ConvertNullToDecimal(dr["Accelerator"]);
                        ActivatorNOBS = Formatting.ConvertNullToDecimal(dr["ActivatorNOBS"]);
                        ActivatorTAED = Formatting.ConvertNullToDecimal(dr["ActivatorTAED"]);
                        ActiveOxygen = Formatting.ConvertNullToDecimal(dr["ActiveOxygen"]);
                        Boron = Formatting.ConvertNullToDecimal(dr["Boron"]);
                        Brand = Formatting.ConvertNullToString(dr["Brand"]);
                        ChlorineBleach = Formatting.ConvertNullToDecimal(dr["ChlorineBleach"]);
                        Country = Formatting.ConvertNullToString(dr["Country"]);
                        H2O2 = Formatting.ConvertNullToDecimal(dr["H2O2"]);
                        ID = Formatting.ConvertNullToString(dr["ID"]);
                        PAP = Formatting.ConvertNullToDecimal(dr["PAP"]);
                        PerCarb = Formatting.ConvertNullToDecimal(dr["PerCarb"]);
                        ProdCode = Formatting.ConvertNullToString(dr["ProdCode"]);
                        Producer = Formatting.ConvertNullToString(dr["Producer"]);
                        Sodium_Dichloroisocyanurate = Formatting.ConvertNullToDecimal(dr["Sodium_Dichloroisocyanurate"]);
                        SPM = Formatting.ConvertNullToDecimal(dr["SPM"]);
                        SPT = Formatting.ConvertNullToDecimal(dr["SPT"]);
                        SubType = Formatting.ConvertNullToString(dr["SubType"]);
                        Trichloroisocyanuric_Acid = Formatting.ConvertNullToDecimal(dr["Trichloroisocyanuric_Acid"]);
                        Type = Formatting.ConvertNullToString(dr["Type"]);
                        Year = Formatting.ConvertNullToString(dr["Year"]);
                        Zinc_Phthalocyanine_Sulphonate = Formatting.ConvertNullToDecimal(dr["Zinc_Phthalocyanine_Sulphonate"]);
                        Zn_PhS = Formatting.ConvertNullToDecimal(dr["Zn_PhS"]);

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
        public void Save(int id)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 960)
                {
                    input = " [BatBleachT] set Accelerator	='" + Accelerator + "',ActivatorNOBS='" + ActivatorNOBS + "',ActivatorTAED='" + ActivatorTAED + "',ActiveOxygen='" + ActiveOxygen + "',"
                            + "Boron='" + Boron + "',Brand='" + Brand + "',ChlorineBleach='" + ChlorineBleach + "',Country='" + Country + "',H2O2='" + H2O2 + "',ID='" + ID + "',PAP='" + PAP + "',PerCarb='" + PerCarb + "',"
                            + "ProdCode='" + ProdCode + "',Producer='" + Producer + "',Sodium_Dichloroisocyanurate='" + Sodium_Dichloroisocyanurate + "',"
                            + "SPM='" + SPM + "',SPT='" + SPT + "',SubType='" + SubType + "',Trichloroisocyanuric_Acid='" + Trichloroisocyanuric_Acid + "',Type='" + Type + "',Year='" + Year + "',Zinc_Phthalocyanine_Sulphonate='" + Zinc_Phthalocyanine_Sulphonate + "',"
                            + "Zn_PhS='" + Zn_PhS + "' WHERE ID='"+ID+"'";

                }
                else if (id == 955)
                {
                    input = "Accelerator,ActivatorNOBS,ActivatorTAED,ActiveOxygen,Boron,Brand,ChlorineBleach,Country,H2O2,ID,PAP,PerCarb,ProdCode,Producer,Sodium_Dichloroisocyanurate,"
                            + "SPM,SPT,SubType,Trichloroisocyanuric_Acid,Type,Year,Zinc_Phthalocyanine_Sulphonate,Zn_PhS VALUES("
                            + "'" + Accelerator + "','" + ActivatorNOBS + "','" + ActivatorTAED + "','" + ActiveOxygen + "','" + Boron + "','" + Brand + "','" + ChlorineBleach + "','" + Country + "','" + H2O2 + "',"
                            + "'" + ID + "','" + PAP + "','" + PerCarb + "','" + ProdCode + "','" + Producer + "','" + Sodium_Dichloroisocyanurate + "','" + SPM + "','" + SPT + "','" + SubType + "','" + Trichloroisocyanuric_Acid + "',"
                            + "'" + Type + "','" + Year + "','" + Zinc_Phthalocyanine_Sulphonate + "','" + Zn_PhS + "')";

                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
    public class BatBuilders
    {
        #region "variable"
        public Decimal AcetateNa;
        public Decimal Active_Carbon;
        public Decimal ATMP;
        public Decimal Bentonite;
        public Decimal Benzoic_acid;
        public String Brand;
        public Decimal CitrateNa;
        public Decimal Citric_Acid;
        public Decimal Clay;
        public String Country;
        public Decimal DPG;
        public Decimal DTMPA;
        public Decimal DTPA;
        public Decimal DTPMP;
        public Decimal EDDS;
        public Decimal EDTA;
        public Decimal EDTMPA;
        public Decimal GLDA;
        public Decimal HEDP;
        public String ID;
        public Decimal Kaolin;
        public Decimal Lactic_Acid;
        public Decimal LaySilic;
        public Decimal MGDA;
        public Decimal Na_Adipate;
        public Decimal Na_Formiate;
        public Decimal Na_gluconate;
        public Decimal Na_metasilicate_anh_;
        public Decimal Na_poly_aspartate_;
        public Decimal Na_Salicylate;
        public Decimal Na_Sebacate;
        public Decimal Na_succinate;
        public Decimal Na_Tartrate;
        public Decimal Na2CO3;
        public Decimal Na2O_2SiO2;
        public Decimal Na3PO4;
        public Decimal Na4P2O7;
        public Decimal Na5P3O10;
        public Decimal NaHCO3;
        public Decimal NTA;
        public Decimal Paper_Sheets;
        public Decimal Phosphoric_acid;
        public String ProdCode;
        public String Producer;
        public Decimal Silica;
        public Decimal Strach;
        public String SubType;
        public Decimal Sucrose;
        public Decimal Sulfamic_acid;
        public Decimal Textile;
        public Decimal Trimethoxy_Benzoic_acid;
        public String Type;
        public Decimal Urea;
        public String Year;
        public Decimal Zeolite4A;
        public Decimal ZeoliteP;
        public Decimal ZnO;

        #endregion
        public BatBuilders() { }
        public BatBuilders(int id, string tmmtId = "0") {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
                        AcetateNa = Formatting.ConvertNullToDecimal(dr["AcetateNa"]);
                        Active_Carbon = Formatting.ConvertNullToDecimal(dr["Active_Carbon"]);
                        ATMP = Formatting.ConvertNullToDecimal(dr["ATMP"]);
                        Bentonite = Formatting.ConvertNullToDecimal(dr["Bentonite"]);
                        Benzoic_acid = Formatting.ConvertNullToDecimal(dr["Benzoic_acid"]);
                        Brand = Formatting.ConvertNullToString(dr["Brand"]);
                        CitrateNa = Formatting.ConvertNullToDecimal(dr["CitrateNa"]);
                        Citric_Acid = Formatting.ConvertNullToDecimal(dr["Citric_Acid"]);
                        Clay = Formatting.ConvertNullToDecimal(dr["Clay"]);
                        Country = Formatting.ConvertNullToString(dr["Country"]);
                        DPG = Formatting.ConvertNullToDecimal(dr["DPG"]);
                        DTMPA = Formatting.ConvertNullToDecimal(dr["DTMPA"]);
                        DTPA = Formatting.ConvertNullToDecimal(dr["DTPA"]);
                        DTPMP = Formatting.ConvertNullToDecimal(dr["DTPMP"]);
                        EDDS = Formatting.ConvertNullToDecimal(dr["EDDS"]);
                        EDTA = Formatting.ConvertNullToDecimal(dr["EDTA"]);
                        EDTMPA = Formatting.ConvertNullToDecimal(dr["EDTMPA"]);
                        GLDA = Formatting.ConvertNullToDecimal(dr["GLDA"]);
                        HEDP = Formatting.ConvertNullToDecimal(dr["HEDP"]);
                        ID = Formatting.ConvertNullToString(dr["ID"]);
                        Kaolin = Formatting.ConvertNullToDecimal(dr["Kaolin"]);
                        Lactic_Acid = Formatting.ConvertNullToDecimal(dr["Lactic_Acid"]);
                        LaySilic = Formatting.ConvertNullToDecimal(dr["LaySilic"]);
                        MGDA = Formatting.ConvertNullToDecimal(dr["MGDA"]);
                        Na_Adipate = Formatting.ConvertNullToDecimal(dr["Na_Adipate"]);
                        Na_Formiate = Formatting.ConvertNullToDecimal(dr["Na_Formiate"]);
                        Na_gluconate = Formatting.ConvertNullToDecimal(dr["Na_gluconate"]);
                        Na_metasilicate_anh_ = Formatting.ConvertNullToDecimal(dr["Na_metasilicate_anh_"]);
                        Na_poly_aspartate_ = Formatting.ConvertNullToDecimal(dr["Na_poly_aspartate_"]);
                        Na_Salicylate = Formatting.ConvertNullToDecimal(dr["Na_Salicylate"]);
                        Na_Sebacate = Formatting.ConvertNullToDecimal(dr["Na_Sebacate"]);
                        Na_succinate = Formatting.ConvertNullToDecimal(dr["Na_succinate"]);
                        Na_Tartrate = Formatting.ConvertNullToDecimal(dr["Na_Tartrate"]);
                        Na2CO3 = Formatting.ConvertNullToDecimal(dr["Na2CO3"]);
                        Na2O_2SiO2 = Formatting.ConvertNullToDecimal(dr["Na2O_2SiO2"]);
                        Na3PO4 = Formatting.ConvertNullToDecimal(dr["Na3PO4"]);
                        Na4P2O7 = Formatting.ConvertNullToDecimal(dr["Na4P2O7"]);
                        Na5P3O10 = Formatting.ConvertNullToDecimal(dr["Na5P3O10"]);
                        NaHCO3 = Formatting.ConvertNullToDecimal(dr["NaHCO3"]);
                        NTA = Formatting.ConvertNullToDecimal(dr["NTA"]);
                        Paper_Sheets = Formatting.ConvertNullToDecimal(dr["Paper_Sheets"]);
                        Phosphoric_acid = Formatting.ConvertNullToDecimal(dr["Phosphoric_acid"]);
                        ProdCode = Formatting.ConvertNullToString(dr["ProdCode"]);
                        Producer = Formatting.ConvertNullToString(dr["Producer"]);
                        Silica = Formatting.ConvertNullToDecimal(dr["Silica"]);
                        Strach = Formatting.ConvertNullToDecimal(dr["Strach"]);
                        SubType = Formatting.ConvertNullToString(dr["SubType"]);
                        Sucrose = Formatting.ConvertNullToDecimal(dr["Sucrose"]);
                        Sulfamic_acid = Formatting.ConvertNullToDecimal(dr["Sulfamic_acid"]);
                        Textile = Formatting.ConvertNullToDecimal(dr["Textile"]);
                        Trimethoxy_Benzoic_acid = Formatting.ConvertNullToDecimal(dr["Trimethoxy_Benzoic_acid"]);
                        Type = Formatting.ConvertNullToString(dr["Type"]);
                        Urea = Formatting.ConvertNullToDecimal(dr["Urea"]);
                        Year = Formatting.ConvertNullToString(dr["Year"]);
                        Zeolite4A = Formatting.ConvertNullToDecimal(dr["Zeolite4A"]);
                        ZeoliteP = Formatting.ConvertNullToDecimal(dr["ZeoliteP"]);
                        ZnO = Formatting.ConvertNullToDecimal(dr["ZnO"]);

                    
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
        public void Save(int id)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 960)
                {
                    input = "BatBuildersT SET AcetateNa='" +AcetateNa+ "',Active_Carbon='" +Active_Carbon+ "',ATMP='" +ATMP+ "',Bentonite='" +Bentonite+ "',Benzoic_acid='" +Benzoic_acid+ "',Brand='" +Brand+ "',"
                            +"CitrateNa='" +CitrateNa+ "',Citric_Acid='" +Citric_Acid+ "',Clay='" +Clay+ "',Country='" +Country+ "',DPG='" +DPG+ "',DTMPA='" +DTMPA+ "',DTPA='" +DTPA+ "',"
                            +"DTPMP='" +DTPMP+ "',EDDS='" +EDDS+ "',EDTA='" +EDTA+ "',EDTMPA='" +EDTMPA+ "',GLDA='" +GLDA+ "',HEDP='" +HEDP+ "',ID='" +ID+ "',Kaolin='" +Kaolin+ "',Lactic_Acid='" +Lactic_Acid+ "',"
                            +"LaySilic='" +LaySilic+ "',MGDA='" +MGDA+ "',Na_Adipate='" +Na_Adipate+ "',Na_Formiate='" +Na_Formiate+ "',Na_gluconate='" +Na_gluconate+ "',Na_metasilicate_anh_='" +Na_metasilicate_anh_+ "',"
                            +"Na_poly_aspartate_='" +Na_poly_aspartate_+ "',Na_Salicylate='" +Na_Salicylate+ "',Na_Sebacate='" +Na_Sebacate+ "',Na_succinate='" +Na_succinate+ "',Na_Tartrate='" +Na_Tartrate+ "',"
                            +"Na2CO3='" +Na2CO3+ "',Na2O_2SiO2='" +Na2O_2SiO2+ "',Na3PO4='" +Na3PO4+ "',Na4P2O7='" +Na4P2O7+ "',Na5P3O10='" +Na5P3O10+ "',NaHCO3='" +NaHCO3+ "',NTA='" +NTA+ "',Paper_Sheets='" +Paper_Sheets+ "',"
                            +"Phosphoric_acid='" +Phosphoric_acid+ "',ProdCode='" +ProdCode+ "',Producer='" +Producer+ "',Silica='" +Silica+ "',Strach='" +Strach+ "',SubType='" +SubType+ "',Sucrose='" +Sucrose+ "',"
                            +"Sulfamic_acid='" +Sulfamic_acid+ "',Textile='" +Textile+ "',Trimethoxy_Benzoic_acid='" +Trimethoxy_Benzoic_acid+ "',Type='" +Type+ "',Urea='" +Urea+ "',Year='" +Year+ "',Zeolite4A='" +Zeolite4A+ "',"
                            + "ZeoliteP='" + ZeoliteP + "',ZnO='" + ZnO + "' WHERE ID='" + ID + "'";
                }
                else if (id == 955)
                {
                    input = "BatBuildersT (AcetateNa,Active_Carbon,ATMP,Bentonite,Benzoic_acid,Brand,CitrateNa,Citric_Acid,Clay,Country,DPG,DTMPA,DTPA,DTPMP,EDDS,EDTA,EDTMPA,GLDA,HEDP,ID,Kaolin,Lactic_Acid,"
                            + "LaySilic,MGDA,Na_Adipate,Na_Formiate,Na_gluconate,Na_metasilicate_anh_,Na_poly_aspartate_,Na_Salicylate,Na_Sebacate,Na_succinate,Na_Tartrate,Na2CO3,Na2O_2SiO2,"
                            + "Na3PO4,Na4P2O7,Na5P3O10,NaHCO3,NTA,Paper_Sheets,Phosphoric_acid,ProdCode,Producer,Silica,Strach,SubType,Sucrose,Sulfamic_acid,Textile,Trimethoxy_Benzoic_acid,"
                            + "Type,Urea,Year,Zeolite4A,ZeoliteP,ZnO VALUES('" + AcetateNa + "','" + Active_Carbon + "','" + ATMP + "','" + Bentonite + "','" + Benzoic_acid + "','" + Brand + "','" + CitrateNa + "','" + Citric_Acid + "','" + Clay + "','" + Country + "',"
                            + "'" + DPG + "','" + DTMPA + "','" + DTPA + "','" + DTPMP + "','" + EDDS + "','" + EDTA + "','" + EDTMPA + "','" + GLDA + "','" + HEDP + "','" + ID + "','" + Kaolin + "','" + Lactic_Acid + "',"
                            + "'" + LaySilic + "','" + MGDA + "','" + Na_Adipate + "','" + Na_Formiate + "','" + Na_gluconate + "','" + Na_metasilicate_anh_ + "','" + Na_poly_aspartate_ + "','" + Na_Salicylate + "',"
                            + "'" + Na_Sebacate + "','" + Na_succinate + "','" + Na_Tartrate + "','" + Na2CO3 + "','" + Na2O_2SiO2 + "','" + Na3PO4 + "'," + Na4P2O7 + "','" + Na5P3O10 + "','" + NaHCO3 + "','" + NTA + "',"
                            + "'" + Paper_Sheets + "','" + Phosphoric_acid + "','" + ProdCode + "','" + Producer + "','" + Silica + "','" + Strach + "','" + SubType + "','" + Sucrose + "','" + Sulfamic_acid + "',"
                            + "'" + Textile + "','" + Trimethoxy_Benzoic_acid + "','" + Type + "','" + Urea + "','" + Year + "','" + Zeolite4A + "','" + ZeoliteP + "','" + ZnO + "')";


                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
    public class BatEnzymes
    {
        #region "variable"
        public String Brand;
        public Decimal Carezyme_5SCEVU_G;
        public String Country;
        public String ID;
        public Decimal Lipolase_100KLU_G;
        public String ProdCode;
        public String Producer;
        public Decimal Savinase_16KNPU_G;
        public String SubType;
        public Decimal Termamyl_300KNU_G;
        public String Type;
        public String Year;

        #endregion
        public BatEnzymes() { }
        public BatEnzymes(int id, string tmmtId = "0") {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
                        Brand = Formatting.ConvertNullToString(dr["Brand"]);
                        Carezyme_5SCEVU_G = Formatting.ConvertNullToDecimal(dr["Carezyme_5SCEVU_G"]);
                        Country = Formatting.ConvertNullToString(dr["Country"]);
                        ID = Formatting.ConvertNullToString(dr["ID"]);
                        Lipolase_100KLU_G = Formatting.ConvertNullToDecimal(dr["Lipolase_100KLU_G"]);
                        ProdCode = Formatting.ConvertNullToString(dr["ProdCode"]);
                        Producer = Formatting.ConvertNullToString(dr["Producer"]);
                        Savinase_16KNPU_G = Formatting.ConvertNullToDecimal(dr["Savinase_16KNPU_G"]);
                        SubType = Formatting.ConvertNullToString(dr["SubType"]);
                        Termamyl_300KNU_G = Formatting.ConvertNullToDecimal(dr["Termamyl_300KNU_G"]);
                        Type = Formatting.ConvertNullToString(dr["Type"]);
                        Year = Formatting.ConvertNullToString(dr["Year"]);

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
        public void Save(int id)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 960)
                {
                    input = "[BatEnzymesT] set Brand='" + Brand + "',Carezyme_5SCEVU_G='" + Carezyme_5SCEVU_G + "',Country='" + Country + "',ID='" + ID + "',Lipolase_100KLU_G='" + Lipolase_100KLU_G + "',"
                            +"ProdCode='" +ProdCode+ "',Producer='" +Producer+ "',Savinase_16KNPU_G='" +Savinase_16KNPU_G+ "',SubType='" +SubType+ "',Termamyl_300KNU_G='" +Termamyl_300KNU_G+ "',"
                            + "Type='" + Type + "',Year='" + Year + "' WHERE ID='" + ID + "'";
                }
                else if (id == 955)
                {
                    input = "[BatEnzymesT] (Brand,Carezyme_5SCEVU_G,Country,ID,Lipolase_100KLU_G,ProdCode,Producer,Savinase_16KNPU_G,SubType,Termamyl_300KNU_G,Type,Year) Values("
                        + "'"+Brand+ "','"+Carezyme_5SCEVU_G+ "','"+Country+ "','"+ID+ "','"+Lipolase_100KLU_G+ "','"+ProdCode+ "','"+Producer+ "','"+Savinase_16KNPU_G+ "','"+SubType+ "','"+Termamyl_300KNU_G+ "','"+Type+ "','"+Year+ "')";
                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
    public class BatOthers
    {
        #region "variable"
        public Decimal Acid_Blue_9;
        public Decimal ADPODS;
        public Decimal AGE;
        public Decimal Alkanolamides;
        public String AmidopropylAO;
        public Decimal AmineOxides;
        public String AO;
        public Decimal Ballast;
        public Decimal Benzotriazole;
        public Decimal Benzyl_alcohol;
        public Decimal Blankophor_LPG;
        public Decimal Blankophor_RKH120;
        public Decimal Blankophor_TX;
        public String Brand;
        public Decimal Butenediol;
        public Decimal Butoxydiglycol;
        public Decimal Butoxypropanol;
        public Decimal CaCl2;
        public Decimal CO2;
        public String Country;
        public Decimal DEA;
        public Decimal DEG;
        public Decimal DEGBE;
        public Decimal DEGME;
        public Decimal Distearyl_ether;
        public Decimal DMDM_Hydantoin;
        public Decimal DPGBE;
        public Decimal DPGME;
        public Decimal DPGPE;
        public Decimal EG;
        public Decimal EGBE;
        public Decimal EGHE;
        public Decimal Ethanol;
        public String FADA;
        public String FAMA;
        public String FAMIPA;
        public Decimal Formaldehyde;
        public Decimal Formic_Acid;
        public Decimal FWA;
        public Decimal Glycerol;
        public Decimal Glycol_distearate;
        public Decimal Hexylene_glycol;
        public String ID;
        public Decimal Isopropanol;
        public Decimal Lignin;
        public Decimal MEA;
        public Decimal Methylpropandiol;
        public Decimal MgCl2;
        public Decimal MgSO4;
        public Decimal MPG;
        public Decimal Na2SO4;
        public Decimal NaCl;
        public Decimal NaOH;
        public Decimal NH4OH;
        public Decimal NonPolarHydrocarbons;
        public Decimal Perfumes;
        public Decimal PG;
        public Decimal PGBE;
        public Decimal PGME;
        public Decimal PGPE;
        public Decimal Phenoxy_ethanol;
        public Decimal PPG_Butyl_ether;
        public String ProdCode;
        public String Producer;
        public Decimal Quaternium_15;
        public Decimal SCS;
        public Decimal SiliconOils;
        public Decimal Sorbitol;
        public Decimal STS;
        public String SubType;
        public Decimal Sunflower_seed_oil;
        public Decimal SXS;
        public Decimal TEA;
        public Decimal TEG;
        public Decimal TEGME;
        public Decimal Terpineol;
        public Decimal Tinopal_5BMGX;
        public Decimal Tinopal_AMSGX;
        public Decimal Tinopal_CBSX;
        public Decimal Tinopal_DCS;
        public Decimal Tinopal_SWN;
        public Decimal Tinopal_UNPAGX;
        public Decimal Tinosan;
        public Decimal TiO2;
        public Decimal TPGBE;
        public Decimal TPGME;
        public Decimal Triclosan;
        public Decimal Trihydroxystearin;
        public Decimal TTEG;
        public String Type;
        public Decimal Water;
        public Decimal X_2_Butoxyethanol;
        public String Year;
        public Decimal ZincPyrithione;
        public Decimal Zn_acetate;
        public Decimal ZnCl2;
        public Decimal ZnCO3;
        public Decimal ZnSO4;

        #endregion
        public BatOthers() { }
        public BatOthers(int id, string tmmtId = "0") {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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
                        Acid_Blue_9 = Formatting.ConvertNullToDecimal(dr["Acid_Blue_9"]);
                        ADPODS = Formatting.ConvertNullToDecimal(dr["ADPODS"]);
                        AGE = Formatting.ConvertNullToDecimal(dr["AGE"]);
                        Alkanolamides = Formatting.ConvertNullToDecimal(dr["Alkanolamides"]);
                        AmidopropylAO = Formatting.ConvertNullToString(dr["AmidopropylAO"]);
                        AmineOxides = Formatting.ConvertNullToDecimal(dr["AmineOxides"]);
                        AO = Formatting.ConvertNullToString(dr["AO"]);
                        Ballast = Formatting.ConvertNullToDecimal(dr["Ballast"]);
                        Benzotriazole = Formatting.ConvertNullToDecimal(dr["Benzotriazole"]);
                        Benzyl_alcohol = Formatting.ConvertNullToDecimal(dr["Benzyl_alcohol"]);
                        Blankophor_LPG = Formatting.ConvertNullToDecimal(dr["Blankophor_LPG"]);
                        Blankophor_RKH120 = Formatting.ConvertNullToDecimal(dr["Blankophor_RKH120"]);
                        Blankophor_TX = Formatting.ConvertNullToDecimal(dr["Blankophor_TX"]);
                        Brand = Formatting.ConvertNullToString(dr["Brand"]);
                        Butenediol = Formatting.ConvertNullToDecimal(dr["Butenediol"]);
                        Butoxydiglycol = Formatting.ConvertNullToDecimal(dr["Butoxydiglycol"]);
                        Butoxypropanol = Formatting.ConvertNullToDecimal(dr["Butoxypropanol"]);
                        CaCl2 = Formatting.ConvertNullToDecimal(dr["CaCl2"]);
                        CO2 = Formatting.ConvertNullToDecimal(dr["CO2"]);
                        Country = Formatting.ConvertNullToString(dr["Country"]);
                        DEA = Formatting.ConvertNullToDecimal(dr["DEA"]);
                        DEG = Formatting.ConvertNullToDecimal(dr["DEG"]);
                        DEGBE = Formatting.ConvertNullToDecimal(dr["DEGBE"]);
                        DEGME = Formatting.ConvertNullToDecimal(dr["DEGME"]);
                        Distearyl_ether = Formatting.ConvertNullToDecimal(dr["Distearyl_ether"]);
                        DMDM_Hydantoin = Formatting.ConvertNullToDecimal(dr["DMDM_Hydantoin"]);
                        DPGBE = Formatting.ConvertNullToDecimal(dr["DPGBE"]);
                        DPGME = Formatting.ConvertNullToDecimal(dr["DPGME"]);
                        DPGPE = Formatting.ConvertNullToDecimal(dr["DPGPE"]);
                        EG = Formatting.ConvertNullToDecimal(dr["EG"]);
                        EGBE = Formatting.ConvertNullToDecimal(dr["EGBE"]);
                        EGHE = Formatting.ConvertNullToDecimal(dr["EGHE"]);
                        Ethanol = Formatting.ConvertNullToDecimal(dr["Ethanol"]);
                        FADA = Formatting.ConvertNullToString(dr["FADA"]);
                        FAMA = Formatting.ConvertNullToString(dr["FAMA"]);
                        FAMIPA = Formatting.ConvertNullToString(dr["FAMIPA"]);
                        Formaldehyde = Formatting.ConvertNullToDecimal(dr["Formaldehyde"]);
                        Formic_Acid = Formatting.ConvertNullToDecimal(dr["Formic_Acid"]);
                        FWA = Formatting.ConvertNullToDecimal(dr["FWA"]);
                        Glycerol = Formatting.ConvertNullToDecimal(dr["Glycerol"]);
                        Glycol_distearate = Formatting.ConvertNullToDecimal(dr["Glycol_distearate"]);
                        Hexylene_glycol = Formatting.ConvertNullToDecimal(dr["Hexylene_glycol"]);
                        ID = Formatting.ConvertNullToString(dr["ID"]);
                        Isopropanol = Formatting.ConvertNullToDecimal(dr["Isopropanol"]);
                        Lignin = Formatting.ConvertNullToDecimal(dr["Lignin"]);
                        MEA = Formatting.ConvertNullToDecimal(dr["MEA"]);
                        Methylpropandiol = Formatting.ConvertNullToDecimal(dr["Methylpropandiol"]);
                        MgCl2 = Formatting.ConvertNullToDecimal(dr["MgCl2"]);
                        MgSO4 = Formatting.ConvertNullToDecimal(dr["MgSO4"]);
                        MPG = Formatting.ConvertNullToDecimal(dr["MPG"]);
                        Na2SO4 = Formatting.ConvertNullToDecimal(dr["Na2SO4"]);
                        NaCl = Formatting.ConvertNullToDecimal(dr["NaCl"]);
                        NaOH = Formatting.ConvertNullToDecimal(dr["NaOH"]);
                        NH4OH = Formatting.ConvertNullToDecimal(dr["NH4OH"]);
                        NonPolarHydrocarbons = Formatting.ConvertNullToDecimal(dr["NonPolarHydrocarbons"]);
                        Perfumes = Formatting.ConvertNullToDecimal(dr["Perfumes"]);
                        PG = Formatting.ConvertNullToDecimal(dr["PG"]);
                        PGBE = Formatting.ConvertNullToDecimal(dr["PGBE"]);
                        PGME = Formatting.ConvertNullToDecimal(dr["PGME"]);
                        PGPE = Formatting.ConvertNullToDecimal(dr["PGPE"]);
                        Phenoxy_ethanol = Formatting.ConvertNullToDecimal(dr["Phenoxy_ethanol"]);
                        PPG_Butyl_ether = Formatting.ConvertNullToDecimal(dr["PPG_Butyl_ether"]);
                        ProdCode = Formatting.ConvertNullToString(dr["ProdCode"]);
                        Producer = Formatting.ConvertNullToString(dr["Producer"]);
                        Quaternium_15 = Formatting.ConvertNullToDecimal(dr["Quaternium_15"]);
                        SCS = Formatting.ConvertNullToDecimal(dr["SCS"]);
                        SiliconOils = Formatting.ConvertNullToDecimal(dr["SiliconOils"]);
                        Sorbitol = Formatting.ConvertNullToDecimal(dr["Sorbitol"]);
                        STS = Formatting.ConvertNullToDecimal(dr["STS"]);
                        SubType = Formatting.ConvertNullToString(dr["SubType"]);
                        Sunflower_seed_oil = Formatting.ConvertNullToDecimal(dr["Sunflower_seed_oil"]);
                        SXS = Formatting.ConvertNullToDecimal(dr["SXS"]);
                        TEA = Formatting.ConvertNullToDecimal(dr["TEA"]);
                        TEG = Formatting.ConvertNullToDecimal(dr["TEG"]);
                        TEGME = Formatting.ConvertNullToDecimal(dr["TEGME"]);
                        Terpineol = Formatting.ConvertNullToDecimal(dr["Terpineol"]);
                        Tinopal_5BMGX = Formatting.ConvertNullToDecimal(dr["Tinopal_5BMGX"]);
                        Tinopal_AMSGX = Formatting.ConvertNullToDecimal(dr["Tinopal_AMSGX"]);
                        Tinopal_CBSX = Formatting.ConvertNullToDecimal(dr["Tinopal_CBSX"]);
                        Tinopal_DCS = Formatting.ConvertNullToDecimal(dr["Tinopal_DCS"]);
                        Tinopal_SWN = Formatting.ConvertNullToDecimal(dr["Tinopal_SWN"]);
                        Tinopal_UNPAGX = Formatting.ConvertNullToDecimal(dr["Tinopal_UNPAGX"]);
                        Tinosan = Formatting.ConvertNullToDecimal(dr["Tinosan"]);
                        TiO2 = Formatting.ConvertNullToDecimal(dr["TiO2"]);
                        TPGBE = Formatting.ConvertNullToDecimal(dr["TPGBE"]);
                        TPGME = Formatting.ConvertNullToDecimal(dr["TPGME"]);
                        Triclosan = Formatting.ConvertNullToDecimal(dr["Triclosan"]);
                        Trihydroxystearin = Formatting.ConvertNullToDecimal(dr["Trihydroxystearin"]);
                        TTEG = Formatting.ConvertNullToDecimal(dr["TTEG"]);
                        Type = Formatting.ConvertNullToString(dr["Type"]);
                        Water = Formatting.ConvertNullToDecimal(dr["Water"]);
                        X_2_Butoxyethanol = Formatting.ConvertNullToDecimal(dr["X_2_Butoxyethanol"]);
                        Year = Formatting.ConvertNullToString(dr["Year"]);
                        ZincPyrithione = Formatting.ConvertNullToDecimal(dr["ZincPyrithione"]);
                        Zn_acetate = Formatting.ConvertNullToDecimal(dr["Zn_acetate"]);
                        ZnCl2 = Formatting.ConvertNullToDecimal(dr["ZnCl2"]);
                        ZnCO3 = Formatting.ConvertNullToDecimal(dr["ZnCO3"]);
                        ZnSO4 = Formatting.ConvertNullToDecimal(dr["ZnSO4"]);

                    
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
        public void Save(int id)
        {
            try
            {
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["MapCConStr"].ConnectionString;
                string input = "";
                if (id == 960)
                {
                    input = "[BatOtherT] SET  Acid_Blue_9	='" + Acid_Blue_9 + "',ADPODS='" + ADPODS + "',AGE='" + AGE + "',Alkanolamides='" + Alkanolamides + "',AmidopropylAO='" + AmidopropylAO + "',"
                            + "AmineOxides='" + AmineOxides + "',AO='" + AO + "',Ballast='" + Ballast + "',Benzotriazole='" + Benzotriazole + "',Benzyl_alcohol='" + Benzyl_alcohol + "',"
                            + "Blankophor_LPG='" + Blankophor_LPG + "',Blankophor_RKH120='" + Blankophor_RKH120 + "',Blankophor_TX='" + Blankophor_TX + "',Brand='" + Brand + "',"
                            + "Butenediol='" + Butenediol + "',Butoxydiglycol='" + Butoxydiglycol + "',Butoxypropanol='" + Butoxypropanol + "',CaCl2='" + CaCl2 + "',CO2='" + CO2 + "',"
                            + "Country='" + Country + "',DEA='" + DEA + "',DEG='" + DEG + "',DEGBE='" + DEGBE + "',DEGME='" + DEGME + "',Distearyl_ether='" + Distearyl_ether + "',DMDM_Hydantoin='" + DMDM_Hydantoin + "',"
                            + "DPGBE='" + DPGBE + "',DPGME='" + DPGME + "',DPGPE='" + DPGPE + "',EG='" + EG + "',EGBE='" + EGBE + "',EGHE='" + EGHE + "',Ethanol='" + Ethanol + "',FADA='" + FADA + "',"
                            + "FAMA='" + FAMA + "',FAMIPA='" + FAMIPA + "',Formaldehyde='" + Formaldehyde + "',Formic_Acid='" + Formic_Acid + "',FWA='" + FWA + "',Glycerol='" + Glycerol + "',Glycol_distearate='" + Glycol_distearate + "',"
                            + "Hexylene_glycol='" + Hexylene_glycol + "',ID='" + ID + "',Isopropanol='" + Isopropanol + "',Lignin='" + Lignin + "',MEA='" + MEA + "',Methylpropandiol='" + Methylpropandiol + "',"
                            + "MgCl2='" + MgCl2 + "',MgSO4='" + MgSO4 + "',MPG='" + MPG + "',Na2SO4='" + Na2SO4 + "',NaCl='" + NaCl + "',NaOH='" + NaOH + "',NH4OH='" + NH4OH + "',NonPolarHydrocarbons='" + NonPolarHydrocarbons + "',"
                            + "Perfumes='" + Perfumes + "',PG='" + PG + "',PGBE='" + PGBE + "',PGME='" + PGME + "',PGPE='" + PGPE + "',Phenoxy_ethanol='" + Phenoxy_ethanol + "',PPG_Butyl_ether='" + PPG_Butyl_ether + "',"
                            + "ProdCode='" + ProdCode + "',Producer='" + Producer + "',Quaternium_15='" + Quaternium_15 + "',SCS='" + SCS + "',SiliconOils='" + SiliconOils + "',Sorbitol='" + Sorbitol + "',"
                            + "STS='" + STS + "',SubType='" + SubType + "',Sunflower_seed_oil='" + Sunflower_seed_oil + "',SXS='" + SXS + "',TEA='" + TEA + "',TEG='" + TEG + "',TEGME='" + TEGME + "',Terpineol='" + Terpineol + "',"
                            + "Tinopal_5BMGX='" + Tinopal_5BMGX + "',Tinopal_AMSGX='" + Tinopal_AMSGX + "',Tinopal_CBSX='" + Tinopal_CBSX + "',Tinopal_DCS='" + Tinopal_DCS + "',Tinopal_SWN='" + Tinopal_SWN + "',"
                            + "Tinopal_UNPAGX='" + Tinopal_UNPAGX + "',Tinosan='" + Tinosan + "',TiO2='" + TiO2 + "',TPGBE='" + TPGBE + "',TPGME='" + TPGME + "',Triclosan='" + Triclosan + "',Trihydroxystearin='" + Trihydroxystearin + "',"
                            + "TTEG='" + TTEG + "',Type='" + Type + "',Water='" + Water + "',X_2_Butoxyethanol='" + X_2_Butoxyethanol + "',Year='" + Year + "',ZincPyrithione='" + ZincPyrithione + "',Zn_acetate='" + Zn_acetate + "',"
                            + "ZnCl2='" + ZnCl2 + "',ZnCO3='" + ZnCO3 + "',ZnSO4='" + ZnSO4 + "' WHERE ID='" + ID + "'";
                }
                else if (id == 955)
                {
                    input = "BatOtherT (Acid_Blue_9,ADPODS,AGE,Alkanolamides,AmidopropylAO,AmineOxides,AO,Ballast,Benzotriazole,Benzyl_alcohol,Blankophor_LPG,Blankophor_RKH120,Blankophor_TX,"
                            + "Brand,Butenediol,Butoxydiglycol,Butoxypropanol,CaCl2,CO2,Country,DEA,DEG,DEGBE,DEGME,Distearyl_ether,DMDM_Hydantoin,DPGBE,DPGME,DPGPE,EG,EGBE,EGHE,Ethanol,"
                            + "FADA,FAMA,FAMIPA,Formaldehyde,Formic_Acid,FWA,Glycerol,Glycol_distearate,Hexylene_glycol,ID,Isopropanol,Lignin,MEA,Methylpropandiol,gCl2,MgSO4,MPG,Na2SO4,"
                            + "NaCl,NaOH,NH4OH,NonPolarHydrocarbons,Perfumes,G,PGBE,PGME,PGPE,Phenoxy_ethanol,PPG_Butyl_ether,ProdCode,Producer,Quaternium_15,SCS,SiliconOils,Sorbitol,STS,SubType,Sunflower_seed_oil,SXS,TEA,TEG,"
                            + "TEGME,Terpineol,Tinopal_5BMGX,Tinopal_AMSGX,Tinopal_CBSX,Tinopal_DCS,Tinopal_SWN,Tinopal_UNPAGX,Tinosan,TiO2,TPGBE,TPGME,Triclosan,Trihydroxystearin,TTEG,"
                            + "Type,Water,X_2_Butoxyethanol,Year,ZincPyrithione,Zn_acetate,ZnCl2,ZnCO3,ZnSO4) Values("
                            + "'" + Acid_Blue_9 + "','" + ADPODS + "','" + AGE + "','" + Alkanolamides + "','" + AmidopropylAO + "','" + AmineOxides + "','" + AO + "','" + Ballast + "','" + Benzotriazole + "','" + Benzyl_alcohol + "',"
                            + "'" + Blankophor_LPG + "','" + Blankophor_RKH120 + "','" + Blankophor_TX + "','" + Brand + "','" + Butenediol + "','" + Butoxydiglycol + "','" + Butoxypropanol + "','" + CaCl2 + "','" + CO2 + "',"
                            + "'" + Country + "','" + DEA + "','" + DEG + "','" + DEGBE + "','" + DEGME + "','" + Distearyl_ether + "','" + DMDM_Hydantoin + "','" + DPGBE + "','" + DPGME + "','" + DPGPE + "','" + EG + "','" + EGBE + "',"
                            + "'" + EGHE + "','" + Ethanol + "','" + FADA + "','" + FAMA + "','" + FAMIPA + "'," + Formaldehyde + "','" + Formic_Acid + "','" + FWA + "','" + Glycerol + "','" + Glycol_distearate + "','" + Hexylene_glycol + "',"
                            + "'" + ID + "','" + Isopropanol + "','" + Lignin + "','" + MEA + "','" + Methylpropandiol + "','" + MgCl2 + "','" + MgSO4 + "','" + MPG + "','" + Na2SO4 + "','" + NaCl + "','" + NaOH + "','" + NH4OH + "',"
                            + "'" + NonPolarHydrocarbons + "','" + Perfumes + "','" + PG + "','" + PGBE + "','" + PGME + "','" + PGPE + "','" + Phenoxy_ethanol + "','" + PPG_Butyl_ether + "','" + ProdCode + "','" + Producer + "',"
                            + "'" + Quaternium_15 + "','" + SCS + "','" + SiliconOils + "','" + Sorbitol + "','" + STS + "','" + SubType + "','" + Sunflower_seed_oil + "','" + SXS + "','" + TEA + "','" + TEG + "','" + TEGME + "','" + Terpineol + "',"
                            + "'" + Tinopal_5BMGX + "','" + Tinopal_AMSGX + "','" + Tinopal_CBSX + "','" + Tinopal_DCS + "','" + Tinopal_SWN + "','" + Tinopal_UNPAGX + "','" + Tinosan + "','" + TiO2 + "','" + TPGBE + "',"
                            + "'" + TPGME + "','" + Triclosan + "','" + Trihydroxystearin + "','" + TTEG + "','" + Type + "','" + Water + "','" + X_2_Butoxyethanol + "','" + Year + "','" + ZincPyrithione + "','" + Zn_acetate + "',"
                            + "'" + ZnCl2 + "','" + ZnCO3 + "','" + ZnSO4 + "')";

                }
                using (SqlConnection Cnxn = new SqlConnection(con))
                {
                    SqlCommand sc = new SqlCommand("Batelle", Cnxn);
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