<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="DealerCreate.aspx.cs" Inherits="tayana_draft_2.backend.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nes-container is-rounded">
    <div style="display: flex; flex-direction: column;">
        <label>CONTINENT</label>
            
        
        <asp:DropDownList id="continent" runat="server">
            <asp:ListItem Value="0">--SELECT THE CONTINENT--</asp:ListItem>
            <asp:ListItem Value="1">USA</asp:ListItem>
            <asp:ListItem Value="2">ASIA</asp:ListItem>
            <asp:ListItem Value="3">EUROPE</asp:ListItem>
            <asp:ListItem Value="4">NORTH AMERICA</asp:ListItem>
            <asp:ListItem Value="5">CENTRAL AMERICA</asp:ListItem>
            <asp:ListItem Value="6">SOUTH AMERICA</asp:ListItem>
            <asp:ListItem Value="7">AFRICA</asp:ListItem>
            <asp:ListItem Value="8">OCEANIA</asp:ListItem>
        </asp:DropDownList>
        <label>DEALER </label>
        <asp:TextBox ID="DealerName" runat="server" class="nes-input"></asp:TextBox>
       
        <label>DEALER DETAILS</label>
        <asp:TextBox ID="ckcontent" runat="server" TextMode="MultiLine" ClientIDMode="Static" ></asp:TextBox>
        <script>
            CKEDITOR.replace('ckcontent',
                {
                    height: 500,
                    width: 800

                });
        </script>

        <div style="display: flex;">
        <label class="nes-btn" style="margin-right: 20px;"><span>
                SELECT YOUR FILE
                <asp:FileUpload ID="FileUpload1" runat="server"  class="nes-btn"/><br/>
            </span>
        </label>

        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSave_Click"  class="nes-btn is-primary"/>
        </div>
    </div>
    </div>


</asp:Content>
