<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Batelle.aspx.cs" Inherits="MapC.Batelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {

            $('#divResultInfo').hide();
            $('#divResultView').hide();
            $('#divResultViewS').hide();
            $('#divResultViewP').hide();
            $('#divResultViewB').hide();
            $('#divResultViewBu').hide();
            $('#divResultViewE').hide();
            $('#divResultViewO').hide();

            showResult();
        });
        function showResult() {
            $('#loader').show();
            $('#divResultInfo').show();
            $('#divResultView').hide();
            $('#divResultLoader').html('<table style="width: 100%;border-bottom: 1px solid rgb(221, 221, 221);"><tr><td align="center" style="text-align:center;padding-bottom:50px;" colspan="6"><img alt="loading" src="../images/ajax-loader_new.gif"></td></tr></table>');
            $('#divResultInfo').html('<span style="margin:20px;"><h4>Please Wait...</h4></span>');
            $.post('Ajax/GetBatelle.ashx', { "ID": 1000 }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {
                            var table = '<table class="table table-striped"><thead><tr><th>Producer</th><th>Brand</th><th>Country </th><th>Year</th><th></th></tr></thead><tbody>';
                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {
                                for (var i = 0; i < jsonData.length; i++) {
                                    tr += '<tr><td><a href="javascript:void(0)" onclick="ShowMM(\'' + jsonData[i].Producer + '\');">' + jsonData[i].Producer + '</a></td><td>' + decodeURIComponent(jsonData[i].Brand).toLocaleString() + '</td>';
                                    tr += '<td>' + jsonData[i].Country + '</td><td>' + jsonData[i].Year + '</td><td>' + jsonData[i].ID + '</td></tr>';
                                }
                                tr += ' </tbody></table>';
                            }
                            else tr += '<tr><td colspan="5">No Record Available!!</td></tr></tbody></table>';
                            $('#divResultInfo').html(table + tr);


                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#divResultLoader').html('');
                    $('#loader').hide();
                }
            });
        }
        function ShowMM(Country) {
            $('#<%=hdnCountry.ClientID%>').val(Country);
            $('#<%=marketClick.ClientID%>').click();
            $('#divResultView').show();
            $('#divResultInfo').hide();
        }
        function ShowList() {
            $('#divResultView').hide();
            $('#divResultInfo').show();
        }
        function ShowData() {
            var id = $('#<%=caab.ClientID%> option:selected').val();
            if (id == '') return;
            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', { "ID": id, "Category": "gen" }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {
                                $('#AlcInsol').val(jsonData[0].AlcInsol);
                                $('#AlcSol').val(jsonData[0].AlcSol);
                                $('#AppDens').val(jsonData[0].AppDens);
                                $('#Bl').val(jsonData[0].Bl);
                                $('#Brand').val(jsonData[0].Brand);
                                $('#Bu').val(jsonData[0].Bu);
                                $('#Ca').val(jsonData[0].Ca);
                                $('#Country').val(jsonData[0].Country);
                                $('#DryRes').val(jsonData[0].DryRes);
                                $('#En').val(jsonData[0].En);
                                $('#Fi').val(jsonData[0].Fi);
                                $('#Fo').val(jsonData[0].Fo);
                                $('#Hy').val(jsonData[0].Hy);
                                $('#ID').val(jsonData[0].ID);
                                $('#Mi').val(jsonData[0].Mi);
                                $('#OnTapDens').val(jsonData[0].OnTapDens);
                                $('#PenInd').val(jsonData[0].PenInd);
                                $('#pH').val(jsonData[0].pH);
                                $('#Po').val(jsonData[0].Po);
                                $('#ProdCode').val(jsonData[0].ProdCode);
                                $('#Producer').val(jsonData[0].Producer);
                                $('#So').val(jsonData[0].So);
                                $('#Su').val(jsonData[0].Su);
                                $('#SubType').val(jsonData[0].SubType);
                                $('#Type').val(jsonData[0].Type);
                                $('#Visc').val(jsonData[0].Visc);
                                $('#Year').val(jsonData[0].Year);


                            }
                            //else tr += '<tr><td colspan="5">No Record Available!!</td></tr></tbody></table>';
                            //$('#divResultInfo').html(table + tr);


                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function SaveData() {
            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', {
                "Category": "gene",
                "AlcInsol": $('#AlcInsol').val(),
                "AlcSol": $('#AlcSol').val(),
                "AppDens": $('#AppDens').val(),
                "Bl": $('#Bl').val(),
                "Brand": $('#Brand').val(),
                "Bu": $('#Bu').val(),
                "Ca": $('#Ca').val(),
                "Country": $('#Country').val(),
                "DryRes": $('#DryRes').val(),
                "En": $('#En').val(),
                "Fi": $('#Fi').val(),
                "Fo": $('#Fo').val(),
                "Hy": $('#Hy').val(),
                "ID": $('#<%=caab.ClientID%> option:selected').val(),
                "Mi": $('#Mi').val(),
                "OnTapDens": $('#OnTapDens').val(),
                "PenInd": $('#PenInd').val(),
                "pH": $('#pH').val(),
                "Po": $('#Po').val(),
                "ProdCode": $('#ProdCode').val(),
                "Producer": $('#Producer').val(),
                "So": $('#So').val(),
                "Su": $('#Su').val(),
                "SubType": $('#SubType').val(),
                "Type": $('#Type').val(),
                "Visc": $('#Visc').val(),
                "Year": $('#Year').val(),


            }, function (data) {

                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {
                            $('#loader').hide();
                            $('#divMessage').html(temp[1]);
                            $("#divMessage").show();
                            $("#divMessage").fadeOut(10000);

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function ShowDataS(Value) {
            $('.quote-platform-wrap').hide();
            $('#divResultView' + Value).show();
            var id = $('#<%=caab.ClientID%> option:selected').val();
            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', { "ID": id, "Category": "gens" }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {
                                $('#SAAA').val(jsonData[0].AAA);
                                $('#SAAB').val(jsonData[0].AAB);
                                $('#SAAG').val(jsonData[0].AAG);
                                $('#SAAO').val(jsonData[0].AAO);
                                $('#SAB').val(jsonData[0].AB);
                                $('#SADHEB').val(jsonData[0].ADHEB);
                                $('#SADMA').val(jsonData[0].ADMA);
                                $('#SADMBAC').val(jsonData[0].ADMBAC);
                                $('#SADMEAQ').val(jsonData[0].ADMEAQ);
                                $('#SADMEBAC').val(jsonData[0].ADMEBAC);
                                $('#SAE').val(jsonData[0].AE);
                                $('#SAEO').val(jsonData[0].AEO);
                                $('#SAEO_APG').val(jsonData[0].AEO_APG);
                                $('#SAEO_PO').val(jsonData[0].AEO_PO);
                                $('#SAEO_PO_PEG').val(jsonData[0].AEO_PO_PEG);
                                $('#SAEOS').val(jsonData[0].AEOS);
                                $('#SAEOS_APEOS').val(jsonData[0].AEOS_APEOS);
                                $('#SAlpha_FAMES').val(jsonData[0].Alpha_FAMES);
                                $('#SAmphoterics').val(jsonData[0].Amphoterics);
                                $('#SAOS').val(jsonData[0].AOS);
                                $('#SAPE').val(jsonData[0].APE);
                                $('#SAPE_AEO').val(jsonData[0].APE_AEO);
                                $('#SAPED').val(jsonData[0].APED);
                                $('#SAPEOS').val(jsonData[0].APEOS);
                                $('#SAPG').val(jsonData[0].APG);
                                $('#SAS_AEOS').val(jsonData[0].AS_AEOS);
                                $('#SAS_APEOS').val(jsonData[0].AS_APEOS);
                                $('#SASs').val(jsonData[0].ASs);
                                $('#SATMAC').val(jsonData[0].ATMAC);
                                $('#SATMAEOC').val(jsonData[0].ATMAEOC);
                                $('#SBABS').val(jsonData[0].BABS);
                                $('#SBAPDA').val(jsonData[0].BAPDA);
                                $('#SBenzoic_deriv_').val(jsonData[0].Benzoic_deriv_);
                                $('#SBrand').val(jsonData[0].Brand);
                                $('#SCationics').val(jsonData[0].Cationics);
                                $('#SCountry').val(jsonData[0].Country);
                                $('#SCyclodextr__Der_').val(jsonData[0].Cyclodextr__Der_);
                                $('#SCyclodextrin').val(jsonData[0].Cyclodextrin);
                                $('#SCyclodextrine').val(jsonData[0].Cyclodextrine);
                                $('#SDAAAQ').val(jsonData[0].DAAAQ);
                                $('#SDADMAC').val(jsonData[0].DADMAC);
                                $('#SDEDEAQ').val(jsonData[0].DEDEAQ);
                                $('#SDETEAQ').val(jsonData[0].DETEAQ);
                                $('#SDMADA').val(jsonData[0].DMADA);
                                $('#SDMBAC').val(jsonData[0].DMBAC);
                                $('#SDMEBAC').val(jsonData[0].DMEBAC);
                                $('#SEFME').val(jsonData[0].EFME);
                                $('#SEthylcaproicNa').val(jsonData[0].EthylcaproicNa);
                                $('#SFAGA').val(jsonData[0].FAGA);
                                $('#SFAME').val(jsonData[0].FAME);
                                $('#SFatty_Alcohol').val(jsonData[0].Fatty_Alcohol);
                                $('#SFFA').val(jsonData[0].FFA);
                                $('#SFluorinated_cmpd').val(jsonData[0].Fluorinated_cmpd);
                                $('#SFluoroc_tone').val(jsonData[0].Fluoroc_tone);
                                $('#SGlycine_deriv_').val(jsonData[0].Glycine_deriv_);
                                $('#SID').val(jsonData[0].ID);
                                $('#SImidazoline_Der_').val(jsonData[0].Imidazoline_Der_);
                                $('#SIsothiazolinone_der_').val(jsonData[0].Isothiazolinone_der_);
                                $('#SLAS').val(jsonData[0].LAS);
                                $('#SMEE').val(jsonData[0].MEE);
                                $('#SMES').val(jsonData[0].MES);
                                $('#SNO').val(jsonData[0].NO);
                                $('#SNonIonics').val(jsonData[0].NonIonics);
                                $('#SPhthalimide_deriv_').val(jsonData[0].Phthalimide_deriv_);
                                $('#SPOE_Sorbitan_Ester').val(jsonData[0].POE_Sorbitan_Ester);
                                $('#SPoly_Asparaginate').val(jsonData[0].Poly_Asparaginate);
                                $('#SProdCode').val(jsonData[0].ProdCode);
                                $('#SProducer').val(jsonData[0].Producer);
                                $('#SSarkosyl').val(jsonData[0].Sarkosyl);
                                $('#SSAS').val(jsonData[0].SAS);
                                $('#SSoaps').val(jsonData[0].Soaps);
                                $('#SSubType').val(jsonData[0].SubType);
                                $('#SSulfoAcetate').val(jsonData[0].SulfoAcetate);
                                $('#SSulfobetaine').val(jsonData[0].Sulfobetaine);
                                $('#SSulphates').val(jsonData[0].Sulphates);
                                $('#SSulphonates').val(jsonData[0].Sulphonates);
                                $('#STMAC').val(jsonData[0].TMAC);
                                $('#Str_tr_muconic_acid_Na_salt').val(jsonData[0].tr_tr_muconic_acid_Na_salt);
                                $('#SType').val(jsonData[0].Type);
                                $('#SUnknown').val(jsonData[0].Unknown);
                                $('#SWAX').val(jsonData[0].WAX);
                                $('#SYear').val(jsonData[0].Year);



                            }
                            //else tr += '<tr><td colspan="5">No Record Available!!</td></tr></tbody></table>';
                            //$('#divResultInfo').html(table + tr);


                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function SaveDataS() {
            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', {
                "Category": "gense",
                "ID": $('#<%=caab.ClientID%> option:selected').val(),
                "AAA": $('#SAAA').val(),
                "AAB": $('#SAAB').val(),
                "AAG": $('#SAAG').val(),
                "AAO": $('#SAAO').val(),
                "AB": $('#SAB').val(),
                "ADHEB": $('#SADHEB').val(),
                "ADMA": $('#SADMA').val(),
                "ADMBAC": $('#SADMBAC').val(),
                "ADMEAQ": $('#SADMEAQ').val(),
                "ADMEBAC": $('#SADMEBAC').val(),
                "AE": $('#SAE').val(),
                "AEO": $('#SAEO').val(),
                "AEO_APG": $('#SAEO_APG').val(),
                "AEO_PO": $('#SAEO_PO').val(),
                "AEO_PO_PEG": $('#SAEO_PO_PEG').val(),
                "AEOS": $('#SAEOS').val(),
                "AEOS_APEOS": $('#SAEOS_APEOS').val(),
                "Alpha_FAMES": $('#SAlpha_FAMES').val(),
                "Amphoterics": $('#SAmphoterics').val(),
                "AOS": $('#SAOS').val(),
                "APE": $('#SAPE').val(),
                "APE_AEO": $('#SAPE_AEO').val(),
                "APED": $('#SAPED').val(),
                "APEOS": $('#SAPEOS').val(),
                "APG": $('#SAPG').val(),
                "AS_AEOS": $('#SAS_AEOS').val(),
                "AS_APEOS": $('#SAS_APEOS').val(),
                "ASs": $('#SASs').val(),
                "ATMAC": $('#SATMAC').val(),
                "ATMAEOC": $('#SATMAEOC').val(),
                "BABS": $('#SBABS').val(),
                "BAPDA": $('#SBAPDA').val(),
                "Benzoic_deriv_": $('#SBenzoic_deriv_').val(),
                "Brand": $('#SBrand').val(),
                "Cationics": $('#SCationics').val(),
                "Country": $('#SCountry').val(),
                "Cyclodextr__Der_": $('#SCyclodextr__Der_').val(),
                "Cyclodextrin": $('#SCyclodextrin').val(),
                "Cyclodextrine": $('#SCyclodextrine').val(),
                "DAAAQ": $('#SDAAAQ').val(),
                "DADMAC": $('#SDADMAC').val(),
                "DEDEAQ": $('#SDEDEAQ').val(),
                "DETEAQ": $('#SDETEAQ').val(),
                "DMADA": $('#SDMADA').val(),
                "DMBAC": $('#SDMBAC').val(),
                "DMEBAC": $('#SDMEBAC').val(),
                "EFME": $('#SEFME').val(),
                "EthylcaproicNa": $('#SEthylcaproicNa').val(),
                "FAGA": $('#SFAGA').val(),
                "FAME": $('#SFAME').val(),
                "Fatty_Alcohol": $('#SFatty_Alcohol').val(),
                "FFA": $('#SFFA').val(),
                "Fluorinated_cmpd": $('#SFluorinated_cmpd').val(),
                "Fluoroc_tone": $('#SFluoroc_tone').val(),
                "Glycine_deriv_": $('#SGlycine_deriv_').val(),
                "Imidazoline_Der_": $('#SImidazoline_Der_').val(),
                "Isothiazolinone_der_": $('#SIsothiazolinone_der_').val(),
                "LAS": $('#SLAS').val(),
                "MEE": $('#SMEE').val(),
                "MES": $('#SMES').val(),
                "NO": $('#SNO').val(),
                "NonIonics": $('#SNonIonics').val(),
                "Phthalimide_deriv_": $('#SPhthalimide_deriv_').val(),
                "POE_Sorbitan_Ester": $('#SPOE_Sorbitan_Ester').val(),
                "Poly_Asparaginate": $('#SPoly_Asparaginate').val(),
                "ProdCode": $('#SProdCode').val(),
                "Producer": $('#SProducer').val(),
                "Sarkosyl": $('#SSarkosyl').val(),
                "SAS": $('#SSAS').val(),
                "Soaps": $('#SSoaps').val(),
                "SubType": $('#SSubType').val(),
                "SulfoAcetate": $('#SSulfoAcetate').val(),
                "Sulfobetaine": $('#SSulfobetaine').val(),
                "Sulphates": $('#SSulphates').val(),
                "Sulphonates": $('#SSulphonates').val(),
                "TMAC": $('#STMAC').val(),
                "tr_tr_muconic_acid_Na_salt": $('#Str_tr_muconic_acid_Na_salt').val(),
                "Type": $('#SType').val(),
                "Unknown": $('#SUnknown').val(),
                "WAX": $('#SWAX').val(),
                "Year": $('#SYear').val(),


            }, function (data) {

                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            $('#divMessage').html(temp[1]);
                            $("#divMessage").show();
                            $("#divMessage").fadeOut(10000);

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }

        function ShowDataP(Value) {
            $('.quote-platform-wrap').hide();
            $('#divResultView' + Value).show();
            var id = $('#<%=caab.ClientID%> option:selected').val();

            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', { "ID": id, "Category": "genp" }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {
                                $('#PAcry_Sulf_Copolymer').val(jsonData[0].Acry_Sulf_Copolymer);
                                $('#PBrand').val(jsonData[0].Brand);
                                $('#PCellulose').val(jsonData[0].Cellulose);
                                $('#PCountry').val(jsonData[0].Country);
                                $('#PDMDAAC_AM').val(jsonData[0].DMDAAC_AM);
                                $('#PGuar_gum').val(jsonData[0].Guar_gum);
                                $('#PID').val(jsonData[0].ID);
                                $('#PPCA_Sulf_Terpolymer').val(jsonData[0].PCA_Sulf_Terpolymer);
                                $('#PPCACopolymer').val(jsonData[0].PCACopolymer);
                                $('#PPCAHomopolymer').val(jsonData[0].PCAHomopolymer);
                                $('#PPCAsilicate_polymer').val(jsonData[0].PCAsilicate_polymer);
                                $('#PPEG').val(jsonData[0].PEG);
                                $('#PPEG_Carboxylate').val(jsonData[0].PEG_Carboxylate);
                                $('#PPolyamine_type').val(jsonData[0].Polyamine_type);
                                $('#PPolyethylene_immine').val(jsonData[0].Polyethylene_immine);
                                $('#PPolysulfonate').val(jsonData[0].Polysulfonate);
                                $('#PPolyvinylalcohol').val(jsonData[0].Polyvinylalcohol);
                                $('#PProdCode').val(jsonData[0].ProdCode);
                                $('#PProducer').val(jsonData[0].Producer);
                                $('#PPVP').val(jsonData[0].PVP);
                                $('#PPVP_VI').val(jsonData[0].PVP_VI);
                                $('#PPVPNO').val(jsonData[0].PVPNO);
                                $('#PSRP').val(jsonData[0].SRP);
                                $('#PSubType').val(jsonData[0].SubType);
                                $('#PType').val(jsonData[0].Type);
                                $('#PXanthan_Gum').val(jsonData[0].Xanthan_Gum);
                                $('#PYear').val(jsonData[0].Year);


                            }

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function SaveDataP() {
            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', {
                "Category": "genpe",
                "PID": $('#<%=caab.ClientID%> option:selected').val(),
                "Acry_Sulf_Copolymer": $('#PAcry_Sulf_Copolymer').val(),
                "Brand": $('#PBrand').val(),
                "Cellulose": $('#PCellulose').val(),
                "Country": $('#PCountry').val(),
                "DMDAAC_AM": $('#PDMDAAC_AM').val(),
                "Guar_gum": $('#PGuar_gum').val(),
                "ID": $('#PID').val(),
                "PCA_Sulf_Terpolymer": $('#PPCA_Sulf_Terpolymer').val(),
                "PCACopolymer": $('#PPCACopolymer').val(),
                "PCAHomopolymer": $('#PPCAHomopolymer').val(),
                "PCAsilicate_polymer": $('#PPCAsilicate_polymer').val(),
                "PEG": $('#PPEG').val(),
                "PEG_Carboxylate": $('#PPEG_Carboxylate').val(),
                "Polyamine_type": $('#PPolyamine_type').val(),
                "Polyethylene_immine": $('#PPolyethylene_immine').val(),
                "Polysulfonate": $('#PPolysulfonate').val(),
                "Polyvinylalcohol": $('#PPolyvinylalcohol').val(),
                "ProdCode": $('#PProdCode').val(),
                "Producer": $('#PProducer').val(),
                "PVP": $('#PPVP').val(),
                "PVP_VI": $('#PPVP_VI').val(),
                "PVPNO": $('#PPVPNO').val(),
                "SRP": $('#PSRP').val(),
                "SubType": $('#PSubType').val(),
                "Type": $('#PType').val(),
                "Xanthan_Gum": $('#PXanthan_Gum').val(),
                "Year": $('#PYear').val(),


            }, function (data) {

                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            $('#divMessage').html(temp[1]);
                            $("#divMessage").show();
                            $("#divMessage").fadeOut(10000);

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function ShowDataB(Value) {
            $('.quote-platform-wrap').hide();
            $('#divResultView' + Value).show();
            var id = $('#<%=caab.ClientID%> option:selected').val();

            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', { "ID": id, "Category": "genb" }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {

                                $('#BAccelerator').val(jsonData[0].Accelerator);
                                $('#BActivatorNOBS').val(jsonData[0].ActivatorNOBS);
                                $('#BActivatorTAED').val(jsonData[0].ActivatorTAED);
                                $('#BActiveOxygen').val(jsonData[0].ActiveOxygen);
                                $('#BBoron').val(jsonData[0].Boron);
                                $('#BBrand').val(jsonData[0].Brand);
                                $('#BChlorineBleach').val(jsonData[0].ChlorineBleach);
                                $('#BCountry').val(jsonData[0].Country);
                                $('#BH2O2').val(jsonData[0].H2O2);
                                $('#BID').val(jsonData[0].ID);
                                $('#BPAP').val(jsonData[0].PAP);
                                $('#BPerCarb').val(jsonData[0].PerCarb);
                                $('#BProdCode').val(jsonData[0].ProdCode);
                                $('#BProducer').val(jsonData[0].Producer);
                                $('#BSodium_Dichloroisocyanurate').val(jsonData[0].Sodium_Dichloroisocyanurate);
                                $('#BSPM').val(jsonData[0].SPM);
                                $('#BSPT').val(jsonData[0].SPT);
                                $('#BSubType').val(jsonData[0].SubType);
                                $('#BTrichloroisocyanuric_Acid').val(jsonData[0].Trichloroisocyanuric_Acid);
                                $('#BType').val(jsonData[0].Type);
                                $('#BYear').val(jsonData[0].Year);
                                $('#BZinc_Phthalocyanine_Sulphonate').val(jsonData[0].Zinc_Phthalocyanine_Sulphonate);
                                $('#BZn_PhS').val(jsonData[0].Zn_PhS);
                            }

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function SaveDataB() {
            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', {
                "Category": "genbe",
                "ID": $('#<%=caab.ClientID%> option:selected').val(),
                "Accelerator": $('#BAccelerator').val(),
                "ActivatorNOBS": $('#BActivatorNOBS').val(),
                "ActivatorTAED": $('#BActivatorTAED').val(),
                "ActiveOxygen": $('#BActiveOxygen').val(),
                "Boron": $('#BBoron').val(),
                "Brand": $('#BBrand').val(),
                "ChlorineBleach": $('#BChlorineBleach').val(),
                "Country": $('#BCountry').val(),
                "H2O2": $('#BH2O2').val(),
                "PAP": $('#BPAP').val(),
                "PerCarb": $('#BPerCarb').val(),
                "ProdCode": $('#BProdCode').val(),
                "Producer": $('#BProducer').val(),
                "Sodium_Dichloroisocyanurate": $('#BSodium_Dichloroisocyanurate').val(),
                "SPM": $('#BSPM').val(),
                "SPT": $('#BSPT').val(),
                "SubType": $('#BSubType').val(),
                "Trichloroisocyanuric_Acid": $('#BTrichloroisocyanuric_Acid').val(),
                "Type": $('#BType').val(),
                "Year": $('#BYear').val(),
                "Zinc_Phthalocyanine_Sulphonate": $('#BZinc_Phthalocyanine_Sulphonate').val(),
                "Zn_PhS": $('#BZn_PhS').val

            }, function (data) {

                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            $('#divMessage').html(temp[1]);
                            $("#divMessage").show();
                            $("#divMessage").fadeOut(10000);

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function ShowDataBu(Value) {
            $('.quote-platform-wrap').hide();
            $('#divResultView' + Value).show();
            var id = $('#<%=caab.ClientID%> option:selected').val();

            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', { "ID": id, "Category": "genbu" }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {

                                $('#BuAcetateNa').val(jsonData[0].AcetateNa);
                                $('#BuActive_Carbon').val(jsonData[0].Active_Carbon);
                                $('#BuATMP').val(jsonData[0].ATMP);
                                $('#BuBentonite').val(jsonData[0].Bentonite);
                                $('#BuBenzoic_acid').val(jsonData[0].Benzoic_acid);
                                $('#BuBrand').val(jsonData[0].Brand);
                                $('#BuCitrateNa').val(jsonData[0].CitrateNa);
                                $('#BuCitric_Acid').val(jsonData[0].Citric_Acid);
                                $('#BuClay').val(jsonData[0].Clay);
                                $('#BuCountry').val(jsonData[0].Country);
                                $('#BuDPG').val(jsonData[0].DPG);
                                $('#BuDTMPA').val(jsonData[0].DTMPA);
                                $('#BuDTPA').val(jsonData[0].DTPA);
                                $('#BuDTPMP').val(jsonData[0].DTPMP);
                                $('#BuEDDS').val(jsonData[0].EDDS);
                                $('#BuEDTA').val(jsonData[0].EDTA);
                                $('#BuEDTMPA').val(jsonData[0].EDTMPA);
                                $('#BuGLDA').val(jsonData[0].GLDA);
                                $('#BuHEDP').val(jsonData[0].HEDP);
                                $('#BuID').val(jsonData[0].ID);
                                $('#BuKaolin').val(jsonData[0].Kaolin);
                                $('#BuLactic_Acid').val(jsonData[0].Lactic_Acid);
                                $('#BuLaySilic').val(jsonData[0].LaySilic);
                                $('#BuMGDA').val(jsonData[0].MGDA);
                                $('#BuNa_Adipate').val(jsonData[0].Na_Adipate);
                                $('#BuNa_Formiate').val(jsonData[0].Na_Formiate);
                                $('#BuNa_gluconate').val(jsonData[0].Na_gluconate);
                                $('#BuNa_metasilicate_anh_').val(jsonData[0].Na_metasilicate_anh_);
                                $('#BuNa_poly_aspartate_').val(jsonData[0].Na_poly_aspartate_);
                                $('#BuNa_Salicylate').val(jsonData[0].Na_Salicylate);
                                $('#BuNa_Sebacate').val(jsonData[0].Na_Sebacate);
                                $('#BuNa_succinate').val(jsonData[0].Na_succinate);
                                $('#BuNa_Tartrate').val(jsonData[0].Na_Tartrate);
                                $('#BuNa2CO3').val(jsonData[0].Na2CO3);
                                $('#BuNa2O_2SiO2').val(jsonData[0].Na2O_2SiO2);
                                $('#BuNa3PO4').val(jsonData[0].Na3PO4);
                                $('#BuNa4P2O7').val(jsonData[0].Na4P2O7);
                                $('#BuNa5P3O10').val(jsonData[0].Na5P3O10);
                                $('#BuNaHCO3').val(jsonData[0].NaHCO3);
                                $('#BuNTA').val(jsonData[0].NTA);
                                $('#BuPaper_Sheets').val(jsonData[0].Paper_Sheets);
                                $('#BuPhosphoric_acid').val(jsonData[0].Phosphoric_acid);
                                $('#BuProdCode').val(jsonData[0].ProdCode);
                                $('#BuProducer').val(jsonData[0].Producer);
                                $('#BuSilica').val(jsonData[0].Silica);
                                $('#BuStrach').val(jsonData[0].Strach);
                                $('#BuSubType').val(jsonData[0].SubType);
                                $('#BuSucrose').val(jsonData[0].Sucrose);
                                $('#BuSulfamic_acid').val(jsonData[0].Sulfamic_acid);
                                $('#BuTextile').val(jsonData[0].Textile);
                                $('#BuTrimethoxy_Benzoic_acid').val(jsonData[0].Trimethoxy_Benzoic_acid);
                                $('#BuType').val(jsonData[0].Type);
                                $('#BuUrea').val(jsonData[0].Urea);
                                $('#BuYear').val(jsonData[0].Year);
                                $('#BuZeolite4A').val(jsonData[0].Zeolite4A);
                                $('#BuZeoliteP').val(jsonData[0].ZeoliteP);
                                $('#BuZnO').val(jsonData[0].ZnO);



                            }

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function SaveDataBu() {
            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', {
                "Category": "genbue",
                "ID": $('#<%=caab.ClientID%> option:selected').val(),
                "AcetateNa": $('#BuAcetateNa').val(),
                "Active_Carbon": $('#BuActive_Carbon').val(),
                "ATMP": $('#BuATMP').val(),
                "Bentonite": $('#BuBentonite').val(),
                "Benzoic_acid": $('#BuBenzoic_acid').val(),
                "Brand": $('#BuBrand').val(),
                "CitrateNa": $('#BuCitrateNa').val(),
                "Citric_Acid": $('#BuCitric_Acid').val(),
                "Clay": $('#BuClay').val(),
                "Country": $('#BuCountry').val(),
                "DPG": $('#BuDPG').val(),
                "DTMPA": $('#BuDTMPA').val(),
                "DTPA": $('#BuDTPA').val(),
                "DTPMP": $('#BuDTPMP').val(),
                "EDDS": $('#BuEDDS').val(),
                "EDTA": $('#BuEDTA').val(),
                "EDTMPA": $('#BuEDTMPA').val(),
                "GLDA": $('#BuGLDA').val(),
                "HEDP": $('#BuHEDP').val(),
                "Kaolin": $('#BuKaolin').val(),
                "Lactic_Acid": $('#BuLactic_Acid').val(),
                "LaySilic": $('#BuLaySilic').val(),
                "MGDA": $('#BuMGDA').val(),
                "Na_Adipate": $('#BuNa_Adipate').val(),
                "Na_Formiate": $('#BuNa_Formiate').val(),
                "Na_gluconate": $('#BuNa_gluconate').val(),
                "Na_metasilicate_anh_": $('#BuNa_metasilicate_anh_').val(),
                "Na_poly_aspartate_": $('#BuNa_poly_aspartate_').val(),
                "Na_Salicylate": $('#BuNa_Salicylate').val(),
                "Na_Sebacate": $('#BuNa_Sebacate').val(),
                "Na_succinate": $('#BuNa_succinate').val(),
                "Na_Tartrate": $('#BuNa_Tartrate').val(),
                "Na2CO3": $('#BuNa2CO3').val(),
                "Na2O_2SiO2": $('#BuNa2O_2SiO2').val(),
                "Na3PO4": $('#BuNa3PO4').val(),
                "Na4P2O7": $('#BuNa4P2O7').val(),
                "Na5P3O10": $('#BuNa5P3O10').val(),
                "NaHCO3": $('#BuNaHCO3').val(),
                "NTA": $('#BuNTA').val(),
                "Paper_Sheets": $('#BuPaper_Sheets').val(),
                "Phosphoric_acid": $('#BuPhosphoric_acid').val(),
                "ProdCode": $('#BuProdCode').val(),
                "Producer": $('#BuProducer').val(),
                "Silica": $('#BuSilica').val(),
                "Strach": $('#BuStrach').val(),
                "SubType": $('#BuSubType').val(),
                "Sucrose": $('#BuSucrose').val(),
                "Sulfamic_acid": $('#BuSulfamic_acid').val(),
                "Textile": $('#BuTextile').val(),
                "Trimethoxy_Benzoic_acid": $('#BuTrimethoxy_Benzoic_acid').val(),
                "Type": $('#BuType').val(),
                "Urea": $('#BuUrea').val(),
                "Year": $('#BuYear').val(),
                "Zeolite4A": $('#BuZeolite4A').val(),
                "ZeoliteP": $('#BuZeoliteP').val(),
                "ZnO": $('#BuZnO').val(),
                

            }, function (data) {

                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            $('#divMessage').html(temp[1]);
                            $("#divMessage").show();
                            $("#divMessage").fadeOut(10000);

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function ShowDataE(Value) {
            $('.quote-platform-wrap').hide();
            $('#divResultView' + Value).show();
            var id = $('#<%=caab.ClientID%> option:selected').val();

            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', { "ID": id, "Category": "genen" }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {

                                $('#EBrand').val(jsonData[0].Brand);
                                $('#ECarezyme_5SCEVU_G').val(jsonData[0].Carezyme_5SCEVU_G);
                                $('#ECountry').val(jsonData[0].Country);
                                $('#EID').val(jsonData[0].ID);
                                $('#ELipolase_100KLU_G').val(jsonData[0].Lipolase_100KLU_G);
                                $('#EProdCode').val(jsonData[0].ProdCode);
                                $('#EProducer').val(jsonData[0].Producer);
                                $('#ESavinase_16KNPU_G').val(jsonData[0].Savinase_16KNPU_G);
                                $('#ESubType').val(jsonData[0].SubType);
                                $('#ETermamyl_300KNU_G').val(jsonData[0].Termamyl_300KNU_G);
                                $('#EType').val(jsonData[0].Type);
                                $('#EYear').val(jsonData[0].Year);

                            }

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function SaveDataE() {
            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', {
                "Category": "genene",
                "ID": $('#<%=caab.ClientID%> option:selected').val(),
                "Brand": $('#EBrand').val(),
                "Carezyme_5SCEVU_G": $('#ECarezyme_5SCEVU_G').val(),
                "Country": $('#ECountry').val(),
                "Lipolase_100KLU_G": $('#ELipolase_100KLU_G').val(),
                "ProdCode": $('#EProdCode').val(),
                "Producer": $('#EProducer').val(),
                "Savinase_16KNPU_G": $('#ESavinase_16KNPU_G').val(),
                "SubType": $('#ESubType').val(),
                "Termamyl_300KNU_G": $('#ETermamyl_300KNU_G').val(),
                "Type": $('#EType').val(),
                "Year": $('#EYear').val(),


            }, function (data) {

                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            $('#divMessage').html(temp[1]);
                            $("#divMessage").show();
                            $("#divMessage").fadeOut(10000);

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function ShowDataO(Value) {
            $('.quote-platform-wrap').hide();
            $('#divResultView' + Value).show();
            var id = $('#<%=caab.ClientID%> option:selected').val();

            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', { "ID": id, "Category": "geno" }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {
                                $('#OAcid_Blue_9').val(jsonData[0].Acid_Blue_9);
                                $('#OADPODS').val(jsonData[0].ADPODS);
                                $('#OAGE').val(jsonData[0].AGE);
                                $('#OAlkanolamides').val(jsonData[0].Alkanolamides);
                                $('#OAmidopropylAO').val(jsonData[0].AmidopropylAO);
                                $('#OAmineOxides').val(jsonData[0].AmineOxides);
                                $('#OAO').val(jsonData[0].AO);
                                $('#OBallast').val(jsonData[0].Ballast);
                                $('#OBenzotriazole').val(jsonData[0].Benzotriazole);
                                $('#OBenzyl_alcohol').val(jsonData[0].Benzyl_alcohol);
                                $('#OBlankophor_LPG').val(jsonData[0].Blankophor_LPG);
                                $('#OBlankophor_RKH120').val(jsonData[0].Blankophor_RKH120);
                                $('#OBlankophor_TX').val(jsonData[0].Blankophor_TX);
                                $('#OBrand').val(jsonData[0].Brand);
                                $('#OButenediol').val(jsonData[0].Butenediol);
                                $('#OButoxydiglycol').val(jsonData[0].Butoxydiglycol);
                                $('#OButoxypropanol').val(jsonData[0].Butoxypropanol);
                                $('#OCaCl2').val(jsonData[0].CaCl2);
                                $('#OCO2').val(jsonData[0].CO2);
                                $('#OCountry').val(jsonData[0].Country);
                                $('#ODEA').val(jsonData[0].DEA);
                                $('#ODEG').val(jsonData[0].DEG);
                                $('#ODEGBE').val(jsonData[0].DEGBE);
                                $('#ODEGME').val(jsonData[0].DEGME);
                                $('#ODistearyl_ether').val(jsonData[0].Distearyl_ether);
                                $('#ODMDM_Hydantoin').val(jsonData[0].DMDM_Hydantoin);
                                $('#ODPGBE').val(jsonData[0].DPGBE);
                                $('#ODPGME').val(jsonData[0].DPGME);
                                $('#ODPGPE').val(jsonData[0].DPGPE);
                                $('#OEG').val(jsonData[0].EG);
                                $('#OEGBE').val(jsonData[0].EGBE);
                                $('#OEGHE').val(jsonData[0].EGHE);
                                $('#OEthanol').val(jsonData[0].Ethanol);
                                $('#OFADA').val(jsonData[0].FADA);
                                $('#OFAMA').val(jsonData[0].FAMA);
                                $('#OFAMIPA').val(jsonData[0].FAMIPA);
                                $('#OFormaldehyde').val(jsonData[0].Formaldehyde);
                                $('#OFormic_Acid').val(jsonData[0].Formic_Acid);
                                $('#OFWA').val(jsonData[0].FWA);
                                $('#OGlycerol').val(jsonData[0].Glycerol);
                                $('#OGlycol_distearate').val(jsonData[0].Glycol_distearate);
                                $('#OHexylene_glycol').val(jsonData[0].Hexylene_glycol);
                                $('#OID').val(jsonData[0].ID);
                                $('#OIsopropanol').val(jsonData[0].Isopropanol);
                                $('#OLignin').val(jsonData[0].Lignin);
                                $('#OMEA').val(jsonData[0].MEA);
                                $('#OMethylpropandiol').val(jsonData[0].Methylpropandiol);
                                $('#OMgCl2').val(jsonData[0].MgCl2);
                                $('#OMgSO4').val(jsonData[0].MgSO4);
                                $('#OMPG').val(jsonData[0].MPG);
                                $('#ONa2SO4').val(jsonData[0].Na2SO4);
                                $('#ONaCl').val(jsonData[0].NaCl);
                                $('#ONaOH').val(jsonData[0].NaOH);
                                $('#ONH4OH').val(jsonData[0].NH4OH);
                                $('#ONonPolarHydrocarbons').val(jsonData[0].NonPolarHydrocarbons);
                                $('#OPerfumes').val(jsonData[0].Perfumes);
                                $('#OPG').val(jsonData[0].PG);
                                $('#OPGBE').val(jsonData[0].PGBE);
                                $('#OPGME').val(jsonData[0].PGME);
                                $('#OPGPE').val(jsonData[0].PGPE);
                                $('#OPhenoxy_ethanol').val(jsonData[0].Phenoxy_ethanol);
                                $('#OPPG_Butyl_ether').val(jsonData[0].PPG_Butyl_ether);
                                $('#OProdCode').val(jsonData[0].ProdCode);
                                $('#OProducer').val(jsonData[0].Producer);
                                $('#OQuaternium_15').val(jsonData[0].Quaternium_15);
                                $('#OSCS').val(jsonData[0].SCS);
                                $('#OSiliconOils').val(jsonData[0].SiliconOils);
                                $('#OSorbitol').val(jsonData[0].Sorbitol);
                                $('#OSTS').val(jsonData[0].STS);
                                $('#OSubType').val(jsonData[0].SubType);
                                $('#OSunflower_seed_oil').val(jsonData[0].Sunflower_seed_oil);
                                $('#OSXS').val(jsonData[0].SXS);
                                $('#OTEA').val(jsonData[0].TEA);
                                $('#OTEG').val(jsonData[0].TEG);
                                $('#OTEGME').val(jsonData[0].TEGME);
                                $('#OTerpineol').val(jsonData[0].Terpineol);
                                $('#OTinopal_5BMGX').val(jsonData[0].Tinopal_5BMGX);
                                $('#OTinopal_AMSGX').val(jsonData[0].Tinopal_AMSGX);
                                $('#OTinopal_CBSX').val(jsonData[0].Tinopal_CBSX);
                                $('#OTinopal_DCS').val(jsonData[0].Tinopal_DCS);
                                $('#OTinopal_SWN').val(jsonData[0].Tinopal_SWN);
                                $('#OTinopal_UNPAGX').val(jsonData[0].Tinopal_UNPAGX);
                                $('#OTinosan').val(jsonData[0].Tinosan);
                                $('#OTiO2').val(jsonData[0].TiO2);
                                $('#OTPGBE').val(jsonData[0].TPGBE);
                                $('#OTPGME').val(jsonData[0].TPGME);
                                $('#OTriclosan').val(jsonData[0].Triclosan);
                                $('#OTrihydroxystearin').val(jsonData[0].Trihydroxystearin);
                                $('#OTTEG').val(jsonData[0].TTEG);
                                $('#OType').val(jsonData[0].Type);
                                $('#OWater').val(jsonData[0].Water);
                                $('#OX_2_Butoxyethanol').val(jsonData[0].X_2_Butoxyethanol);
                                $('#OYear').val(jsonData[0].Year);
                                $('#OZincPyrithione').val(jsonData[0].ZincPyrithione);
                                $('#OZn_acetate').val(jsonData[0].Zn_acetate);
                                $('#OZnCl2').val(jsonData[0].ZnCl2);
                                $('#OZnCO3').val(jsonData[0].ZnCO3);
                                $('#OZnSO4').val(jsonData[0].ZnSO4);



                            }

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function SaveDataO() {
            $('#loader').show();
            $.post('Ajax/GetBatelle.ashx', {
                "Category": "genoe",
                "ID": $('#<%=caab.ClientID%> option:selected').val(),
                "Acid_Blue_9": $('#OAcid_Blue_9').val(),
                "ADPODS": $('#OADPODS').val(),
                "AGE": $('#OAGE').val(),
                "Alkanolamides": $('#OAlkanolamides').val(),
                "AmidopropylAO": $('#OAmidopropylAO').val(),
                "AmineOxides": $('#OAmineOxides').val(),
                "AO": $('#OAO').val(),
                "Ballast": $('#OBallast').val(),
                "Benzotriazole": $('#OBenzotriazole').val(),
                "Benzyl_alcohol": $('#OBenzyl_alcohol').val(),
                "Blankophor_LPG": $('#OBlankophor_LPG').val(),
                "Blankophor_RKH120": $('#OBlankophor_RKH120').val(),
                "Blankophor_TX": $('#OBlankophor_TX').val(),
                "Brand": $('#OBrand').val(),
                "Butenediol": $('#OButenediol').val(),
                "Butoxydiglycol": $('#OButoxydiglycol').val(),
                "Butoxypropanol": $('#OButoxypropanol').val(),
                "CaCl2": $('#OCaCl2').val(),
                "CO2": $('#OCO2').val(),
                "Country": $('#OCountry').val(),
                "DEA": $('#ODEA').val(),
                "DEG": $('#ODEG').val(),
                "DEGBE": $('#ODEGBE').val(),
                "DEGME": $('#ODEGME').val(),
                "Distearyl_ether": $('#ODistearyl_ether').val(),
                "DMDM_Hydantoin": $('#ODMDM_Hydantoin').val(),
                "DPGBE": $('#ODPGBE').val(),
                "DPGME": $('#ODPGME').val(),
                "DPGPE": $('#ODPGPE').val(),
                "EG": $('#OEG').val(),
                "EGBE": $('#OEGBE').val(),
                "EGHE": $('#OEGHE').val(),
                "Ethanol": $('#OEthanol').val(),
                "FADA": $('#OFADA').val(),
                "FAMA": $('#OFAMA').val(),
                "FAMIPA": $('#OFAMIPA').val(),
                "Formaldehyde": $('#OFormaldehyde').val(),
                "Formic_Acid": $('#OFormic_Acid').val(),
                "FWA": $('#OFWA').val(),
                "Glycerol": $('#OGlycerol').val(),
                "Glycol_distearate": $('#OGlycol_distearate').val(),
                "Hexylene_glycol": $('#OHexylene_glycol').val(),
                "Isopropanol": $('#OIsopropanol').val(),
                "Lignin": $('#OLignin').val(),
                "MEA": $('#OMEA').val(),
                "Methylpropandiol": $('#OMethylpropandiol').val(),
                "MgCl2": $('#OMgCl2').val(),
                "MgSO4": $('#OMgSO4').val(),
                "MPG": $('#OMPG').val(),
                "Na2SO4": $('#ONa2SO4').val(),
                "NaCl": $('#ONaCl').val(),
                "NaOH": $('#ONaOH').val(),
                "NH4OH": $('#ONH4OH').val(),
                "NonPolarHydrocarbons": $('#ONonPolarHydrocarbons').val(),
                "Perfumes": $('#OPerfumes').val(),
                "PG": $('#OPG').val(),
                "PGBE": $('#OPGBE').val(),
                "PGME": $('#OPGME').val(),
                "PGPE": $('#OPGPE').val(),
                "Phenoxy_ethanol": $('#OPhenoxy_ethanol').val(),
                "PPG_Butyl_ether": $('#OPPG_Butyl_ether').val(),
                "ProdCode": $('#OProdCode').val(),
                "Producer": $('#OProducer').val(),
                "Quaternium_15": $('#OQuaternium_15').val(),
                "SCS": $('#OSCS').val(),
                "SiliconOils": $('#OSiliconOils').val(),
                "Sorbitol": $('#OSorbitol').val(),
                "STS": $('#OSTS').val(),
                "SubType": $('#OSubType').val(),
                "Sunflower_seed_oil": $('#OSunflower_seed_oil').val(),
                "SXS": $('#OSXS').val(),
                "TEA": $('#OTEA').val(),
                "TEG": $('#OTEG').val(),
                "TEGME": $('#OTEGME').val(),
                "Terpineol": $('#OTerpineol').val(),
                "Tinopal_5BMGX": $('#OTinopal_5BMGX').val(),
                "Tinopal_AMSGX": $('#OTinopal_AMSGX').val(),
                "Tinopal_CBSX": $('#OTinopal_CBSX').val(),
                "Tinopal_DCS": $('#OTinopal_DCS').val(),
                "Tinopal_SWN": $('#OTinopal_SWN').val(),
                "Tinopal_UNPAGX": $('#OTinopal_UNPAGX').val(),
                "Tinosan": $('#OTinosan').val(),
                "TiO2": $('#OTiO2').val(),
                "TPGBE": $('#OTPGBE').val(),
                "TPGME": $('#OTPGME').val(),
                "Triclosan": $('#OTriclosan').val(),
                "Trihydroxystearin": $('#OTrihydroxystearin').val(),
                "TTEG": $('#OTTEG').val(),
                "Type": $('#OType').val(),
                "Water": $('#OWater').val(),
                "X_2_Butoxyethanol": $('#OX_2_Butoxyethanol').val(),
                "Year": $('#OYear').val(),
                "ZincPyrithione": $('#OZincPyrithione').val(),
                "Zn_acetate": $('#OZn_acetate').val(),
                "ZnCl2": $('#OZnCl2').val(),
                "ZnCO3": $('#OZnCO3').val(),
                "ZnSO4": $('#OZnSO4').val(),


            }, function (data) {

                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            $('#divMessage').html(temp[1]);
                            $("#divMessage").show();
                            $("#divMessage").fadeOut(10000);

                        }
                    }
                }
                catch (ex) {
                    alert(ex);
                }
                finally {
                    $('#loader').hide();
                }

            });
        }
        function ShowComposition(Value) {
            $('#loader').show();
            $('.quote-platform-wrap').hide();
            $('#divResultView').show();
            $('#loader').hide();
        }
    </script>

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <ul class="nav nav-tabs">
        <li role="presentation"><a href="Default.aspx">Market</a></li>
        <li role="presentation"><a href="TechMap.aspx">Technical</a></li>
        <li role="presentation"><a href="AccountBrand.aspx">Account/Brand</a></li>
        <li role="presentation"><a href="ConAcctBrnd.aspx">Country/Account/Brand</a></li>
        <li role="presentation" class="active carrot"><a href="Batelle.aspx">Batella</a></li>
    </ul>
    <br />
    <br />
    <%--<a href="Views/MarketMapF/BatelleCreate.aspx">Create New</a>--%>

    <div id="divResultInfo" class="qoute-platform-wrap" style="display: none; clear: both;"></div>
    <div id="divResultLoader"></div>
    <asp:Button ID="marketClick" runat="server" OnClick="marketClick_Click" Style="display: none;" />
    <asp:HiddenField ID="hdnCountry" runat="server" Value="" />
    <div id="divResultView" class="quote-platform-wrap" style="display: block; clear: both;">
        <br />
        <br />
        <div class="form-horizontal" role="form">

            <div class="form-group">
                <label class="control-label col-sm-3" for="email">Select Producer:</label>
                <div class="col-sm-3 ">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="marketClick" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>

                            <asp:DropDownList ID="caab" runat="server" name="caab" onchange="ShowData()" CssClass="form-control" OnSelectedIndexChanged="caab_SelectedIndexChanged" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <div class="col-sm-3 ">
                    &nbsp;
                </div>
                <div class="col-sm-3 ">
                    <button type="button" class="btn btn-primary" onclick="ShowList()">&laquo; Back </button>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">ID:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="ID" disabled="disabled">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Year:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Year" disabled="disabled">
                </div>
                <label class="control-label col-sm-3">&nbsp;</label>
                <div class="col-sm-3">
                    <input type="button" class="form-control btn btn-info" value="Surfactant Composition" onclick="ShowDataS('S');" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Country:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Country" disabled="disabled">
                </div>
                <label class="control-label col-sm-3">&nbsp;</label>
                <div class="col-sm-3">
                    <input type="button" class="form-control btn btn-success" value="Polymers Composition" onclick="ShowDataP('P');" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Producer:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Producer" disabled="disabled">
                </div>
                <label class="control-label col-sm-3">&nbsp;</label>
                <div class="col-sm-3">
                    <input type="button" class="form-control btn btn-info" value="Bleach Composition" onclick="ShowDataB('B');" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Brand:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Brand" disabled="disabled">
                </div>
                <label class="control-label col-sm-3">&nbsp;</label>
                <div class="col-sm-3">
                    <input type="button" class="form-control btn btn-success" value="Builders Composition" onclick="ShowDataBu('Bu');" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Type:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Type" disabled="disabled">
                </div>
                <label class="control-label col-sm-3">&nbsp;</label>
                <div class="col-sm-3">
                    <input type="button" class="form-control btn btn-info" value="Enzymes Composition" onclick="ShowDataE('E');" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">SubType:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="SubType" disabled="disabled">
                </div>
                <label class="control-label col-sm-3">&nbsp;</label>
                <div class="col-sm-3">
                    <input type="button" class="form-control btn btn-success" value="Others Composition" onclick="ShowDataO('O');" />
                </div>
            </div>
            <div class="form-group">

                <label class="control-label col-sm-3">Su:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Su" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">DryRes:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="DryRes" placeholder="Enter">
                </div>


            </div>
            <div class="form-group">

                <label class="control-label col-sm-3">Fo:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Fo" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">Alc Sol:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="AlcSol" placeholder="Enter">
                </div>


            </div>
            <div class="form-group">

                <label class="control-label col-sm-3">Bu:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Bu" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">Alc Insol:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="AlcInsol" placeholder="Enter">
                </div>


            </div>
            <div class="form-group">

                <label class="control-label col-sm-3">Fi:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Fi" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">pH:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="pH" placeholder="Enter">
                </div>


            </div>
            <div class="form-group">

                <label class="control-label col-sm-3">Bl:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Bl" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">App Dens:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="AppDens" placeholder="Enter">
                </div>


            </div>
            <div class="form-group">

                <label class="control-label col-sm-3">Ca:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Ca" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">On Tap Dens:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="OnTapDens" placeholder="Enter">
                </div>


            </div>
            <div class="form-group">

                <label class="control-label col-sm-3">Po:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Po" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">Visc:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Visc" placeholder="Enter">
                </div>


            </div>
            <div class="form-group">

                <label class="control-label col-sm-3">En:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="En" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">Pen Ind:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="PenInd" placeholder="Enter">
                </div>


            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Mi:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Mi" placeholder="Enter">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">So:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="So" placeholder="Enter">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Hy:</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="Hy" placeholder="Enter">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-3">
                    <button type="button" class="btn btn-default" onclick="SaveDataGen()">Submit</button>
                </div>
            </div>
        </div>


    </div>
    <div id="divResultViewS" class="quote-platform-wrap form-horizontal">
         
        <div class="form-group">
            <label class="control-label col-sm-1">ID:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SID" disabled="disabled">
            </div>
            <div class="col-sm-3 text-right ">
                <button type="button" class="btn btn-primary" onclick="ShowComposition('S')">&laquo; Back </button>
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">AAA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAAA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AAB:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAAB" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AAG:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAAG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AAO:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAAO" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AB:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAB" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">ADHEB:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SADHEB" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ADMA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SADMA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ADMBAC:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SADMBAC" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ADMEAQ:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SADMEAQ" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ADMEBAC:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SADMEBAC" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">AE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AEO:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAEO" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AEO_APG:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAEO_APG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AEO_PO:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAEO_PO" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AEO_PO_PEG:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAEO_PO_PEG" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">AEOS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAEOS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AEOS_APEOS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAEOS_APEOS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Alpha_FAMES:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAlpha_FAMES" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Amphoterics:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAmphoterics" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AOS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAOS" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">APE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAPE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">APE_AEO:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAPE_AEO" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">APED:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAPED" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">APEOS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAPEOS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">APG:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAPG" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">AS_AEOS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAS_AEOS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AS_APEOS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SAS_APEOS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ASs:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SASs" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ATMAC:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SATMAC" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ATMAEOC:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SATMAEOC" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">BABS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SBABS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">BAPDA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SBAPDA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Benzoic deriv:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SBenzoic_deriv_" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Brand:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SBrand" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Cationics:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SCationics" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Country:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SCountry" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Cyclodextr Der_:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SCyclodextr__Der_" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Cyclodextrin:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SCyclodextrin" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Cyclodextrine:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SCyclodextrine" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DAAAQ:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SDAAAQ" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">DADMAC:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SDADMAC" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DEDEAQ:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SDEDEAQ" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DETEAQ:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SDETEAQ" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DMADA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SDMADA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DMBAC:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SDMBAC" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">DMEBAC:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SDMEBAC" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">EFME:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SEFME" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Ethylcaproic Na:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SEthylcaproicNa" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">FAGA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SFAGA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">FAME:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SFAME" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Fatty_Alcohol:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SFatty_Alcohol" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">FFA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SFFA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Fluorinated cmpd:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SFluorinated_cmpd" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Fluoroc tone:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SFluoroc_tone" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Glycine deriv:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SGlycine_deriv_" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Imidazoline Der_:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SImidazolineDer_" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Isothia zolinone der:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SIsothiazolinone_der_" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">LAS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SLAS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">MEE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SMEE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">MES:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SMES" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">NO:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SNO" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">NonIonics:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SNonIonics" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Phthalimide deriv:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SPhthalimide_deriv_" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">POE Sorbitan_Ester:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SPOE_Sorbitan_Ester" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Poly Asparaginate:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SPoly_Asparaginate" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">ProdCode:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SProdCode" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Producer:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SProducer" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Sarkosyl:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SSarkosyl" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">SAS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SSAS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Soaps:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SSoaps" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">SubType:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SSubType" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">SulfoAcetate:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SSulfoAcetate" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Sulfobetaine:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SSulfobetaine" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Sulphates:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SSulphates" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Sulphonates:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SSulphonates" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">TMAC:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="STMAC" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">tr_muconic acid Na salt:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="Str_tr_muconic_acid_Na_salt" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Type:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SType" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Unknown:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SUnknown" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">WAX:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SWAX" placeholder="Enter">
            </div>


        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Year:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="SYear" disabled="disabled">
            </div>

            <div class="col-sm-3">
                <input type="button" class=" btn btn-warning" onclick="SaveDataS()" value="Update Surfactant">
            </div>
        </div>


    </div>
    <div id="divResultViewP" class="quote-platform-wrap form-horizontal">
         
        <div class="form-group">
            <label class="control-label col-sm-3">ID:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PID" disabled="disabled">
            </div>
             <div class="col-sm-3 text-right">
                <button type="button" class="btn btn-primary" onclick="ShowComposition('P')">&laquo; Back </button>
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Acry Sulf Copolymer:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PAcry_Sulf_Copolymer" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Brand:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PBrand" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Cellulose:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PCellulose" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Country:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PCountry" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">DMDAAC_AM:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PDMDAAC_AM" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Guar_gum:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PGuar_gum" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">PCA Sulf Terpolymer:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPCA_Sulf_Terpolymer" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">PCACopolymer:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPCACopolymer" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">PCAHomopolymer:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPCAHomopolymer" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">PCAsilicate polymer:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPCAsilicate_polymer" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">PEG:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPEG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">PEG Carboxylate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPEG_Carboxylate" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Polyamine type:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPolyamine_type" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Polyethylene immine:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPolyethylene_immine" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Polysulfonate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPolysulfonate" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Polyvinylalcohol:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPolyvinylalcohol" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">ProdCode:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PProdCode" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Producer:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PProducer" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">PVP:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPVP" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">PVP_VI:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPVP_VI" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">PVPNO:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PPVPNO" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">SRP:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PSRP" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">SubType:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PSubType" disabled="disabled">
            </div>
            <label class="control-label col-sm-3">Type:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PType" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Xanthan Gum:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PXanthan_Gum" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Year:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="PYear" disabled="disabled">
            </div>

        </div>
         <div class="form-group">
            

            <div class="col-sm-3">
                <input type="button" class=" btn btn-warning" onclick="SaveDataP()" value="Update Polymer">
            </div>
        </div>

    </div>
    <div id="divResultViewB" class="quote-platform-wrap form-horizontal">
         
        <div class="form-group">
            <label class="control-label col-sm-3">ID:</label><div class="col-sm-3" >
                <input type="text" class="form-control" id="BID" disabled="disabled">
            </div>
            <div class="col-sm-3 text-right">
                <button type="button" class="btn btn-primary" onclick="ShowComposition('B')">&laquo; Back </button>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Accelerator:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BAccelerator" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">ActivatorNOBS:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BActivatorNOBS" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">ActivatorTAED:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BActivatorTAED" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">ActiveOxygen:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BActiveOxygen" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Boron:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BBoron" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Brand:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BBrand" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">ChlorineBleach:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BChlorineBleach" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Country:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BCountry" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">H2O2:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BH2O2" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">PAP:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BPAP" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">PerCarb:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BPerCarb" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">ProdCode:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BProdCode" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Producer:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BProducer" disabled="disabled">
            </div>
            <label class="control-label col-sm-3">Sodium Dichloroisocyanurate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BSodium_Dichloroisocyanurate" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">SPM:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BSPM" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">SPT:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BSPT" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">SubType:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BSubType" disabled="disabled">
            </div>
            <label class="control-label col-sm-3">Trichloro isocyanuric Acid:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BTrichloroisocyanuric_Acid" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Type:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BType" disabled="disabled">
            </div>
            <label class="control-label col-sm-3">Year:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BYear" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Zinc Phthalocyanine Sulphonate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BZinc_Phthalocyanine_Sulphonate" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Zn_PhS:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BZn_PhS" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            

            <div class="col-sm-3">
                <input type="button" class=" btn btn-warning" onclick="SaveDataB()" value="Update Bleach">
            </div>
        </div>
    </div>
    <div id="divResultViewBu" class="quote-platform-wrap form-horizontal">
       
        <div class="form-group">
            <label class="control-label col-sm-3">ID:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuID" disabled="disabled">
            </div>
             <div class="col-sm-3 text-right">
                <button type="button" class="btn btn-primary" onclick="ShowComposition('Bu')">&laquo; Back </button>
            </div>

        </div>

        <div class="form-group">
            <label class="control-label col-sm-3">ATMP:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuATMP" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Bentonite:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuBentonite" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Benzoic_acid:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuBenzoic_acid" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Brand:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuBrand" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">CitrateNa:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuCitrateNa" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Citric_Acid:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuCitric_Acid" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Clay:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuClay" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Country:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuCountry" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">DPG:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuDPG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">DTMPA:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuDTMPA" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">DTPA:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuDTPA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">DTPMP:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuDTPMP" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">EDDS:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuEDDS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">EDTA:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuEDTA" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">EDTMPA:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuEDTMPA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">GLDA:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuGLDA" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">HEDP:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuHEDP" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Kaolin:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuKaolin" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Lactic_Acid:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuLactic_Acid" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">LaySilic:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuLaySilic" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">MGDA:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuMGDA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Na_Adipate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa_Adipate" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Na_Formiate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa_Formiate" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Na_gluconate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa_gluconate" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Na_metasilicate_anh_:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa_metasilicate_anh_" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Na_poly_aspartate_:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa_poly_aspartate_" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Na_Salicylate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa_Salicylate" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Na_Sebacate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa_Sebacate" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Na_succinate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa_succinate" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Na_Tartrate:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa_Tartrate" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Na2CO3:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa2CO3" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Na2O_2SiO2:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa2O_2SiO2" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Na3PO4:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa3PO4" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Na4P2O7:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNa4P2O7" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">NTA:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuNTA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Paper_Sheets:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuPaper_Sheets" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Phosphoric_acid:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuPhosphoric_acid" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">ProdCode:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuProdCode" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Producer:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuProducer" disabled="disabled">
            </div>
            <label class="control-label col-sm-3">Silica:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuSilica" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Strach:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuStrach" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">SubType:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuSubType" disabled="disabled">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Sucrose:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuSucrose" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Sulfamic_acid:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuSulfamic_acid" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Textile:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuTextile" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">Trimethoxy_Benzoic_acid:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuTrimethoxy_Benzoic_acid" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Type:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuType" disabled="disabled">
            </div>
            <label class="control-label col-sm-3">Urea:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuUrea" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Year:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuYear" disabled="disabled">
            </div>
            <label class="control-label col-sm-3">Zeolite4A:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuZeolite4A" placeholder="Enter">
            </div>

        </div>
        
         <div class="form-group">
            <label class="control-label col-sm-3">ZeoliteP:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuZeoliteP" placeholder="Enter">
            </div>
            <label class="control-label col-sm-3">ZnO:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="BuZnO" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            

            <div class="col-sm-3">
                <input type="button" class=" btn btn-warning" onclick="SaveDataBu()" value="Update Builder">
            </div>
        </div>

    </div>
    <div id="divResultViewE" class="quote-platform-wrap form-horizontal">
         
        <div class="form-group">
            <div class="form-group">
                <label class="control-label col-sm-3">ID:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="EID" disabled="disabled">
                </div>
                 <div class="col-sm-3 text-right">
                <button type="button" class="btn btn-primary" onclick="ShowComposition('B')">&laquo; Back </button>
            </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Carezyme 5SCEVU_G:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="ECarezyme_5SCEVU_G" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">Country:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="ECountry" disabled="disabled">
                </div>

            </div>
            <div class="form-group">
                
                <label class="control-label col-sm-3">Lipolase 100KLU_G:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="ELipolase_100KLU_G" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">Year:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="EYear" disabled="disabled">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">ProdCode:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="EProdCode" disabled="disabled">
                </div>
                <label class="control-label col-sm-3">Producer:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="EProducer" disabled="disabled">
                </div>

            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Savinase 16KNPU_G:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="ESavinase_16KNPU_G" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">SubType:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="ESubType" disabled="disabled">
                </div>

            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Termamyl 300KNU_G:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="ETermamyl_300KNU_G" placeholder="Enter">
                </div>
                <label class="control-label col-sm-3">Type:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="EType" disabled="disabled">
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Brand:</label><div class="col-sm-3">
                    <input type="text" class="form-control" id="EBrand"disabled="disabled">
                </div>
                  <div class="col-sm-3">
                <input type="button" class=" btn btn-warning" onclick="SaveDataE()" value="Update Enzymes">
            </div>

            </div>
             
        </div>

    </div>
    <div id="divResultViewO" class="quote-platform-wrap form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-1">ID:</label><div class="col-sm-3">
                <input type="text" class="form-control" id="OID" disabled="disabled">
            </div>
            <div class="col-sm-3 text-right">
                <button type="button" class="btn btn-primary" onclick="ShowComposition('B')">&laquo; Back </button>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">ADPODS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OADPODS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Acid_Blue_9:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OAcid_Blue_9" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AGE:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OAGE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Alkanolamides:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OAlkanolamides" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Amido propylAO:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OAmidopropylAO" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">AmineOxides:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OAmineOxides" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">AO:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OAO" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Ballast:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OBallast" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Benzotriazole:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OBenzotriazole" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Benzyl alcohol:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OBenzyl_alcohol" placeholder="Enter">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Blankophor LPG:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OBlankophor_LPG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Blankophor RKH120:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OBlankophor_RKH120" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Blankophor TX:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OBlankophor_TX" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Brand:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OBrand" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Butenediol:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OButenediol" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Butoxydi glycol:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OButoxydiglycol" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Butoxy propanol:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OButoxypropanol" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">CaCl2:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OCaCl2" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">CO2:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OCO2" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Country:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OCountry" disabled="disabled">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">DEA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="ODEA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DEG:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="ODEG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DEGBE:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="ODEGBE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DEGME:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="ODEGME" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Distearyl ether:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="ODistearyl_ether" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">DMDM Hydantoin:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="ODMDM_Hydantoin" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DPGBE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="ODPGBE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DPGME:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="ODPGME" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">DPGPE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="ODPGPE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">EG:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OEG" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">EGBE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OEGBE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">EGHE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OEGHE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Ethanol:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OEthanol" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">FADA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OFADA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">FAMA:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OFAMA" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">FAMIPA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OFAMIPA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Formal dehyde:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OFormaldehyde" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Formic Acid:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OFormic_Acid" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">FWA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OFWA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Glycerol:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OGlycerol" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Glycol distearate:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OGlycol_distearate" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Hexylene glycol:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OHexylene_glycol" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Isopropanol:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OIsopropanol" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Lignin:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OLignin" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">MEA:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OMEA" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Methylpropandiol:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OMethylpropandiol" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">MgCl2:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OMgCl2" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">MgSO4:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OMgSO4" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">MPG:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OMPG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Na2SO4:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="ONa2SO4" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">NaCl:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="ONaCl" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">NaOH:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="ONaOH" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">NH4OH:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="ONH4OH" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">NonPolar Hydrocarbons:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="ONonPolarHydrocarbons" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Perfumes:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OPerfumes" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">PG:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OPG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">PGBE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OPGBE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">PGME:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OPGME" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">PGPE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OPGPE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Phenoxy ethanol:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OPhenoxy_ethanol" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">PPG Butyl ether:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OPPG_Butyl_ether" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ProdCode:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OProdCode" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Producer:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OProducer" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Quaternium 15:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OQuaternium_15" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">SCS:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OSCS" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">SiliconOils:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OSiliconOils" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Sorbitol:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OSorbitol" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">STS:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OSTS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">SubType:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OSubType" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Sunflower seed oil:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OSunflower_seed_oil" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">SXS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OSXS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">TEA:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTEA" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">TEG:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OTEG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">TEGME:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTEGME" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Terpineol:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OTerpineol" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Tinopal 5BMGX:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTinopal_5BMGX" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Tinopal AMSGX:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTinopal_AMSGX" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Tinopal CBSX:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OTinopal_CBSX" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Tinopal DCS:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTinopal_DCS" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Tinopal SWN:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OTinopal_SWN" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Tinopal UNPAGX:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTinopal_UNPAGX" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Tinosan:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTinosan" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">TiO2:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OTiO2" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">TPGBE:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTPGBE" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">TPGME:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OTPGME" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">Triclosan:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTriclosan" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Tri hydroxy stearin:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OTrihydroxystearin" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">TTEG:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OTTEG" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Type:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OType" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Water:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OWater" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">X_2_Butoxy ethanol:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OX_2_Butoxyethanol" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Year:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OYear" disabled="disabled">
            </div>
            <label class="control-label col-sm-1">Zinc Pyrithione:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OZincPyrithione" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">Zn acetate:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OZn_acetate" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ZnCl2:</label><div class="col-sm-2">
                <input type="text" class="form-control" id="OZnCl2" placeholder="Enter">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-1">ZnCO3:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OZnCO3" placeholder="Enter">
            </div>
            <label class="control-label col-sm-1">ZnSO4:</label><div class="col-sm-1">
                <input type="text" class="form-control" id="OZnSO4" placeholder="Enter">
            </div>
             <div class="col-sm-3">
                <input type="button" class=" btn btn-warning" onclick="SaveDataO()" value="Update Others">
            </div>
        </div>
          

    </div>
    <div style="display: block;" class="sort-loader onboard" id="loader">
        <p>
            <img alt="Loading..." src="../images/ajax-loader_new.gif"><br>
            <span id="lblWaiting">Loading please wait...</span>
        </p>
    </div>

    <div id="divMessage" class="message-watch" style="display: none;"></div>


</asp:Content>

