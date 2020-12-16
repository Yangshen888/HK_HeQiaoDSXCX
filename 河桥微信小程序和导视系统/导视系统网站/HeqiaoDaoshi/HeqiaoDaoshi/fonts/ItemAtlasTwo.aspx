<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemAtlasTwo.aspx.cs" Inherits="HeqiaoDaoshi.fonts.ItemAtlasTwo" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>河桥宣传-图集详情</title>
    <!--css-->
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <%--<link rel="stylesheet" href="css/timeline.css">--%>
    <style>
        #cUl li{
            list-style:none;
            position:absolute;
            top:0;
            left:0;
            display:none;
            text-align:center;
        }
        #cUl li span{
            font-size: 28px;
            line-height: 2;
            /* color: #fff; */
            letter-spacing: 2px;
        }
    </style>
    <script>
        function goback() {
            window.history.back(-1);
        }
        function gosyback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
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
                    <div style="float: right;cursor: pointer;position: absolute;top: 50%;transform: translateY(-50%);right:20px;" onclick="goback()">
                        <img src="./images/new/backBtn.png" alt="">
                    </div>
                </div>
                <!--html-->
                <div id="timeLine" style="padding: 0 50px;">
                    <div id="cList" style="position:relative;">
                        <a style="cursor: pointer;position:absolute;top:50%;left:0;transform:translateY(-50%)" id="btnLeft">
                            <img src="images/第三页/82.png" />
                        </a>
                        <div style="width: 1230px;height:800px; margin: 0 auto; overflow: hidden;position:relative;">
                            <ul id="cUl">
                                <%=Itemlistr %>
                            </ul>
                        </div>
                        <a style="cursor: pointer;position:absolute;top:50%;right:0;transform:translateY(-50%)" id="btnRight">
                            <img src="images/488.png" />
                        </a>
                    </div>
                </div>
            </div>
            <div class="line"></div>
            <div class="main_r">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
        <!--js-->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script>
            var idd = "<%=Request.QueryString["idd"]%>";
            var lislen = $('#cUl li').length;
            console.log(lislen)
            var current = idd;
            $('#cUl li').eq(idd).show()
            $('#btnRight').on('click', function () {
                nextImg()
            })
            $('#btnLeft').on('click', function () {
                lastImg()
            })
            function nextImg() {
                if (current == lislen - 1) {
                    current=-1
                }
                current++;
                $('#cUl li').eq(current).show().siblings().hide()
            }
            function lastImg() {
                if (current == 0) {
                    current = lislen
                }
                current--;
                $('#cUl li').eq(current).show().siblings().hide()
            }
        </script>
        <%--<script type="text/javascript" src="js/jquery-timeLine.js"></script>
        <script type="text/javascript">
            $(function () {
                $("#timeLine").timeLine({
                    w: 1230  //每一个li的宽度
                });
            });
        </script>--%>
    </form>
</body>
</html>

