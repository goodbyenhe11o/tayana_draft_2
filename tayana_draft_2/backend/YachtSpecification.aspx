<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="YachtSpecification.aspx.cs" Inherits="tayana_draft_2.backend.WebForm13" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="nes-container is-rounded">
        
        <h4>DETAIL SPECIFICATION</h4>
        <asp:TextBox CssClass="ckeditor" ID="tbSpecification" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" OnClick="btnSubmit_OnClick"  class="nes-btn is-primary"/>
        <asp:Button ID="btnReturn" runat="server" Text="RETURN" OnClick="btnReturn_OnClick" class="nes-btn is-error"/>
    </div>

</asp:Content>
