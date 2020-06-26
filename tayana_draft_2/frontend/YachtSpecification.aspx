<%@ Page Title="" Language="C#" MasterPageFile="~/frontend/front.Master" AutoEventWireup="true" CodeBehind="YachtSpecification.aspx.cs" Inherits="tayana_draft_2.frontend.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!--遮罩-->
<div class="bannermasks"><img src="images/banner01_masks.png" alt="&quot;&quot;" /></div>
<!--遮罩結束-->

<div class="banner">
<div id="gallery" class="ad-gallery">
      <div class="ad-image-wrapper">
      </div>
      <div class="ad-controls" style="display:none">
      </div>
      <div class="ad-nav">
        <div class="ad-thumbs">
          <ul class="ad-thumb-list">
            <li>
              <a href="images/test1.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>
            <li>
              <a href="images/test002.jpg">
                <img src="images/pit003.jpg">
              </a>
            </li>                        
          </ul>
        </div>
      </div>
    </div>
    </div>


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
                <div class="box5">
                    <h4>DETAIL SPECIFICATION</h4>
                    <asp:Literal ID="lrSpecification" runat="server" Text='<%#Eval("Specification") %>'></asp:Literal>


                </div>
                <!--------------------------------內容結束------------------------------------------------------>
            </div>
        </div>

        <!--------------------------------右邊選單結束---------------------------------------------------->
    </div>

</asp:Content>
