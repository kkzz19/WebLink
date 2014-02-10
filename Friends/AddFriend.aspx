<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddFriend.aspx.cs" Inherits="AddFriend" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="title" runat="server" Font-Bold="True" Font-Size="Medium" 
        ForeColor="Black" 
        Text="Select a member to friend. (All choices have a common interest with you.)" 
        BorderStyle="None"></asp:Label>
    <br />
    <asp:SqlDataSource ID="memberInterestData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        
    SelectCommand="SELECT DISTINCT MemberProfiles.Username, MemberProfiles.VisibleUsername, MemberProfiles.MemberID FROM MemberProfiles INNER JOIN MemberToInterests ON MemberToInterests.MemberID = MemberProfiles.MemberID WHERE (MemberToInterests.DateDropped IS NULL) AND (MemberToInterests.MemberID &lt;&gt; @ownMemberID) AND EXISTS (SELECT InterestID FROM MemberToInterests AS MemberToInterests_1 WHERE (MemberID = @ownMemberID)) AND (NOT EXISTS (SELECT MemberA_ID FROM Friends WHERE (MemberA_ID = @ownMemberID) AND (MemberB_ID = MemberToInterests.MemberID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL) OR (MemberA_ID = MemberToInterests.MemberID) AND (MemberB_ID = @ownMemberID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL))) AND (NOT EXISTS (SELECT MemberA_ID FROM Friends AS Friends_1 WHERE (MemberA_ID = @ownMemberID) AND (MemberB_ID = MemberToInterests.MemberID) AND (StartDate IS NULL) AND (EndDate IS NULL) AND (RequestRejectDate IS NULL) OR (MemberA_ID = MemberToInterests.MemberID) AND (MemberB_ID = @ownMemberID) AND (StartDate IS NULL) AND (EndDate IS NULL) AND (RequestRejectDate IS NULL)))">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="memberInterestData" DataTextField="Visibleusername" 
        DataValueField="MemberID" ondatabound="DropDownList1_OnDataBound">
</asp:DropDownList>
<br />
    <br />
        <asp:Button ID="Button1" runat="server" Text="Add Friend" Width="83px" 
    onclick="Button1_Click" />
        <asp:Button ID="backButton" runat="server" 
            Text="Back" Width="82px" PostBackUrl="~/MemberWelcome.aspx" 
    onclick="backButton_Click" />
    <br />
<br />
<asp:Label ID="friendInviteStatus" runat="server"></asp:Label>
<br />
    </asp:Content>