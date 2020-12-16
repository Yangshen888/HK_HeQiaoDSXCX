<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemHengZiList.aspx.cs" Inherits="HeqiaoDaoshi.fonts.ItemHengZiList" %>

<%@ Register Src="~/fonts/Head.ascx" TagPrefix="uc1" TagName="Head" %>
<%@ Register Src="~/fonts/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>横向列表</title>
    <link href="/fonts/css/bodecss.css" rel="stylesheet" />
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

        .mainCon {
            position: absolute;
            top: 20%;
            left: 12%;
        }

        .videoBox {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 90%;
            height: 85%;
            overflow-y: auto;
            box-sizing: border-box;
            padding-top: 20px;
            /* background-color: purple; */
        }

        .videoBox li {
            width: 33.333%;
            list-style: none;
            float: left;
            text-align: center;
            padding-bottom: 20px;
            cursor: pointer;
        }

        .itemBox {
            width: 250px;
            height: 250px;
            line-height: 250x;
            margin: 0 auto;
            border: 2px solid #382929;
        }

        .itemName {
            font-size: 28px;
            color: #382929;
            letter-spacing: 4px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }

        .line {
            /* position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 12%; */
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
                    <div>
                        <img src="./images/new/xcspBg.png" alt="">
                    </div>
                    <div class="videoBox">
                        <ul>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <div class="itemBox">
                                            <span style="height: 100%;display: inline-block;vertical-align: middle;"></span>
                                            <img style="vertical-align: middle;width: 200px;max-height: 200px;" src="<%# geturl(Eval("Picname").ToString(),Eval("Types").ToString()) %>" alt="" onclick="goitemback('<%# Eval("Ids").ToString()+"|"+Eval("Types").ToString() %>')">
                                        </div>
                                        <p class="itemName"><%#  Eval("Title") %></p>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="line"></div>
            <div class="main_r">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
<script>
    if(types === '5' || types === '6' || types === '7'){
        console.log('123123')
        console.log(types)
        document.getElementById('pageItem').src='./images/new/gzts2.png'
    }else if(types === '1' || types === '2' || types === '3'|| types === '4'){
        document.getElementById('pageItem').src='./images/new/hqxc2.png'
    }else if(types === '8'){
        document.getElementById('pageItem').src='./images/new/jdjs2.png'
    }
</script>
</html>
