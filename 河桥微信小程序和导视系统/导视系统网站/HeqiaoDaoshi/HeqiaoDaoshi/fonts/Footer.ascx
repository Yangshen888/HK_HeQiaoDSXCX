<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="HeqiaoDaoshi.fonts.Footer" %>
<script>
    function gobackfooter(index) {
        window.location.href = "MapDisplay.aspx?index=" + index + "&indexNumId=" + indexNumId;
    }
</script>
<script src="js/jquery.min.js"></script>
<div style="display: inline-block;user-select:none;position:absolute;right:0;top:50%;transform:translateY(-50%);">
    <ul>
        <li style="cursor: pointer;" onclick="gobackfooter(1)"><img src="./images/new/port.png" alt=""></li>
        <li style="cursor: pointer;" onclick="gobackfooter(2)"><img src="./images/new/mtdc.png" alt=""></li>
        <li style="cursor: pointer;" onclick="gobackfooter(3)"><img src="./images/new/tccs.png" alt=""></li>
        <li style="cursor: pointer;" onclick="gobackfooter(4)"><img src="./images/new/sincen.png" alt=""></li>
        <li style="cursor: pointer;" onclick="gobackfooter(5)"><img src="./images/new/hotel.png" alt=""></li>
        <li style="cursor: pointer;" onclick="gobackfooter(6)"><img src="./images/new/plate.png" alt=""></li>
        <li style="cursor: pointer;" onclick="gobackfooter(7)"><img src="./images/new/hospital.png" alt=""></li>
        <li style="cursor: pointer;" onclick="gobackfooter(8)"><img src="./images/new/bank.png" alt=""></li>
        <li style="cursor: pointer;" onclick="gobackfooter(9)"><img src="./images/new/tolite.png" alt=""></li>
        <li style="cursor: pointer;" onclick="gobackfooter(10)"><img src="./images/new/visitorcenter.png" alt=""></li>
    </ul>
</div>
<div class="num" style="position:fixed;bottom:20px;right:20px;"></div>


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
