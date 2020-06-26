<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="Rego.aspx.cs" Inherits="tayana_draft_2.backend.WebForm4" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rego-wrapper">
        <div class="nes-container with-title is-centered" style="margin-left: 50px; margin-top: 20px;">
            <p class="title" style="background-color: #dff7e5">REGISTRATION</p>
            <label>FIRST NAME</label>
            <asp:TextBox ID="txtFname" runat="server" class="nes-input" style="margin-bottom: 20px; " required ></asp:TextBox>
            <label>SURNAME</label>
            <asp:TextBox ID="txtSname" runat="server" class="nes-input" style="margin-bottom: 20px; " required></asp:TextBox>
            <label>EMAIL</label>
            <asp:TextBox ID="txtEmail" runat="server" type="email" class="nes-input" style="margin-bottom: 20px; " required></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Incorrect Email Format"></asp:RegularExpressionValidator>
            </br>
            <label>USERNAME <span>*</span></label>
            <asp:TextBox ID="txtUsername" runat="server" class="nes-input" style="margin-bottom: 20px; " required></asp:TextBox>
            <label>PASSWORD <span>*</span></label>
            <asp:TextBox ID="txtPassword" runat="server" type="password" class="nes-input" style="margin-bottom: 20px; " required></asp:TextBox>
            <label>CONFIRM PASSWORD <span>*</span></label>
            <asp:TextBox ID="txtCpassword" runat="server" type="password" class="nes-input" style="margin-bottom: 20px; " required></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCpassword" ControlToCompare="txtPassword" ErrorMessage="PASSWORD DO NOT TALLY"></asp:CompareValidator>

            <asp:Label ID="lblErrorMessage" runat="server" Text="CONFIRM PASSWORD"></asp:Label>
            <%--<label class="nes-btn is-error">--%>

            <%--<span>UPLOAD PROFILE PICTURE</span><asp:FileUpload ID="FileUpload1" runat="server" class="nes-btn is-error" Style="width: 100%" /></label>--%>
            
            <div class="nes-container is-rounded" style="margin-bottom: 20px;">
                <p>SHARE ACCESS TO</p>

                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                        <asp:ListItem Value="01" style="padding-right: 10px;">PROFILE</asp:ListItem>
                        <asp:ListItem Value="02" style="padding-right: 10px;">NEWS</asp:ListItem>
                        <asp:ListItem Value="03" style="padding-right: 10px;">USERS</asp:ListItem>
                        <asp:ListItem Value="04" style="padding-right: 10px;">DEALERS</asp:ListItem>
                        <asp:ListItem Value="05" style="padding-right: 10px;">YACHTS</asp:ListItem>
                        
              <%--      <li><asp:CheckBox ID="CheckBox1" runat="server" Text="PROFILE" Value="01"/></li>
                    <li><asp:CheckBox ID="CheckBox2" runat="server" Text="ALL USERS" Value="02"/></li>
                    <li><asp:CheckBox ID="CheckBox3" runat="server" Text="MEDIA" Value="03"/></li>
                    <li><asp:CheckBox ID="CheckBox4" runat="server" Text="POST" Value="04"/></li>--%>
                    </asp:CheckBoxList>
                
            </div>



            <div class="rego-btn">

                <asp:Button ID="Button2" runat="server" Text="SUBMIT" class="nes-btn is-primary" OnClick="RegoSubmit" />
                <input type="reset" id="Reset1" class="nes-btn is-warning" value="CANCEL">
                <asp:Button ID="Button1" runat="server" Text="RETURN" OnClick="Button1_OnClick"  class="nes-btn is-success"/>
            </div>
            <asp:Label ID="lblErrorMessage1" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
