<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScenicInformationList.aspx.cs" Inherits="HeqiaoDaoshi.fonts.ScenicInformationList" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>景区资讯</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <script>
        function goback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
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
                    <div style="height: 660px; margin-top: 50px;">
                        <div style="overflow: scroll; overflow-x: hidden; height: 615px;">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <div style="overflow:auto; background: rgba(0,0,0,0.4); margin-top: 15px; margin-right: 82px; border: 3px solid #847B78; cursor: pointer;">
                                        <div style="float: left; width: 56%;">
                                            <p style="margin-left: 35px; color: #fff; font-size: 25px; font-weight: bold; letter-spacing: 2px;">
                                                <%# Eval("Title").ToString() %>
                                            </p>
                                            <div style="color: #fff; font-size: 20px; margin-left: 35px; letter-spacing: 2px; line-height: 2;text-indent:2em;">
                                                <%# Eval("Introduce").ToString() %>
                                            </div>
                                        </div>
                                        <div style="float: right;">
                                            <img src="<%# geturl(Eval("Picture").ToString()) %>" width="202" height="258" style="object-fit:cover;border-radius:5px;"/>
                                            <img src="<%# geturl1(Eval("Picture").ToString()) %>" width="202" height="258" style="margin-left: 15px;object-fit:cover;border-radius:5px;" />
                                            <img src="<%# geturl2(Eval("Picture").ToString()) %>" width="202" height="258" style="margin-top: 8px; margin-right: 20px; margin-left: 15px;object-fit:cover;border-radius:5px;" />
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

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
