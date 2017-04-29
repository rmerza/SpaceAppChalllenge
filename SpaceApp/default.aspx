<%@ Page Title="SpaceApp - Hidden Water" Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SpaceApp._default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" />
    <script src="https://cdn.anychart.com/js/7.13.1/anychart-bundle.min.js"></script>
    <script src="Scripts/maps/saudi_arabia.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.15/proj4.js"></script>
    <link rel="stylesheet" href="https://cdn.anychart.com/css/7.13.1/anychart-ui.min.css" />
    <script type="text/javascript">
        function map(vdata, vtitle) {
            var dataSet_lat_long = anychart.data.set(vdata);
            map = anychart.map();
            map.padding([20, 0, 10, 0]);
            map.geoData(anychart.maps['saudi_arabia']);

            //var series_lat_long = map.marker(dataSet_lat_long);
            //series_lat_long.tooltip().titleFormat("{%size} cm");
            //series_lat_long.tooltip().format("{%long} / {%lat}");
            //series_lat_long.labels(false);

            var series = map.bubble(dataSet_lat_long);
            series.tooltip().titleFormat("{%size} cm");
            series.tooltip().format("{%long} / {%lat}");
            series.labels(false);
            series.selectionMode("none");
            series.stroke(false);

            map.maxBubbleSize(30);
            map.minBubbleSize(0);

            map.title().fontSize(18);
            map.title(vtitle);
            map.interactivity().zoomOnMouseWheel(true);
            map.container("container");
            map.draw();
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <asp:UpdateProgress ID="updProgress" runat="server">
            <ProgressTemplate>
                <div style="position: absolute; padding-left: 550px; padding-top: 80px;">
                    <img alt="progress" src="loading.gif" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:Table ID="Table1" runat="server" Width="100%" GridLines="None" CellSpacing="5" Font-Size="1.5em" CssClass="table-bordered">
            <asp:TableRow>
                <asp:TableCell Width="170px" VerticalAlign="Top" HorizontalAlign="Center">
                    <table>
                        <tr><td><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/logo_spaceApps.png" CssClass="logo" /></td></tr>
                        <tr><td><asp:Image ID="Image1" runat="server" ImageUrl="~/logo_water-drop.png" Height="100" /></td></tr>
                        <tr style="height:300px; vertical-align:bottom;">
                            <td>Year
                    <asp:DropDownList ID="DDListYear" runat="server" Font-Size=".8em" ForeColor="DodgerBlue">
                        <asp:ListItem>2010</asp:ListItem>
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                    </asp:DropDownList>
                                Month
                    <asp:DropDownList ID="DDListMonth" runat="server" Font-Size=".8em" ForeColor="Green">
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                            </td>
                        </tr>
                        <tr><td><asp:Button ID="Button1" runat="server" Text="Load Data" OnClick="Render" Font-Size="1em" /></td></tr>
                    </table>
                </asp:TableCell>
                <asp:TableCell><div id="container" style="width: 1200px; height: 850px;" /></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </form>
</body>
</html>
