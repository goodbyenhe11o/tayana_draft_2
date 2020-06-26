<%@ Page Title="" Language="C#" MasterPageFile="~/backend/SiteNew.Master" AutoEventWireup="true" CodeBehind="WebForm15.aspx.cs" Inherits="tayana_draft_2.backend.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="nes-container is-rounded content-wrapper">


        <div class="left-part">
            <div class="nes-container is-rounded">
                <p style="font-size: 20px; text-decoration: underline">CHANGE YOUR PROFILE PICTURE</p>
                <label class="nes-btn">
                  <%--  <span>SELECT YOUR FILE</span><asp:FileUpload ID="FileUpload1" runat="server" ondatabinding="update_img" />--%>
                </label>
                <asp:Button ID="Button1" runat="server" Text="UPLOAD AND UPDATE" class="nes-btn is-success" />

                <asp:Label ID="uploadMessage" runat="server" Text=""></asp:Label>
            </div>



            <div class="nes-container is-rounded">
                <p style="font-size: 20px; text-decoration: underline">UPDATE YOUR PASSWORD</p>
                <label>ENTER NEW PASSWORD</label>
                <asp:TextBox ID="txtPassword" runat="server" class="nes-input"></asp:TextBox>
                <label>RE-ENTER NEW PASSWORD</label>
                <asp:TextBox ID="txtCpassword" runat="server" class="nes-input"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCpassword" ControlToCompare="txtPassword" Operator="Equal" ErrorMessage="PASSWORDS DO NOT TALLY" ForeColor="Red"></asp:CompareValidator>
                <asp:Button ID="Button2" runat="server" Text="CONFIRM UPDATE" class="nes-btn is-success" />
                <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
            </div>

        </div>

        <div class="nes-container is-rounded right-part">
        <p style="font-size: 20px; text-decoration: underline ">UPDATE YOUR USER DETAILS</p>
            <label>INPUT YOUR FIRST NAME</label>
            <asp:TextBox ID="txtFname" runat="server" class="nes-input"></asp:TextBox>
            <label>INPUT YOUR SURNAME</label>
            <asp:TextBox ID="txtSname" runat="server" class="nes-input"></asp:TextBox>
             
            <label>INPUT YOUR NEW EMAIL ADDRESS </label>
            <asp:TextBox ID="txtEmail" runat="server" type="email" class="nes-input"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="UPDATE DETAILS" class="nes-btn is-success" />
        </div>
         
     </div>
    

</asp:Content>
