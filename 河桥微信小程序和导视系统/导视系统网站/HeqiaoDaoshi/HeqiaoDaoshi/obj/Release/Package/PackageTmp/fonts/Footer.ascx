<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="HeqiaoDaoshi.fonts.Footer" %>
<script>
    function gobackfooter(index) {
        window.location.href = "MapDisplay.aspx?index=" + index + "&indexNumId=" + indexNumId;
    }
</script>
<script src="js/jquery.min.js"></script>
<div style="display: inline-block;user-select:none;">
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(1)">
        <img src="images/首页/停车场.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">停车场</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(2)">
        <img src="images/bick.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">美团单车</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(3)">
        <img src="images/market.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">特产超市</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(4)">
        <img src="images/sencen.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">景点</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(5)">
        <img src="images/live.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">民宿</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(6)">
        <img src="images/hands.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">采摘</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(7)">
        <img src="images/首页/医院.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">医院</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(8)">
        <img src="images/bank.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">银行</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(9)">
        <img src="images/首页/公共厕所.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">公共厕所</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; cursor: pointer;" onclick="gobackfooter(10)">
        <img src="images/首页/游客中心.png" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">游客中心</span>
    </div>
    <%--<div style="margin:25px 25px 0 25px;float: left; text-align: center; margin-left: 80px; cursor: pointer;">
        <img src="images/首页/寺庙.png" width="46" height="37" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">寺庙</span>
    </div>
    <div style="margin:25px 25px 0 25px;float: left; text-align: center; margin-left: 80px; cursor: pointer;">
        <img src="images/首页/宝箱.png" width="46" height="37" />
        <span style="color: #ffffff; display: block; letter-spacing: 2px; font-size: 20px;">宝藏</span>
    </div>--%>
    <div class="num" style="position:fixed;bottom:20px;right:20px;">
    </div>
</div>

<script>
    var indexNumbianhao = "<%=Request.QueryString["SeriesNo"]%>";
    if (indexNumbianhao != "" && indexNumbianhao != null) {
        var indexNumId = indexNumbianhao;
    }
    else {
        var indexNumId = "<%=Request.QueryString["indexNumId"]%>";
    }
    //localStorage.setItem('num', indexNumId);
    //var getData = localStorage.getItem('num')    
    $('.num').html(indexNumId)
    //document.querySelector('num').innerHTML = '编号：';
    //console.log(html)
</script>
