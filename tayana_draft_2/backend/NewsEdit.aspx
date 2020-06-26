<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="NewsEdit.aspx.cs" Inherits="tayana_draft_2.backend.WebForm8" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <span>Title</span>
        <asp:TextBox ID="title" runat="server"></asp:TextBox><br />
        <span>Summary</span>
        <asp:TextBox ID="summary" runat="server"></asp:TextBox><br />
        <label>PIN THE NEWS?</label>
        <asp:RadioButtonList ID="RadioButtonList2" runat="server">
            <asp:ListItem Text="Y" Value="1" Selected="True"></asp:ListItem>
            <asp:ListItem Text="N" Value="0"></asp:ListItem>
        </asp:RadioButtonList>
        <span>Content</span><br />
        <asp:TextBox ID="ckcontent" runat="server" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox><br />
        <script>
            CKEDITOR.replace('ckcontent', { height: 800, });
        </script>
        <span>IMAGE UPLOAD</span>
        <asp:FileUpload ID="FileUpload1" runat="server" /><br/>


        <asp:Button ID="BtnSave" runat="server" Text="SUBMIT" OnClick="BtnSave_OnClick" />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnReturn" runat="server" Text="RETURN" OnClick="btnReturn_OnClick"/>
    </div>

</asp:Content>
