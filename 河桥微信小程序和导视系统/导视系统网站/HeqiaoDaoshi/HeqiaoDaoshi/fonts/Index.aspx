<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HeqiaoDaoshi.fonts.Index" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <link href="/fonts/css/liMarquee.css" rel="stylesheet" />
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
            user-select: none;
        }

        .mainbg {
            position: absolute;
            top: 0;
            left: 0;
            font-size: 0;
            z-index: -1;
            width: 100%;
        }

        .main_l {
            float: left;
            position: relative;
            width: 56%;
            height: 100%;
        }

        .main_l_bg {
            position: absolute;
            left: 0;
            font-size: 0;
            width: 100%;
        }

        .mian_l_top {
            position: absolute;
            top: 0;
            left: 0;
            height: 50%;
            width: 100%;
        }

        .verse {
            width: 15%;
            text-align: center;
            position: absolute;
            top: 50%;
            transform: translateY(-40%);
        }

        .mode {
            position: relative;
            float: right;
            height: 100%;
            width: 90%;
        }

        .modeli {
            float: left;
            list-style: none;
            position: absolute;
            cursor: pointer;
        }

        .pagesy {
            bottom: 10%;
            left: 5%;
        }

        .hqxc {
            top: 25%;
            left: 20%;
        }

        .jqzx {
            top: 55%;
            left: 32%;
        }

        .jqjs {
            top: 20%;
            left: 45%;
        }

        .gzts {
            top: 60%;
            left: 50%;
        }

        .ykfw {
            top: 32%;
            left: 65%;
        }

        .dtdl {
            top: 30%;
            left: 80%;
        }

        .main_l_bottom {
            position: absolute;
            top: 50%;
            transform: translateY(-45%);
            width: 75%;
            overflow: hidden;
            height: 210px;
            margin-left: 60px;
        }

        .main_m {
            float: left;
            height: 100%;
            font-size: 0;
            margin-right: 15px;
            box-sizing: border-box;
        }

        .logo_text {
            float: left;
        }

        .logo_img {
            float: left;
            margin-left: 30px;
        }
        .line{
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
        .lunboBox{
            width: 80%;
            background-image: url(./images/new/lunbo.png);
            background-size: 100% 100%;
            height: 300px;
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
        }
        .imgBox1{
            width: 100%;
            height: 100% !important;
            overflow: hidden;
            background: transparent !important;
            /* background-image: url(./images/new/lunbo.png); */
        }
        .itemli{
            list-style: none;
            display: inline;
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
                <div class="main_l_bg">
                    <img src="./images/new/leftbg.png" alt="" style="width: 100%;">
                </div>
                <!-- 首页左侧上部 -->
                <div class="mian_l_top">
                    <!-- 页面左侧诗句 -->
                    <div class="verse">
                        <img src="./images/new/index_text.png" alt="" style="width: 80px;">
                    </div>
                    <!-- 页面模块 -->
                    <div class="mode">
                        <ul>
                            <li class="modeli pagesy">
                                <img src="./images/new/index.png" alt="">
                            </li>
                            <li class="modeli hqxc" onclick="geturl(1)">
                                <img src="./images/new/hqxc.png" alt="">
                            </li>
                            <li class="modeli jqzx" onclick="geturl(2)">
                                <img src="./images/new/jqzx.png" alt="">
                            </li>
                            <li class="modeli jqjs" onclick="geturl(3)">
                                <img src="./images/new/jqjs.png" alt="">
                            </li>
                            <li class="modeli gzts" onclick="geturl(4)">
                                <img src="./images/new/gzts.png" alt="">
                            </li>
                            <li class="modeli ykfw" onclick="geturl(5)">
                                <img src="./images/new/ykfw.png" alt="">
                            </li>
                            <li class="modeli dtdl" onclick="geturl(6)">
                                <img src="./images/new/dtdl.png" alt="">
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- <div class="imgBox" style="background-color:transparent;height:100%;width:100%;">
                    <ul class="imglis">
                        <% for (int i = 0; i < cSPs.Count; i++)
                            {%>
                        <li><img class="pimg" onclick="toBig(this)" style="width:100%;"
                                src='<%= cSPs[i].Picture %>' /></li>
                        <%} %>
                    </ul>
                </div> -->
                <!-- 首页左侧底部轮播 -->
                <div class="lunboBox">
                    <div class="main_l_bottom">
                        <div class="imgBox1">
                            <% for (int i = 0; i < cSPs.Count; i++)
                                {%>
                                <div class="itemli">
                                    <img class="pimg" onclick="toBig(this)" style="height: 200px;" src='<%= cSPs[i].Picture %>' />
                                </div>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main_m" style="position: relative;width: 32%;">
                <div style="border-left: 2px solid #302f2e;position: absolute;bottom: 0;height: 90%;padding-top: 40px;">
                    <div class="logo" style="font-size: 0;overflow: hidden;">
                        <div class="logo_text">
                            <img src="./images/new/log_text.png" alt="">
                        </div>
                        <div class="logo_img">
                            <img src="./images/new/hqz.png" alt="">
                            <br />
                            <img src="./images/new/hqz_logo.png" alt="">
                        </div>
                    </div>
                    <div class="videoBox" style="font-size: 0;text-align: center;position: relative;">
                        <img src="./images/new/videoBg.png" alt="" style="width: 450px;">
                        <div style="position: absolute;bottom:50px;left: 50%;transform: translateX(-50%);">
                            <video src="<%=spurl %>" controls="controls" poster="images/index_poster.png"
                                style="width: 360px; height: 220px; background: #000;">
                            </video>
                        </div>
                    </div>
                </div>
            </div>
            <div class="line"></div>
            <div class="main_r">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
        <script>
            function geturl(types) {
                if (types == "1") {
                    window.location.href = 'ItemHengList.aspx?indexNumId=' + indexNumId;
                }
                else if (types == "2") {
                    window.location.href = 'ScenicInformationList.aspx?indexNumId=' + indexNumId;
                }
                else if (types == "3") {
                    window.location.href = 'ScenicIntroductionList.aspx?indexNumId=' + indexNumId;
                }
                else if (types == "4") {
                    window.location.href = 'OldTownFeaturesList.aspx?indexNumId=' + indexNumId;
                }
                else if (types == "5") {
                    window.location.href = 'TouristServicesList.aspx?indexNumId=' + indexNumId;
                }
                else if (types == "6") {
                    window.location.href = 'MapDisplay.aspx?indexNumId=' + indexNumId;
                }
            }
        </script>
        <script src="js/jquery-1.8.3.min.js"></script>
        <script src="js/jquery.liMarquee.js"></script>
        <script>
            var $limarquee = $('.imgBox1').liMarquee();
            function toBig(obj) {
                console.log(123)
                var _this = $(obj);//将当前的pimg元素作为_this传入函数  
                console.log(_this)
                imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
            };
            function imgShow(outerdiv, innerdiv, bigimg, _this) {
                var src = _this.attr("src");//获取当前点击的pimg元素中的src属性  
                $(bigimg).attr("src", src);//设置#bigimg元素的src属性  

                /*获取当前点击图片的真实大小，并显示弹出层及大图*/
                $("<img/>").attr("src", src).load(function () {
                    var windowW = $(window).width();//获取当前窗口宽度  
                    var windowH = $(window).height();//获取当前窗口高度  
                    var realWidth = this.width;//获取图片真实宽度  
                    var realHeight = this.height;//获取图片真实高度  
                    var imgWidth, imgHeight;
                    var scale = 2;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放  

                    if (realHeight > windowH * scale) {//判断图片高度  
                        imgHeight = windowH * scale;//如大于窗口高度，图片高度进行缩放  
                        imgWidth = imgHeight / realHeight * realWidth;//等比例缩放宽度  
                        if (imgWidth > windowW * scale) {//如宽度扔大于窗口宽度  
                            imgWidth = windowW * scale;//再对宽度进行缩放  
                        }
                    } else if (realWidth > windowW * scale) {//如图片高度合适，判断图片宽度  
                        imgWidth = windowW * scale;//如大于窗口宽度，图片宽度进行缩放  
                        imgHeight = imgWidth / realWidth * realHeight;//等比例缩放高度  
                    } else {//如果图片真实高度和宽度都符合要求，高宽不变  
                        imgWidth = realWidth;
                        imgHeight = realHeight;
                    }
                    $(bigimg).css("width", imgWidth);//以最终的宽度对图片缩放  

                    var w = (windowW - imgWidth) / 2;//计算图片与窗口左边距  
                    var h = (windowH - imgHeight) / 2;//计算图片与窗口上边距  
                    $(innerdiv).css({ "top": h, "left": w });//设置#innerdiv的top和left属性  
                    $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg  
                    console.log(123456)
                    $limarquee.liMarquee('pause');
                });
                $(outerdiv).click(function () {//再次点击淡出消失弹出层  
                    $(this).fadeOut("fast");
                    $limarquee.liMarquee('play');
                });
            }
        </script>
    </form>
</body>
</html>
