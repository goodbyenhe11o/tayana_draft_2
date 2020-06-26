<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ckeditor_test.aspx.cs" Inherits="tayana_draft_2.Ckeditor_test" ValidateRequest="false" %>
<%@ Register Assembly="CKFinder" Namespace="CKFinder" TagPrefix="CKFinder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
  
    <script src="Scripts/ckeditor/ckeditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span>TITLE</span>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
            <span>CONTENT</span>
            <textarea class="ckeditor" id="ckcontent" runat="server"></textarea><br/>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <span>IMAGE UPLOAD</span><asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSave_Click" />

        </div>
    </form>
</body>
</html>
