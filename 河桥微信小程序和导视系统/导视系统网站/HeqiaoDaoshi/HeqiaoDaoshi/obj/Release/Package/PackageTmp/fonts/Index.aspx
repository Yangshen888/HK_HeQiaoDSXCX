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
        .imglis li{
            list-style:none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="height: 110px; width: 100%; background: rgba(0,0,0,0.4);">
                <uc1:Head runat="server" ID="Head" />
            </div>
            <div style="height: 860px;">
                <div style="height: 760px; width: 27%; background: rgba(0,0,0,0.4); float: left; margin-left: 75px; margin-top: 48px;">
                    <div style="text-align:center;font-size:0;padding:15px 0;">
                        <video src="<%=spurl %>" controls="controls" poster="images/index_poster.png" style="width: 495px; height: 330px; background: #000;">
                        </video>
                    </div>
                    <div style="text-align:center;font-size:0;padding:15px 0;">
                        <video src="https://hqjsc.hzgx.info/wxapp/static/village/xiaohongn.mp4" controls="controls" poster="https://hqjsc.hzgx.info/wxapp/static/village/dmPoster.png" style="width: 495px; height: 330px; background: #000;">
                        </video>
                    </div>
                    <%--<div style="user-select:none;">
                        <img src="images/首页/322.png" style="margin-left: 24px; margin-top: 20px;" />
                        <img src="images/首页/323.png" style="margin-left: 30px; margin-top: 20px;" />
                        <img src="images/首页/325.png" style="margin-left: 30px; margin-top: 20px;" />
                    </div>--%>
                </div>
                <div style="height: 760px; width: 39%; background: rgba(0,0,0,0.4); float: left; margin-left: 100px; margin-top: 48px;">
                    <div style="float: left; text-align: center; margin-left: 70px; margin-top: 50px; cursor: pointer;" onclick="geturl(1)">
                        <img src="images/首页/475.png" />
                        <span style="color: #ffffff; display: block; letter-spacing: 2px; margin-top: -10px; font-size: 20px;">河桥宣传</span>
                    </div>
                    <div style="float: left; text-align: center; margin-left: 85px; margin-top: 50px; cursor: pointer;" onclick="geturl(2)">
                        <img src="images/首页/476.png" />
                        <span style="color: #ffffff; display: block; letter-spacing: 2px; margin-top: -10px; font-size: 20px;">景区资讯</span>
                    </div>
                    <div style="float: left; text-align: center; margin-left: 85px; margin-top: 50px; cursor: pointer;" onclick="geturl(3)">
                        <img src="images/首页/479.png" />
                        <span style="color: #ffffff; display: block; letter-spacing: 2px; margin-top: -10px; font-size: 20px;">景点介绍</span>
                    </div>
                    <div style="float: left; text-align: center; margin-left: 70px; margin-top: 25px; cursor: pointer;" onclick="geturl(4)">
                        <img src="images/首页/474.png" />
                        <span style="color: #ffffff; display: block; letter-spacing: 2px; margin-top: -10px; font-size: 20px;">古镇特色</span>
                    </div>
                    <div style="float: left; text-align: center; margin-left: 85px; margin-top: 25px; cursor: pointer;" onclick="geturl(5)">
                        <img src="images/首页/477.png" />
                        <span style="color: #ffffff; display: block; letter-spacing: 2px; margin-top: -10px; font-size: 20px;">游客服务</span>
                    </div>
                    <div style="float: left; text-align: center; margin-left: 85px; margin-top: 25px; cursor: pointer;" onclick="geturl(6)">
                        <img src="images/首页/478.png" />
                        <span style="color: #ffffff; display: block; letter-spacing: 2px; margin-top: -10px; font-size: 20px;">地图导览</span>
                    </div>
                </div>
                <div style="height: 760px;overflow:hidden; width: 16%; background: rgba(0,0,0,0.4); float: left; margin-left: 100px; margin-top: 48px;padding:0 10px;">
                    <div class="imgBox" style="background-color:transparent;height:100%;width:100%;">
                        <ul class="imglis">
                            <% for (int i = 0; i < cSPs.Count; i++)
                                {%>
                            <li><img class="pimg" onclick="toBig(this)" style="width:100%;" src='<%= cSPs[i].Picture %>' /></li>
                            <%} %>
                        </ul>
                    </div>
                    <%--<span style="font-size: 28px; text-align: center; display: block; margin-top: 10px; letter-spacing: 2px; color: #fff; font-weight: bold;">温馨提示</span>
                    <div style="font-size: 16px; text-align: center; display: block; margin-top: 20px; letter-spacing: 3px; color: #fff; line-height: 30px;">
                        <span style="display: block;">浏览过程中遇急、难、险困等事件</span>
                        <span>请及时拨打电话求助：</span>
                    </div>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div style="font-size: 16px; text-align: center; display: block; margin-top: 50px; letter-spacing: 3px; color: #fff; line-height: 30px;">
                                <span style="display: block;"><%# Eval("PhoneName").ToString() %></span>
                                <span><%# Eval("Phone").ToString() %></span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>--%>
                </div>
            </div>
            <div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
                <div id="innerdiv" style="position:absolute;">
                    <img id="bigimg" style="border:5px solid #fff;" />
                </div>
            </div>    
            <div style="height: 110px; width: 100%; background: rgba(0,0,0,0.4); text-align: center;">
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
            var $limarquee = $('.imgBox').liMarquee({
                direction: 'up',
                scrollamount: 100 //速度
            });
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
