<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InterestEdit.aspx.cs" Inherits="InterestEdit"
    MasterPageFile="~/Site.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style3
        {
            height: 22px;
            width: 202px;
        }
        .style4
        {
            width: 202px;
        }
        .style5
        {
            width: 550px;
        }
        .style8
        {
            width: 202px;
            height: 74px;
        }
        .style11
        {
            height: 22px;
            width: 344px;
        }
        .style12
        {
            width: 344px;
            height: 74px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"
        Text="Edit interests"></asp:Label>
    <br />
    <asp:Button ID="backButton" runat="server" Text="Back" Width="60px" CausesValidation="False"
        OnClick="backButton_Click" />
    <br />
    <asp:SqlDataSource ID="categoryData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [CatID], [Name] FROM [Categories] WHERE ([DateDeleted] IS NULL)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="interestData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT Categories.CatID, Interests.CatID AS Expr1, Interests.Name, Interests.InterestID FROM Categories INNER JOIN Interests ON Categories.CatID = Interests.CatID WHERE (Categories.CatID = @CatID) AND Interests.DateDeleted IS NULL">
        <SelectParameters>
            <asp:SessionParameter Name="CatID" SessionField="SelectedCategoryID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="memberInterestData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT MemberToInterests.InterestID, Interests.Name, MemberToInterests.MemberID FROM MemberToInterests INNER JOIN Interests ON MemberToInterests.InterestID = Interests.InterestID WHERE (Interests.DateDeleted IS NULL) AND (MemberToInterests.DateDropped IS NULL) AND (MemberToInterests.MemberID = @MemberID)">
        <SelectParameters>
            <asp:SessionParameter Name="MemberID" SessionField="MemberID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Add Interest" Font-Bold="True" Font-Underline="True"></asp:Label>
    <table style="width: auto">
        <tr>
            <td class="style3">
                <asp:Label ID="Label3" runat="server" Text="Select a Category of Interests" Font-Size="Small"></asp:Label>
            </td>
            <td class="style11">
                <asp:Label ID="Label4" runat="server" Text="Choose an interest" Font-Size="Small"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8">
                <asp:ListBox ID="categoryList" runat="server" DataSourceID="categoryData" OnSelectedIndexChanged="chooseCategoryButton_OnItemsChanged"
                    DataTextField="Name" DataValueField="CatID" AutoPostBack="True" Height="70px"
                    Width="120px"></asp:ListBox>
            </td>
            <td class="style12">
                <!-- InterestList only gets updated when CategoryList gets chosen. -->
                <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" ChildrenAsTriggers="false"
                    runat="server">
                    <ContentTemplate>
                        <asp:ListBox ID="interestList" runat="server" DataSourceID="interestData" DataTextField="Name"
                            DataValueField="InterestID" Height="70px" Width="120px"></asp:ListBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="categoryList" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="2" rowspan="1">
                <!-- DeleteList only gets updated when addInterest or deleteInterest is chosen -->
                <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" ChildrenAsTriggers="false"
                    runat="server">
                    <ContentTemplate>
                        <asp:Button ID="addInterestButton" runat="server" Text="Add Interest" Width="87px"
                            OnClick="addInterestButton_Click" CausesValidation="False" />
                        <asp:Label ID="interestAddSuccFail" runat="server"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="addInterestButton" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <br />
    <table style="width: auto">
        <tr>
            <td class="style5">
                <asp:Label ID="Label5" runat="server" Text="Delete Interest" Font-Bold="True" Font-Underline="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label6" runat="server" Text="Current Interests:" Font-Size="Small"></asp:Label>
                <br />
                <!-- DeleteList only gets updated when addInterest or deleteInterest is chosen -->
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="false"
                    runat="server">
                    <ContentTemplate>
                        <asp:ListBox ID="memberInterestList" runat="server" DataSourceID="memberInterestData"
                            DataTextField="Name" DataValueField="InterestID" Width="120px"></asp:ListBox>
                        <br />
                        <asp:Button ID="deleteInterestButton" runat="server" Text="Delete" Width="60px" OnClick="deleteInterestButton_Click"
                            CausesValidation="False" />
                        <asp:Label ID="interestDeleteSuccFail" runat="server"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="addInterestButton" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="deleteInterestButton" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <asp:Label ID="Label7" runat="server" Text="Search for an Interest" 
                    Font-Bold="True" Font-Underline="True"></asp:Label>
                <br />
                <br />
                <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue" 
                    NavigateUrl="~/InterestPages/SearchInterest.aspx">Click here to start a search</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>
