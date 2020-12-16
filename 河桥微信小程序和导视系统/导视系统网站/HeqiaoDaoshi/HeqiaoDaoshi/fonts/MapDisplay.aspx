<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapDisplay.aspx.cs" Inherits="HeqiaoDaoshi.fonts.MapDisplay" %>

<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        body {
            /*background: url('images/fe28ea5a-a3b9-4c99-b93a-5a03705bb959(1).jpg') no-repeat;*/
            width: 1920px;
            height: 1080px;
            margin: 0px auto;
        }
        #info {
            position: absolute;
            left: 30px;
            top: 30px;
            background: #FFF;
            width: 350px;
            height: 120px;
            padding: 10px;
            border-radius: 3px;
        }
        .imgBox{
            min-width:150px;
            width:100%;
            height:80px;
            border-radius:5px;
            overflow:hidden;
            position:relative;
        }
        .mapImg{
            width:150px;
            object-fit:cover;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        .mapDialog{
            position:absolute;
            top:50%;
            left:50%;
            transform:translate(-50%,-50%);
            background-color:#fff;
            border-radius:10px;
            width:900px;
            padding:10px 0 20px 0;
            z-index:9999;
            display:none;
        }
        /*关闭按钮动画*/
        /*@keyframes closeRotate{
            0%{
                transform:rotate(0)
            }
            100%{
                transform:rotate(360deg)
            }
        }*/
        .closeBtn{
            width:40px;
            position:absolute;
            top:-10px;
            right:-10px;
            /*animation:closeRotate 2s linear infinite;*/
            transform-origin:center;
        }

        .name{
            font-size:18px;
            line-height:2;
            letter-spacing:2px;
        }
        .imageBox{
            width:800px;
            height:450px;
            margin:0 auto;
            overflow:hidden;
            position:relative;
            border-radius:10px;
        }
        .img{
            width:100%;
            position:absolute;
            top:50%;
            left:0;
            transform:translateY(-50%);
        }
        .address{
            width:800px;
            margin:0 auto;
            text-align:left;
            line-height:2;
        }
        .content{
            width:800px;
            margin:0 auto;
            text-indent:2em;
            text-align:justify;
            line-height:1.5;
        }
        .parkNumBox{
            width:800px;
            margin:0 auto;
            overflow:auto;
        }
        .parkNum{
            width:40%;
            height:60px;
            padding:10px;
            color:#fff;
            border-radius:10px;
        }
        .num_l{
            float:left;
            background-color:rgba(220,20,60,0.5);
        }
        .num_r{
            float:right;
            background-color:rgba(0,250,154,0.5);
        }
        .main_r {
            /* position: absolute; */
            height: 970px;
            width: 240px;
            /* bottom: 0; */
            /* right: 0; */
            /* transform: translateY(-50%); */
            background: rgba(0,0,0,0.2);
            z-index: 99999;
        }

        .main_r li {
            list-style: none;
            cursor: pointer;
        }
    </style>
    <%--<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=maKQq65C8lP3EPvBQHBUox2OzGqW6vhc"></script>--%>
    <%--<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77"></script>--%>
    <%--<script charset="utf-8" src="https://3gimg.qq.com/lightmap/components/geolocation/geolocation.min.js"></script>--%>
    <script charset="utf-8" src="https://map.qq.com/api/gljs?v=1.exp&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77"></script>
    <script src="js/jquery.min.js"></script>
    <script>
        //$('#backBtn').on('click', function () {
        //    window.history.back(-1);
        //})
        function gobackhead() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
    </script>
    <script>
        var lon = 119.250643;
        var lat = 30.096866;
        function init() {
            $.when(
                $.ajax({
                    url: 'https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/getPointert?indexNumId=' + indexNumId,
                    method: 'get',
                    success: function (data) {
                        console.log("设备位置数据请求成功")
                        console.log(data);
                        if (data.data != null) {
                            lat = parseFloat(data.data.lat);
                            lon = parseFloat(data.data.lon);
                        }
                    },
                    error: function (data) {
                        console.log("数据请求失败")
                        console.log(data);
                    }
                })
            ).then(function () {
                var center = new TMap.LatLng(lat, lon);
                //初始化地图
                var map = new TMap.Map("container", {
                    rotation: 20,//设置地图旋转角度
                    pitch: 30, //设置俯仰角度（0~45）
                    zoom: 16,//设置地图缩放级别
                    center: center//设置地图中心点坐标
                });

                //初始marker
                var marker = new TMap.MultiMarker({
                    id: 'marker-layer',
                    map: map,
                    styles: {
                        "marker": new TMap.MarkerStyle({
                            "width": 24,
                            "height": 35,
                            "anchor": { x: 12, y: 35 },
                            "src": 'https://mapapi.qq.com/web/lbs/javascriptGL/demo/img/markerDefault.png'
                        })
                    },
                    geometries: [{
                        "id": 'demo1',
                        "styleId": 'marker',
                        "position": center,
                        "properties": {
                            "title": "marker"
                        }
                    }]
                });
                //初始化infoWindow
                var infoWindow = new TMap.InfoWindow({
                    map: map,
                    position: center,
                    offset: { x: 0, y: -42 } //设置信息窗相对position偏移像素
                });
                infoWindow.open();//初始关闭信息窗关闭
                infoWindow.setContent('当前位置');//设置信息窗内容
                //监听标注点击事件
                marker.on("click", function (evt) {
                    //设置infoWindow
                    infoWindow.open(); //打开信息窗
                    
                })
            })
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" style="height: 100%;">
        <div style="position: relative;">
            <div style="height: 110px; width: 100%; background: rgba(0,0,0,0.4); position: relative;">
                <uc1:Head runat="server" ID="Head" />
                <div style="position: absolute; top: 50%; left: 30px; cursor: pointer; transform: translateY(-50%);" id="backBtn" onclick="gobackhead()">
                    <img src="images/第二页/82.png" />
                </div>
            </div>
            <div style="display: flex;">
                <div style="flex: 1;height: 970px;" id="container">
                    <div class="mapDialog">
                        <%--<img src="images/closeBtn.png" class="closeBtn" onclick="closedailog()" />--%>
                        <div class="dailogBox" style="text-align:center;">
                        </div>
                    </div>
                </div>
                <div class="main_r">
                    <uc1:Footer runat="server" ID="Footer" />
                </div>
            </div>
        </div>
    </form>
    <%--文字转语音--%>
    <script type="text/javascript"> 
        //文字转语音
        function doTTS(Introduce) {
            console.log(Introduce)
            var ttsDiv = document.getElementById('bdtts_div_id');
            var ttsAudio = document.getElementById('tts_autio_id');
            var ttsText = Introduce;

            ttsDiv.removeChild(ttsAudio);
            var au1 = '<audio id="tts_autio_id" autoplay="autoplay">';
            var sss = '<source id="tts_source_id" src="https://tts.baidu.com/text2audio?lan=Zh&ie=UTF-8&spd=4&text=' + ttsText + '" type="audio/mpeg">';
            var eee = '<embed id="tts_embed_id" height="0" width="0" src="">';
            var au2 = '</audio>';
            ttsDiv.innerHTML = au1 + sss + eee + au2;

            ttsAudio = document.getElementById('tts_autio_id');

            ttsAudio.play();
        }
    </script>
    <script>
        var index = "<%=Request.QueryString["index"]%>";
        if (index != "") {
            if (index == "1") {
                creatMarker('https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/getcarparklist');
            }
            else if (index == "2") {
                creatMarker('https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/getsharinglist');
            }
            else if (index == "3") {
                creatMarker('https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/getfoodtclist');
            }
            else if (index == "4") {
                creatMarker('https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/indexrightpicture');
            }
            else if (index == "5") {
                creatMarker('https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/gethotellist');
            }
            else if (index == "6") {
                creatMarker('https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/getspecialpicklist');
            }
            else if (index == "7") {
                creatMarker('https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/gethospitallist');
            }
            else if (index == "8") {
                creatMarker('https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/getbanklist');
            }
            else if (index == "9") {
                creatMarker('https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/getgtoiletlist');
            }
            else {
                init()
            }
        }
        else {
            init()
        }


        function creatMarker(getUrl) {
            $.when(
                $.ajax({
                    url: 'https://hqjsc.hzgx.info/api/v1/DaoshiMap/DaoshiMap/getPointert?indexNumId=' + indexNumId,
                    method: 'get',
                    success: function (data) {
                        console.log("设备位置数据请求成功")
                        console.log(data);
                        if (data.data != null) {
                            lat = parseFloat(data.data.lat);
                            lon = parseFloat(data.data.lon);
                            console.log(data.data.lat, data.data.lon)
                        }
                    },
                    error: function (data) {
                        console.log("数据请求失败")
                        console.log(data);
                    }
                })
            ).then(function () {
                console.log(lat, lon)
                var center = new TMap.LatLng(lat, lon);
                //初始化地图
                var map = new TMap.Map("container", {
                    rotation: 20,//设置地图旋转角度
                    pitch: 30, //设置俯仰角度（0~45）
                    zoom: 16,//设置地图缩放级别
                    center: center//设置地图中心点坐标
                });
                var marker = new TMap.MultiMarker({
                    id: 'marker-layer',
                    map: map,
                    styles: {
                        "marker": new TMap.MarkerStyle({
                            "width": 24,
                            "height": 35,
                            "anchor": { x: 12, y: 35 },
                            "src": 'https://mapapi.qq.com/web/lbs/javascriptGL/demo/img/markerDefault.png'
                        })
                    },
                    geometries: [{
                        "id": 'demo12',
                        "styleId": 'marker',
                        "position": center,
                        "properties": {
                            "title": "marker2"
                        }
                    }]
                });
                //初始化infoWindow
                var infoWindow = new TMap.InfoWindow({
                    map: map,
                    position: center,
                    offset: { x: 0, y: -42 } //设置信息窗相对position偏移像素
                });
                infoWindow.open();//初始关闭信息窗关闭
                infoWindow.setContent('当前位置');//设置信息窗内容
                //监听标注点击事件
                marker.on("click", function (evt) {
                    //设置infoWindow
                    infoWindow.open(); //打开信息窗
                })
                $.ajax({
                    url: getUrl,
                    method: 'get',
                    success: function (data) {
                        console.log("数据请求成功")
                        console.log(data);
                        var markers = [];
                        for (var i = 0; i < data.data.length; i++) {
                            var markerP = new TMap.LatLng(data.data[i].lat, data.data[i].lon);//设置中心点坐标
                            var marker = new TMap.MultiMarker({
                                id: data.data[i].id,
                                map: map,
                                styles: {
                                    "marker": new TMap.MarkerStyle({
                                        "width": 24,
                                        "height": 35,
                                        "anchor": { x: 12, y: 35 },
                                        "src": 'https://mapapi.qq.com/web/lbs/javascriptGL/demo/img/markerDefault.png'
                                    })
                                },
                                geometries: [{
                                    "id": data.data[i].id,
                                    "position": markerP,
                                    "properties": {
                                        "title": data.data[i].name
                                    }
                                }]
                            });
                            var obj = JSON.stringify(data.data[i]);
                            console.log(obj);
                            //初始化infoWindow
                            var infoWindow = new TMap.InfoWindow({
                                map: map,
                                position: markerP,
                                content: "<div><div class='imgBox'><img class='mapImg' onclick='dailogShow("+obj+")' src='" + data.data[i].picture + "' /></div><div style='margin-top:5px;'>" + data.data[i].name + "</div></div>",
                                offset: { x: 0, y: -50 } //设置信息窗相对position偏移像素
                            });
                            infoWindow.open(); //打开信息窗
                            // infoWindow.setContent(data.data[i].name);//设置信息窗内容
                            marker.on("click", function (evt) {
                                //设置infoWindow
                                infoWindow.open(); //打开信息窗
                            })
                        }
                    },
                    error: function (data) {
                        console.log("数据请求失败")
                        console.log(data);
                    }
                });
                //关闭弹窗
                function closedailog() {
                    var dailog = document.querySelector('.mapDialog');
                    dailog.style.display = 'none';
                    //关闭弹窗，暂停音频
                    var audio = document.getElementById("myAudio");
                    console.log(audio);
                    if (audio != null) {
                        audio.pause();
                    }
                    $('.dailogBox').html('');
                }
                map.on('click', function () {
                    closedailog()
                })
            })
        }
    </script>
    <%--marker详情--%>
    <script>
        var index = "<%=Request.QueryString["index"]%>";
        var num = 0;
        //打开弹窗
        function dailogShow(e) {
            console.log(e.name);
            //if (num == 0) {
            var dailog = document.querySelector('.mapDialog');
            $('.dailogBox').html('');
                dailog.style.display = 'block';
                if (index == 1) {
                    $('.dailogBox').append('<div class="name">' + e.name + '</div><div class="imageBox"><img class="img" src="' + e.picture + '" /></div><div class="address">地址：' + e.address + '</div><div class="parkNumBox"><div class="parkNum num_l"><div style="text-align:left;">总车位</div><div style="font-size:30px;">' + e.truckSpace + '</div></div><div class="parkNum num_r"><div style="text-align:left;">剩余车位</div><div style="font-size:30px;">' + e.surplusTs + '</div></div></div>')
                } else if (index == 2 || index == 3 || index == 9 || index == 10) {
                    $('.dailogBox').append('<div class="name">' + e.name + '</div><div class="imageBox"><img class="img" src="' + e.picture + '" /></div><div class="address">地址：' + e.address + '</div>')
                } else if (index == 4) {
                    $('.dailogBox').append('<div class="name">' + e.name + '</div><div class="imageBox"><img class="img" src="' + e.picture + '" /></div><div class="address">地址：' + e.address + '</div><div class="content">' + e.content + '</div><audio controls="controls" id="myAudio" style="margin:36px 0 0 30px;outline:none;display:none;"><source src="https://hqjsc.hzgx.info/UploadFiles/Scene/Audio/' + e.audio + '" type="audio/mpeg" /></audio>')
                } else if (index == 5 || index == 6 || index == 7 || index == 8) {
                    $('.dailogBox').append('<div class="name">' + e.name + '</div><div class="imageBox"><img class="img" src="' + e.picture + '" /></div><div class="address">地址：' + e.address + '</div><div class="content">' + e.content + '</div>')
                }
                num++
            //}
            //打开弹窗，自动播放音频
            var audio = document.getElementById("myAudio");
            console.log(audio);
            if (audio != null) {
                audio.play();
            }
        }
        //关闭弹窗
        function closedailog() {
            //num=0
            var dailog = document.querySelector('.mapDialog');
            dailog.style.display = 'none';
            //关闭弹窗，暂停音频
            var audio = document.getElementById("myAudio");
            console.log(audio);
            if (audio != null) {
                audio.pause();
            }
        }
    </script>
</body>
</html>
