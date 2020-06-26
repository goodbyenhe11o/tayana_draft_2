<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="NewsCreate.aspx.cs" Inherits="tayana_draft_2.backend.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nes-container is-rounded">
        <label>TITLE</label>
        <asp:TextBox ID="NewsTitle" runat="server" class="nes-input"></asp:TextBox><br />
        <label>SUMMARY</label>
        <asp:TextBox ID="NewsSummary" runat="server"  class="nes-input"></asp:TextBox><br />
        <label>PIN THE NEWS?</label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" >
            <asp:ListItem Text="Y" Value="1" Selected="True"></asp:ListItem><asp:ListItem Text="N" Value="0"></asp:ListItem>
        </asp:RadioButtonList>

        <span>CONTENT</span>
        <textarea class="ckeditor" id="ckcontent" runat="server" ></textarea><br />

        <label class="nes-btn"><span>
                SELECT YOUR FILE
        <asp:FileUpload ID="FileUpload1" runat="server"  class="nes-btn"/><br/>
        </span>
        </label>
        <asp:Button ID="btnSave" runat="server" Text="SUBMIT " OnClick="BtnSave_Click" class="nes-btn is-primary"/>
        <asp:Label ID="uploadMessage" runat="server" Text=""></asp:Label>
    </div>


</asp:Content>
