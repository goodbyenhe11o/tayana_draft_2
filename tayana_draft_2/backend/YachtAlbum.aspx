<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="YachtAlbum.aspx.cs" Inherits="tayana_draft_2.backend.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div  class="nes-container is-rounded">
        <div class="card">
        <div class="nes-container is-rounded">

        <h3>YACHT ALBUM</h3>
            <br>
            <label class="nes-btn"><span>
                    SELECT YOUR FILE
    <asp:FileUpload ID="yachtLayout" runat="server" AllowMultiple="True"  class="nes-btn"></asp:FileUpload>
            <br>
                </span>
            </label>
            <asp:Label ID="lbPictureForm" runat="server" Text="UPLOAD .jpg or .png ONLY" Font-Bold="True"></asp:Label>
            <asp:Label ID="lbPictureResult" runat="server"></asp:Label>
            <br>
            <br>
            <asp:Button runat="server" ID="btnSubmit" Text="IMAGE UPLOAD" OnClick="btnSubmit_OnClick" class="nes-btn is-primary"/>
            <asp:Button ID="btnReturn" runat="server" Text="RETURN" OnClick="btnReturn_OnClick"  class="nes-btn is-error"/>
            </div>
            </div>
        
        
       
        <div  class="nes-container is-rounded">

        <asp:Repeater ID="rpLayout" runat="server" OnItemCommand="rpLayout_OnItemCommand">
            
            

                        <HeaderTemplate>
                            <div class="table-responsive">
                                <asp:Button ID="btnDelete"  runat="server" Text="Delete" CommandName="delCmd" OnClientClick="javascript:if(!window.confirm('CONFIRM TO DELETE?')) window.event.returnValue = false;"  class="nes-btn is-warning"/>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>SELECT</th>
                                            <th>YACHTS</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>

                            <tr>
                                <td>
                                    <asp:CheckBox ID="cb" runat="server" />
                                    <asp:HiddenField ID="HiddenField1" Value='<%# Eval("id") %>' runat="server"   />
                                </td>
                                <td>

                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Img") %>' Width="150px" Height="150px" />
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </tbody></table></div>
                        </FooterTemplate>

        </asp:Repeater>
        
        
            </div>
        </div>
        </div>
            
   
</asp:Content>
