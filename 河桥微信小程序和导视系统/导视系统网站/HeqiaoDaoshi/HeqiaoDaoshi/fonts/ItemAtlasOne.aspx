<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemAtlasOne.aspx.cs" Inherits="HeqiaoDaoshi.fonts.ItemAtlasOne" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>河桥宣传-图集</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <script>
        function goback() {
            //window.history.back(-1);
            window.location.href = "ItemHengZiList.aspx?types=3" + "&indexNumId=" + indexNumId;;
        }
        function gosyback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
        function goitemback(i) {
            window.location.href = "ItemAtlasTwo.aspx?ids=<%=Request.QueryString["ids"]%>&idd=" + i + "&indexNumId=" + indexNumId;
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
            top: 20%;
            left: 12%;
        }

        .videoBox {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 90%;
            height: 85%;
            overflow-y: auto;
            box-sizing: border-box;
            padding-top: 20px;
        }

        .videoBox li {
            width: 33.333%;
            list-style: none;
            float: left;
            text-align: center;
            padding-bottom: 20px;
            cursor: pointer;
        }

        .itemBox {
            width: 250px;
            height: 250px;
            line-height: 250x;
            margin: 0 auto;
            border: 2px solid #382929;
        }

        .itemName {
            font-size: 28px;
            color: #382929;
            letter-spacing: 4px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
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
                    <div>
                        <img src="./images/new/xcspBg.png" alt="">
                    </div>
                    <div class="videoBox">
                        <%=strlist%>
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
