<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="tayana_draft_2.backend.Login" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/Login.css"/>
    <link href="https://unpkg.com/nes.css@2.3.0/css/nes.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Press+Start+2P" rel="stylesheet"/>
    <link href="css/Login.css" rel="stylesheet"/>

    <title></title>
</head>
<body>
    <form id="form1" runat="server" class="nes-container is-rounded is-dark">
        <div class="nes-balloon from-left">LOGIN</div>
        <div class="nes-container with-title is-centered">
            <label class="">USERNAME <span>*</span></label>
            <asp:TextBox ID="username" runat="server" class="nes-textarea" required></asp:TextBox><br />

            <label>PASSWORD <span>*</span></label>
            <asp:TextBox ID="password" runat="server" class="nes-textarea" TextMode="Password" required></asp:TextBox><br />
            <%--<asp:HyperLink ID="HyperLink1" runat="server">FORGOT PASSWORD</asp:HyperLink>--%>
        </div>
        <div class="button">
            <asp:Button ID="btnSubmit" runat="server" Text="LOGIN" OnClick="btnSubmit_OnClick" class="nes-btn is-primary"/>
            <%--<asp:Button ID="Button2" runat="server" Text="REGISTER" class="nes-btn is-success" OnClick="Button2_Click"/>--%>
            <%--<a href="registration.aspx" class="nes-btn is-success">REGISTER</a>--%> 
            <%-- set above to dashboard --%>
            <input type="reset"  id="Reset1" class="nes-btn is-warning" value="RESET">
            
        </div>
    
        
        <asp:Label ID="lblErrorMessage" runat="server" Text="Incorrect User Credentials"></asp:Label>
    </form>
</body>
</html>
