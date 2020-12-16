<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemHengZiList.aspx.cs" Inherits="HeqiaoDaoshi.fonts.ItemHengZiList" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>横向列表</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script>
        var types = "<%=Request.QueryString["types"]%>";

        function goback() {
            if (types == "1" || types == "2" || types == "3" || types == "4") {
                window.location.href = "ItemHengList.aspx?indexNumId=" + indexNumId;
            } else if (types == "5" || types == "6" || types == "7") {
                window.location.href = "OldTownFeaturesList.aspx?indexNumId=" + indexNumId;
            } else if (types == "8") {
                //window.history.back(-1);
                window.location.href = "TouristServicesList.aspx?indexNumId=" + indexNumId;
            }
        }
        function gosyback() {
            window.location.href = "Index.aspx?indexNumId=" + indexNumId;
        }
        function goitemback(ids) {
            var strlist = ids.split('|');
            var id = strlist[0];
            var types = strlist[1];
            if (types == "3") {
                window.location.href = "ItemAtlasOne.aspx?ids=" + id + "&indexNumId=" + indexNumId;
            }
            else if (types == "4") {
                window.location.href = "ItemAtlasShow.aspx?ids=" + id + "&indexNumId=" + indexNumId;
            }
            else {
                window.location.href = "ItemHengZiShow.aspx?types=" + types + "&ids=" + id + "&indexNumId=" + indexNumId;
            }

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
                    <div style="background: rgba(0,0,0,0.4); height: 660px; margin-top: 35px;">
                        <div style="height: 100%">
                            <div style="overflow-y: auto; height: 100%">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <%--<div style="float: left; width: 380px; height: 420px; margin-left: 45px; margin-top: 80px; cursor: pointer;" onclick="goitemback()">
                                            <img src="images/第二页/26.png" />
                                            <span style="display: block; text-align: center; font-size: 25px; color: #fff; margin-top: 10px;"><%#  Eval("Title") %></span>
                                        </div>--%>
                                        <div style="float: left; width: 570px; margin-top: 30px; text-align: center; font-size: 0; cursor: pointer;">
                                            <div style="position: relative;" class="imgBox">
                                                <img <%# gettypes(Request.QueryString["types"]) %> src="images/首页/315.png" class="playBtn" />
                                                <img src="<%# geturl(Eval("Picname").ToString(),Eval("Types").ToString()) %>" width="372" height="329" style="border-radius: 5px; object-fit: cover;" onclick="goitemback('<%# Eval("Ids").ToString()+"|"+Eval("Types").ToString() %>')" />
                                            </div>
                                            <span style="display: block; text-align: center; font-size: 25px; color: #fff; margin-top: 10px;"><%#  Eval("Title") %></span>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
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
