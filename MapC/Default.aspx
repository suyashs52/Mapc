<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MapC._Default" %>

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
            $.post('Ajax/GetMarketList.ashx', { "ID": 1000 }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {
                            var table = '<table class="table table-striped"><thead><tr><th>Country</th><th>AccountName</th><th>CustomerType </th><th>BrandName</th><th>EnzymesUsed </th><th></th></tr></thead><tbody>';
                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            if (jsonData.length > 0) {
                                for (var i = 0; i < jsonData.length; i++) {
                                    tr += '<tr><td><a href="javascript:void(0)" onclick="ShowMM(\'' + jsonData[i].Country + '\');">' + jsonData[i].Country + '</a></td><td>' + decodeURIComponent(jsonData[i].AccountName).toLocaleString() + '</td>';
                                    tr += '<td>' + jsonData[i].CustomerType + '</td><td>' + jsonData[i].BrandName + '</td><td>' + jsonData[i].EnzymesUsed + '</td><td>' + jsonData[i].ID + '</td></tr>';
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
        function ShowData()
        {
            var id = $('#<%=caab.ClientID%> option:selected').val();
            id = -id;
            $('#loader').show();
            $.post('Ajax/GetMarketList.ashx', { "ID": id }, function (data) {
                try{
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
                catch(ex){
                    alert(ex);
                }
                finally{
                    $('#loader').hide();
                }

            });
        }

        function SaveData()
        {
            $.post('Ajax/GetMarketList.ashx', {
                "ID": $('#<%=caab.ClientID%>').val(),
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
                "Comments1": $('#Comments1').val(),


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
        <li role="presentation" class="active carrot"><a href="#">Market</a></li>
        <li role="presentation"><a href="TechMap.aspx">Technical</a></li>
        <li role="presentation"><a href="AccountBrand.aspx">Account/Brand</a></li>
        <li role="presentation"><a href="ConAcctBrnd.aspx">Country/Account/Brand</a></li>
        <li role="presentation"><a href="Batelle.aspx">Batella</a></li>
    </ul>
    <br /><br />
    <a href="Views/MarketMapF/MarketMapCreate.aspx" >Create New</a>

    <div id="divResultInfo" class="qoute-platform-wrap" style="display: none; clear: both;"></div>
    <div id="divResultLoader"></div>
   <asp:Button ID="marketClick" runat="server" OnClick="marketClick_Click" Style="display: none;" />
    <asp:HiddenField ID="hdnCountry" runat="server" Value="" />
    <div id="divResultView" class="qoute-platform-wrap" style="display: block; clear: both;">
        <br /><br />
        <div class="form-horizontal" role="form">

            <div class="form-group">
                <label class="control-label col-sm-3" for="email">Select your Country<br />
                    Account /AccountType /Brand:</label>
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
                    <button type="button" class="btn btn-primary" onclick="ShowList()" >&laquo; Back </button>
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
                <label class="control-label col-sm-3">Account Type:</label>
                <div class="col-sm-3 ">
                    <asp:DropDownList ID="accountType" runat="server" CssClass="form-control" />
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
                    <asp:DropDownList ID="brandName" runat="server" CssClass="form-control" />

                </div>
                <label class="control-label col-sm-3">EnzymaticY/N:</label>
                <div class="col-sm-3">
                    <input type="checkbox" class="form-control" id="EnzymaticYN">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">ProductType:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="productType" runat="server" CssClass="form-control" />

                </div>
                <label class="control-label col-sm-3">EnzymeSupplier:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="enzymeSupplier" runat="server" CssClass="form-control" />

                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Tier:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="tier" runat="server" CssClass="form-control" />

                </div>
                <label class="control-label col-sm-3">EnzymeUsed:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="enzymeUsed" runat="server" CssClass="form-control" />

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
                    <button type="submit" class="btn btn-default" onclick="SaveData()">Submit</button>
                </div>
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
