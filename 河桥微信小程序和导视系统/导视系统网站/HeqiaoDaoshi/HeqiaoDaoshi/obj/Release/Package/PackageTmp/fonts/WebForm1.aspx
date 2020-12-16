<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HeqiaoDaoshi.fonts.WebForm1" %>

<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>河桥宣传-图集详情</title>
    <!--css-->
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/timeline.css">
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
                        <div id="cList">
                            <a href="#" id="btnLeft">
                                <img src="images/第三页/82.png" />
                            </a>
                            <div style="width: 1230px; margin: 0 auto; overflow: hidden">
                                <ul id="cUl">
                                    <li>
                                        <div style="float: left; width: 1230px; margin-top: 85px;">
                                            <img src="images/蒙版组30.png" />
                                        </div>
                                        <span class="li-tit">第1张，共10张</span>
                                    </li>
                                    <li>
                                        <div style="float: left; width: 1230px; margin-top: 85px;">
                                            <img src="images/蒙版组30.png" />
                                        </div>
                                        <span class="li-tit">2</span>
                                    </li>
                                </ul>
                            </div>
                            <a href="#" id="btnRight">
                                <img src="images/488.png" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!--js-->
            <script type="text/javascript" src="js/jquery.min.js"></script>
            <script type="text/javascript" src="js/jquery-timeLine.js"></script>
            <script type="text/javascript">
                $(function () {
                    $("#timeLine").timeLine({
                        w: 1230  //每一个li的宽度
                        //            btnPrev:"#btnLeft",      //上一个按钮
                        //            btnNext: "#btnRight",  //下一个按钮
                        //            dateBox:"#yearList", //日期的ul盒子
                        //            dateArr: "#yearList li", //保存每一个日期的数组
                        //            conBox:"#cUl",  //保存切换内容的ul盒子
                        //            conArr:"#cUl li" //保存每一个内容的数
                    });
                });
            </script>
            <div style="height: 110px; width: 100%; background: rgba(0,0,0,0.4); text-align: center;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>

