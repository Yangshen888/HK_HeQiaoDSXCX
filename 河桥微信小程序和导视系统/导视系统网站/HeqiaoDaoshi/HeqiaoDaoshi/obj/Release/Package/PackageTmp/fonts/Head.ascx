<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Head.ascx.cs" Inherits="HeqiaoDaoshi.fonts.Head" %>
<script>
    var t = null;
    window.setInterval(time, 1000);//开始执行
    function time() {
        clearTimeout(t);//清除定时器
        dt = new Date();
        var y = dt.getYear() + 1900;
        var mm = dt.getMonth() + 1;
        var d = dt.getDate();
        var weekday = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
        var day = dt.getDay();
        var h = dt.getHours();
        var m = dt.getMinutes();
        var s = dt.getSeconds();
        if (h < 10) { h = "0" + h; }
        if (m < 10) { m = "0" + m; }
        if (s < 10) { s = "0" + s; }
        document.getElementById("date").innerHTML = "" + h + ":" + m + "";
        document.getElementById("timeShow").innerHTML = y + "-" + mm + "-" + d;
        document.getElementById("week").innerHTML = weekday[day];
    }
    function gobackhead() {
        window.location.href = "Index.aspx?indexNumId=" + indexNumId;
    }
</script>
<style>
    div{
        user-select:none;
    }
</style>
<div style="width: 33%; height: 100px; float: left; cursor: pointer;" onclick="gobackhead()">
    <div style="float: left; margin: 30px 0px 0px 90px;">
    </div>
    <div style="float: left;">
        <img src="images/474.png" style="margin-left: 60px;" />
    </div>
    <div>
        <img src="images/heqiaozhen.png" style="margin-left: 20px; margin-top: 10px;" />
    </div>
</div>
<div style="width: 33%; height: 100px; float: left; color: #fff; text-align: center; line-height: 100px; font-size: 45px; letter-spacing: 7px; padding-left: 8px; margin-top: 4px;">
    唐昌首镇&nbsp;&nbsp;古韵河桥
</div>
<div style="width: 33%; height: 100px; float: left; color: #fff; text-align: right; font-size: 30px;">
    <span style="text-align: center; padding-left: 200px; font-size: 30px; letter-spacing: 2px; margin-top: 12px; display: block;"><span id="date"></span><span id="week"></span></span>
    <span style="text-align: center; padding-left: 200px; font-size: 30px; letter-spacing: 2px; margin-top: 8px; display: block;"><span id="timeShow"></span></span>
</div>
