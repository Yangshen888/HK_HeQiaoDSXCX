<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemHengList.aspx.cs" Inherits="HeqiaoDaoshi.fonts.ItemHengList" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>横向列表</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <script>
        function goback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
        function gosyback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
        function goitemback(types) {
            window.location.href = "ItemHengZiList.aspx?types=" + types + "&indexNumId=" + indexNumId;
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
            position: relative;
            overflow: hidden;
        }
        .mainCon_l {
            position: absolute;
            bottom: 20px;
            left: 10%;
        }

        .mainCon_r {
            float: left;
            box-sizing: border-box;
            padding: 0 10%;
        }
        .imgBox{
            font-size: 0;
            position: absolute;
            top: 78px;
            right: 122px;
            border-radius: 18px;
            overflow: hidden;
        }
        .mainConItem {
            float: left;
            font-size: 0;
            position: relative;
            cursor: pointer;
        }
        .mainConItem_l{
            float: left;
        }
        .mainConItem_r{
            float: right;
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
                        <img src="./images/new/hqxc2.png" alt="">
                    </div>
                    <!-- 返回按钮 -->
                    <div style="float: right;cursor: pointer;position: absolute;top: 50%;transform: translateY(-50%);right: 20px;" onclick="goback()">
                        <img src="./images/new/backBtn.png" alt="">
                    </div>
                </div>
                <div class="mainCon">
                    <div class="mainCon_l">
                        <img src="./images/new/gzts_text.png" alt="" width="80px">
                    </div>
                    <div class="mainCon_r">
                        <div class="mainConItem mainConItem_l"  onclick="goitemback(1)">
                            <img src="./images/new/rwjs.png" alt="" style="height: 390px;">
                            <div class="imgBox">
                                <img src="images/第二页/26.png" style="height: 240px;" />
                            </div>
                        </div>
                        <div class="mainConItem mainConItem_l" onclick="goitemback(2)">
                            <img src="./images/new/xctp.png" alt="" style="height: 390px;">
                            <div class="imgBox">
                                <img src="images/第二页/27.png" style="height: 240px;" />
                            </div>
                        </div>
                        <div class="mainConItem mainConItem_r" onclick="goitemback(3)">
                            <img src="./images/new/zrzy.png" alt="" style="height: 390px;">
                            <div class="imgBox">
                                <img src="images/第二页/25.png" style="height: 240px;" />
                            </div>
                        </div>
                        <div class="mainConItem mainConItem_r" onclick="goitemback(4)">
                            <img src="./images/new/xcsp.png" alt="" style="height: 390px;">
                            <div class="imgBox">
                                <img src="images/第二页/24.png" style="height: 240px;" />
                            </div>
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
