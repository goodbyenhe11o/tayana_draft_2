<%@ Page Title="" Language="C#" MasterPageFile="~/frontend/front.Master" AutoEventWireup="true" CodeBehind="Certificat.aspx.cs" Inherits="tayana_draft_2.frontend.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--遮罩-->
    <div class="bannermasks" style="display: none;">
        <img src="images/company.jpg" alt="&quot;&quot;" width="967" height="371" />
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

    <div class="banner" style="height: 371px;">
        <ul>
            <li>
                <img src="images/Company.jpg" alt="Tayana Yachts" /></li>
        </ul>

    </div>
    <!--------------------------------換圖結束---------------------------------------------------->




    <div class="conbg">
        <!--------------------------------左邊選單開始---------------------------------------------------->
        <div class="left">

            <div class="left1">
                <p><span>COMPANY </span></p>
                <ul>
                    <li><a href="Company.aspx">About Us</a></li>
                    <li><a href="Certificat.aspx">Certificat</a></li>
                </ul>
            </div>
        </div>

        <!--------------------------------左邊選單結束---------------------------------------------------->

        <!--------------------------------右邊選單開始---------------------------------------------------->
        <div id="crumb"><a href="index.aspx">Home</a> >> <a href="Company.aspx">Company</a> >><a href="Certificat.aspx"><span class="on1">Certificat</span></a></div>
        <div class="right">
            <div class="right1">
                <div class="title"><span>Certificat</span></div>

                <!--------------------------------內容開始---------------------------------------------------->
                <div class="box3">
                    <p style="padding-bottom: 20px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.</p>
                    <div style="display: flex; flex-direction: row-reverse; justify-content: space-between; margin-bottom: 10px;" >
                        <p style="border: 1px solid #CCCCCC; padding: 5px;"><img src="images/certificat001.jpg" /></p>
                        <p style="border: 1px solid #CCCCCC; padding: 5px;"><img src="images/certificat002.jpg" /></p>
                        <p style="border: 1px solid #CCCCCC; padding: 5px;"><img src="images/certificat003.jpg" /></p>
                    </div>
                    <div style="display: flex; flex-direction: row-reverse; justify-content: space-between; margin-bottom: 10px;">
                        <p style="border: 1px solid #CCCCCC; padding: 5px;"><img src="images/certificat004.jpg" /></p>
                        <p style="border: 1px solid #CCCCCC; padding: 5px;"><img src="images/certificat005.jpg" /></p>
                        <p style="border: 1px solid #CCCCCC; padding: 5px;"><img src="images/certificat006.jpg" /></p>
                    </div>
                    <div style="display: flex; flex-direction: row-reverse; justify-content: space-between; margin-bottom: 10px;">
                        <p style="border: 1px solid #CCCCCC; padding: 5px;"><img src="images/certificat007.jpg" /></p>
                        <p style="border: 1px solid #CCCCCC; padding: 5px;"><img src="images/certificat008.jpg" /></p>
                    </div>



                    <!--------------------------------內容結束------------------------------------------------------>
                </div>
            </div>

            <!--------------------------------右邊選單結束---------------------------------------------------->
        </div>
</asp:Content>
