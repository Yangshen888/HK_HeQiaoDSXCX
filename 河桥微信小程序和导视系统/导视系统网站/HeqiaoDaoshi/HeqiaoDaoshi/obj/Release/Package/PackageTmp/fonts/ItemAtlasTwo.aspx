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
            font-size: 24px;
            line-height: 2;
            color: #fff;
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
                        <div style="float: left; cursor: pointer;" onclick="goback()">
                            <img src="images/第二页/82.png" style="margin-top: 25px;" />
                            <span style="color: #fff; font-size: 30px; display: block; margin-top: -60px; margin-left: 80px;">返回上一步</span>
                        </div>
                        <div style="float: right; cursor: pointer;" onclick="gosyback()">
                            <img src="images/第二页/329.png" style="margin-top: 25px;" />
                            <span style="color: #fff; color: #fff; font-size: 30px; display: block; margin-top: -60px; margin-left: 85px; margin-right: 25px; letter-spacing: 2px;">返回首页</span>
                        </div>
                    </div>
                    <!--html-->
                    <div id="timeLine">
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
            <div style="height: 110px; width: 100%; background: rgba(0,0,0,0.4); text-align: center;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>

