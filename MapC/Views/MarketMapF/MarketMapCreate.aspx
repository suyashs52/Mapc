<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MarketMapCreate.aspx.cs" Inherits="MapC.Views.MarketMapF.MarketMapCreate" %>

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
            $.post('../../Ajax/GetMarketList.ashx', {
                "ID": 0,
                "TmmtDate": $('#date').val(),
                "LookuptoTmmCountryT": $('#<%=country.ClientID%>').val(),
                "LookuptoTmmAcountT": $('#<%=account.ClientID%>').val(),
                "LookuptoTmmAccountTypeT": $('#<%=accountType.ClientID%>').val(),
                "ProductionCapacityMT": $('#ProductionCapacity').val(),
                "ActualTotalProduction": $('#actualtotalproduction').val(),
                "TotalMarketShare": $('#TotalMarketShare').val(),
                "EnzymaticYN": $('#EnzymaticYN').is(":checked"),
                "LookuptoTmmBrandName": $('#<%=brandName.ClientID%>').val(),
                "LookuptoTmmEnzymeSupplierT": $('#<%=enzymeSupplier.ClientID%>').val(),
                "LookuptoTmmProductT": $('#<%=productType.ClientID%>').val(),
                "TmmEnzymeName": $('#<%=enzymeUsed.ClientID%>').val(),
                "LookuptoTmmTierT": $('#<%=tier.ClientID%>').val(),
                "EnzymeDosage": $('#EnzymeDosage').val(),
                "PriceEnzymeSolutionkg": $('#PriceEnzymeSolutionkg').val(),
                "BrandProdMTY": $('#BrandProdMTY').val(),
                "MarketShare": $('#MarketShare').val(),
                "EnzymeSalesPotentialMT": $('#EnzymeSalesPotentialMT').val(),
                "EnzymeSalesMT": $('#EnzymeSalesMT').val(),
                "RetailPriceKg": $('#RetailPriceKg').val(),
                "CurrencyName": $('#CurrencyName').val(),
                "TurnOverPotential": $('#TurnOverPotential').val(),
                "RetailPriceEurKg": $('#RetailPriceEurKg').val(),
                "ExchangeRateLocalEUR": $('#ExchangeRateLocalEUR').val(),
                "EnzymeSpendMT": $('#EnzymeSpendMT').val(),
                "ProductionCostMT": $('#ProductionCostMT').val(),
                "Comments2": $('#Comments2').val(),
                "Comments1": $('#Comments1').val()


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
                                window.location = "../../Default.aspx";
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
            else if (Value == 'enzymeused') {
                SaveValue = $('#<%=enzymeUsed.ClientID%> option:selected').text();
                $('#newEnzymeUsed').val(SaveValue);
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
            else if (Value == 'enzymeused') {
                SaveParam = Value;
                SaveValue = escape($('#newEnzymeUsed').val());
                ID = escape($('#<%=enzymeUsed.ClientID%> option:selected').val());
                NewValue = document.getElementById('chkEnzymeUsed').checked;
                DelValue = document.getElementById('chkDelEnzymeUsed').checked;
            }
            $.post('../../Ajax/MarketListDropListSave.ashx', {
                "SaveParam": SaveParam,
                "SaveValue": SaveValue,
                "ID": ID,
                "NewValue": NewValue,
                "DelValue":DelValue
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
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <ul class="nav nav-tabs">
        <li role="presentation" class="active carrot"><a href="../../Default.aspx">Market</a></li>
         <li role="presentation" ><a href="../../TechMap.aspx">Technical</a></li>
        <li role="presentation"><a href="../../AccountBrand.aspx">Account/Brand</a></li>
        <li role="presentation"><a href="../../ConAcctBrnd.aspx">Country/Account/Brand</a></li>
        <li role="presentation"><a href="../../Batella.aspx">Batella</a></li>
    </ul>
    <div class="form-horizontal" role="form">
        <br />
        <br />
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
            <label class="control-label col-sm-3">Account Type:</label>
            <div class="col-sm-3 ">
                <asp:DropDownList ID="accountType" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modAccountType" onclick="ShowModal('accounttype')">New</button>


            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-3">ProductionCapacity MT/Y:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="ProductionCapacity" placeholder="Enter ProductionCapacity">
            </div>
            <label class="control-label col-sm-3">ActualTotalProduction:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="actualtotalproduction" placeholder="Enter ActualTotalProduction">
            </div>


        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">TotalMarketShare:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="TotalMarketShare" placeholder="Enter TotalMarketShare">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">BrandName:</label>
            <div class="col-sm-3">
                <asp:DropDownList ID="brandName" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modBrandName" onclick="ShowModal('brandname')">New</button>


            </div>
            <label class="control-label col-sm-3">EnzymaticY/N:</label>
            <div class="col-sm-3">
                <input type="checkbox" class="form-control" id="EnzymaticYN">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">ProductType:</label>
            <div class="col-sm-3">
                <asp:DropDownList ID="productType" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modProductType" onclick="ShowModal('producttype')">New</button>
            </div>
            <label class="control-label col-sm-3">EnzymeSupplier:</label>
            <div class="col-sm-3">
                <asp:DropDownList ID="enzymeSupplier" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modEnzymeSupplier" onclick="ShowModal('enzymesupplier')">New</button>


            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Tier:</label>
            <div class="col-sm-3">
                <asp:DropDownList ID="tier" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modTier" onclick="ShowModal('tier')">New</button>

            </div>
            <label class="control-label col-sm-3">EnzymeUsed:</label>
            <div class="col-sm-3">
                <asp:DropDownList ID="enzymeUsed" runat="server" CssClass="btn btn-default dropdown-toggle col-sm-9" Style="text-align: left;" />
                &nbsp;
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modEnzymeUsed" onclick="ShowModal('enzymeused')">New</button>

            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-6">&nbsp;</label>
            <label class="control-label col-sm-2">EnzymeDosage:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="EnzymeDosage" placeholder="Enter ">
            </div>
            <label class="control-label col-sm-2">PriceEnzymeSolution:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="PriceEnzymeSolution" placeholder="Enter ">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">BrandProduction MT/Year:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="BrandProdMTY" placeholder="Enter ">
            </div>
            <label class="control-label col-sm-1">Market Share:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="MarketShare" placeholder="Enter ">
            </div>
            <label class="control-label col-sm-2">EnzymeSalesPotentialMT:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="EnzymeSalesPotentialMT" placeholder="Enter ">
            </div>
            <label class="control-label col-sm-2">EnzymeSalesMT:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="EnzymeSalesMT" placeholder="Enter ">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">RetailPrice/Kg:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="RetailPriceKg" placeholder="Enter ">
            </div>
            <label class="control-label col-sm-1">Currency Name:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="CurrencyName" placeholder="Enter ">
            </div>
            <label class="control-label col-sm-2">TurnOverPotential:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="TurnOverPotential" placeholder="Enter ">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">RetailPriceEur/Kg:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="RetailPriceEurKg" placeholder="Enter ">
            </div>
            <label class="control-label col-sm-1">Exchange Rate Local/EUR:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="ExchangeRateLocalEUR" placeholder="Enter ">
            </div>
            <label class="control-label col-sm-2">EnzymeSpendMT:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="EnzymeSpendMT" placeholder="Enter ">
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">ProductionCost/MT:</label>
            <div class="col-sm-1">
                <input type="text" class="form-control" id="ProductionCostMT" placeholder="Enter ">
            </div>


        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Comments1:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="Comments1" placeholder="Enter ">
            </div>
            <label class="control-label col-sm-3">Comments2:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="Comments2" placeholder="Enter ">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-3">
                <button type="button" class="btn btn-default" onclick="SaveData()">Submit</button>
            </div>
        </div>

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
                                <label class="label-info" for="chkCountry" data-toggle="tooltip" data-placement="top" Title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelCountry"  class="delete" >
                                <label class="label-danger" for="chkDelCountry" data-toggle="tooltip" data-placement="top" Title="Delete Value"></label>
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
                                <label class="label-info" for="chkAccount" data-toggle="tooltip" data-placement="top" Title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelAccount"  class="delete" >
                                <label class="label-danger" for="chkDelAccount" data-toggle="tooltip" data-placement="top" Title="Delete Value"></label>
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
                                <label class="label-info" for="chkAccountType" data-toggle="tooltip" data-placement="top" Title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelAccountType"  class="delete" >
                                <label class="label-danger" for="chkDelAccountType" data-toggle="tooltip" data-placement="top" Title="Delete Value"></label>
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
                            <input type="text"   id="newBrandName" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                         <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkBrandName">
                                <label class="label-info" for="chkBrandName" data-toggle="tooltip" data-placement="top" Title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelBrandName"  class="delete" >
                                <label class="label-danger" for="chkDelBrandName" data-toggle="tooltip" data-placement="top" Title="Delete Value"></label>
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
                            <input type="text"   id="newProductType" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                        <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkProductType">
                                <label class="label-info" for="chkProductType" data-toggle="tooltip" data-placement="top" Title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelProductType"  class="delete" >
                                <label class="label-danger" for="chkDelProductType" data-toggle="tooltip" data-placement="top" Title="Delete Value"></label>
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
                            <input type="text"   id="newTier" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                          <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkTier">
                                <label class="label-info" for="chkTier" data-toggle="tooltip" data-placement="top" Title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelTier"  class="delete" >
                                <label class="label-danger" for="chkDelTier" data-toggle="tooltip" data-placement="top" Title="Delete Value"></label>
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

    <div class="modal fade" id="modEnzymeUsed" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New TmmEnzymeUsed   </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">TmmEnzymeUsed:</label>
                        <div class="col-sm-3">
                            <input type="text"   id="newEnzymeUsed" placeholder="Enter " class="form-control col-sm-4">
                        </div>
                         <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkEnzymeUsed">
                                <label class="label-info" for="chkEnzymeUsed" data-toggle="tooltip" data-placement="top" Title="New Value"></label>
                            </span>
                        </label>
                        <label class="control-label col-sm-2">
                            
                            <span class="material-switch pull-right">
                                <input type="checkbox" name="someSwitchOption001" id="chkDelEnzymeUsed"  class="delete" >
                                <label class="label-danger" for="chkDelEnzymeUsed" data-toggle="tooltip" data-placement="top" Title="Delete Value"></label>
                            </span>
                        </label>
                        <div class=" col-sm-2">
                            <button onclick="SaveModal('EnzymeUsed')" data-dismiss="modal" class="btn btn-default" type="button">Save</button>
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
