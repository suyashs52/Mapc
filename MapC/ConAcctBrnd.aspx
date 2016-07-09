<%@ Page Title="Country / Account / Brand" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="ConAcctBrnd.aspx.cs" Inherits="MapC.ConAcctBrnd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            showResult();
        });
        function showResult() {
            $('#divResultInfo').show();
            $('#divResultView').hide();
            $('#divResultLoader').html('<table style="width: 100%;border-bottom: 1px solid rgb(221, 221, 221);"><tr><td align="center" style="text-align:center;padding-bottom:50px;" colspan="6"><img alt="loading" src="../images/ajax-loader_new.gif"></td></tr></table>');
            $('#divResultInfo').html('<span style="margin:20px;"><h4>Please Wait...</h4></span>');
            $.post('Ajax/GetAccountBrand.ashx', { "ID": -2000 }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {

                            var table = ' <div class="row">';
                            var jsonData = eval('(' + data + ')')
                            var tr = '';
                            var charAtZero = '';
                            var count = 0;
                            if (jsonData.length > 0) {
                                for (var i = 0; i < jsonData.length; i++) {
                                    if (jsonData[i].Country.substring(0, 1).toUpperCase() != charAtZero) {
                                        charAtZero = jsonData[i].Country.substring(0, 1).toUpperCase();
                                        if (count == 1) tr += '</div></div>';
                                        tr += '<div class="panel panel-default"><div class="panel-heading"> <strong>' + charAtZero + '</strong></div><div class="panel-body">'
                                        count = 0;
                                    }
                                    count = 1;
                                    tr += '<div class="col-md-4"><p class="thumbnail text-center" onclick="ShowData(\'' + jsonData[i].Country + '\',\'' + jsonData[i].ID + '\')">' + jsonData[i].Country + '</p></div>';
                                }
                                tr += ' </div>';
                            }
                            else tr += '<span class="label label-info">No Records Found!!</span></div>';
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

            $('#divResultView').show();
            $('#divResultInfo').hide();
        }
        function ShowList() {
            $('#divResultView').hide();
            $('#divResultInfo').show();
        }
        function ShowData(AccountName,AccountId) {
            var arr = new Array();
            arr[0] = AccountName;
            arr[1] = AccountId;

            $('#divResultInfo').hide();
            $('#divResultView').show();
            $('#divResultLoader').html('<table style="width: 100%;border-bottom: 1px solid rgb(221, 221, 221);"><tr><td align="center" style="text-align:center;padding-bottom:50px;" colspan="6"><img alt="loading" src="../images/ajax-loader_new.gif"></td></tr></table>');
            $('#divResultView').html('<span style="margin:20px;"><h4>Please Wait...</h4></span>');
            $.post('Ajax/GetAccountBrand.ashx', { "ID": -arr[1] }, function (data) {
                try {
                    if (data != null) {
                        var temp = new Array();
                        temp = data.split("@@");
                        if (data.indexOf("Error") == 0) alert(temp[1]);
                        else if (data != "") {
                            var table = '<div class="col-sm-12 "><button type="button" class="btn btn-primary" onclick="ShowList()" >&laquo; Back </button></div><br/><br/>';
                            var jsonData = eval('(' + data + ')')
                            table += ' <div class="panel panel-default"><div class="panel-heading"><button class="btn btn-primary" type="button">' + arr[0] + ' <span class="badge">' + jsonData.length + '</span></button></div><div class="table-responsive" style="overflow:auto;">';
                            table += ' <table class="table table-hover text-center"><thead><tr><th>TmmtDate</th><th>AccountName</th><th>ProductionCapacityMT</th><th>TotalMarketShare</th><th>BrandName</th><th>ProductType</th><th>BrandProdMTY</th><th>EnzymesUsed</th></tr></thead><tbody>';
                            var tr = '';
                            if (jsonData.length > 0) {
                                for (var i = 0; i < jsonData.length; i++) {
                                    tr += '<tr><td>' + jsonData[i].TmmtDate + '</td><td>' + jsonData[i].AccountName + '</td><td>' + jsonData[i].ProductionCapacityMT + '</td><td>' + jsonData[i].TotalMarketShare + '</td><td>' + jsonData[i].BrandName + '</td><td>' + jsonData[i].ProductType + '</td><td>' + jsonData[i].BrandProdMTY + '</td><td>' + jsonData[i].EnzymesUsed + '</td></tr>';
                                }
                                tr += '</tbody></table></div></div>';
                            }
                            else tr += '<tr><td colspan="5">No Record Available!!</td></tr></tbody></table></div></div>';
                            $('#divResultView').html(table + tr);


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


    </script>

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <ul class="nav nav-tabs">
        <li role="presentation"><a href="#">Market</a></li>
        <li role="presentation"><a href="TechMap.aspx">Technical</a></li>
        <li role="presentation" ><a href="AccountBrand.aspx">Account/Brand</a></li>
        <li role="presentation" class="active carrot"><a href="ConAcctBrnd.aspx">Country/Account/Brand</a></li>
        <li role="presentation"><a href="Batella.aspx">Batella</a></li>
    </ul>
    <br />
    <br />
     <div id="divResultInfo" class="qoute-platform-wrap" style="display: none; clear: both;">
    </div>

    <div id="divResultLoader"></div>

    <asp:HiddenField ID="hdnCountry" runat="server" Value="" />
    <div id="divResultView" class="qoute-platform-wrap" style="display: block; clear: both;">
    
    </div>

    <div style="display: none;" class="sort-loader onboard" id="loader">
        <p>
            <img alt="Loading..." src="../images/ajax-loader_new.gif"><br>
            <span id="lblWaiting">Loading please wait...</span>
        </p>
    </div>

    <div id="divMessage" class="message-watch" style="display: none;"></div>

</asp:Content>
