<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouristServicesOne.aspx.cs" Inherits="HeqiaoDaoshi.fonts.TouristServicesOne" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>游客服务-咨询</title>
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
            transform: translateY(-50%);
            overflow: hidden;
            width: 100%;
            min-height: 400px;
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
            overflow-x: auto;
            box-sizing: border-box;
            padding: 0 5%;
        }

        .title {
            font-size: 0;
        }

        .imgBox {
            overflow: hidden;
        }

        .imgBox ul {
            display: flex;
            justify-content: space-around;
        }

        .imgBox li {
            float: left;
            list-style: none;
            margin: 20px;
        }

        .introuduce {
            font-size: 28px;
            text-align: justify;
            letter-spacing: 2px;
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
                <img src="./images/new/pagesbg.png" alt="" style="width: 100%;height: 100%;">
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
                <div class="mainCon"></div>
                <div class="poem">
                    <img src="./images/new/gzts_text.png" alt="" style="width: 80px;">
                </div>
                <div class="sinceBox">
                    <div style="background: rgba(0,0,0,0.4); height: 630px; margin-top: 65px;margin-right:30px;">
                        <span
                            style="font-size: 28px; text-align: center; display: block; padding-top: 15px; letter-spacing: 2px; color: #fff; font-weight: bold;">温馨提示</span>
                        <div
                            style="font-size: 16px; text-align: center; display: block; margin-top: 20px; letter-spacing: 3px; color: #fff; line-height: 30px;">
                            <span style="display: block;">浏览过程中遇急、难、险困等事件请及时拨打电话求助：</span>
                        </div>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div style="font-size: 16px; text-align: center; display: block; margin-top: 35px; letter-spacing: 3px; color: #fff; line-height: 30px;">
                                    <span style="display: block;"><%# Eval("PhoneName").ToString() %></span>
                                    <span><%# Eval("Phone").ToString() %></span>
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
