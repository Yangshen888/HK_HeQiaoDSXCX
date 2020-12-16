<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemAtlasShow.aspx.cs" Inherits="HeqiaoDaoshi.fonts.ItemAtlasShow" %>

<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>河桥宣传-视频播放</title>
    <!--css-->
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/timeline.css">
    <script>
        function goback() {
            //window.history.back(-1);
            window.location.href = "ItemHengZiList.aspx?types=4" + "&indexNumId=" + indexNumId;;
        }
        function gosyback() {
            window.location.href = "Index.aspx";
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
                    <div style="width: 1230px; margin: 0 auto; overflow: hidden">
                        <div style="float: left; width: 1230px; margin-top: 85px;">
                            <%--<img src="images/蒙版组30.png" />--%>
                            <video src="<%=spurl %>" controls="controls"  style="width:1207px;height:557px;background:#000;">

                            </video>
                        </div>
                    </div>
                </div>
            </div>

            <div style="height: 110px; width: 100%; background: rgba(0,0,0,0.4); text-align: center;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>

