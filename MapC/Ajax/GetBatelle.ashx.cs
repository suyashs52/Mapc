using MapC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MapC.Ajax
{
    /// <summary>
    /// Summary description for GetBatelle
    /// </summary>
    public class GetBatelle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Result = string.Empty;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            try
            {
                string ID = Formatting.ConvertNullToString(context.Request["ID"]);
                string Category = Formatting.ConvertNullToString(context.Request["Category"]);
                if (ID.Length == 0) return;
                if (Category == "gen")
                {

                    Models.Batelle tm = new Models.Batelle(980, ID);


                    sb.Append("[{");
                    sb.Append("\"AlcInsol\" : \"" + tm.AlcInsol + "\",");
                    sb.Append("\"AlcSol\" : \"" + tm.AlcSol + "\",");
                    sb.Append("\"AppDens\" : \"" + tm.AppDens + "\",");
                    sb.Append("\"Bl\" : \"" + tm.Bl + "\",");
                    sb.Append("\"Brand\" : \"" + tm.Brand + "\",");
                    sb.Append("\"Bu\" : \"" + tm.Bu + "\",");
                    sb.Append("\"Ca\" : \"" + tm.Ca + "\",");
                    sb.Append("\"Country\" : \"" + tm.Country + "\",");
                    sb.Append("\"DryRes\" : \"" + tm.DryRes + "\",");
                    sb.Append("\"En\" : \"" + tm.En + "\",");
                    sb.Append("\"Fi\" : \"" + tm.Fi + "\",");
                    sb.Append("\"Fo\" : \"" + tm.Fo + "\",");
                    sb.Append("\"Hy\" : \"" + tm.Hy + "\",");
                    sb.Append("\"ID\" : \"" + tm.ID + "\",");
                    sb.Append("\"Mi\" : \"" + tm.Mi + "\",");
                    sb.Append("\"OnTapDens\" : \"" + tm.OnTapDens + "\",");
                    sb.Append("\"PenInd\" : \"" + tm.PenInd + "\",");
                    sb.Append("\"pH\" : \"" + tm.pH + "\",");
                    sb.Append("\"Po\" : \"" + tm.Po + "\",");
                    sb.Append("\"ProdCode\" : \"" + tm.ProdCode + "\",");
                    sb.Append("\"Producer\" : \"" + tm.Producer + "\",");
                    sb.Append("\"So\" : \"" + tm.So + "\",");
                    sb.Append("\"Su\" : \"" + tm.Su + "\",");
                    sb.Append("\"SubType\" : \"" + tm.SubType + "\",");
                    sb.Append("\"Type\" : \"" + tm.Type + "\",");
                    sb.Append("\"Visc\" : \"" + tm.Visc + "\",");
                    sb.Append("\"Year\" : \"" + tm.Year + "\",");


                    sb.Append("}]");



                }
                else if (Category == "gene")
                {
                    Models.Batelle tm = new Models.Batelle();
                    tm.AlcInsol = Formatting.ConvertNullToDecimal(context.Request["AlcInsol"]);
                    tm.AlcSol = Formatting.ConvertNullToDecimal(context.Request["AlcSol"]);
                    tm.AppDens = Formatting.ConvertNullToDecimal(context.Request["AppDens"]);
                    tm.Bl = Formatting.ConvertNullToDecimal(context.Request["Bl"]);
                    tm.Brand = Formatting.ConvertNullToString(context.Request["Brand"]);
                    tm.Bu = Formatting.ConvertNullToDecimal(context.Request["Bu"]);
                    tm.Ca = Formatting.ConvertNullToDecimal(context.Request["Ca"]);
                    tm.Country = Formatting.ConvertNullToString(context.Request["Country"]);
                    tm.DryRes = Formatting.ConvertNullToDecimal(context.Request["DryRes"]);
                    tm.En = Formatting.ConvertNullToDecimal(context.Request["En"]);
                    tm.Fi = Formatting.ConvertNullToDecimal(context.Request["Fi"]);
                    tm.Fo = Formatting.ConvertNullToDecimal(context.Request["Fo"]);
                    tm.Hy = Formatting.ConvertNullToDecimal(context.Request["Hy"]);
                    tm.ID = Formatting.ConvertNullToString(context.Request["ID"]);
                    tm.Mi = Formatting.ConvertNullToDecimal(context.Request["Mi"]);
                    tm.OnTapDens = Formatting.ConvertNullToDecimal(context.Request["OnTapDens"]);
                    tm.PenInd = Formatting.ConvertNullToString(context.Request["PenInd"]);
                    tm.pH = Formatting.ConvertNullToDecimal(context.Request["pH"]);
                    tm.Po = Formatting.ConvertNullToDecimal(context.Request["Po"]);
                    tm.ProdCode = Formatting.ConvertNullToString(context.Request["ProdCode"]);
                    tm.Producer = Formatting.ConvertNullToString(context.Request["Producer"]);
                    tm.So = Formatting.ConvertNullToDecimal(context.Request["So"]);
                    tm.Su = Formatting.ConvertNullToDecimal(context.Request["Su"]);
                    tm.SubType = Formatting.ConvertNullToString(context.Request["SubType"]);
                    tm.Type = Formatting.ConvertNullToString(context.Request["Type"]);
                    tm.Visc = Formatting.ConvertNullToString(context.Request["Visc"]);
                    tm.Year = Formatting.ConvertNullToString(context.Request["Year"]);
                    tm.SaveGen(960);
                   sb.Append("Successful@@Save Successfully!");
                }
                else if (Category == "gens")
                {

                    BatSurfactantsT tm = new Models.BatSurfactantsT(970, ID);

                    sb.Append("[{");
                    sb.Append("\"AAA\" : \"" + tm.AAA + "\",");
                    sb.Append("\"AAB\" : \"" + tm.AAB + "\",");
                    sb.Append("\"AAG\" : \"" + tm.AAG + "\",");
                    sb.Append("\"AAO\" : \"" + tm.AAO + "\",");
                    sb.Append("\"AB\" : \"" + tm.AB + "\",");
                    sb.Append("\"ADHEB\" : \"" + tm.ADHEB + "\",");
                    sb.Append("\"ADMA\" : \"" + tm.ADMA + "\",");
                    sb.Append("\"ADMBAC\" : \"" + tm.ADMBAC + "\",");
                    sb.Append("\"ADMEAQ\" : \"" + tm.ADMEAQ + "\",");
                    sb.Append("\"ADMEBAC\" : \"" + tm.ADMEBAC + "\",");
                    sb.Append("\"AE\" : \"" + tm.AE + "\",");
                    sb.Append("\"AEO\" : \"" + tm.AEO + "\",");
                    sb.Append("\"AEO_APG\" : \"" + tm.AEO_APG + "\",");
                    sb.Append("\"AEO_PO\" : \"" + tm.AEO_PO + "\",");
                    sb.Append("\"AEO_PO_PEG\" : \"" + tm.AEO_PO_PEG + "\",");
                    sb.Append("\"AEOS\" : \"" + tm.AEOS + "\",");
                    sb.Append("\"AEOS_APEOS\" : \"" + tm.AEOS_APEOS + "\",");
                    sb.Append("\"Alpha_FAMES\" : \"" + tm.Alpha_FAMES + "\",");
                    sb.Append("\"Amphoterics\" : \"" + tm.Amphoterics + "\",");
                    sb.Append("\"AOS\" : \"" + tm.AOS + "\",");
                    sb.Append("\"APE\" : \"" + tm.APE + "\",");
                    sb.Append("\"APE_AEO\" : \"" + tm.APE_AEO + "\",");
                    sb.Append("\"APED\" : \"" + tm.APED + "\",");
                    sb.Append("\"APEOS\" : \"" + tm.APEOS + "\",");
                    sb.Append("\"APG\" : \"" + tm.APG + "\",");
                    sb.Append("\"AS_AEOS\" : \"" + tm.AS_AEOS + "\",");
                    sb.Append("\"AS_APEOS\" : \"" + tm.AS_APEOS + "\",");
                    sb.Append("\"ASs\" : \"" + tm.ASs + "\",");
                    sb.Append("\"ATMAC\" : \"" + tm.ATMAC + "\",");
                    sb.Append("\"ATMAEOC\" : \"" + tm.ATMAEOC + "\",");
                    sb.Append("\"BABS\" : \"" + tm.BABS + "\",");
                    sb.Append("\"BAPDA\" : \"" + tm.BAPDA + "\",");
                    sb.Append("\"Benzoic_deriv_\" : \"" + tm.Benzoic_deriv_ + "\",");
                    sb.Append("\"Brand\" : \"" + tm.Brand + "\",");
                    sb.Append("\"Cationics\" : \"" + tm.Cationics + "\",");
                    sb.Append("\"Country\" : \"" + tm.Country + "\",");
                    sb.Append("\"Cyclodextr__Der_\" : \"" + tm.Cyclodextr__Der_ + "\",");
                    sb.Append("\"Cyclodextrin\" : \"" + tm.Cyclodextrin + "\",");
                    sb.Append("\"Cyclodextrine\" : \"" + tm.Cyclodextrine + "\",");
                    sb.Append("\"DAAAQ\" : \"" + tm.DAAAQ + "\",");
                    sb.Append("\"DADMAC\" : \"" + tm.DADMAC + "\",");
                    sb.Append("\"DEDEAQ\" : \"" + tm.DEDEAQ + "\",");
                    sb.Append("\"DETEAQ\" : \"" + tm.DETEAQ + "\",");
                    sb.Append("\"DMADA\" : \"" + tm.DMADA + "\",");
                    sb.Append("\"DMBAC\" : \"" + tm.DMBAC + "\",");
                    sb.Append("\"DMEBAC\" : \"" + tm.DMEBAC + "\",");
                    sb.Append("\"EFME\" : \"" + tm.EFME + "\",");
                    sb.Append("\"EthylcaproicNa\" : \"" + tm.EthylcaproicNa + "\",");
                    sb.Append("\"FAGA\" : \"" + tm.FAGA + "\",");
                    sb.Append("\"FAME\" : \"" + tm.FAME + "\",");
                    sb.Append("\"Fatty_Alcohol\" : \"" + tm.Fatty_Alcohol + "\",");
                    sb.Append("\"FFA\" : \"" + tm.FFA + "\",");
                    sb.Append("\"Fluorinated_cmpd\" : \"" + tm.Fluorinated_cmpd + "\",");
                    sb.Append("\"Fluoroc_tone\" : \"" + tm.Fluoroc_tone + "\",");
                    sb.Append("\"Glycine_deriv_\" : \"" + tm.Glycine_deriv_ + "\",");
                    sb.Append("\"ID\" : \"" + tm.ID + "\",");
                    sb.Append("\"Imidazoline_Der_\" : \"" + tm.Imidazoline_Der_ + "\",");
                    sb.Append("\"Isothiazolinone_der_\" : \"" + tm.Isothiazolinone_der_ + "\",");
                    sb.Append("\"LAS\" : \"" + tm.LAS + "\",");
                    sb.Append("\"MEE\" : \"" + tm.MEE + "\",");
                    sb.Append("\"MES\" : \"" + tm.MES + "\",");
                    sb.Append("\"NO\" : \"" + tm.NO + "\",");
                    sb.Append("\"NonIonics\" : \"" + tm.NonIonics + "\",");
                    sb.Append("\"Phthalimide_deriv_\" : \"" + tm.Phthalimide_deriv_ + "\",");
                    sb.Append("\"POE_Sorbitan_Ester\" : \"" + tm.POE_Sorbitan_Ester + "\",");
                    sb.Append("\"Poly_Asparaginate\" : \"" + tm.Poly_Asparaginate + "\",");
                    sb.Append("\"ProdCode\" : \"" + tm.ProdCode + "\",");
                    sb.Append("\"Producer\" : \"" + tm.Producer + "\",");
                    sb.Append("\"Sarkosyl\" : \"" + tm.Sarkosyl + "\",");
                    sb.Append("\"SAS\" : \"" + tm.SAS + "\",");
                    sb.Append("\"Soaps\" : \"" + tm.Soaps + "\",");
                    sb.Append("\"SubType\" : \"" + tm.SubType + "\",");
                    sb.Append("\"SulfoAcetate\" : \"" + tm.SulfoAcetate + "\",");
                    sb.Append("\"Sulfobetaine\" : \"" + tm.Sulfobetaine + "\",");
                    sb.Append("\"Sulphates\" : \"" + tm.Sulphates + "\",");
                    sb.Append("\"Sulphonates\" : \"" + tm.Sulphonates + "\",");
                    sb.Append("\"TMAC\" : \"" + tm.TMAC + "\",");
                    sb.Append("\"tr_tr_muconic_acid_Na_salt\" : \"" + tm.tr_tr_muconic_acid_Na_salt + "\",");
                    sb.Append("\"Type\" : \"" + tm.Type + "\",");
                    sb.Append("\"Unknown\" : \"" + tm.Unknown + "\",");
                    sb.Append("\"WAX\" : \"" + tm.WAX + "\",");
                    sb.Append("\"Year\" : \"" + tm.Year + "\",");

                    sb.Append("}]");



                }
                else if (Category == "gense")
                {
                    BatSurfactantsT tm = new Models.BatSurfactantsT();
                    tm.AAA = Formatting.ConvertNullToString(context.Request["AAA"]);
                    tm.AAB = Formatting.ConvertNullToString(context.Request["AAB"]);
                    tm.AAG = Formatting.ConvertNullToDecimal(context.Request["AAG"]);
                    tm.AAO = Formatting.ConvertNullToString(context.Request["AAO"]);
                    tm.AB = Formatting.ConvertNullToString(context.Request["AB"]);
                    tm.ADHEB = Formatting.ConvertNullToString(context.Request["ADHEB"]);
                    tm.ADMA = Formatting.ConvertNullToString(context.Request["ADMA"]);
                    tm.ADMBAC = Formatting.ConvertNullToString(context.Request["ADMBAC"]);
                    tm.ADMEAQ = Formatting.ConvertNullToString(context.Request["ADMEAQ"]);
                    tm.ADMEBAC = Formatting.ConvertNullToString(context.Request["ADMEBAC"]);
                    tm.AE = Formatting.ConvertNullToString(context.Request["AE"]);
                    tm.AEO = Formatting.ConvertNullToString(context.Request["AEO"]);
                    tm.AEO_APG = Formatting.ConvertNullToString(context.Request["AEO_APG"]);
                    tm.AEO_PO = Formatting.ConvertNullToDecimal(context.Request["AEO_PO"]);
                    tm.AEO_PO_PEG = Formatting.ConvertNullToString(context.Request["AEO_PO_PEG"]);
                    tm.AEOS = Formatting.ConvertNullToString(context.Request["AEOS"]);
                    tm.AEOS_APEOS = Formatting.ConvertNullToString(context.Request["AEOS_APEOS"]);
                    tm.Alpha_FAMES = Formatting.ConvertNullToString(context.Request["Alpha_FAMES"]);
                    tm.Amphoterics = Formatting.ConvertNullToDecimal(context.Request["Amphoterics"]);
                    tm.AOS = Formatting.ConvertNullToString(context.Request["AOS"]);
                    tm.APE = Formatting.ConvertNullToString(context.Request["APE"]);
                    tm.APE_AEO = Formatting.ConvertNullToString(context.Request["APE_AEO"]);
                    tm.APED = Formatting.ConvertNullToDecimal(context.Request["APED"]);
                    tm.APEOS = Formatting.ConvertNullToString(context.Request["APEOS"]);
                    tm.APG = Formatting.ConvertNullToString(context.Request["APG"]);
                    tm.AS_AEOS = Formatting.ConvertNullToString(context.Request["AS_AEOS"]);
                    tm.AS_APEOS = Formatting.ConvertNullToString(context.Request["AS_APEOS"]);
                    tm.ASs = Formatting.ConvertNullToString(context.Request["ASs"]);
                    tm.ATMAC = Formatting.ConvertNullToString(context.Request["ATMAC"]);
                    tm.ATMAEOC = Formatting.ConvertNullToString(context.Request["ATMAEOC"]);
                    tm.BABS = Formatting.ConvertNullToString(context.Request["BABS"]);
                    tm.BAPDA = Formatting.ConvertNullToString(context.Request["BAPDA"]);
                    tm.Benzoic_deriv_ = Formatting.ConvertNullToString(context.Request["Benzoic_deriv_"]);
                    tm.Brand = Formatting.ConvertNullToString(context.Request["Brand"]);
                    tm.Cationics = Formatting.ConvertNullToDecimal(context.Request["Cationics"]);
                    tm.Country = Formatting.ConvertNullToString(context.Request["Country"]);
                    tm.Cyclodextr__Der_ = Formatting.ConvertNullToString(context.Request["Cyclodextr__Der_"]);
                    tm.Cyclodextrin = Formatting.ConvertNullToString(context.Request["Cyclodextrin"]);
                    tm.Cyclodextrine = Formatting.ConvertNullToString(context.Request["Cyclodextrine"]);
                    tm.DAAAQ = Formatting.ConvertNullToString(context.Request["DAAAQ"]);
                    tm.DADMAC = Formatting.ConvertNullToString(context.Request["DADMAC"]);
                    tm.DEDEAQ = Formatting.ConvertNullToString(context.Request["DEDEAQ"]);
                    tm.DETEAQ = Formatting.ConvertNullToString(context.Request["DETEAQ"]);
                    tm.DMADA = Formatting.ConvertNullToString(context.Request["DMADA"]);
                    tm.DMBAC = Formatting.ConvertNullToString(context.Request["DMBAC"]);
                    tm.DMEBAC = Formatting.ConvertNullToString(context.Request["DMEBAC"]);
                    tm.EFME = Formatting.ConvertNullToString(context.Request["EFME"]);
                    tm.EthylcaproicNa = Formatting.ConvertNullToString(context.Request["EthylcaproicNa"]);
                    tm.FAGA = Formatting.ConvertNullToDecimal(context.Request["FAGA"]);
                    tm.FAME = Formatting.ConvertNullToString(context.Request["FAME"]);
                    tm.Fatty_Alcohol = Formatting.ConvertNullToString(context.Request["Fatty_Alcohol"]);
                    tm.FFA = Formatting.ConvertNullToString(context.Request["FFA"]);
                    tm.Fluorinated_cmpd = Formatting.ConvertNullToString(context.Request["Fluorinated_cmpd"]);
                    tm.Fluoroc_tone = Formatting.ConvertNullToString(context.Request["Fluoroc_tone"]);
                    tm.Glycine_deriv_ = Formatting.ConvertNullToString(context.Request["Glycine_deriv_"]);
                    tm.ID = Formatting.ConvertNullToString(context.Request["ID"]);
                    tm.Imidazoline_Der_ = Formatting.ConvertNullToString(context.Request["Imidazoline_Der_"]);
                    tm.Isothiazolinone_der_ = Formatting.ConvertNullToString(context.Request["Isothiazolinone_der_"]);
                    tm.LAS = Formatting.ConvertNullToString(context.Request["LAS"]);
                    tm.MEE = Formatting.ConvertNullToString(context.Request["MEE"]);
                    tm.MES = Formatting.ConvertNullToString(context.Request["MES"]);
                    tm.NO = Formatting.ConvertNullToString(context.Request["NO"]);
                    tm.NonIonics = Formatting.ConvertNullToDecimal(context.Request["NonIonics"]);
                    tm.Phthalimide_deriv_ = Formatting.ConvertNullToString(context.Request["Phthalimide_deriv_"]);
                    tm.POE_Sorbitan_Ester = Formatting.ConvertNullToString(context.Request["POE_Sorbitan_Ester"]);
                    tm.Poly_Asparaginate = Formatting.ConvertNullToString(context.Request["Poly_Asparaginate"]);
                    tm.ProdCode = Formatting.ConvertNullToString(context.Request["ProdCode"]);
                    tm.Producer = Formatting.ConvertNullToString(context.Request["Producer"]);
                    tm.Sarkosyl = Formatting.ConvertNullToString(context.Request["Sarkosyl"]);
                    tm.SAS = Formatting.ConvertNullToString(context.Request["SAS"]);
                    tm.Soaps = Formatting.ConvertNullToDecimal(context.Request["Soaps"]);
                    tm.SubType = Formatting.ConvertNullToString(context.Request["SubType"]);
                    tm.SulfoAcetate = Formatting.ConvertNullToString(context.Request["SulfoAcetate"]);
                    tm.Sulfobetaine = Formatting.ConvertNullToString(context.Request["Sulfobetaine"]);
                    tm.Sulphates = Formatting.ConvertNullToDecimal(context.Request["Sulphates"]);
                    tm.Sulphonates = Formatting.ConvertNullToDecimal(context.Request["Sulphonates"]);
                    tm.TMAC = Formatting.ConvertNullToDecimal(context.Request["TMAC"]);
                    tm.tr_tr_muconic_acid_Na_salt = Formatting.ConvertNullToString(context.Request["tr_tr_muconic_acid_Na_salt"]);
                    tm.Type = Formatting.ConvertNullToString(context.Request["Type"]);
                    tm.Unknown = Formatting.ConvertNullToString(context.Request["Unknown"]);
                    tm.WAX = Formatting.ConvertNullToString(context.Request["WAX"]);
                    tm.Year = Formatting.ConvertNullToString(context.Request["Year"]);
                    tm.Save(960);
                   sb.Append("Successful@@Save Successfully!");
                }
                else if (Category == "genp")
                {

                    BatPolymers tm = new Models.BatPolymers(985, ID);
                    sb.Append("[{");
                    sb.Append("\"Acry_Sulf_Copolymer\" : \"" + tm.Acry_Sulf_Copolymer + "\",");
                    sb.Append("\"Brand\" : \"" + tm.Brand + "\",");
                    sb.Append("\"Cellulose\" : \"" + tm.Cellulose + "\",");
                    sb.Append("\"Country\" : \"" + tm.Country + "\",");
                    sb.Append("\"DMDAAC_AM\" : \"" + tm.DMDAAC_AM + "\",");
                    sb.Append("\"Guar_gum\" : \"" + tm.Guar_gum + "\",");
                    sb.Append("\"ID\" : \"" + tm.ID + "\",");
                    sb.Append("\"PCA_Sulf_Terpolymer\" : \"" + tm.PCA_Sulf_Terpolymer + "\",");
                    sb.Append("\"PCACopolymer\" : \"" + tm.PCACopolymer + "\",");
                    sb.Append("\"PCAHomopolymer\" : \"" + tm.PCAHomopolymer + "\",");
                    sb.Append("\"PCAsilicate_polymer\" : \"" + tm.PCAsilicate_polymer + "\",");
                    sb.Append("\"PEG\" : \"" + tm.PEG + "\",");
                    sb.Append("\"PEG_Carboxylate\" : \"" + tm.PEG_Carboxylate + "\",");
                    sb.Append("\"Polyamine_type\" : \"" + tm.Polyamine_type + "\",");
                    sb.Append("\"Polyethylene_immine\" : \"" + tm.Polyethylene_immine + "\",");
                    sb.Append("\"Polysulfonate\" : \"" + tm.Polysulfonate + "\",");
                    sb.Append("\"Polyvinylalcohol\" : \"" + tm.Polyvinylalcohol + "\",");
                    sb.Append("\"ProdCode\" : \"" + tm.ProdCode + "\",");
                    sb.Append("\"Producer\" : \"" + tm.Producer + "\",");
                    sb.Append("\"PVP\" : \"" + tm.PVP + "\",");
                    sb.Append("\"PVP_VI\" : \"" + tm.PVP_VI + "\",");
                    sb.Append("\"PVPNO\" : \"" + tm.PVPNO + "\",");
                    sb.Append("\"SRP\" : \"" + tm.SRP + "\",");
                    sb.Append("\"SubType\" : \"" + tm.SubType + "\",");
                    sb.Append("\"Type\" : \"" + tm.Type + "\",");
                    sb.Append("\"Xanthan_Gum\" : \"" + tm.Xanthan_Gum + "\",");
                    sb.Append("\"Year\" : \"" + tm.Year + "\",");

                    sb.Append("}]");

                }

                else if (Category == "genpe")
                {
                    BatPolymers tm = new Models.BatPolymers();
                    tm.Acry_Sulf_Copolymer = Formatting.ConvertNullToDecimal(context.Request["Acry_Sulf_Copolymer"]);
                    tm.Brand = Formatting.ConvertNullToString(context.Request["Brand"]);
                    tm.Cellulose = Formatting.ConvertNullToDecimal(context.Request["Cellulose"]);
                    tm.Country = Formatting.ConvertNullToString(context.Request["Country"]);
                    tm.DMDAAC_AM = Formatting.ConvertNullToDecimal(context.Request["DMDAAC_AM"]);
                    tm.Guar_gum = Formatting.ConvertNullToDecimal(context.Request["Guar_gum"]);
                    tm.ID = Formatting.ConvertNullToString(context.Request["ID"]);
                    tm.PCA_Sulf_Terpolymer = Formatting.ConvertNullToDecimal(context.Request["PCA_Sulf_Terpolymer"]);
                    tm.PCACopolymer = Formatting.ConvertNullToDecimal(context.Request["PCACopolymer"]);
                    tm.PCAHomopolymer = Formatting.ConvertNullToDecimal(context.Request["PCAHomopolymer"]);
                    tm.PCAsilicate_polymer = Formatting.ConvertNullToDecimal(context.Request["PCAsilicate_polymer"]);
                    tm.PEG = Formatting.ConvertNullToDecimal(context.Request["PEG"]);
                    tm.PEG_Carboxylate = Formatting.ConvertNullToDecimal(context.Request["PEG_Carboxylate"]);
                    tm.Polyamine_type = Formatting.ConvertNullToDecimal(context.Request["Polyamine_type"]);
                    tm.Polyethylene_immine = Formatting.ConvertNullToDecimal(context.Request["Polyethylene_immine"]);
                    tm.Polysulfonate = Formatting.ConvertNullToDecimal(context.Request["Polysulfonate"]);
                    tm.Polyvinylalcohol = Formatting.ConvertNullToDecimal(context.Request["Polyvinylalcohol"]);
                    tm.ProdCode = Formatting.ConvertNullToString(context.Request["ProdCode"]);
                    tm.Producer = Formatting.ConvertNullToString(context.Request["Producer"]);
                    tm.PVP = Formatting.ConvertNullToDecimal(context.Request["PVP"]);
                    tm.PVP_VI = Formatting.ConvertNullToDecimal(context.Request["PVP_VI"]);
                    tm.PVPNO = Formatting.ConvertNullToDecimal(context.Request["PVPNO"]);
                    tm.SRP = Formatting.ConvertNullToDecimal(context.Request["SRP"]);
                    tm.SubType = Formatting.ConvertNullToString(context.Request["SubType"]);
                    tm.Type = Formatting.ConvertNullToString(context.Request["Type"]);
                    tm.Xanthan_Gum = Formatting.ConvertNullToDecimal(context.Request["Xanthan_Gum"]);
                    tm.Year = Formatting.ConvertNullToString(context.Request["Year"]);
                    tm.Save(960);
                   sb.Append("Successful@@Save Successfully!");
                }
                else if (Category == "genb")
                {

                    BatBleach tm = new Models.BatBleach(800, ID);
                    sb.Append("[{");
                    sb.Append("\"Accelerator\" : \"" + tm.Accelerator + "\",");
                    sb.Append("\"ActivatorNOBS\" : \"" + tm.ActivatorNOBS + "\",");
                    sb.Append("\"ActivatorTAED\" : \"" + tm.ActivatorTAED + "\",");
                    sb.Append("\"ActiveOxygen\" : \"" + tm.ActiveOxygen + "\",");
                    sb.Append("\"Boron\" : \"" + tm.Boron + "\",");
                    sb.Append("\"Brand\" : \"" + tm.Brand + "\",");
                    sb.Append("\"ChlorineBleach\" : \"" + tm.ChlorineBleach + "\",");
                    sb.Append("\"Country\" : \"" + tm.Country + "\",");
                    sb.Append("\"H2O2\" : \"" + tm.H2O2 + "\",");
                    sb.Append("\"ID\" : \"" + tm.ID + "\",");
                    sb.Append("\"PAP\" : \"" + tm.PAP + "\",");
                    sb.Append("\"PerCarb\" : \"" + tm.PerCarb + "\",");
                    sb.Append("\"ProdCode\" : \"" + tm.ProdCode + "\",");
                    sb.Append("\"Producer\" : \"" + tm.Producer + "\",");
                    sb.Append("\"Sodium_Dichloroisocyanurate\" : \"" + tm.Sodium_Dichloroisocyanurate + "\",");
                    sb.Append("\"SPM\" : \"" + tm.SPM + "\",");
                    sb.Append("\"SPT\" : \"" + tm.SPT + "\",");
                    sb.Append("\"SubType\" : \"" + tm.SubType + "\",");
                    sb.Append("\"Trichloroisocyanuric_Acid\" : \"" + tm.Trichloroisocyanuric_Acid + "\",");
                    sb.Append("\"Type\" : \"" + tm.Type + "\",");
                    sb.Append("\"Year\" : \"" + tm.Year + "\",");
                    sb.Append("\"Zinc_Phthalocyanine_Sulphonate\" : \"" + tm.Zinc_Phthalocyanine_Sulphonate + "\",");
                    sb.Append("\"Zn_PhS\" : \"" + tm.Zn_PhS + "\",");

                    sb.Append("}]");

                }
                else if (Category == "genbe")
                {
                    BatBleach tm = new Models.BatBleach();
                    tm.Accelerator = Formatting.ConvertNullToDecimal(context.Request["Accelerator"]);
                    tm.ActivatorNOBS = Formatting.ConvertNullToDecimal(context.Request["ActivatorNOBS"]);
                    tm.ActivatorTAED = Formatting.ConvertNullToDecimal(context.Request["ActivatorTAED"]);
                    tm.ActiveOxygen = Formatting.ConvertNullToDecimal(context.Request["ActiveOxygen"]);
                    tm.Boron = Formatting.ConvertNullToDecimal(context.Request["Boron"]);
                    tm.Brand = Formatting.ConvertNullToString(context.Request["Brand"]);
                    tm.ChlorineBleach = Formatting.ConvertNullToDecimal(context.Request["ChlorineBleach"]);
                    tm.Country = Formatting.ConvertNullToString(context.Request["Country"]);
                    tm.H2O2 = Formatting.ConvertNullToDecimal(context.Request["H2O2"]);
                    tm.ID = Formatting.ConvertNullToString(context.Request["ID"]);
                    tm.PAP = Formatting.ConvertNullToDecimal(context.Request["PAP"]);
                    tm.PerCarb = Formatting.ConvertNullToDecimal(context.Request["PerCarb"]);
                    tm.ProdCode = Formatting.ConvertNullToString(context.Request["ProdCode"]);
                    tm.Producer = Formatting.ConvertNullToString(context.Request["Producer"]);
                    tm.Sodium_Dichloroisocyanurate = Formatting.ConvertNullToDecimal(context.Request["Sodium_Dichloroisocyanurate"]);
                    tm.SPM = Formatting.ConvertNullToDecimal(context.Request["SPM"]);
                    tm.SPT = Formatting.ConvertNullToDecimal(context.Request["SPT"]);
                    tm.SubType = Formatting.ConvertNullToString(context.Request["SubType"]);
                    tm.Trichloroisocyanuric_Acid = Formatting.ConvertNullToDecimal(context.Request["Trichloroisocyanuric_Acid"]);
                    tm.Type = Formatting.ConvertNullToString(context.Request["Type"]);
                    tm.Year = Formatting.ConvertNullToString(context.Request["Year"]);
                    tm.Zinc_Phthalocyanine_Sulphonate = Formatting.ConvertNullToDecimal(context.Request["Zinc_Phthalocyanine_Sulphonate"]);
                    tm.Zn_PhS = Formatting.ConvertNullToDecimal(context.Request["Zn_PhS"]);
                    tm.Save(960);
                   sb.Append("Successful@@Save Successfully!");
                }
                else if (Category == "genbu")
                {

                    BatBuilders tm = new Models.BatBuilders(700, ID);
                    sb.Append("[{");
                    sb.Append("\"AcetateNa\" : \"" + tm.AcetateNa + "\",");
                    sb.Append("\"Active_Carbon\" : \"" + tm.Active_Carbon + "\",");
                    sb.Append("\"ATMP\" : \"" + tm.ATMP + "\",");
                    sb.Append("\"Bentonite\" : \"" + tm.Bentonite + "\",");
                    sb.Append("\"Benzoic_acid\" : \"" + tm.Benzoic_acid + "\",");
                    sb.Append("\"Brand\" : \"" + tm.Brand + "\",");
                    sb.Append("\"CitrateNa\" : \"" + tm.CitrateNa + "\",");
                    sb.Append("\"Citric_Acid\" : \"" + tm.Citric_Acid + "\",");
                    sb.Append("\"Clay\" : \"" + tm.Clay + "\",");
                    sb.Append("\"Country\" : \"" + tm.Country + "\",");
                    sb.Append("\"DPG\" : \"" + tm.DPG + "\",");
                    sb.Append("\"DTMPA\" : \"" + tm.DTMPA + "\",");
                    sb.Append("\"DTPA\" : \"" + tm.DTPA + "\",");
                    sb.Append("\"DTPMP\" : \"" + tm.DTPMP + "\",");
                    sb.Append("\"EDDS\" : \"" + tm.EDDS + "\",");
                    sb.Append("\"EDTA\" : \"" + tm.EDTA + "\",");
                    sb.Append("\"EDTMPA\" : \"" + tm.EDTMPA + "\",");
                    sb.Append("\"GLDA\" : \"" + tm.GLDA + "\",");
                    sb.Append("\"HEDP\" : \"" + tm.HEDP + "\",");
                    sb.Append("\"ID\" : \"" + tm.ID + "\",");
                    sb.Append("\"Kaolin\" : \"" + tm.Kaolin + "\",");
                    sb.Append("\"Lactic_Acid\" : \"" + tm.Lactic_Acid + "\",");
                    sb.Append("\"LaySilic\" : \"" + tm.LaySilic + "\",");
                    sb.Append("\"MGDA\" : \"" + tm.MGDA + "\",");
                    sb.Append("\"Na_Adipate\" : \"" + tm.Na_Adipate + "\",");
                    sb.Append("\"Na_Formiate\" : \"" + tm.Na_Formiate + "\",");
                    sb.Append("\"Na_gluconate\" : \"" + tm.Na_gluconate + "\",");
                    sb.Append("\"Na_metasilicate_anh_\" : \"" + tm.Na_metasilicate_anh_ + "\",");
                    sb.Append("\"Na_poly_aspartate_\" : \"" + tm.Na_poly_aspartate_ + "\",");
                    sb.Append("\"Na_Salicylate\" : \"" + tm.Na_Salicylate + "\",");
                    sb.Append("\"Na_Sebacate\" : \"" + tm.Na_Sebacate + "\",");
                    sb.Append("\"Na_succinate\" : \"" + tm.Na_succinate + "\",");
                    sb.Append("\"Na_Tartrate\" : \"" + tm.Na_Tartrate + "\",");
                    sb.Append("\"Na2CO3\" : \"" + tm.Na2CO3 + "\",");
                    sb.Append("\"Na2O_2SiO2\" : \"" + tm.Na2O_2SiO2 + "\",");
                    sb.Append("\"Na3PO4\" : \"" + tm.Na3PO4 + "\",");
                    sb.Append("\"Na4P2O7\" : \"" + tm.Na4P2O7 + "\",");
                    sb.Append("\"Na5P3O10\" : \"" + tm.Na5P3O10 + "\",");
                    sb.Append("\"NaHCO3\" : \"" + tm.NaHCO3 + "\",");
                    sb.Append("\"NTA\" : \"" + tm.NTA + "\",");
                    sb.Append("\"Paper_Sheets\" : \"" + tm.Paper_Sheets + "\",");
                    sb.Append("\"Phosphoric_acid\" : \"" + tm.Phosphoric_acid + "\",");
                    sb.Append("\"ProdCode\" : \"" + tm.ProdCode + "\",");
                    sb.Append("\"Producer\" : \"" + tm.Producer + "\",");
                    sb.Append("\"Silica\" : \"" + tm.Silica + "\",");
                    sb.Append("\"Strach\" : \"" + tm.Strach + "\",");
                    sb.Append("\"SubType\" : \"" + tm.SubType + "\",");
                    sb.Append("\"Sucrose\" : \"" + tm.Sucrose + "\",");
                    sb.Append("\"Sulfamic_acid\" : \"" + tm.Sulfamic_acid + "\",");
                    sb.Append("\"Textile\" : \"" + tm.Textile + "\",");
                    sb.Append("\"Trimethoxy_Benzoic_acid\" : \"" + tm.Trimethoxy_Benzoic_acid + "\",");
                    sb.Append("\"Type\" : \"" + tm.Type + "\",");
                    sb.Append("\"Urea\" : \"" + tm.Urea + "\",");
                    sb.Append("\"Year\" : \"" + tm.Year + "\",");
                    sb.Append("\"Zeolite4A\" : \"" + tm.Zeolite4A + "\",");
                    sb.Append("\"ZeoliteP\" : \"" + tm.ZeoliteP + "\",");
                    sb.Append("\"ZnO\" : \"" + tm.ZnO + "\",");

                    sb.Append("}]");

                }
                else if (Category == "genbue")
                {

                    BatBuilders tm = new Models.BatBuilders();
                    tm.AcetateNa = Formatting.ConvertNullToDecimal(context.Request["AcetateNa"]);
                    tm.Active_Carbon = Formatting.ConvertNullToDecimal(context.Request["Active_Carbon"]);
                    tm.ATMP = Formatting.ConvertNullToDecimal(context.Request["ATMP"]);
                    tm.Bentonite = Formatting.ConvertNullToDecimal(context.Request["Bentonite"]);
                    tm.Benzoic_acid = Formatting.ConvertNullToDecimal(context.Request["Benzoic_acid"]);
                    tm.Brand = Formatting.ConvertNullToString(context.Request["Brand"]);
                    tm.CitrateNa = Formatting.ConvertNullToDecimal(context.Request["CitrateNa"]);
                    tm.Citric_Acid = Formatting.ConvertNullToDecimal(context.Request["Citric_Acid"]);
                    tm.Clay = Formatting.ConvertNullToDecimal(context.Request["Clay"]);
                    tm.Country = Formatting.ConvertNullToString(context.Request["Country"]);
                    tm.DPG = Formatting.ConvertNullToDecimal(context.Request["DPG"]);
                    tm.DTMPA = Formatting.ConvertNullToDecimal(context.Request["DTMPA"]);
                    tm.DTPA = Formatting.ConvertNullToDecimal(context.Request["DTPA"]);
                    tm.DTPMP = Formatting.ConvertNullToDecimal(context.Request["DTPMP"]);
                    tm.EDDS = Formatting.ConvertNullToDecimal(context.Request["EDDS"]);
                    tm.EDTA = Formatting.ConvertNullToDecimal(context.Request["EDTA"]);
                    tm.EDTMPA = Formatting.ConvertNullToDecimal(context.Request["EDTMPA"]);
                    tm.GLDA = Formatting.ConvertNullToDecimal(context.Request["GLDA"]);
                    tm.HEDP = Formatting.ConvertNullToDecimal(context.Request["HEDP"]);
                    tm.ID = Formatting.ConvertNullToString(context.Request["ID"]);
                    tm.Kaolin = Formatting.ConvertNullToDecimal(context.Request["Kaolin"]);
                    tm.Lactic_Acid = Formatting.ConvertNullToDecimal(context.Request["Lactic_Acid"]);
                    tm.LaySilic = Formatting.ConvertNullToDecimal(context.Request["LaySilic"]);
                    tm.MGDA = Formatting.ConvertNullToDecimal(context.Request["MGDA"]);
                    tm.Na_Adipate = Formatting.ConvertNullToDecimal(context.Request["Na_Adipate"]);
                    tm.Na_Formiate = Formatting.ConvertNullToDecimal(context.Request["Na_Formiate"]);
                    tm.Na_gluconate = Formatting.ConvertNullToDecimal(context.Request["Na_gluconate"]);
                    tm.Na_metasilicate_anh_ = Formatting.ConvertNullToDecimal(context.Request["Na_metasilicate_anh_"]);
                    tm.Na_poly_aspartate_ = Formatting.ConvertNullToDecimal(context.Request["Na_poly_aspartate_"]);
                    tm.Na_Salicylate = Formatting.ConvertNullToDecimal(context.Request["Na_Salicylate"]);
                    tm.Na_Sebacate = Formatting.ConvertNullToDecimal(context.Request["Na_Sebacate"]);
                    tm.Na_succinate = Formatting.ConvertNullToDecimal(context.Request["Na_succinate"]);
                    tm.Na_Tartrate = Formatting.ConvertNullToDecimal(context.Request["Na_Tartrate"]);
                    tm.Na2CO3 = Formatting.ConvertNullToDecimal(context.Request["Na2CO3"]);
                    tm.Na2O_2SiO2 = Formatting.ConvertNullToDecimal(context.Request["Na2O_2SiO2"]);
                    tm.Na3PO4 = Formatting.ConvertNullToDecimal(context.Request["Na3PO4"]);
                    tm.Na4P2O7 = Formatting.ConvertNullToDecimal(context.Request["Na4P2O7"]);
                    tm.Na5P3O10 = Formatting.ConvertNullToDecimal(context.Request["Na5P3O10"]);
                    tm.NaHCO3 = Formatting.ConvertNullToDecimal(context.Request["NaHCO3"]);
                    tm.NTA = Formatting.ConvertNullToDecimal(context.Request["NTA"]);
                    tm.Paper_Sheets = Formatting.ConvertNullToDecimal(context.Request["Paper_Sheets"]);
                    tm.Phosphoric_acid = Formatting.ConvertNullToDecimal(context.Request["Phosphoric_acid"]);
                    tm.ProdCode = Formatting.ConvertNullToString(context.Request["ProdCode"]);
                    tm.Producer = Formatting.ConvertNullToString(context.Request["Producer"]);
                    tm.Silica = Formatting.ConvertNullToDecimal(context.Request["Silica"]);
                    tm.Strach = Formatting.ConvertNullToDecimal(context.Request["Strach"]);
                    tm.SubType = Formatting.ConvertNullToString(context.Request["SubType"]);
                    tm.Sucrose = Formatting.ConvertNullToDecimal(context.Request["Sucrose"]);
                    tm.Sulfamic_acid = Formatting.ConvertNullToDecimal(context.Request["Sulfamic_acid"]);
                    tm.Textile = Formatting.ConvertNullToDecimal(context.Request["Textile"]);
                    tm.Trimethoxy_Benzoic_acid = Formatting.ConvertNullToDecimal(context.Request["Trimethoxy_Benzoic_acid"]);
                    tm.Type = Formatting.ConvertNullToString(context.Request["Type"]);
                    tm.Urea = Formatting.ConvertNullToDecimal(context.Request["Urea"]);
                    tm.Year = Formatting.ConvertNullToString(context.Request["Year"]);
                    tm.Zeolite4A = Formatting.ConvertNullToDecimal(context.Request["Zeolite4A"]);
                    tm.ZeoliteP = Formatting.ConvertNullToDecimal(context.Request["ZeoliteP"]);
                    tm.ZnO = Formatting.ConvertNullToDecimal(context.Request["ZnO"]);
                    tm.Save(960);
                   sb.Append("Successful@@Save Successfully!");
                }
                else if (Category == "genen")
                {

                    BatEnzymes tm = new Models.BatEnzymes(600, ID);
                    sb.Append("[{");
                    sb.Append("\"Brand\" : \"" + tm.Brand + "\",");
                    sb.Append("\"Carezyme_5SCEVU_G\" : \"" + tm.Carezyme_5SCEVU_G + "\",");
                    sb.Append("\"Country\" : \"" + tm.Country + "\",");
                    sb.Append("\"ID\" : \"" + tm.ID + "\",");
                    sb.Append("\"Lipolase_100KLU_G\" : \"" + tm.Lipolase_100KLU_G + "\",");
                    sb.Append("\"ProdCode\" : \"" + tm.ProdCode + "\",");
                    sb.Append("\"Producer\" : \"" + tm.Producer + "\",");
                    sb.Append("\"Savinase_16KNPU_G\" : \"" + tm.Savinase_16KNPU_G + "\",");
                    sb.Append("\"SubType\" : \"" + tm.SubType + "\",");
                    sb.Append("\"Termamyl_300KNU_G\" : \"" + tm.Termamyl_300KNU_G + "\",");
                    sb.Append("\"Type\" : \"" + tm.Type + "\",");
                    sb.Append("\"Year\" : \"" + tm.Year + "\",");

                    sb.Append("}]");

                }

                else if (Category == "genene")
                {
                    BatEnzymes tm = new Models.BatEnzymes();
                    tm.Brand = Formatting.ConvertNullToString(context.Request["Brand"]);
                    tm.Carezyme_5SCEVU_G = Formatting.ConvertNullToDecimal(context.Request["Carezyme_5SCEVU_G"]);
                    tm.Country = Formatting.ConvertNullToString(context.Request["Country"]);
                    tm.ID = Formatting.ConvertNullToString(context.Request["ID"]);
                    tm.Lipolase_100KLU_G = Formatting.ConvertNullToDecimal(context.Request["Lipolase_100KLU_G"]);
                    tm.ProdCode = Formatting.ConvertNullToString(context.Request["ProdCode"]);
                    tm.Producer = Formatting.ConvertNullToString(context.Request["Producer"]);
                    tm.Savinase_16KNPU_G = Formatting.ConvertNullToDecimal(context.Request["Savinase_16KNPU_G"]);
                    tm.SubType = Formatting.ConvertNullToString(context.Request["SubType"]);
                    tm.Termamyl_300KNU_G = Formatting.ConvertNullToDecimal(context.Request["Termamyl_300KNU_G"]);
                    tm.Type = Formatting.ConvertNullToString(context.Request["Type"]);
                    tm.Year = Formatting.ConvertNullToString(context.Request["Year"]);
                    tm.Save(960);
                   sb.Append("Successful@@Save Successfully!");
                }
                else if (Category == "geno")
                {

                    BatOthers tm = new Models.BatOthers(550, ID);
                    sb.Append("[{");
                    sb.Append("\"Acid_Blue_9\" : \"" + tm.Acid_Blue_9 + "\",");
                    sb.Append("\"ADPODS\" : \"" + tm.ADPODS + "\",");
                    sb.Append("\"AGE\" : \"" + tm.AGE + "\",");
                    sb.Append("\"Alkanolamides\" : \"" + tm.Alkanolamides + "\",");
                    sb.Append("\"AmidopropylAO\" : \"" + tm.AmidopropylAO + "\",");
                    sb.Append("\"AmineOxides\" : \"" + tm.AmineOxides + "\",");
                    sb.Append("\"AO\" : \"" + tm.AO + "\",");
                    sb.Append("\"Ballast\" : \"" + tm.Ballast + "\",");
                    sb.Append("\"Benzotriazole\" : \"" + tm.Benzotriazole + "\",");
                    sb.Append("\"Benzyl_alcohol\" : \"" + tm.Benzyl_alcohol + "\",");
                    sb.Append("\"Blankophor_LPG\" : \"" + tm.Blankophor_LPG + "\",");
                    sb.Append("\"Blankophor_RKH120\" : \"" + tm.Blankophor_RKH120 + "\",");
                    sb.Append("\"Blankophor_TX\" : \"" + tm.Blankophor_TX + "\",");
                    sb.Append("\"Brand\" : \"" + tm.Brand + "\",");
                    sb.Append("\"Butenediol\" : \"" + tm.Butenediol + "\",");
                    sb.Append("\"Butoxydiglycol\" : \"" + tm.Butoxydiglycol + "\",");
                    sb.Append("\"Butoxypropanol\" : \"" + tm.Butoxypropanol + "\",");
                    sb.Append("\"CaCl2\" : \"" + tm.CaCl2 + "\",");
                    sb.Append("\"CO2\" : \"" + tm.CO2 + "\",");
                    sb.Append("\"Country\" : \"" + tm.Country + "\",");
                    sb.Append("\"DEA\" : \"" + tm.DEA + "\",");
                    sb.Append("\"DEG\" : \"" + tm.DEG + "\",");
                    sb.Append("\"DEGBE\" : \"" + tm.DEGBE + "\",");
                    sb.Append("\"DEGME\" : \"" + tm.DEGME + "\",");
                    sb.Append("\"Distearyl_ether\" : \"" + tm.Distearyl_ether + "\",");
                    sb.Append("\"DMDM_Hydantoin\" : \"" + tm.DMDM_Hydantoin + "\",");
                    sb.Append("\"DPGBE\" : \"" + tm.DPGBE + "\",");
                    sb.Append("\"DPGME\" : \"" + tm.DPGME + "\",");
                    sb.Append("\"DPGPE\" : \"" + tm.DPGPE + "\",");
                    sb.Append("\"EG\" : \"" + tm.EG + "\",");
                    sb.Append("\"EGBE\" : \"" + tm.EGBE + "\",");
                    sb.Append("\"EGHE\" : \"" + tm.EGHE + "\",");
                    sb.Append("\"Ethanol\" : \"" + tm.Ethanol + "\",");
                    sb.Append("\"FADA\" : \"" + tm.FADA + "\",");
                    sb.Append("\"FAMA\" : \"" + tm.FAMA + "\",");
                    sb.Append("\"FAMIPA\" : \"" + tm.FAMIPA + "\",");
                    sb.Append("\"Formaldehyde\" : \"" + tm.Formaldehyde + "\",");
                    sb.Append("\"Formic_Acid\" : \"" + tm.Formic_Acid + "\",");
                    sb.Append("\"FWA\" : \"" + tm.FWA + "\",");
                    sb.Append("\"Glycerol\" : \"" + tm.Glycerol + "\",");
                    sb.Append("\"Glycol_distearate\" : \"" + tm.Glycol_distearate + "\",");
                    sb.Append("\"Hexylene_glycol\" : \"" + tm.Hexylene_glycol + "\",");
                    sb.Append("\"ID\" : \"" + tm.ID + "\",");
                    sb.Append("\"Isopropanol\" : \"" + tm.Isopropanol + "\",");
                    sb.Append("\"Lignin\" : \"" + tm.Lignin + "\",");
                    sb.Append("\"MEA\" : \"" + tm.MEA + "\",");
                    sb.Append("\"Methylpropandiol\" : \"" + tm.Methylpropandiol + "\",");
                    sb.Append("\"MgCl2\" : \"" + tm.MgCl2 + "\",");
                    sb.Append("\"MgSO4\" : \"" + tm.MgSO4 + "\",");
                    sb.Append("\"MPG\" : \"" + tm.MPG + "\",");
                    sb.Append("\"Na2SO4\" : \"" + tm.Na2SO4 + "\",");
                    sb.Append("\"NaCl\" : \"" + tm.NaCl + "\",");
                    sb.Append("\"NaOH\" : \"" + tm.NaOH + "\",");
                    sb.Append("\"NH4OH\" : \"" + tm.NH4OH + "\",");
                    sb.Append("\"NonPolarHydrocarbons\" : \"" + tm.NonPolarHydrocarbons + "\",");
                    sb.Append("\"Perfumes\" : \"" + tm.Perfumes + "\",");
                    sb.Append("\"PG\" : \"" + tm.PG + "\",");
                    sb.Append("\"PGBE\" : \"" + tm.PGBE + "\",");
                    sb.Append("\"PGME\" : \"" + tm.PGME + "\",");
                    sb.Append("\"PGPE\" : \"" + tm.PGPE + "\",");
                    sb.Append("\"Phenoxy_ethanol\" : \"" + tm.Phenoxy_ethanol + "\",");
                    sb.Append("\"PPG_Butyl_ether\" : \"" + tm.PPG_Butyl_ether + "\",");
                    sb.Append("\"ProdCode\" : \"" + tm.ProdCode + "\",");
                    sb.Append("\"Producer\" : \"" + tm.Producer + "\",");
                    sb.Append("\"Quaternium_15\" : \"" + tm.Quaternium_15 + "\",");
                    sb.Append("\"SCS\" : \"" + tm.SCS + "\",");
                    sb.Append("\"SiliconOils\" : \"" + tm.SiliconOils + "\",");
                    sb.Append("\"Sorbitol\" : \"" + tm.Sorbitol + "\",");
                    sb.Append("\"STS\" : \"" + tm.STS + "\",");
                    sb.Append("\"SubType\" : \"" + tm.SubType + "\",");
                    sb.Append("\"Sunflower_seed_oil\" : \"" + tm.Sunflower_seed_oil + "\",");
                    sb.Append("\"SXS\" : \"" + tm.SXS + "\",");
                    sb.Append("\"TEA\" : \"" + tm.TEA + "\",");
                    sb.Append("\"TEG\" : \"" + tm.TEG + "\",");
                    sb.Append("\"TEGME\" : \"" + tm.TEGME + "\",");
                    sb.Append("\"Terpineol\" : \"" + tm.Terpineol + "\",");
                    sb.Append("\"Tinopal_5BMGX\" : \"" + tm.Tinopal_5BMGX + "\",");
                    sb.Append("\"Tinopal_AMSGX\" : \"" + tm.Tinopal_AMSGX + "\",");
                    sb.Append("\"Tinopal_CBSX\" : \"" + tm.Tinopal_CBSX + "\",");
                    sb.Append("\"Tinopal_DCS\" : \"" + tm.Tinopal_DCS + "\",");
                    sb.Append("\"Tinopal_SWN\" : \"" + tm.Tinopal_SWN + "\",");
                    sb.Append("\"Tinopal_UNPAGX\" : \"" + tm.Tinopal_UNPAGX + "\",");
                    sb.Append("\"Tinosan\" : \"" + tm.Tinosan + "\",");
                    sb.Append("\"TiO2\" : \"" + tm.TiO2 + "\",");
                    sb.Append("\"TPGBE\" : \"" + tm.TPGBE + "\",");
                    sb.Append("\"TPGME\" : \"" + tm.TPGME + "\",");
                    sb.Append("\"Triclosan\" : \"" + tm.Triclosan + "\",");
                    sb.Append("\"Trihydroxystearin\" : \"" + tm.Trihydroxystearin + "\",");
                    sb.Append("\"TTEG\" : \"" + tm.TTEG + "\",");
                    sb.Append("\"Type\" : \"" + tm.Type + "\",");
                    sb.Append("\"Water\" : \"" + tm.Water + "\",");
                    sb.Append("\"X_2_Butoxyethanol\" : \"" + tm.X_2_Butoxyethanol + "\",");
                    sb.Append("\"Year\" : \"" + tm.Year + "\",");
                    sb.Append("\"ZincPyrithione\" : \"" + tm.ZincPyrithione + "\",");
                    sb.Append("\"Zn_acetate\" : \"" + tm.Zn_acetate + "\",");
                    sb.Append("\"ZnCl2\" : \"" + tm.ZnCl2 + "\",");
                    sb.Append("\"ZnCO3\" : \"" + tm.ZnCO3 + "\",");
                    sb.Append("\"ZnSO4\" : \"" + tm.ZnSO4 + "\",");

                    sb.Append("}]");

                }
                else if (Category == "genoe")
                {
                    BatOthers tm = new Models.BatOthers();

                    tm.Acid_Blue_9 = Formatting.ConvertNullToDecimal(context.Request["Acid_Blue_9"]);
                    tm.ADPODS = Formatting.ConvertNullToDecimal(context.Request["ADPODS"]);
                    tm.AGE = Formatting.ConvertNullToDecimal(context.Request["AGE"]);
                    tm.Alkanolamides = Formatting.ConvertNullToDecimal(context.Request["Alkanolamides"]);
                    tm.AmidopropylAO = Formatting.ConvertNullToString(context.Request["AmidopropylAO"]);
                    tm.AmineOxides = Formatting.ConvertNullToDecimal(context.Request["AmineOxides"]);
                    tm.AO = Formatting.ConvertNullToString(context.Request["AO"]);
                    tm.Ballast = Formatting.ConvertNullToDecimal(context.Request["Ballast"]);
                    tm.Benzotriazole = Formatting.ConvertNullToDecimal(context.Request["Benzotriazole"]);
                    tm.Benzyl_alcohol = Formatting.ConvertNullToDecimal(context.Request["Benzyl_alcohol"]);
                    tm.Blankophor_LPG = Formatting.ConvertNullToDecimal(context.Request["Blankophor_LPG"]);
                    tm.Blankophor_RKH120 = Formatting.ConvertNullToDecimal(context.Request["Blankophor_RKH120"]);
                    tm.Blankophor_TX = Formatting.ConvertNullToDecimal(context.Request["Blankophor_TX"]);
                    tm.Brand = Formatting.ConvertNullToString(context.Request["Brand"]);
                    tm.Butenediol = Formatting.ConvertNullToDecimal(context.Request["Butenediol"]);
                    tm.Butoxydiglycol = Formatting.ConvertNullToDecimal(context.Request["Butoxydiglycol"]);
                    tm.Butoxypropanol = Formatting.ConvertNullToDecimal(context.Request["Butoxypropanol"]);
                    tm.CaCl2 = Formatting.ConvertNullToDecimal(context.Request["CaCl2"]);
                    tm.CO2 = Formatting.ConvertNullToDecimal(context.Request["CO2"]);
                    tm.Country = Formatting.ConvertNullToString(context.Request["Country"]);
                    tm.DEA = Formatting.ConvertNullToDecimal(context.Request["DEA"]);
                    tm.DEG = Formatting.ConvertNullToDecimal(context.Request["DEG"]);
                    tm.DEGBE = Formatting.ConvertNullToDecimal(context.Request["DEGBE"]);
                    tm.DEGME = Formatting.ConvertNullToDecimal(context.Request["DEGME"]);
                    tm.Distearyl_ether = Formatting.ConvertNullToDecimal(context.Request["Distearyl_ether"]);
                    tm.DMDM_Hydantoin = Formatting.ConvertNullToDecimal(context.Request["DMDM_Hydantoin"]);
                    tm.DPGBE = Formatting.ConvertNullToDecimal(context.Request["DPGBE"]);
                    tm.DPGME = Formatting.ConvertNullToDecimal(context.Request["DPGME"]);
                    tm.DPGPE = Formatting.ConvertNullToDecimal(context.Request["DPGPE"]);
                    tm.EG = Formatting.ConvertNullToDecimal(context.Request["EG"]);
                    tm.EGBE = Formatting.ConvertNullToDecimal(context.Request["EGBE"]);
                    tm.EGHE = Formatting.ConvertNullToDecimal(context.Request["EGHE"]);
                    tm.Ethanol = Formatting.ConvertNullToDecimal(context.Request["Ethanol"]);
                    tm.FADA = Formatting.ConvertNullToString(context.Request["FADA"]);
                    tm.FAMA = Formatting.ConvertNullToString(context.Request["FAMA"]);
                    tm.FAMIPA = Formatting.ConvertNullToString(context.Request["FAMIPA"]);
                    tm.Formaldehyde = Formatting.ConvertNullToDecimal(context.Request["Formaldehyde"]);
                    tm.Formic_Acid = Formatting.ConvertNullToDecimal(context.Request["Formic_Acid"]);
                    tm.FWA = Formatting.ConvertNullToDecimal(context.Request["FWA"]);
                    tm.Glycerol = Formatting.ConvertNullToDecimal(context.Request["Glycerol"]);
                    tm.Glycol_distearate = Formatting.ConvertNullToDecimal(context.Request["Glycol_distearate"]);
                    tm.Hexylene_glycol = Formatting.ConvertNullToDecimal(context.Request["Hexylene_glycol"]);
                    tm.ID = Formatting.ConvertNullToString(context.Request["ID"]);
                    tm.Isopropanol = Formatting.ConvertNullToDecimal(context.Request["Isopropanol"]);
                    tm.Lignin = Formatting.ConvertNullToDecimal(context.Request["Lignin"]);
                    tm.MEA = Formatting.ConvertNullToDecimal(context.Request["MEA"]);
                    tm.Methylpropandiol = Formatting.ConvertNullToDecimal(context.Request["Methylpropandiol"]);
                    tm.MgCl2 = Formatting.ConvertNullToDecimal(context.Request["MgCl2"]);
                    tm.MgSO4 = Formatting.ConvertNullToDecimal(context.Request["MgSO4"]);
                    tm.MPG = Formatting.ConvertNullToDecimal(context.Request["MPG"]);
                    tm.Na2SO4 = Formatting.ConvertNullToDecimal(context.Request["Na2SO4"]);
                    tm.NaCl = Formatting.ConvertNullToDecimal(context.Request["NaCl"]);
                    tm.NaOH = Formatting.ConvertNullToDecimal(context.Request["NaOH"]);
                    tm.NH4OH = Formatting.ConvertNullToDecimal(context.Request["NH4OH"]);
                    tm.NonPolarHydrocarbons = Formatting.ConvertNullToDecimal(context.Request["NonPolarHydrocarbons"]);
                    tm.Perfumes = Formatting.ConvertNullToDecimal(context.Request["Perfumes"]);
                    tm.PG = Formatting.ConvertNullToDecimal(context.Request["PG"]);
                    tm.PGBE = Formatting.ConvertNullToDecimal(context.Request["PGBE"]);
                    tm.PGME = Formatting.ConvertNullToDecimal(context.Request["PGME"]);
                    tm.PGPE = Formatting.ConvertNullToDecimal(context.Request["PGPE"]);
                    tm.Phenoxy_ethanol = Formatting.ConvertNullToDecimal(context.Request["Phenoxy_ethanol"]);
                    tm.PPG_Butyl_ether = Formatting.ConvertNullToDecimal(context.Request["PPG_Butyl_ether"]);
                    tm.ProdCode = Formatting.ConvertNullToString(context.Request["ProdCode"]);
                    tm.Producer = Formatting.ConvertNullToString(context.Request["Producer"]);
                    tm.Quaternium_15 = Formatting.ConvertNullToDecimal(context.Request["Quaternium_15"]);
                    tm.SCS = Formatting.ConvertNullToDecimal(context.Request["SCS"]);
                    tm.SiliconOils = Formatting.ConvertNullToDecimal(context.Request["SiliconOils"]);
                    tm.Sorbitol = Formatting.ConvertNullToDecimal(context.Request["Sorbitol"]);
                    tm.STS = Formatting.ConvertNullToDecimal(context.Request["STS"]);
                    tm.SubType = Formatting.ConvertNullToString(context.Request["SubType"]);
                    tm.Sunflower_seed_oil = Formatting.ConvertNullToDecimal(context.Request["Sunflower_seed_oil"]);
                    tm.SXS = Formatting.ConvertNullToDecimal(context.Request["SXS"]);
                    tm.TEA = Formatting.ConvertNullToDecimal(context.Request["TEA"]);
                    tm.TEG = Formatting.ConvertNullToDecimal(context.Request["TEG"]);
                    tm.TEGME = Formatting.ConvertNullToDecimal(context.Request["TEGME"]);
                    tm.Terpineol = Formatting.ConvertNullToDecimal(context.Request["Terpineol"]);
                    tm.Tinopal_5BMGX = Formatting.ConvertNullToDecimal(context.Request["Tinopal_5BMGX"]);
                    tm.Tinopal_AMSGX = Formatting.ConvertNullToDecimal(context.Request["Tinopal_AMSGX"]);
                    tm.Tinopal_CBSX = Formatting.ConvertNullToDecimal(context.Request["Tinopal_CBSX"]);
                    tm.Tinopal_DCS = Formatting.ConvertNullToDecimal(context.Request["Tinopal_DCS"]);
                    tm.Tinopal_SWN = Formatting.ConvertNullToDecimal(context.Request["Tinopal_SWN"]);
                    tm.Tinopal_UNPAGX = Formatting.ConvertNullToDecimal(context.Request["Tinopal_UNPAGX"]);
                    tm.Tinosan = Formatting.ConvertNullToDecimal(context.Request["Tinosan"]);
                    tm.TiO2 = Formatting.ConvertNullToDecimal(context.Request["TiO2"]);
                    tm.TPGBE = Formatting.ConvertNullToDecimal(context.Request["TPGBE"]);
                    tm.TPGME = Formatting.ConvertNullToDecimal(context.Request["TPGME"]);
                    tm.Triclosan = Formatting.ConvertNullToDecimal(context.Request["Triclosan"]);
                    tm.Trihydroxystearin = Formatting.ConvertNullToDecimal(context.Request["Trihydroxystearin"]);
                    tm.TTEG = Formatting.ConvertNullToDecimal(context.Request["TTEG"]);
                    tm.Type = Formatting.ConvertNullToString(context.Request["Type"]);
                    tm.Water = Formatting.ConvertNullToDecimal(context.Request["Water"]);
                    tm.X_2_Butoxyethanol = Formatting.ConvertNullToDecimal(context.Request["X_2_Butoxyethanol"]);
                    tm.Year = Formatting.ConvertNullToString(context.Request["Year"]);
                    tm.ZincPyrithione = Formatting.ConvertNullToDecimal(context.Request["ZincPyrithione"]);
                    tm.Zn_acetate = Formatting.ConvertNullToDecimal(context.Request["Zn_acetate"]);
                    tm.ZnCl2 = Formatting.ConvertNullToDecimal(context.Request["ZnCl2"]);
                    tm.ZnCO3 = Formatting.ConvertNullToDecimal(context.Request["ZnCO3"]);
                    tm.ZnSO4 = Formatting.ConvertNullToDecimal(context.Request["ZnSO4"]);
                    tm.Save(960);
                   sb.Append("Successful@@Save Successfully!");

                }
                else
                {
                    BatelleMapCollection mmfc = new BatelleMapCollection(1000);
                    if (mmfc.Count > 0)
                    {
                        sb.Append("[");
                        foreach (Models.Batelle mmf in mmfc.Values)
                        {
                            sb.Append("{\"ID\" : \"" + mmf.ID + "\",");
                            sb.Append("\"Producer\" : \"" + mmf.Producer + "\",");
                            sb.Append("\"Brand\" : \"" + System.Uri.EscapeDataString(mmf.Brand) + "\",");
                            sb.Append("\"Country\" : \"" + mmf.Country + "\",");

                            sb.Append("\"Year\" : \"" + mmf.Year + "\"},");
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