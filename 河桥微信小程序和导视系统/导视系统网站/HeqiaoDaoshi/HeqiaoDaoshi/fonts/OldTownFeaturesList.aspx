﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldTownFeaturesList.aspx.cs" Inherits="HeqiaoDaoshi.fonts.OldTownFeaturesList" %>

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
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html,
        body {
            height: 100%;
        }

        .main {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .mainbg {
            position: absolute;
            top: 0;
            left: 0;
            font-size: 0;
            z-index: -1;
        }

        .main_l {
            float: left;
            position: relative;
            width: 88%;
            height: 100%;
        }

        .mainHead {
            overflow: hidden;
            padding: 0 50px;
            margin-top: 50px;
            position: relative;
        }

        .mainCon{
            overflow: hidden;
            position: absolute;
            top: 50%;
            transform: translateY(-40%);
            width: 100%;
        }
        .mainCon_l {
            width: 10%;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            text-align: center;
        }

        .mainCon_r {
            float: right;
            width: 90%;
            display: flex;
            justify-content: space-around;
        }

        .mainConItem {
            float: left;
            text-align: center;
            cursor: pointer;
        }

        .line {
            float: left;
            width: 0;
            height: 50%;
            border-right: 2px solid #ccc;
        }

        .main_r {
            position: absolute;
            top: 50%;
            right: 0;
            transform: translateY(-50%);
            height: 100%;
        }

        .main_r li {
            list-style: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="height: 100%;">
        <div class="main">
            <div class="mainbg">
                <img src="./images/new/pagesbg.png" alt="" style="width: 100%;height: 100%;">
            </div>
            <div class="main_l">
                <div class="mainHead">
                    <div style="float: left;" onclick="gosyback()">
                        <img src="./images/new/index2.png" alt="">
                    </div>
                    <div style="float: left;position: absolute;top: 50%;transform: translateY(-50%);left: 12%;">
                        <img src="./images/new/gzts2.png" alt="">
                    </div>
                    <!-- 返回按钮 -->
                    <div style="float: right;cursor: pointer;position: absolute;top: 50%;transform: translateY(-50%);right: 20px;" onclick="goback()">
                        <img src="./images/new/backBtn.png" alt="">
                    </div>
                </div>
                <div class="mainCon">
                    <div class="mainCon_l">
                        <img src="./images/new/gzts_text.png" alt="" style="width: 80px;">
                    </div>
                    <div class="mainCon_r">
                        <div class="mainConItem" onclick="goitemback(5)">
                            <img src="images/蒙版组33.png" /><br />
                            <img src="./images/new/tc.png" alt="">
                        </div>
                        <div class="mainConItem" onclick="goitemback(6)">
                            <img src="images/蒙版组31.png" /><br />
                            <img src="./images/new/tsms.png" alt="">
                        </div>
                        <div class="mainConItem" onclick="goitemback(7)">
                            <img src="images/蒙版组32.png" /><br />
                            <img src="./images/new/nyczy.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="line"></div>
            <div class="main_r">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>
