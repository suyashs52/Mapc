<%@ Page Title="Tech Map Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TechMap.aspx.cs" Inherits="MapC.TechMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet">
    <script type="text/javascript" src="/Scripts/moment.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            showResult();
        });
        function showResult() {
            $('#divResultInfo').show();
            $('#divResultView').hide();
            $('#divResultLoader').html('<table style="width: 100%;border-bottom: 1px solid rgb(221, 221, 221);"><tr><td align="center" style="text-align:center;padding-bottom:50px;" colspan="6"><img alt="loading" src="../images/ajax-loader_new.gif"></td></tr></table>');
            $('#divResultInfo').html('<span style="margin:20px;"><h4>Please Wait...</h4></span>');
            $.post('Ajax/GetTechList.ashx', { "ID": 1000 }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {
                            var table = '<table class="table table-striped"><thead><tr><th>Country</th><th>AccountName</th><th>BrandName</th><th>Tier </th><th></th></tr></thead><tbody>';
                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {
                                for (var i = 0; i < jsonData.length; i++) {
                                    tr += '<tr><td><a href="javascript:void(0)" onclick="ShowMM(\'' + jsonData[i].Country + '\');">' + jsonData[i].Country + '</a></td><td>' + decodeURIComponent(jsonData[i].AccountName).toLocaleString() + '</td>';
                                    tr += '<td>' + jsonData[i].BrandName + '</td><td>' + jsonData[i].Tier + '</td><td>' + jsonData[i].ID + '</td></tr>';
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
            id = -id;
            $('#loader').show();
            $.post('Ajax/GetTechList.ashx', { "ID": id }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {
                                $('#date').val(jsonData[0].TmmtDate);
                                $('#<%=country.ClientID%>').val(jsonData[0].LookuptoTmmCountryT);
                                $('#<%=account.ClientID%>').val(jsonData[0].LookuptoTmmAcountT);
                                $('#<%=accountType.ClientID%>').val(jsonData[0].LookuptoTmmAccountTypeT);
                                $('#<%=brandName.ClientID%>').val(jsonData[0].LookuptoTmmBrandName);
                                $('#<%=enzymeSupplier.ClientID%>').val(jsonData[0].LookuptoTmmEnzymeSupplierT);
                                $('#<%=productType.ClientID%>').val(jsonData[0].LookuptoTmmProductT);
                                $('#<%=enzymeSolutionName.ClientID%>').val(parseInt(jsonData[0].EnzymeSolutionName));
                                $('#<%=tier.ClientID%>').val(jsonData[0].LookuptoTmmTierT);
                                $('#Alcalinity').val(jsonData[0].Alcalinity);
                                $('#AMLAS').val(jsonData[0].AMLAS);
                                $('#AMNA').val(jsonData[0].AMNA);
                                $('#AMSoap').val(jsonData[0].AMSoap);
                                $('#BatelleData').val(jsonData[0].BatelleData);
                                $('#Bleachactiveoxygen').val(jsonData[0].Bleachactiveoxygen);
                                $('#Carbonate').val(jsonData[0].Carbonate);
                                $('#Carbonates').val(jsonData[0].Carbonates);
                                $('#Comments4').val(jsonData[0].Comments4);
                                $('#Comments5').val(jsonData[0].Comments5);
                                $('#Commets3').val(jsonData[0].Commets3);
                                $('#DosageDetergentgLwash').val(jsonData[0].DosageDetergentgLwash);
                                $('#EnzymeCosts').val(jsonData[0].EnzymeCosts);
                                $('#EnzymeDosageStudy').val(jsonData[0].EnzymeDosageStudy);
                                $('#Field10').val(jsonData[0].Field10);
                                $('#Field6').val(jsonData[0].Field6);
                                $('#Field7').val(jsonData[0].Field7);
                                $('#Field8').val(jsonData[0].Field8);
                                $('#Field9').val(jsonData[0].Field9);
                                $('#FormulationCost').val(jsonData[0].FormulationCost);
                                $('#Glycerine').val(jsonData[0].Glycerine);
                                $('#Linktochemicalanalysis').val(jsonData[0].Linktochemicalanalysis);
                                $('#LinktoWPreport').val(jsonData[0].LinktoWPreport);
                                $('#OpticalBrigthener').val(jsonData[0].OpticalBrigthener);
                                $('#PHDetergent').val(jsonData[0].PHDetergent);
                                $('#Silicate').val(jsonData[0].Silicate);
                                $('#STPPsodiumsalt').val(jsonData[0].STPPsodiumsalt);
                                $('#Swatch10').val(jsonData[0].Swatch10);
                                $('#Swatch6').val(jsonData[0].Swatch6);
                                $('#Swatch7').val(jsonData[0].Swatch7);
                                $('#Swatch8').val(jsonData[0].Swatch8);
                                $('#Swatch9').val(jsonData[0].Swatch9);
                                $('#TAEDcontent').val(jsonData[0].TAEDcontent);
                                $('#Talc').val(jsonData[0].Talc);
                                $('#TFM').val(jsonData[0].TFM);
                                $('#Water').val(jsonData[0].Water);
                                $('#WaterHardnessdH').val(jsonData[0].WaterHardnessdH);
                                $('#WPCFTCS06').val(jsonData[0].WPCFTCS06);
                                $('#WPCFTCS28').val(jsonData[0].WPCFTCS28);
                                $('#WPCFTKCH141').val(jsonData[0].WPCFTKCH141);
                                $('#WPEMPA116').val(jsonData[0].WPEMPA116);
                                $('#WPTemperature').val(jsonData[0].WPTemperature);
                                $('#WPType').val(jsonData[0].WPType);
                                $('#WPWFK20PF').val(jsonData[0].WPWFK20PF);
                                $('#Zeolites').val(jsonData[0].Zeolites);

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

        function isNumber(evt) {
          //  var arr = new Array();
            //arr = "0123456789";

            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            //var KeyChar = String.fromCharCode(charCode);
            if(charCode>47 && charCode<58 || charCode==9)
                return true
            else return false;
            //for (k = 0; k < arr.length; k++) {

            //    if (KeyChar == arr[k]) {

            //        return true;
            //    }

            //}
            //return false;
        }

        function SaveData() {
            $.post('Ajax/GetTechList.ashx', {
                "ID": $('#<%=caab.ClientID%>').val(),
                "TmmtDate": $('#date').val(),
                "LookuptoTmmCountryT": $('#<%=country.ClientID%>').val(),
                "LookuptoTmmAcountT": $('#<%=account.ClientID%>').val(),
                "LookuptoTmmAccountTypeT": $('#<%=accountType.ClientID%>').val(),
                "LookuptoTmmBrandName": $('#<%=brandName.ClientID%>').val(),
                "LookuptoTmmEnzymeSupplierT": $('#<%=enzymeSupplier.ClientID%>').val(),
                "LookuptoTmmProductT": $('#<%=productType.ClientID%>').val(),
                "EnzymeSolutionName": $('#<%=enzymeSolutionName.ClientID%>').val(),
                "LookuptoTmmTierT": $('#<%=tier.ClientID%>').val(),
                "Alcalinity": $('#Alcalinity').val(),
                "AMLAS": $('#AMLAS').val(),
                "AMNA": $('#AMNA').val(),
                "AMSoap": $('#AMSoap').val(),
                "BatelleData": $('#BatelleData').val(),
                "Bleachactiveoxygen": $('#Bleachactiveoxygen').val(),
                "Carbonate": $('#Carbonate').val(),
                "Carbonates": $('#Carbonates').val(),
                "Comments4": $('#Comments4').val(),
                "Comments5": $('#Comments5').val(),
                "Commets3": $('#Commets3').val(),
                "DosageDetergentgLwash": $('#DosageDetergentgLwash').val(),
                "EnzymeCosts": $('#EnzymeCosts').val(),
                "EnzymeDosageStudy": $('#EnzymeDosageStudy').val(),
                "Field10": $('#Field10').val(),
                "Field6": $('#Field6').val(),
                "Field7": $('#Field7').val(),
                "Field8": $('#Field8').val(),
                "Field9": $('#Field9').val(),
                "FormulationCost": $('#FormulationCost').val(),
                "Glycerine": $('#Glycerine').val(),
                "Linktochemicalanalysis": $('#Linktochemicalanalysis').val(),
                "LinktoWPreport": $('#LinktoWPreport').val(),
                "OpticalBrigthener": $('#OpticalBrigthener').val(),
                "PHDetergent": $('#PHDetergent').val(),
                "Silicate": $('#Silicate').val(),
                "STPPsodiumsalt": $('#STPPsodiumsalt').val(),
                "Swatch10": $('#Swatch10').val(),
                "Swatch6": $('#Swatch6').val(),
                "Swatch7": $('#Swatch7').val(),
                "Swatch8": $('#Swatch8').val(),
                "Swatch9": $('#Swatch9').val(),
                "TAEDcontent": $('#TAEDcontent').val(),
                "Talc": $('#Talc').val(),
                "TFM": $('#TFM').val(),
                "Water": $('#Water').val(),
                "WaterHardnessdH": $('#WaterHardnessdH').val(),
                "WPCFTCS06": $('#WPCFTCS06').val(),
                "WPCFTCS28": $('#WPCFTCS28').val(),
                "WPCFTKCH141": $('#WPCFTKCH141').val(),
                "WPEMPA116": $('#WPEMPA116').val(),
                "WPTemperature": $('#WPTemperature').val(),
                "WPType": $('#WPType').val(),
                "WPWFK20PF": $('#WPWFK20PF').val(),
                "Zeolites": $('#Zeolites').val()


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
    </script>

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <ul class="nav nav-tabs">
        <li role="presentation"><a href="Default.aspx">Market</a></li>
        <li role="presentation" class="active carrot"><a href="TechMap.aspx">Technical</a></li>
        <li role="presentation"><a href="AccountBrand.aspx">Account/Brand</a></li>
        <li role="presentation"><a href="ConAcctBrnd.aspx">Country/Account/Brand</a></li>
        <li role="presentation"><a href="Batella.aspx">Batella</a></li>
    </ul>
    <br />
    <br />
    <a href="Views/MarketMapF/TechMapCreate.aspx">Create New</a>
    <div id="divResultInfo" class="qoute-platform-wrap" style="display: none; clear: both;"></div>
    <div id="divResultLoader"></div>
    <asp:Button ID="marketClick" runat="server" OnClick="marketClick_Click" Style="display: none;" />
    <asp:HiddenField ID="hdnCountry" runat="server" Value="" />

    <div id="divResultView" class="qoute-platform-wrap" style="display: block; clear: both">

        <br />
        <br />
        <div class="form-horizontal" role="form">
            <div class="form-group">
                <label class="control-label col-sm-3" for="email">
                    Select your Country<br />
                    Account /BrandName/Tier:</label>
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
                <label class="control-label col-sm-3" for="email">Date:</label>

                <div class="col-sm-3">

                    <div class='input-group date' id='datetimepicker1'>
                        <input type="text" class="form-control" id="date" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#datetimepicker1').datetimepicker({

                                format: 'DD/MM/YYYY'
                            });
                        });
                    </script>

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Country:</label>
                <div class="col-sm-3 ">
                    <asp:DropDownList ID="country" runat="server" CssClass="form-control" />

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Account:</label>
                <div class="col-sm-3 ">
                    <asp:DropDownList ID="account" runat="server" CssClass="form-control" />

                </div>
            </div>
            <div class="form-group">
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Account Type:</label>
                <div class="col-sm-3 ">
                    <asp:DropDownList ID="accountType" runat="server" CssClass="form-control" />
                </div>
                <label class="control-label col-sm-3">BrandName:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="brandName" runat="server" CssClass="form-control" />

                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">EnzymeSupplier:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="enzymeSupplier" runat="server" CssClass="form-control" />

                </div>
                <label class="control-label col-sm-3">ProductType:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="productType" runat="server" CssClass="form-control" />

                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">EnzymeSolutionName:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="enzymeSolutionName" runat="server" CssClass="form-control" />

                </div>
                <label class="control-label col-sm-3">Tier:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="tier" runat="server" CssClass="form-control" />

                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">Detergent Formula</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label class="control-label col-sm-4">AM LAS:</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" id="AMLAS" placeholder="Enter">
                            </div>

                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-4">AM Soap:</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" id="AMSoap" placeholder="Enter">
                            </div>

                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-12">Link to chemical analysis:</label>

                            <div class="col-sm-12 ">
                                <input type="text" class="form-control" id="Linktochemicalanalysis" placeholder="Enter">
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-sm-4">AM NA:</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" id="AMNA" placeholder="Enter">
                            </div>

                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-7">Bleach( active oxygen):</label>
                            <div class="col-sm-12 ">
                                <input type="text" class="form-control" id="Bleachactiveoxygen" placeholder="Enter">
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-12">STPP (sodium salt):</label>
                            <div class="col-sm-12 ">
                                <input type="text" class="form-control" id="STPPsodiumsalt" placeholder="Enter">
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6">Comment S4:</label>

                            <div class="col-sm-12 ">
                                <input type="text" class="form-control" id="Comments4" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Zeolites:</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" id="Zeolites" placeholder="Enter">
                            </div>

                        </div>
                        <br>
                        <br>
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Carbonates:</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" id="Carbonates" placeholder="Enter">
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-12">TAED content:</label>
                            <div class="col-sm-12 ">
                                <input type="text" class="form-control" id="TAEDcontent" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-12">Optical Brigthener:</label>
                            <div class="col-sm-12 ">
                                <input type="text" class="form-control" id="OpticalBrigthener" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-12">Enzyme Costs:</label>
                            <div class="col-sm-11 ">
                                <input type="text" class="form-control" id="EnzymeCosts" placeholder="Enter">
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-12">Formulation Cost:</label>
                            <div class="col-sm-12 ">
                                <input type="text" class="form-control" id="FormulationCost" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-12">Batelle Data:</label>
                            <div class="col-sm-12 ">
                                <input type="text" class="form-control" id="BatelleData" placeholder="Enter">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-4">
                <div class="panel panel-info">
                    <div class="panel-heading">SoapBar Formula</div>
                    <div class="panel-body form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-4">TFM:</label>
                            <div class="col-sm-8 ">
                                <input type="text" placeholder="Enter" id="TFM" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Water:</label>
                            <div class="col-sm-8 ">
                                <input type="text" placeholder="Enter" id="Water" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Alcalinity:</label>
                            <div class="col-sm-8">
                                <input type="text" placeholder="Enter" id="Alcalinity" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Glycerine:</label>
                            <div class="col-sm-8 ">
                                <input type="text" placeholder="Enter" id="Glycerine" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Silicate:</label>
                            <div class="col-sm-8 ">
                                <input type="text" placeholder="Enter" id="Silicate" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Talc:</label>
                            <div class="col-sm-8 ">
                                <input type="text" placeholder="Enter" id="Talc" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Carbonate:</label>
                            <div class="col-sm-8 ">
                                <input type="text" placeholder="Enter" id="Carbonate" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-4">Comments5:</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" id="Comments5" placeholder="Enter">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">Washing Trial</div>
                    <div class="panel-body form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-7">Enzyme Dosage Study:</label>

                            <label class="control-label col-sm-5">WPCFTCS28:</label>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-7 ">
                                <input type="text" class="form-control" id="EnzymeDosageStudy" placeholder="Enter">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="WPCFTCS28" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-7">WPType:</label>

                            <label class="control-label col-sm-5">WPWFK20PF:</label>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-7 ">
                                <input type="text" class="form-control" id="WPType" placeholder="Enter">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="WPWFK20PF" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-7">WPTemperature:</label>

                            <label class="control-label col-sm-5">WPCFTCS06:</label>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-7 ">
                                <input type="text" class="form-control" id="WPTemperature" placeholder="Enter">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="WPCFTCS06" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-7">
                                DosageDetergent<br />
                                (g/L wash):</label>

                            <label class="control-label col-sm-5">WPEMPA116:</label>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-7 ">
                                <input type="text" class="form-control" id="DosageDetergentgLwash" placeholder="Enter">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="WPEMPA116" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-7">WaterHardnessdH:</label>
                            <label class="control-label col-sm-5">WPCFTKCH141:</label>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-7 ">
                                <input type="text" class="form-control" id="WaterHardnessdH" placeholder="Enter">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="WPCFTKCH141" placeholder="Enter">
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <label class="control-label col-sm-4">PHDetergent:</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" id="PHDetergent" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-sm-7 ">
                                <input type="text" class="form-control" id="Swatch6" placeholder="Enter">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="Field6" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Commets3:</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" id="Commets3" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-sm-7 ">
                                <input type="text" class="form-control" id="Swatch7" placeholder="Use Comma">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="Field7" placeholder="Enter" onkeypress="return isNumber(event)">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-sm-7 ">
                                <input type="text" class="form-control" id="Swatch8" placeholder="Enter">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="Field8" placeholder="Enter" onkeypress="return isNumber(event)">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="Swatch9" placeholder="Enter">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="Field9" placeholder="Enter" onkeypress="return isNumber(event)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">LinktoWPreport:</label>
                            <div class="col-sm-8 ">
                                <input type="text" class="form-control" id="LinktoWPreport" placeholder="Enter">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="Swatch10" placeholder="Enter">
                            </div>
                            <div class="col-sm-5 ">
                                <input type="text" class="form-control" id="Field10" placeholder="Enter" onkeypress="return isNumber(event)">
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
                <div class="col-sm-offset-2 col-sm-3">
                    <button type="submit" class="btn btn-default" onclick="SaveData()">Submit</button>
                </div>
            </div>







    </div>
    <div style="display: none;" class="sort-loader onboard" id="loader">
        <p>
            <img alt="Loading..." src="../images/ajax-loader_new.gif"><br>
            <span id="lblWaiting">Loading please wait...</span>
        </p>
    </div>

    <div id="divMessage" class="message-watch" style="display: none;"></div>


</asp:Content>
