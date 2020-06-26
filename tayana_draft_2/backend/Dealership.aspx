<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="Dealership.aspx.cs" Inherits="tayana_draft_2.backend.WebForm6" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        .gvStyle {
            border: 2px solid #CCC;
        }
        /*Header 標題*/
        .gvStyle th
        {
            background-color: #E2EAF2;
            font-weight: lighter;
            border: 1px solid #ccc;
            height:25px;
            text-align:center;
        }
        /*OnMouseOver 滑鼠移過列表時, 背景色變更*/
        .gvStyle tr:hover
        {
            background-color:#FFF4DA;
        }
        /*Rows 列表顏色*/
        .gvStyle td
        {
            border: 1px solid #ccc;
            height:25px;
            text-align:center;
        }
        /*Change Rows 如果想要有單、雙列不同顏色替換, 在這裡更換*/
        .gvStyle .alt
        {
            background-color:#efefef;
            border: 1px solid #ccc;
            height:25px;
        }
        /*Page 分頁顏色*/
        .gvStyle .pgr table
        {
            margin-left:auto;
            margin-right:auto;
        }
        .gvStyle .pgr td
        {
            background-color:#E2EAF2;
            border-width: 0px;
            padding:0px 3px 0px 3px;
        }
        .gvStyle .pgr a
        {
            color: #666; text-decoration:underline;
            padding:0px 3px 0px 3px;
        }
        .gvStyle .pgr a:hover
        {
            color: #FF0000; text-decoration: none;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nes-container with-title is-centered" style="display: flex;">
        <div>
            <div class="nes-container with-title is-centered">
                <span>SEARCH NEWS WITH KEYWORD</span>
                <asp:TextBox ID="tbSearch" runat="server" class="nes-input is-success" style="margin-bottom: 20px;"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="SEARCH" OnClick="btnSearch_OnClick" class="nes-btn is-primary"/>
            </div>
            <div class=nes-container with-title is-centered">
                <span>SEARCH NEWS WITH TIME</span><br/>
                <asp:TextBox ID="tbStart" runat="server" TextMode="Date" class="nes-input is-success"></asp:TextBox>
                <asp:TextBox ID="tbEnd" runat="server" textmode="Date" class="nes-input is-success" style="margin-bottom: 20px;"></asp:TextBox>
                <asp:Button ID="btnSearchTime" runat="server" Text="SEARCH" OnClick="btnSearchTime_OnClick" class="nes-btn is-primary"/>
            </div>
        </div>
        <input id="resetReturn" type="reset" value="RESET SEARCH"  class="nes-btn is-error"/>
    </div>

    
    <asp:GridView ID="GridView2" runat="server" style="width: 1000px;">

    </asp:GridView>

    <div class="nes-container is-rounded" style="text-align: center;">
        <asp:Button ID="btnCreate" runat="server" class="nes-btn is-primary"  Text="CREATE DEALER" OnClick="btnCreate_OnClick"/>
                  
    </div>
    
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_OnRowDeleting" CssClass="gvStyle">
            <Columns>
            
                <asp:BoundField DataField="DealerName" HeaderText="DealerName" SortExpression="DealerName" />
                <asp:BoundField DataField="Continent" HeaderText="Continent" SortExpression="Continent" />
                <asp:TemplateField HeaderText="THUMBNAIL IMAGE">
                    <ItemTemplate>
                        <asp:Image ID="thumbNail" runat="server" ImageUrl='<%#"/backend/allFiles/"+Eval("Img") %>' Width="109px"  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DEALER DETAILS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"DealerEdit.aspx?id="+Eval("id") %>' Text="EDIT"  class="nes-btn is-primary"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DELETE DEALER">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="DELETE" Text="DELETE" class="nes-btn is-error"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tayanaConnectionString %>" SelectCommand="SELECT * FROM [Dealership]"></asp:SqlDataSource>
       
    </div>

</asp:Content>
