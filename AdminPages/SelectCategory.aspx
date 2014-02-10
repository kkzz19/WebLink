<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectCategory.aspx.cs" Inherits="AdminPages_SelectCategory" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

        .style2
        {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="Black" Text="Choose category"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [Name], [Description], [CatID] FROM [Categories] WHERE DateDeleted IS NULL">
    </asp:SqlDataSource>
    <asp:Label ID="noCategories" runat="server" Text="(No categories)" 
        Visible="False"></asp:Label>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnPreRender="Repeater1_OnPrerender" OnItemDataBound="Repeater1_OnItemDataBound"
        onitemcommand="Repeater1_ItemCommand">
        <HeaderTemplate>
            <table border="1">
                <tr>
                    <th>
                        <b>Category</b>
                    </th>
                    <th>
                        <b>Description</b>
                    </th>
                    <th>
                        <b>ID</b>
                    </th>
                    <th>
                        <b>Submit</b>
                    </th>
                    <th>
                        <b>Delete</b>
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="CatTableName" runat="server" Text=<%# Eval("Name")%>></asp:Label>
                    
                </td>
                <td>
                    <%# Eval("Description")%>
                </td>
                <td>
                    <%# Eval("CatID")%>
                </td>
                <td>
                    <asp:Button ID="selectCategory" runat="server" Text="Select" CausesValidation="False" />
                </td>
                <td>
                    <asp:Button ID="deleteCategory" runat="server" Text="Delete" CausesValidation="False" />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:Label ID="deleteMessage" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" 
        Text="Add Category"></asp:Label>
    <br />
    <table>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="addCategory" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter in an interest name"
                    ForeColor="Red" ControlToValidate="addCategory"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Descripton (Optional)"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="addDesc" runat="server" Height="122px" Width="330px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="addCatButton" runat="server" Text="Add" 
                    OnClick="addCatButton_Click" />
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="catAddSuccessFail" runat="server"></asp:Label>
                <br />
                <br />
            </td>
            <td class="style2">
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="backButton" runat="server" Text="Back" Width="60px" PostBackUrl="~/MemberWelcome.aspx"
                    CausesValidation="False" onclick="backButton_Click" />
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>
