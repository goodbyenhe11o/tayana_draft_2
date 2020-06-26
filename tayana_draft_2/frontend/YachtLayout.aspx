<%@ Page Title="" Language="C#" MasterPageFile="~/frontend/front.Master" AutoEventWireup="true" CodeBehind="YachtLayout.aspx.cs" Inherits="tayana_draft_2.frontend.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--<script type="text/javascript">
     $(function () {

            // 先取得 #abgne-block-20110111 , 必要參數及輪播間隔
            var $block = $('#abgne-block-20110111'),
                timrt, speed = 4000;


            // 幫 #abgne-block-20110111 .title ul li 加上 hover() 事件
            var $li = $('.title ul li', $block).hover(function () {
                // 當滑鼠移上時加上 .over 樣式
                $(this).addClass('over').siblings('.over').removeClass('over');
            }, function () {
                // 當滑鼠移出時移除 .over 樣式
                $(this).removeClass('over');
            }).click(function () {
                // 當滑鼠點擊時, 顯示相對應的 div.info
                // 並加上 .on 樣式

                $(this).addClass('on').siblings('.on').removeClass('on');
                var thisLi = $('#abgne-block-20110111 .bd .banner ul:eq(0)').children().eq($(this).index());
                $('#abgne-block-20110111 .bd .banner ul:eq(0)').children().hide().eq($(this).index()).fadeIn(1000);
                if (thisLi.children('input[type=hidden]').val() == 1) {
                    thisLi.children('.new').show();
                }

            });

            // 幫 $block 加上 hover() 事件
            $block.hover(function () {
                // 當滑鼠移上時停止計時器
                clearTimeout(timer);
            }, function () {
                // 當滑鼠移出時啟動計時器
                timer = setTimeout(move, speed);
            });

            // 控制輪播
            function move() {
                var _index = $('.title ul li.on', $block).index();
                _index = (_index + 1) % $li.length;
                $li.eq(_index).click();

                timer = setTimeout(move, speed);
            }

            // 啟動計時器
            timer = setTimeout(move, speed);

            //相簿輪撥初始值設定
            $('.title ul li:eq(0)').addClass('on');
            var thisLi = $('#abgne-block-20110111 .bd .banner ul:eq(0) li:eq(0)');
            thisLi.addClass('on');
            if (thisLi.children('input[type=hidden]').val() == 1) {
                thisLi.children('.new').show();
         }
            </script>--%>
    
    <script type="text/javascript" src="Scripts/jquery.ad-gallery.js"></script>
    
    <script type="text/javascript">
        $(function() {
   
            var galleries = $('.ad-gallery').adGallery();
            galleries[0].settings.effect ='slide-hori';
    
    
    
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <!--遮罩-->
<div class="bannermasks"><img src="images/banner01_masks.png" alt="&quot;&quot;" /></div>
<!--遮罩結束-->

<div id="buttom01"><a href="#"><img src="images/buttom01.gif" alt="next" /></a></div>

<!--小圖開始-->
<div class="bannerimg">
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


</div>
<!--小圖結束-->


<div id="buttom02"> <a href="#"><img src="images/buttom02.gif" alt="next" /></a></div>



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
                            <asp:Literal ID="lrYachtName" runat="server" Text='<%#Eval("Newbuilding").ToString()=="1"?Eval("Name").ToString()+ " " +"(New Building)" : Eval("Name") %>'></asp:Literal>
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
            <div id="crumb"><a href="#">Home</a> >> <a href="#">Yachts</a> >> <a href="#"><span >
                <asp:Literal ID="lrCrumb" runat="server" Text='<%#Eval("YachtName") %>'></asp:Literal></span></a></div>
            <div class="right">
                <div class="right1">
                    <div class="title">
                        <asp:Label ID="lbYachtName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </div>

                    <!--------------------------------內容開始---------------------------------------------------->

                    <!--次選單-->
                    <div class="menu_y">
                        <ul>
                            <li class="menu_y00">YACHTS</li>
                            <li><a class="menu_yli01" ID="aOverview" clientidmode="Static" runat="server">Overview</a></li>
                            <li><a class="menu_yli02" ID="aLayout" clientidmode="Static" runat="server">Layout & deck plan</a></li>
                            <li><a class="menu_yli03" ID="aSpecification" clientidmode="Static" runat="server">Specification</a></li>
                        </ul>
                    </div>
                    <!--次選單-->
                    <div class="box6">
                        <p>Layout & deck plan</p>
                        <asp:Repeater ID="rpLayout" runat="server">
                            <HeaderTemplate>
                                <ul>
                            </HeaderTemplate>
                        <ItemTemplate>
                            <li style="width: 670px;">
                            <img src='../backend/<%#Eval("Img") %>' width="600px;"/></li>
                        </ItemTemplate>
                          <FooterTemplate>

                        </ul>
                          </FooterTemplate>
                    </asp:Repeater>
                    </div>

                <div class="clear"></div>




                    <!--------------------------------內容結束------------------------------------------------------>
                </div>
            </div>

            <!--------------------------------右邊選單結束---------------------------------------------------->
        </div>

    </asp:Content>


