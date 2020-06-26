<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="DealerEdit.aspx.cs" Inherits="tayana_draft_2.backend.WebForm9" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <span>DEALER NAME</span>
        <asp:TextBox ID="txtDealerName" runat="server"></asp:TextBox><br/>
        <span>DEALER DETAILS</span>
        <asp:TextBox ID="ckcontent" runat="server" TextMode="MultiLine" ClientIDMode="Static" ></asp:TextBox>
        <script>
            CKEDITOR.replace('ckcontent', { height: 800, });
        </script>
        <span>IMAGE UPLOAD</span>
        <asp:FileUpload ID="FileUpload1" runat="server" /><br/>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="btnSave" runat="server" Text="SUBMIT" OnClick="btnSave_OnClick"/>

          

    </div>

</asp:Content>
