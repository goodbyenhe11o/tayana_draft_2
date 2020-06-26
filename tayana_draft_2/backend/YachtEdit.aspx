<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="YachtEdit.aspx.cs" Inherits="tayana_draft_2.backend.WebForm10" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.ckeditor.com/4.14.0/standard-all/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('editor1', {
            width: '70%',
            height: 500
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nes-container is-rounded">
    <div>
        <label>Yacht Name</label>

        <asp:TextBox ID="TextBox1" runat="server" class="nes-input"></asp:TextBox><br/>
        <label>Is the yacht a Newbuilding?</label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Text="Y" Value="1" Selected="True"></asp:ListItem>
            <asp:ListItem Text="N" Value="0"></asp:ListItem>
        </asp:RadioButtonList>

        <label>Overview Content</label>
        <br />
        <asp:TextBox ID="ckcontent1" CssClass="ckeditor" runat="server" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox><br />
        <label>Overview Dimension</label>
        
        <asp:TextBox ID="ckcontent" CssClass="ckeditor" runat="server" TextMode="MultiLine" ClientIDMode="Static">
            <table class="table02">
                <tr>
                    <td class="table02td01">
                        <table>
                            <tr>
                                <th>L.O.A.</th>
                                <td>0000000</td>
                            </tr>
                            <tr class="tr003">
                                <th>L.W.L.</th>
                                <td>0000000</td>
                            </tr>
                            <tr>
                                <th>Beam</th>
                                <td>0000000</td>
                            </tr>
                            <tr class="tr003">
                                <th>Draft (Fin Keel)</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Displacement</th>
                                <td></td>
                            </tr>
                            <tr class="tr003">
                                <th>Ballast (Fin Keel)</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Sail Area (Main + 150% Triangle)<br />
                                    Main (9.0 oz)<br />
                                    Stays (9.0 oz)<br />
                                    No. 1 Genoa (7.2 oz)<br />
                                    Genoa (150%) (7.2 oz)<br />
                                    I :<br />
                                    J :<br />
                                    P :<br />
                                    E :</th>
                                <td></td>
                            </tr>
                            <tr class="tr003">
                                <th>D/L=191.47Ballast/Displacement</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Exterior Style, Interior Designer</th>
                                <td></td>
                            </tr>
                            <tr class="tr003">
                                <th>Naval Architect Designer</th>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        UPLOAD THE IMAGE HERE AND DELETE AFTER UPLOAD
                        <br>
                    </td>
                </tr>
            </table>
        </asp:TextBox><br />
      <%--  <script>
            CKEDITOR.replace('ckcontent', { height: 800, });
        </script>--%>
        <label class="nes-btn"><span>
                SELECT YOUR FILE
                <asp:FileUpload ID="FileUpload1" runat="server"  class="nes-btn"/><br/>
            </span>
        </label>
        <asp:Button ID="btnSave" runat="server" Text="SUBMIT" OnClick="btnSave_OnClick" class="nes-btn is-primary"/>
        <asp:Button ID="btnReturn" runat="server" Text="RETURN" OnClick="btnReturn_OnClick" class="nes-btn is-error"/>
    </div>
        </div>
</asp:Content>
