<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Xem Thời Tiết</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="Scripts/script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Xem Thời Tiết</h1>
            <button type="button" onclick="fetchWeatherData()">Tải Dữ Liệu Thời Tiết</button>
            <div id="curve_chart" style="width: 100%; height: 500px"></div>
        </div>
    </form>
</body>
</html>
