<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouristServicesOne.aspx.cs" Inherits="HeqiaoDaoshi.fonts.TouristServicesOne" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>游客服务-咨询</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <script>
        function goback() {   
            window.location.href = "TouristServicesList.aspx?indexNumId=" + indexNumId;
        }
        function gosyback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
        function goitemback() {
            window.location.href = "ItemHengZiList.aspx?indexNumId=" + indexNumId;
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
                    <div style="background: rgba(0,0,0,0.4); height: 630px; margin-top: 65px;margin-right:30px;">
                        <span style="font-size: 28px; text-align: center; display: block; padding-top: 15px; letter-spacing: 2px; color: #fff; font-weight: bold;">温馨提示</span>
                        <div style="font-size: 16px; text-align: center; display: block; margin-top: 20px; letter-spacing: 3px; color: #fff; line-height: 30px;">
                            <span style="display: block;">浏览过程中遇急、难、险困等事件请及时拨打电话求助：</span>
                        </div>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div style="font-size: 16px; text-align: center; display: block; margin-top: 35px; letter-spacing: 3px; color: #fff; line-height: 30px;">
                                    <span style="display: block;"><%# Eval("PhoneName").ToString() %></span>
                                    <span><%# Eval("Phone").ToString() %></span>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
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
