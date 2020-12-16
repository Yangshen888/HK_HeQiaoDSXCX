<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldTownFeaturesList.aspx.cs" Inherits="HeqiaoDaoshi.fonts.OldTownFeaturesList" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>特色古镇</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />    
    <script>
        function goback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
        function gosyback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
        function goitemback(types) {
            window.location.href = "ItemHengZiList.aspx?types=" + types + "&indexNumId=" + indexNumId;;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="height: 110px; width: 100%; background: rgba(0,0,0,0.4);">
                <uc1:Head runat="server" ID="Head" />
            </div>
            <div style="height: 860px;">
                <div style="margin: 0 auto; width: 90%; height: 775px;">
                    <div style="height: 80px;">
                        <div style="float: left;cursor:pointer;" onclick="goback()" >
                            <img src="images/第二页/82.png" style="margin-top: 25px;" />
                            <span style="color: #fff; font-size: 30px; display: block; margin-top: -60px; margin-left: 80px;">返回上一步</span>
                        </div>
                        <div style="float: right;cursor:pointer;" onclick="gosyback()">
                            <img src="images/第二页/329.png" style="margin-top: 25px;" />
                            <span style="color: #fff; color: #fff; font-size: 30px; display: block; margin-top: -60px; margin-left: 85px; margin-right: 25px; letter-spacing: 2px;">返回首页</span>
                        </div>
                    </div>
                    <div style="background: rgba(0,0,0,0.4); height: 660px; margin-top: 35px;">
                        <div style="overflow: scroll; overflow-y: hidden; height: 530px;">
                            <div style="height: 660px;">
                                <div style="float: left; width: 380px; height: 420px; margin-left: 140px; margin-top: 80px;cursor:pointer;" onclick="goitemback(5)">
                                    <img src="images/蒙版组33.png" />
                                    <span style="display: block; text-align: center; font-size: 25px; color: #fff; margin-top: 10px;">特产</span>
                                </div>
                                <div style="float: left; width: 380px; height: 420px; margin-left: 160px; margin-top: 80px;cursor:pointer;" onclick="goitemback(6)">
                                    <img src="images/蒙版组31.png" />
                                    <span style="display: block; text-align: center; font-size: 25px; color: #fff; margin-top: 10px;">特色民宿</span>
                                </div>
                                <div style="float: left; width: 380px; height: 420px; margin-left: 140px; margin-top: 80px;cursor:pointer;" onclick="goitemback(7)">
                                    <img src="images/蒙版组32.png" />
                                    <span style="display: block; text-align: center; font-size: 25px; color: #fff; margin-top: 10px;">农业采摘园</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="height: 110px; width: 100%; background: rgba(0,0,0,0.4); text-align: center;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>
