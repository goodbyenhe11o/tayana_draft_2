<%@ Page Title="" Language="C#" MasterPageFile="~/frontend/front.Master" AutoEventWireup="true" CodeBehind="Dealers.aspx.cs" Inherits="tayana_draft_2.frontend.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--遮罩-->
    <div class="bannermasks" style="display: none;">
        <img src="images/DEALERS.jpg" alt="&quot;&quot;" width="967" height="371" />
    </div>
    <!--遮罩結束-->

    <!--<div id="buttom01"><a href="#"><img src="images/buttom01.gif" alt="next" /></a></div>-->

    <!--小圖開始-->
    <!--<div class="bannerimg">
<ul>
<li> <a href="#"><div class="on"><p class="bannerimg_p"><img  src="images/pit003.jpg" alt="&quot;&quot;" /></p></div></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" width="300" /></p>
</a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
</ul>

<ul>
<li> <a class="on" href="#"><p class="bannerimg_p"><img  src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <p class="bannerimg_p"><a href="#"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
</ul>


</div>-->
    <!--小圖結束-->


    <!--<div id="buttom02"> <a href="#"><img src="images/buttom02.gif" alt="next" /></a></div>-->

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

            <div class="left1">
                <p><span>DEALERS</span></p>
                <ul>
                    <li><a href="Dealers.aspx?id=1">USA</a></li>
                    <li><a href="Dealers.aspx?id=2">ASIA</a></li>
                    <li><a href="Dealers.aspx?id=3">EUROPE</a></li>
                    <li><a href="Dealers.aspx?id=4">NORTH AMERICA</a></li>
                    <li><a href="Dealers.aspx?id=4">CENTRAL</a></li>
                    <li><a href="Dealers.aspx?id=5">SOUTH AMERICA</a></li>
                    <li><a href="Dealers.aspx?id=6">AFRICA</a></li>
                    <li><a href="Dealers.aspx?id=7">OCEANIA</a></li>
                </ul>
            </div>
        </div>

        <!--------------------------------左邊選單結束---------------------------------------------------->

        <!--------------------------------右邊選單開始---------------------------------------------------->
        <div id="crumb"><a href="#">Home</a> >> <a href="#">Dealers </a>>> <a href="#"><span class="on1">
            <asp:Literal ID="lrCrumb" runat="server" Text=""></asp:Literal></span></a></div>
        <div class="right">
            <div class="right1">
                <div class="title"><span>
                    <asp:Literal ID="lrCrumbContinent" runat="server" Text=""></asp:Literal></span></div>

                <!--------------------------------內容開始---------------------------------------------------->
                <div class="box2_list">
                    <asp:Repeater ID="rpDealers" runat="server">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <div class="list02">
                                    <ul>
                                        <li class="list02li">
                                            <div>
                                                <p>
                                                    <img src='<%#"/backend/allFiles/"+Eval("Img") %>' height="209px" width="209px" />
                                                </p>
                                            </div>
                                        </li>
                                        <li>
                                            <asp:Label ID="lbDealerName" runat="server" Text='<%#Eval("DealerName") %>'></asp:Label><br />
                                            <asp:Literal ID="lrDcontent" runat="server" Text='<%#Eval("Dcontent") %>'></asp:Literal>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div class="pagenumber">| <span>1</span> | <a href="#">2</a> | <a href="#">3</a> | <a href="#">4</a> | <a href="#">5</a> |  <a href="#">Next</a>  <a href="#">LastPage</a></div>
                    <div class="pagenumber1">Items：<span>89</span>  |  Pages：<span>1/9</span></div>
                </div>
                <!--------------------------------內容結束------------------------------------------------------>
            </div>
        </div>
        <!--------------------------------右邊選單結束---------------------------------------------------->
    </div>

</asp:Content>
