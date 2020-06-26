<%@ Page Title="" Language="C#" MasterPageFile="~/frontend/front.Master" AutoEventWireup="true" CodeBehind="YachtOverview.aspx.cs" Inherits="tayana_draft_2.frontend.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/jquery.ad-gallery.css">
    <style type="text/css">
        img, div, input {
            behavior: url("");
        }
    </style>
    <script type="text/javascript" src="Scripts/jquery.ad-gallery.js"></script>
    <script type="text/javascript">
        $(function () {

               var galleries = $('.ad-gallery').adGallery();
               galleries[0].settings.effect = 'fade';
               if ($('.banner input[type=hidden]').val() == "0") {
                   $(".bannermasks").hide();
                   $(".banner").hide();
                   $("#crumb").css("top", "125px");
               }


           });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--遮罩-->
      <%--  <div class="bannermasks">
            <img src="images/DEALERS.jpg" alt="&quot;&quot;" width="967" height="371" />
        </div>--%>
    <!--遮罩結束-->


    <!--------------------------------換圖開始---------------------------------------------------->

    <div class="banner">
        <ul>
            <li>
                <img src="images/newbanner.jpg" alt="Tayana Yachts" /></li>
        </ul>

    </div>
    <!--------------------------------換圖結束---------------------------------------------------->


    <div class="conbg">
        <!--------------------------------左邊選單開始---------------------------------------------------->
        <div class="left">
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
            <div class="left1">
              
                <p><span>YACHTS</span></p>
                <ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <li><a href="YachtOverview.aspx?id=<%#Eval("id") %>">
                        <asp:Literal ID="lrYachtName" runat="server" Text='<%#Eval("Newbuilding").ToString()=="0"?Eval("Name").ToString()+ " " +"(NewBuilding)" : Eval("Name") %>'></asp:Literal>
                    </a></li>
                </ItemTemplate>
                  
            <FooterTemplate>
                </ul>
            </div>

            </FooterTemplate>
            </asp:Repeater>

        </div>


      




        <!--------------------------------左邊選單結束---------------------------------------------------->

        <!--------------------------------右邊選單開始---------------------------------------------------->
        <div id="crumb"><a href="#">Home</a> >> <a href="#">Yachts</a> >> <a href="#"><span class="on1">Dynasty 72</span></a></div>
        <div class="right">
            <div class="right1">
                <div class="title">
                    <asp:Label ID="lbYachtName" runat="server" Text='<%#Eval("Name") %>'></asp:Label></div>

                <!--------------------------------內容開始---------------------------------------------------->

                <!--次選單-->
                <div class="menu_y">
                    <ul>
                        <li class="menu_y00">YACHTS</li>
                        <li><a class="menu_yli01" ID="aOverview" clientidmode="Static" runat="server">OVERVIEW</a></li>
                        <li><a class="menu_yli02" ID="aLayout" clientidmode="Static" runat="server">Layout & deck plan</a></li>
                        <li><a class="menu_yli03" ID="aSpecification" clientidmode="Static" runat="server">Specification</a></li>
                    </ul>
                </div>
                <!--次選單-->

                <div class="box1">
                    <asp:Literal ID="lrContent" runat="server"></asp:Literal>

                </div>

                <div class="box3">
                    <h4>PRINCIPAL DIMENSION</h4>
                    <asp:Literal ID="lrDimension" runat="server"></asp:Literal>


                </div>
                <p class="topbuttom">
                    <img src="images/top.gif" alt="top" /></p>

                <!--下載開始-->
                <div class="downloads">
                    <p>
                        <img src="images/downloads.gif" alt="&quot;&quot;" /></p>
                    <ul>
                        <li><a href="#">Downloads 001</a></li>
                        <li><a href="#">Downloads 001</a></li>
                        <li><a href="#">Downloads 001</a></li>
                        <li><a href="#">Downloads 001</a></li>
                        <li><a href="#">Downloads 001</a></li>

                    </ul>
                </div>
                <!--下載結束-->


                <!--------------------------------內容結束------------------------------------------------------>
            </div>
        </div>

        <!--------------------------------右邊選單結束---------------------------------------------------->
    </div>

</asp:Content>
