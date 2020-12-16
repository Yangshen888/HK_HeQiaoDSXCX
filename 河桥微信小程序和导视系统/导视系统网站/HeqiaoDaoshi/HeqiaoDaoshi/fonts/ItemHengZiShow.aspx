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
            right: 0;
            cursor: pointer;
            display: none;
        }
    </style>
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
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            overflow: hidden;
            width: 100%;
            min-height: 400px;
        }
        .poem{
            width: 10%;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            text-align: center;
        }
        .sinceBox{
            float: right;
            width: 90%;
            overflow-x: auto;
            box-sizing: border-box;
            padding: 0 5%;
        }
        .title{
            font-size: 0;
        }
        .imgBox{
            overflow: hidden;
        }
        .imgBox ul{
            display: flex;
            justify-content: space-around;
        }
        .imgBox li{
            float: left;
            list-style: none;
            margin: 20px;
        }

        .introuduce{
            font-size: 28px;
            text-align: justify;
            letter-spacing: 2px;
            text-indent: 2em;
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
                // document.getElementById('pageItem').src='./images/new/jdjs2.png'
            }else if(type=5){
                // document.getElementById('pageItem').src='./images/new/hqxc2.png'
            }
        }
        window.onload = function () {
            goitemback()
        }
    </script>
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
                        <img src="" alt="" id="pageItem">
                    </div>
                    <!-- 返回按钮 -->
                    <div style="float: right;cursor: pointer;position: absolute;top: 50%;transform: translateY(-50%);right: 20px;" onclick="goback()">
                        <img src="./images/new/backBtn.png" alt="">
                    </div>
                </div>
                <div class="mainCon">
                    <div class="poem">
                        <img src="./images/new/gzts_text.png" alt="" style="width: 80px;">
                    </div>
                    <div class="sinceBox">
                        <div class="title">
                            <p style="font-size: 36px;letter-spacing: 4px;"><%=headname %></p> 
                            <img src="./images/new/yun.png" alt="">
                        </div>
                        <div class="imgBox">
                            <ul>
                                <li>
                                    <img src="<%=picimageurl1 %>" alt="" style="height: 200px;">
                                </li>
                                <li>
                                    <img src="<%=picimageurl2 %>" alt="" style="height: 200px;">
                                </li>
                                <li>
                                    <img src="<%=picimageurl3 %>" alt="" style="height: 200px;">
                                </li>
                            </ul>
                        </div>
                        <div class="introuduce">
                            <%=contentstr %>
                        </div>
                        <audio controls="controls" id="myAudio" style="margin: 36px 0 0 30px; outline: none; display: none;">
                            <source src="<%=audioUrl %>" type="audio/mpeg" />
                        </audio>
                        <div id="playBtn">
                            <div style="overflow: auto;">
                                <span style="color: #fff; font-size: 40px; float: left;">(</span>
                                <img src="./images/audio.png" style="width: 60px; float: left;" />
                                <span style="color: #fff; font-size: 40px; float: left;">)</span>
                            </div>
                            <p style="color: #fff; text-align: center; line-height: 2;">语音播报</p>
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
            //根据是否有录音文件来判断
            var url = "<%=audioUrl %>"
            var ctext = "<%=contentstr %>";
            var audio = document.getElementById("myAudio");
            var btn = document.getElementById("playBtn");
            btn.onclick = function () {
                if (url.indexOf(".mp3") != "-1") {
                    console.log(url);
                    if (audio.paused) { //判断当前的状态是否为暂停，若是则点击播放，否则暂停
                        audio.play();
                    } else {
                        audio.pause();
                    }
                }
               else
                {
                    doTTS(ctext);
                    //console.log(ctext)
                }
            }
        </script>
        <%--文字转语音--%>
        <script type="text/javascript"> 
            //文字转语音
            function doTTS(Introduce) {
                //console.log(Introduce)
                var ttsDiv = document.getElementById('bdtts_div_id');
                var ttsAudio = document.getElementById('tts_autio_id');
                var ttsText = Introduce;

                ttsDiv.removeChild(ttsAudio);
                var au1 = '<audio id="tts_autio_id" autoplay="autoplay">';
                //var sss = '<source id="tts_source_id" src="https://tts.baidu.com/text2audio?lan=Zh&ie=UTF-8&spd=1&pit=5&per=3&text=' + ttsText + '" type="audio/mpeg">';
                var sss = '<source id="tts_source_id" src="http://tts.baidu.com/text2audio?lan=zh&amp;ie=UTF-8&amp;spd=5&amp;pit=5&amp;per=3&amp;text=' + ttsText + '" type="audio/mpeg">';
                var eee = '<embed id="tts_embed_id" height="0" width="0" src="">';
                var au2 = '</audio>';
                ttsDiv.innerHTML = au1 + sss + eee + au2;

                ttsAudio = document.getElementById('tts_autio_id');

                ttsAudio.play();
            }
        </script>
		<script>
		    if(types === '5'){
		        document.getElementById('pageItem').src='./images/new/hqxc2.png'
		    }else if(types === '4'){
		        document.getElementById('pageItem').src='./images/new/jdjs2.png'
		    }else if(types === '7' || types === '6' || types === '5'){
		        document.getElementById('pageItem').src='./images/new/gzts2.png'
		    }else if(types === '1' || types === '2'){
		        document.getElementById('pageItem').src='./images/new/hqxc2.png'
		    }
		</script>
    </form>
</body>
</html>
