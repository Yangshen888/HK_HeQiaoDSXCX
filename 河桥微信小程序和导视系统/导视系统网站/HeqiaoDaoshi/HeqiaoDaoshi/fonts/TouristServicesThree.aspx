<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouristServicesThree.aspx.cs" Inherits="HeqiaoDaoshi.fonts.TouristServicesThree" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>游客服务-导游服务</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <script>
        function goback() {
            window.location.href = "TouristServicesList.aspx?indexNumId=" + indexNumId;
        }
        function gosyback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
        function goitemback() {
            window.location.href = "ItemHengZiList.aspx?indexNumId=" + indexNumId;
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

        .mainCon {
            position: absolute;
            top: 50%;
            transform: translateY(-40%);
            overflow: hidden;
            width: 100%;
        }

        .poem {
            width: 10%;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            text-align: center;
        }

        .sinceBox {
            float: right;
            width: 90%;
            height: 320px;
            overflow-x: auto;
            display: flex;
        }

        .itemBox {
            float: left;
            width: 380px;
            height: 100%;
            background-image: url(./images/new/jdjsbox.png);
            background-size: 100% 100%;
            display: table;
            cursor: pointer;
            margin-right: 10px;
        }

        .tabelBox {
            /* height: 250px; */
            overflow-y: hidden;
            display: table-cell;
            vertical-align: middle;
            position: relative;
            box-sizing: border-box;
            padding-left: 20px;
            font-size: 0;
        }

        .itemName {
            position: absolute;
            right: 25px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 28px;
            color: #382929;
            writing-mode: vertical-rl;
            height: 60%;
            text-align-last: justify;
        }

        .line {
            /* position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 12%; */
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
            /* float: right; */
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
                <img src="./images/new/bg.png" alt="" style="width: 100%;height: 100%;">
            </div>
            <div class="main_l">
                <div class="mainHead">
                    <div style="float: left;" onclick="gosyback()">
                        <img src="./images/new/index2.png" alt="">
                    </div>
                    <div style="float: left;position: absolute;top: 50%;transform: translateY(-50%);left: 12%;">
                        <img src="./images/new/jdjs2.png" alt="">
                    </div>
                    <!-- 返回按钮 -->
                    <div style="float: right;cursor: pointer;position: absolute;top: 50%;transform: translateY(-50%);right: 20px;" onclick="goback()">
                        <img src="./images/new/backBtn.png" alt="">
                    </div>
                </div>
                <div class="mainCon">
                    <div class="poem">
                        <img src="./images/new/gzts_text.png" alt="">
                    </div>
                    <div class="sinceBox">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="itemBox">
                                    <div class="tabelBox">
                                        <img src="<%# geturl(Eval("FMPicture").ToString()) %>" alt=""
                                            style="width: 280px;max-height:300px">
                                        <div class="itemName"><%#  Eval("TourGuideName") %></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
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
