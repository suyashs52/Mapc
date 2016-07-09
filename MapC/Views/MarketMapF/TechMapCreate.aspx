<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TechMapCreate.aspx.cs" Inherits="MapC.Views.MarketMapF.TechMapCreate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet">
    <script type="text/javascript" src="/Scripts/moment.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap-datetimepicker.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();

            $('.delete').change(function () {
                if ($(this).is(":checked")) {
                    var returnVal = confirm("Sure to Delete Data?");
                    $(this).attr("checked", returnVal);
                }
            });
        });


        function SaveData() {
            $.post('../../Ajax/GetTechList.ashx', {
                "ID": 0,
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
                            setTimeout(function () {
                                window.location = "../../TechMap.aspx";
                            }, 5000);
                           
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
        function ShowModal(Value) {
            var SaveValue = '';
            if (Value == 'country') {
                SaveValue = $('#<%=country.ClientID%> option:selected').text();
                $('#newCountry').val(SaveValue);
            }
            else if (Value == 'account') {
                SaveValue = $('#<%=account.ClientID%> option:selected').text();
                $('#newAccount').val(SaveValue);
            }
            else if (Value == 'accounttype') {
                SaveValue = $('#<%=accountType.ClientID%> option:selected').text();
                $('#newAccountType').val(SaveValue);
            }
            else if (Value == 'brandname') {
                SaveValue = $('#<%=brandName.ClientID%> option:selected').text();
                $('#newBrandName').val(SaveValue);
            }
            else if (Value == 'producttype') {
                SaveValue = $('#<%=productType.ClientID%> option:selected').text();
                $('#newProductType').val(SaveValue);
            }
            else if (Value == 'tier') {
                SaveValue = $('#<%=tier.ClientID%> option:selected').text();
                $('#newTier').val(SaveValue);
            }
            else if (Value == 'enzymesupplier') {
                SaveValue = $('#<%=enzymeSupplier.ClientID%> option:selected').text();
                $('#newEnzymeSupplier').val(SaveValue);
            }
            else if (Value == 'enzymesolutionname') {
                SaveValue = $('#<%=enzymeSolutionName.ClientID%> option:selected').text();
                    $('#newEnzymeSolutionName').val(SaveValue);
                }
}

function SaveModal(Value) {
    var SaveParam = '';
    var SaveValue = '';
    var ID = '';
    var NewValue = '';
    if (Value == 'country') {
        SaveParam = Value;
        SaveValue = escape($('#newCountry').val());
        ID = escape($('#<%=country.ClientID%> option:selected').val());
        NewValue = document.getElementById('chkCountry').checked;
        DelValue = document.getElementById('chkDelCountry').checked;
    }
    else if (Value == 'account') {
        SaveParam = Value;
        SaveValue = escape($('#newAccount').val());
        ID = escape($('#<%=account.ClientID%> option:selected').val());
        NewValue = document.getElementById('chkAccount').checked;
        DelValue = document.getElementById('chkDelAccount').checked;
    }
    else if (Value == 'accounttype') {
        SaveParam = Value;
        SaveValue = escape($('#newAccountType').val());
        ID = escape($('#<%=accountType.ClientID%> option:selected').val());
                NewValue = document.getElementById('chkAccountType').checked;
                DelValue = document.getElementById('chkDelAccountType').checked;
            }
            else if (Value == 'brandname') {
                SaveParam = Value;
                SaveValue = escape($('#newBrandName').val());
                ID = escape($('#<%=brandName.ClientID%> option:selected').val());
                NewValue = document.getElementById('chkchkBrandName').checked;
                DelValue = document.getElementById('chkDelchkBrandName').checked;
            }
            else if (Value == 'producttype') {
                SaveParam = Value;
                SaveValue = escape($('#newProductType').val());
                ID = escape($('#<%=productType.ClientID%> option:selected').val());
                NewValue = document.getElementById('chkProductType').checked;
                DelValue = document.getElementById('chkDelProductType').checked;
            }
            else if (Value == 'tier') {
                SaveParam = Value;
                SaveValue = escape($('#newTier').val());
                ID = escape($('#<%=tier.ClientID%> option:selected').val());
                NewValue = document.getElementById('chkTier').checked;
                DelValue = document.getElementById('chkDelTier').checked;
            }
            else if (Value == 'enzymesupplier') {
                SaveParam = Value;
                SaveValue = escape($('#newEnzymeSupplier').val());
                ID = escape($('#<%=enzymeSupplier.ClientID%> option:selected').val());
                NewValue = document.getElementById('chkEnzymeSupplier').checked;
                DelValue = document.getElementById('chkDelEnzymeSupplier').checked;
            }
            else if (Value == 'enzymesolutionname') {
                SaveParam = Value;
                SaveValue = escape($('#newEnzymeSolutionName').val());
                ID = escape($('#<%=enzymeSolutionName.ClientID%> option:selected').val());
                NewValue = document.getElementById('chkEnzymeSolutionName').checked;
                DelValue = document.getElementById('chkDelEnzymeSolutionName').checked;
            }
    $.post('../../Ajax/MarketListDropListSave.ashx', {
        "SaveParam": SaveParam,
        "SaveValue": SaveValue,
        "ID": ID,
        "NewValue": NewValue,
        "DelValue": DelValue
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
                     setTimeout(function () {
                    window.location = window.location;
                    }, 3000);

                }
            }
        }
        catch (ex) {
            alert(ex);
        }
        finally {

        }
    });

}
function isNumber(evt) {
    //  var arr = new Array();
    //arr = "0123456789";

    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    //var KeyChar = String.fromCharCode(charCode);
    if (charCode > 47 && charCode < 58 || charCode == 9 || charCode == 8)
        return true
    else return false;
    //for (k = 0; k < arr.length; k++) {

    //    if (KeyChar == arr[k]) {

    //        return true;
    //    }

    //}
    //return false;
}
function Back()
{
    window.location = "../../TechMap.aspx";
}
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <ul class="nav nav-tabs">
        <li role="presentation"><a href="../../Default.aspx">Market</a></li>
        <li role="presentation" class="active carrot"><a href="../../TechMap.aspx">Technical</a></li>
        <li role="presentation"><a href="../../AccountBrand.aspx">Account/Brand</a></li>
        <li role="presentation"><a href="../../ConAcctBrnd.aspx">Country/Account/Brand</a></li>
        <li role="presentation"><a href="../../Batella.aspx">Batella</a></li>
    </ul>
    <br />
    <br />
    <div id="divResultView" class="qoute-platform-wrap" style="display: block; clear: both">

        <br />
        <br />
        <div class="form-horizontal" role="form">
            <%-- <div class="col-sm-3 ">
                    <button type="button" class="btn btn-primary" onclick="Back()" >&laquo; Back </button>
                </div>--%>
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
                    <asp:DropDownList ID="country" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                    &nbsp;
                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modCountry" onclick="ShowModal('country')">New</button>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Account:</label>
                <div class="col-sm-3 ">
                    <asp:DropDownList ID="account" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                    &nbsp;
                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modAccount" onclick="ShowModal('account')">New</button>


                </div>
            </div>
            <div class="form-group">
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Account Type:</label>
                <div class="col-sm-3 ">
                    <asp:DropDownList ID="accountType" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                    &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modAccountType" onclick="ShowModal('accounttype')">New</button>

                </div>
                <label class="control-label col-sm-3">BrandName:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="brandName" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                    &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modBrandName" onclick="ShowModal('brandname')">New</button>


                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">EnzymeSupplier:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="enzymeSupplier" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                    &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modEnzymeSupplier" onclick="ShowModal('enzymesupplier')">New</button>

                </div>
                <label class="control-label col-sm-3">ProductType:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="productType" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                    &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modProductType" onclick="ShowModal('producttype')">New</button>

                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">EnzymeSolutionName:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="enzymeSolutionName" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                    &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modEnzymeSolutionName" onclick="ShowModal('enzymesolutionname')">New</button>

                </div>
                <label class="control-label col-sm-3">Tier:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="tier" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                    &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modTier" onclick="ShowModal('tier')">New</button>

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
                <button type="button" class="btn btn-default" onclick="SaveData()">Submit</button>
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

    <!-- Modal -->
    <div class="modal fade" id="modCountry" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Country   </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">New Country:</label>

                        <div class="col-sm-3">
                            <input type="text" placeholder="Enter " id="newCountry" class="form-control col-sm-4">
                        </div>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkCountry">
                                <label class="label-info" for="chkCountry" data-toggle="tooltip" data-placement="top" title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelCountry" class="delete">
                                <label class="label-danger" for="chkDelCountry" data-toggle="tooltip" data-placement="top" title="Delete Value"></label>
                            </span>
                        </label>
                        <div class=" col-sm-2">
                            <button onclick="SaveModal('country')" data-dismiss="modal" class="btn btn-default" type="button">Save</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <div class="modal fade" id="modAccount" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Account   </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">Account:</label>
                        <div class="col-sm-3">
                            <input type="text" id="newAccount" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkAccount">
                                <label class="label-info" for="chkAccount" data-toggle="tooltip" data-placement="top" title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelAccount" class="delete">
                                <label class="label-danger" for="chkDelAccount" data-toggle="tooltip" data-placement="top" title="Delete Value"></label>
                            </span>
                        </label>
                        <div class=" col-sm-2">
                            <button onclick="SaveModal('account')" data-dismiss="modal" class="btn btn-default" type="button">Save</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>

    </div>

    <div class="modal fade" id="modAccountType" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New AccountType   </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">AccountType:</label>
                        <div class="col-sm-3">
                            <input type="text" id="newAccountType" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkAccountType">
                                <label class="label-info" for="chkAccountType" data-toggle="tooltip" data-placement="top" title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelAccountType" class="delete">
                                <label class="label-danger" for="chkDelAccountType" data-toggle="tooltip" data-placement="top" title="Delete Value"></label>
                            </span>
                        </label>
                        <div class=" col-sm-2">
                            <button onclick="SaveModal('accounttype')" data-dismiss="modal" class="btn btn-default" type="button">Save</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>

    </div>

    <div class="modal fade" id="modBrandName" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New BrandName   </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">BrandName:</label>
                        <div class="col-sm-3">
                            <input type="text" id="newBrandName" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkBrandName">
                                <label class="label-info" for="chkBrandName" data-toggle="tooltip" data-placement="top" title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelBrandName" class="delete">
                                <label class="label-danger" for="chkDelBrandName" data-toggle="tooltip" data-placement="top" title="Delete Value"></label>
                            </span>
                        </label>
                        <div class=" col-sm-2">
                            <button onclick="SaveModal('brandname')" data-dismiss="modal" class="btn btn-default" type="button">Save</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>

    </div>

    <div class="modal fade" id="modProductType" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Product Type   </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">Product Type:</label>
                        <div class="col-sm-3">
                            <input type="text" id="newProductType" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkProductType">
                                <label class="label-info" for="chkProductType" data-toggle="tooltip" data-placement="top" title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelProductType" class="delete">
                                <label class="label-danger" for="chkDelProductType" data-toggle="tooltip" data-placement="top" title="Delete Value"></label>
                            </span>
                        </label>
                        <div class=" col-sm-2">
                            <button onclick="SaveModal('producttype')" data-dismiss="modal" class="btn btn-default" type="button">Save</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>

    </div>

    <div class="modal fade" id="modTier" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Tier   </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">Tier:</label>
                        <div class="col-sm-3">
                            <input type="text" id="newTier" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkTier">
                                <label class="label-info" for="chkTier" data-toggle="tooltip" data-placement="top" title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelTier" class="delete">
                                <label class="label-danger" for="chkDelTier" data-toggle="tooltip" data-placement="top" title="Delete Value"></label>
                            </span>
                        </label>
                        <div class=" col-sm-2">
                            <button onclick="SaveModal('tier')" data-dismiss="modal" class="btn btn-default" type="button">Save</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>

    </div>
    <div class="modal fade" id="modEnzymeSupplier" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New SupplierF   </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">SupplierF:</label>
                        <div class="col-sm-3">
                            <input type="text"   id="newEnzymeSupplier" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                          <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkEnzymeSupplier">
                                <label class="label-info" for="chkEnzymeSupplier" data-toggle="tooltip" data-placement="top" Title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelEnzymeSupplier"  class="delete" >
                                <label class="label-danger" for="chkDelEnzymeSupplier" data-toggle="tooltip" data-placement="top" Title="Delete Value"></label>
                            </span>
                        </label>
                        <div class=" col-sm-2">
                            <button onclick="SaveModal('enzymesupplier')" data-dismiss="modal" class="btn btn-default" type="button">Save</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>

    </div>
    <div class="modal fade" id="modEnzymeSolutionName" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Enzyme Solution Name   </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">EnzymeSolution Name:</label>
                        <div class="col-sm-3">
                            <input type="text" id="newEnzymeSolutionName" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkEnzymeSolutionName">
                                <label class="label-info" for="chkEnzymeSolutionName" data-toggle="tooltip" data-placement="top" title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">

                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelEnzymeSolutionName" class="delete">
                                <label class="label-danger" for="chkDelEnzymeSolutionName" data-toggle="tooltip" data-placement="top" title="Delete Value"></label>
                            </span>
                        </label>
                        <div class=" col-sm-2">
                            <button onclick="SaveModal('enzymesolutionname')" data-dismiss="modal" class="btn btn-default" type="button">Save</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
