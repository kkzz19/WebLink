<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminInterest.aspx.cs" Inherits="AdminPages_AdminInterest" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style2
        {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="interestEditTitle" runat="server" Font-Bold="True" 
        Font-Size="X-Large" ForeColor="Black"></asp:Label>
    <br />

    <asp:SqlDataSource ID="interestList" runat="server" 
    
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        
        
        SelectCommand="SELECT [Name], [Description], [CatID], InterestID FROM [Interests] WHERE ([CatID] = @CatID) AND DateDeleted IS NULL" onselecting="interestList_Selecting" 
        >
        <SelectParameters>
            <asp:QueryStringParameter Name="CatID" QueryStringField="CategoryID" 
                Type="Int32" />
        </SelectParameters>
 
        </asp:SqlDataSource>

    <asp:Label ID="noInterests" runat="server" Text="(No interests)" 
        Visible="False"></asp:Label>

    <br />

       <asp:Repeater ID="Repeater1" runat="server" DataSourceID="interestList" OnItemDataBound="Repeater1_OnItemDataBound"
        onitemcommand="Repeater1_ItemCommand">
        <HeaderTemplate>
            <table border="1">
                <tr>
                    <th>
                        <b>Interest</b>
                    </th>
                    <th>
                        <b>Description</b>
                    </th>
                    <th>
                        <b>ID</b>
                    </th>
                    <th>
                        <b>Delete</b>
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="InterestTableName" runat="server" Text=<%# Eval("Name")%>></asp:Label>
                    
                </td>
                <td>
                    <%# Eval("Description")%>
                </td>
                <td>
                    <asp:Label ID="InterestIDName" runat="server" Text=<%# Eval("InterestID")%>></asp:Label>
                </td>
                <td>
                    <asp:Button ID="deleteInterest" runat="server" Text="Delete" CausesValidation="False" />
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
    <asp:Label ID="addInterestLabel" runat="server" Font-Bold="True"></asp:Label>
    <br />
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
                <asp:Button ID="addInterestButton" runat="server" Text="Add" 
                    OnClick="addInterestButton_Click" />
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
                <asp:Label ID="intAddSuccessFail" runat="server"></asp:Label>
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
                <asp:Button ID="backButton" runat="server" Text="Back" Width="60px" PostBackUrl="~/AdminPages/SelectCategory.aspx"
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
    <br />
</asp:Content>
