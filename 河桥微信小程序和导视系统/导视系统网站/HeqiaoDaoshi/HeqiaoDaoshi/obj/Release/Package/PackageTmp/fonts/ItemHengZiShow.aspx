<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemHengZiShow.aspx.cs" Inherits="HeqiaoDaoshi.fonts.ItemHengZiShow" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>横向列表</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <style>
        #playBtn {
            position: absolute;
            bottom: 0;
            right: 50px;
            cursor: pointer;
            display: none;
        }
    </style>
    <script>
        var types = "<%=Request.QueryString["types"]%>";
        function goback() {
            //window.history.back(-1);
            if (types == "1" || types == "2" || types == "5" || types == "6" || types == "7") {

                window.location.href = "ItemHengZiList.aspx?indexNumId=" + indexNumId + "&types=" + types;
            } else if (types == "4") {
                //window.history.back(-1);
                window.location.href = "ScenicIntroductionList.aspx?indexNumId=" + indexNumId;
            }
        }
        function gosyback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
    </script>
    <script>
                var type = "<%=Request.QueryString["types"]%>";
                function goitemback() {
                    console.log(type)
                    if (type == 4) {
                        document.querySelector('#playBtn').style.display = 'block';
                    }
                }
                window.onload = function () {
                    goitemback()
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

                <%--<button onclick="playAudio()" id="playAudio">播放</button>--%>
                <div style="margin: 0 auto; width: 90%; height: 775px; position: relative;">
                    <div style="height: 80px;">
                        <div style="float: left; cursor: pointer;" onclick="goback()">
                            <img src="images/第二页/82.png" style="margin-top: 25px;" />
                            <span style="color: #fff; font-size: 30px; display: block; margin-top: -60px; margin-left: 80px;">返回上一步</span>
                        </div>
                        <audio controls="controls" id="myAudio" style="margin: 36px 0 0 30px; outline: none; display: none;">
                            <source src="<%=audioUrl %>" type="audio/mpeg" />
                        </audio>
                        <div style="float: right; cursor: pointer;" onclick="gosyback()">
                            <img src="images/第二页/329.png" style="margin-top: 25px;" />
                            <span style="color: #fff; color: #fff; font-size: 30px; display: block; margin-top: -60px; margin-left: 85px; margin-right: 25px; letter-spacing: 2px;">返回首页</span>
                        </div>
                    </div>
                    <div style="background: rgba(0,0,0,0.4); height: 660px; margin-top: 35px; overflow-y: auto;">
                        <div style="height: 350px;">
                            <div style="float: left; width: 33.3333%; height: 100%; padding: 20px; box-sizing: border-box;">
                                <img src="<%=picimageurl1 %>" style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px;" />
                            </div>
                            <div style="float: left; width: 33.3333%; height: 100%; padding: 20px; box-sizing: border-box;">
                                <img src="<%=picimageurl2 %>" style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px;" />
                            </div>
                            <div style="float: left; width: 33.3333%; height: 100%; padding: 20px; box-sizing: border-box;">
                                <img src="<%=picimageurl3 %>" style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px;" />
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div style="text-align: center; color: #fff; margin-top: 30px; font-weight: bold; font-size: 30px; letter-spacing: 4px;">
                            <span><%=headname %></span>
                            <span style="background: rgba(255, 191, 191, 0.4); width: 60px; height: 8px; display: block; border-radius: 10px; text-align: center; margin: 0 auto;"></span>
                        </div>
                        <div>
                            <div style="margin-left: 35px; margin-right: 35px; color: #fff; font-size: 24px; margin-top: 10px; line-height: 30px; letter-spacing: 2px; font-family: cursive; text-indent: 2em;">
                                <%=contentstr %>
                            </div>
                        </div>
                    </div>
                    <div id="playBtn">
                        <div style="overflow: auto;">
                            <span style="color: #fff; font-size: 40px; float: left;">(</span>
                            <img src="images/audio.png" style="width: 60px; float: left;" />
                            <span style="color: #fff; font-size: 40px; float: left;">)</span>
                        </div>
                        <p style="color: #fff; text-align: center; line-height: 2;">语音播报</p>
                    </div>
                </div>
            </div>
            <div style="height: 110px; width: 100%; background: rgba(0,0,0,0.4); text-align: center;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
        <script>
                var audio = document.getElementById("myAudio");
                var btn = document.getElementById("playBtn");
                btn.onclick = function () {
                    if (audio.paused) { //判断当前的状态是否为暂停，若是则点击播放，否则暂停
                        audio.play();
                    } else {
                        audio.pause();
                    }
                }
        </script>
    </form>
</body>
</html>
