<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="YachtInfo.aspx.cs" Inherits="tayana_draft_2.backend.WebForm2" %>
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
    <div class="nes-container is-rounded" style="text-align: center;">
    <asp:Button ID="Button1" runat="server" Text="CREATE NEW YACHT" OnClick="Button1_OnClick" class="nes-btn is-primary"/>
    </div>
    <div>
    <div class="nes-container is-rounded" style="text-align: center;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_OnRowDeleting" CssClass="gvStyle">
                     
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Yacht Name" SortExpression="Name" />
                <asp:BoundField DataField="Newbuilding" HeaderText="New building" SortExpression="Newbuilding" />
                <asp:TemplateField HeaderText="OVERVIEW">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"YachtEdit.aspx?id="+Eval("id") %>' Text="EDIT" class="nes-btn is-primary"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SPECIFICATION">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#"YachtSpecification.aspx?id="+Eval("id") %>' Text="EDIT" class="nes-btn is-success"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderText="DELETE YACHT">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Delete" Text="DELETE" class="nes-btn is-error"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="YACHT LAYOUT" >
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#"YachtLayout.aspx?id="+Eval("id") %>' Text="EDIT" class="nes-btn is-warning"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="YACHT  ALBUM">
                    <ItemTemplate>
                        <asp:HyperLink ID="DeleteYacht" runat="server" NavigateUrl='<%#"YachtAlbum.aspx?id="+Eval("id") %>' Text="EDIT" class="nes-btn is-primary"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tayanaConnectionString %>" SelectCommand="SELECT * FROM [YachtInfo]"></asp:SqlDataSource>
     
    </div>
        </div>

</asp:Content>
