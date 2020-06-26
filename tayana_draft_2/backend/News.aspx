<%@ Page Title="" Language="C#" MasterPageFile="~/backend/back.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="tayana_draft_2.backend.WebForm3" validateRequest="false" %>
<%@ Register Assembly="CKFinder" Namespace="CKFinder" TagPrefix="CKFinder" %>

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
    
    <div class="nes-container with-title is-centered" style="display: flex;">
        <div>
    <div class="nes-container with-title is-centered">
            <span>SEARCH NEWS WITH KEYWORD</span>
        <asp:TextBox ID="tbSearch" runat="server" class="nes-input is-success" style="margin-bottom: 20px;"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="SEARCH" OnClick="btnSearch_OnClick"   class="nes-btn is-primary"/>
    </div>
    <div class=nes-container with-title is-centered">
            <span>SEARCH NEWS WITH TIME</span><br/>
        <asp:TextBox ID="tbStart" runat="server" TextMode="Date" class="nes-input is-success"></asp:TextBox>
        <asp:TextBox ID="tbEnd" runat="server" textmode="Date" class="nes-input is-success" style="margin-bottom: 20px;"></asp:TextBox>
        <asp:Button ID="btnSearchTime" runat="server" Text="SEARCH" OnClick="btnSearchTime_OnClick"  class="nes-btn is-primary"/>
    </div>
    </div>
        <input id="resetReturn" type="reset" value="RESET SEARCH"  class="nes-btn is-error"/>
    </div>
    
    <div class="nes-container is-rounded" style="text-align: center;">
    <asp:Button ID="btnCreate" runat="server" class="nes-btn is-primary" OnClick="btnCreate_OnClick" Text="CREATE NEWS" />
    </div>
    <div class="nes-table-responsive">
        
        <asp:GridView ID="GridView2" runat="server" style="width: 1000px;">

        </asp:GridView>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_OnRowDeleting" CssClass="gvStyle" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"   style="width: 1000px;">
            <Columns>
                
                <asp:BoundField DataField="id" HeaderText="ID"
                                InsertVisible="False" ReadOnly="True" SortExpression="id"  />
                <asp:BoundField DataField="title" HeaderText="TITLE"
                    SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="SUMMARY"
                                SortExpression="summary" />
                <asp:BoundField DataField="pin" HeaderText="TOP NEWS"
                                SortExpression="pin" />

               
                
                <asp:TemplateField HeaderText="PREVIEW">
                    <ItemTemplate>
                        
                        <asp:Image ID="thumbNail" runat="server" ImageUrl='<%#"/backend/allFiles/"+Eval("img") %>'  Width="100px"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EDIT NEWS">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text="EDIT"  class="nes-btn"
                                       NavigateUrl='<%#"NewsEdit.aspx?id="+Eval("id") %>'></asp:HyperLink>
                    </ItemTemplate>
                 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DELETE NEWS">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Delete" Text="DELETE"  class="nes-btn is-error"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
             
            </Columns>
        </asp:GridView>
       
      
            <DeleteParameters>
                <asp:Parameter Name="original_Nid" Type="Int32" />
                <asp:Parameter Name="original_Ntitle" Type="String" />
                <asp:Parameter Name="original_Ncontent" Type="String" />
                <asp:Parameter Name="original_Nimg" Type="String" />
                <asp:Parameter Name="original_Nattachment" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ntitle" Type="String" />
                <asp:Parameter Name="Ncontent" Type="String" />
                <asp:Parameter Name="Nimg" Type="String" />
                <asp:Parameter Name="Nattachment" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ntitle" Type="String" />
                <asp:Parameter Name="Ncontent" Type="String" />
                <asp:Parameter Name="Nimg" Type="String" />
                <asp:Parameter Name="Nattachment" Type="String" />
                <asp:Parameter Name="original_Nid" Type="Int32" />
                <asp:Parameter Name="original_Ntitle" Type="String" />
                <asp:Parameter Name="original_Ncontent" Type="String" />
                <asp:Parameter Name="original_Nimg" Type="String" />
                <asp:Parameter Name="original_Nattachment" Type="String" />
            </UpdateParameters>
     
    </div>

    
                                         
</asp:Content>
