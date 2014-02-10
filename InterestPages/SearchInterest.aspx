<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchInterest.aspx.cs" Inherits="InterestPages_SearchInterest"
    MasterPageFile="~/Site.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table>
        <tr>
            <td class="style10" style="font-weight: bold; text-decoration: underline">
                Search For an Interest to Add
            </td>
        </tr>
        <tr>
            <td class="style5" style="font-weight: normal;">
                
                <!-- Conditionally update the search box to only update when search button is hit-->
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="true"
                    runat="server">
                    <ContentTemplate>
                        <asp:SqlDataSource ID="searchInterestData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT InterestID, Name FROM Interests WHERE (Name LIKE '%' + @interestName + '%') AND DateDeleted IS NULL">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="searchInterestBox" Name="interestName" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:TextBox ID="searchInterestBox" runat="server" AutoPostBack="True"></asp:TextBox>
                        <asp:Button ID="searchInterestButton" runat="server" Text="Search"
                            Width="61px" />
                        <asp:Label ID="noMatchesFound" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="Results" Font-Size="Small"></asp:Label>
                        <br />
                        <asp:ListBox ID="searchInterestList" runat="server" Width="120px" OnDataSourceChanged="ListControl1_DataSourceChanged"
                            EnableViewState="False" OnDataBound="searchInterestList_OnDataBound" 
                            DataSourceID="searchInterestData" DataTextField="Name" 
                            DataValueField="InterestID">
                        </asp:ListBox>
                        <br />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="searchInterestButton" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                
                <!-- Conditionally update the add label to only update when add button is hit-->
                <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" ChildrenAsTriggers="false"
                    runat="server">
                    <ContentTemplate>
                    <asp:Button ID="addSearchInterest" runat="server" OnClick="addSearchInterest_Click"
                            Text="Add Interest" CausesValidation="False" />
                        <asp:Label ID="searchInterestAddSuccFail" runat="server"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="addSearchInterest" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <br />
                <asp:Button ID="backButton" runat="server" Text="Back" 
                    OnClick="backButton_Click" CausesValidation="False" />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
