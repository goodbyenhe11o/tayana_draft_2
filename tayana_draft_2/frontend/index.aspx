<%@ Page Title="" Language="C#" MasterPageFile="~/frontend/front.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="tayana_draft_2.frontend.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--遮罩-->
    <!--遮罩-->
    <div class="bannermasks">
        <img src="images/banner00_masks.png" alt="&quot;&quot;" />
    </div>
    <!--遮罩結束-->







            
    <!--------------------------------換圖開始---------------------------------------------------->
    <div id="abgne-block-20110111">

        <div class="bd">

            <div class="banner">
                <asp:Repeater ID="rpLargeImg" runat="server">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="info">
                            <%--<div class="new" style='<%# Eval("newbuilding").ToString() == "1" ? "display:none": "" %>'/>--%>
                            <a href="#">
                             
                            <img src='<%#"/backend/"+Eval("Img") %>' />
                                
                            </a><!--文字開始--><div class="wordtitle">TAYANA
                                
                                <asp:Literal ID="lrYachtName" runat="server" Text='<%#Eval("YachtName") %>'></asp:Literal>
                                <span>
                                    <asp:Literal ID="lrYachtID" runat="server" Text='<%#Eval("Yid") %>'></asp:Literal></span>
                                <p>SPECIFICATION SHEET</p>
                                <%--</div>--%>
                            </div>

                            <!--文字結束-->
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
                <!--小圖開始-->
                <div class="bannerimg title">
                    <asp:Repeater ID="rpSmallImg" runat="server">
                        <HeaderTemplate>
                    <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                        <li>
                            <div>
                                
                                <p class="bannerimg_p" >
                                    <img src='<%#"/backend/"+Eval("Img") %>' alt="&quot;&quot;" style="width: 151px; height: 58px;"/>
                                </p>
                            </div>
                        </li>
                        </ItemTemplate>
                      <FooterTemplate>
                    </ul>
                      </FooterTemplate>
                    </asp:Repeater>
                </div>
                
             
                <!--小圖結束-->
            </div>
        </div>
    </div>
    <!--------------------------------換圖結束---------------------------------------------------->


    <!--------------------------------最新消息---------------------------------------------------->
    <div class="news">
        <div class="newstitle">
            <p class="newstitlep1">
                <img src="images/news.gif" alt="news" />
            </p>
            <p class="newstitlep2"><a href="#">More>></a></p>
        </div>

        <asp:Repeater ID="rpTopNews" runat="server">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>

                <!--TOP第一則最新消息-->
                <li>


                    <div class="news01">
                        <div class="newstop">
                            <img src="images/new_top01.png" alt="&quot;&quot;" />
                        </div>
                        <div class="news02p1">
                            <p class="news02p1img">
                                <img src='<%#"/backend/allFiles/"+Eval("img") %>' alt="&quot;&quot;" />
                            </p>
                        </div>
                        <p class="news02p2">
                            <asp:Label ID="lbInitdate" runat="server" Text='<%#Eval("initdate") %>'></asp:Label>
                            <a href="News.aspx?id=<%#Eval("title") %>">
                                <asp:Literal ID="lrTitle" runat="server" Text='<%#Eval("title") %>'></asp:Literal>
                            </a>
                        </p>
                    </div>
                </li>
            </ItemTemplate>


            <%--<!--TOP第一則最新消息結束-->

            <!--第二則-->
            <li>
                <div class="news02">
                    <div class="news02p1">
                        <p class="news02p1img">
                            <img src="images/pit001.jpg" alt="&quot;&quot;" />
                        </p>
                    </div>
                    <p class="news02p2">
                        <span>Tayana 58 CE Certifica..</span>
                        <a href="#">For Tayana 58 entering the EU, CE Certificates are AVAILABLE to ensure conformity to all applicable European ...</a>
                    </p>
                </div>
            </li>
            <!--第二則結束-->

            <li>
                <div class="news02">
                    <div class="news02p1">
                        <p class="news02p1img">
                            <img src="images/pit001.jpg" alt="&quot;&quot;" />
                        </p>
                    </div>
                    <p class="news02p2">
                        <span>Big Cruiser in a Small ..</span>
                        <a href="#">Tayana 37 is our classical product and full of skilful craftsmanship. We only plan to build TWO units in a year.</a>
                    </p>
                </div>
            </li>--%>
            <FooterTemplate>
                </ul>
            </FooterTemplate>

        </asp:Repeater>
    </div>

    <!--------------------------------最新消息結束---------------------------------------------------->

</asp:Content>
