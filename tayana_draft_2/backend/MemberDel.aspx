<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="MemberDel.aspx.cs" Inherits="tayana_draft_2.backend.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gvStyle {
            border: 2px solid #CCC;
        }
        /*Header 標題*/
        .gvStyle th
        {
            background-color: #E2EAF2;
            font-weight: lighter;
            border: 1px solid #ccc;
            height:25px;
            text-align:center;
        }
        /*OnMouseOver 滑鼠移過列表時, 背景色變更*/
        .gvStyle tr:hover
        {
            background-color:#FFF4DA;
        }
        /*Rows 列表顏色*/
        .gvStyle td
        {
            border: 1px solid #ccc;
            height:25px;
            text-align:center;
        }
        /*Change Rows 如果想要有單、雙列不同顏色替換, 在這裡更換*/
        .gvStyle .alt
        {
            background-color:#efefef;
            border: 1px solid #ccc;
            height:25px;
        }
        /*Page 分頁顏色*/
        .gvStyle .pgr table
        {
            margin-left:auto;
            margin-right:auto;
        }
        .gvStyle .pgr td
        {
            background-color:#E2EAF2;
            border-width: 0px;
            padding:0px 3px 0px 3px;
        }
        .gvStyle .pgr a
        {
            color: #666; text-decoration:underline;
            padding:0px 3px 0px 3px;
        }
        .gvStyle .pgr a:hover
        {
            color: #FF0000; text-decoration: none;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div style="margin-top: 50px; margin-left: -40px;">
                <div style="margin-left: 50px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_OnRowDeleting" style="width: 1000px;" CssClass="gvStyle">
                    <Columns>
       
                        <asp:BoundField DataField="FName" HeaderText="FIRST NAME" SortExpression="FName" />
                        <asp:BoundField DataField="SName" HeaderText="SURNAME" SortExpression="SName" />
                        <asp:TemplateField HeaderText="USER IMAGE">
                            <ItemTemplate>  
                                <asp:Image ID="thumbNail" runat="server" ImageUrl='<%#"/backend/Images/"+Eval("Uimg") %>' Width="109px"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="isAdmin" HeaderText="isAdmin" SortExpression="isAdmin" />

                        <asp:TemplateField HeaderText="UPDATE">
                            <ItemTemplate>  
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"MemberEdit.aspx?id="+Eval("id") %>' Text="UPDATE" class="nes-btn is-primary"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DELETE">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Delete" Text="DELETE"  class="nes-btn is-error"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                </div>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tayanaConnectionString %>" SelectCommand="SELECT * FROM [TayanaUserTable]"></asp:SqlDataSource>
                


        </div>
</asp:Content>
