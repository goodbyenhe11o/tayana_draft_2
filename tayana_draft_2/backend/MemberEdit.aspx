<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="MemberEdit.aspx.cs" Inherits="tayana_draft_2.backend.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   <div class="nes-container is-rounded content-wrapper">


        <div class="left-part">
            <div class="nes-container is-rounded">
                <p style="font-size: 20px; text-decoration: underline">CHANGE PROFILE PICTURE</p>
                <label class="nes-btn">
                    <span>SELECT YOUR FILE</span><asp:FileUpload ID="FileUpload1" runat="server"/>
                </label>
                <asp:Button ID="btnUpload" runat="server" Text="UPLOAD AND UPDATE" class="nes-btn is-success"  OnClick="btnUpload_OnClick" />

                <asp:Label ID="uploadMessage" runat="server" Text=""></asp:Label>
            </div>



            <div class="nes-container is-rounded">
                <p style="font-size: 20px; text-decoration: underline">UPDATE PASSWORD</p>
                <label>ENTER NEW PASSWORD</label>
                <asp:TextBox ID="txtPassword" runat="server" class="nes-input" Text='<%#Eval("Password")%>'></asp:TextBox>
                <label>RE-ENTER NEW PASSWORD</label>
                <asp:TextBox ID="txtCpassword" runat="server" class="nes-input" Text='<%#Eval("CPassword")%>'></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCpassword" ControlToCompare="txtPassword" Operator="Equal" ErrorMessage="PASSWORDS DO NOT TALLY" ForeColor="Red"></asp:CompareValidator>
                <asp:Button ID="btnConfirmUpload" runat="server" Text="CONFIRM UPDATE" class="nes-btn is-success" style="margin-left: -200px; margin-top: 20px;"  OnClick="btnConfirmUpload_OnClick"/>
                <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
            </div>

        </div>

        <div class="nes-container is-rounded right-part">
        <p style="font-size: 20px; text-decoration: underline ">UPDATE USER DETAILS</p>
            <label>INPUT YOUR FIRST NAME</label>
            <asp:TextBox ID="txtFname" runat="server" class="nes-input" Text='<%#Eval("FName")%>'></asp:TextBox>
            <label>INPUT YOUR SURNAME</label>
            <asp:TextBox ID="txtSname" runat="server" class="nes-input" Text='<%#Eval("SName")%>'></asp:TextBox>
             
            <label>INPUT YOUR NEW EMAIL ADDRESS </label>
            <asp:TextBox ID="txtEmail" runat="server" type="email" class="nes-input" Text='<%#Eval("Email")%>'></asp:TextBox>
            <asp:Button ID="btnUpdateDetails" runat="server" Text="UPDATE DETAILS" class="nes-btn is-success"  style="margin-left: 180px; margin-top: 20px;" OnClick="btnUpdateDetails_OnClick"/>
        </div>

      </div>

</asp:Content>
