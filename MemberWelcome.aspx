<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="MemberWelcome.aspx.cs"
    Inherits="MemberWelcome" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <p>
        <asp:Label ID="welcomeLabel" runat="server" Font-Size="XX-Large"></asp:Label><br />
        <asp:Label ID="joinDateLabel" runat="server" Text="Label" Font-Italic="True" Font-Size="Small"></asp:Label>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT StartDate, MemberA_ID, MemberB_ID, RequestSendDate, RequestRejectDate, EndDate FROM Friends WHERE (MemberA_ID = @ownMemberID) AND (IsRead = 0) AND (RequestRejectDate IS NOT NULL) AND (EndDate IS NULL) AND (DropperID &lt;&gt; @ownMemberID) OR (MemberA_ID = @ownMemberID) AND (IsRead = 0) AND (EndDate IS NULL) AND (StartDate IS NOT NULL) OR (MemberA_ID = @ownMemberID) AND (IsRead = 0) AND (EndDate IS NOT NULL) AND (DropperID &lt;&gt; @ownMemberID) OR (IsRead = 0) AND (EndDate IS NOT NULL) AND (DropperID &lt;&gt; @ownMemberID) AND (MemberB_ID = @ownMemberID)">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT DISTINCT MemberProfiles.VisibleUsername, Friends.RequestSendDate, Friends.MemberA_ID, Friends.MemberB_ID FROM Friends INNER JOIN MemberProfiles ON Friends.MemberA_ID = MemberProfiles.MemberID WHERE (Friends.MemberB_ID = @ownMemberID) AND (NOT EXISTS (SELECT MemberA_ID FROM Friends AS Friends_2 WHERE (MemberA_ID = @ownMemberID) AND (MemberB_ID = MemberProfiles.MemberID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL) OR (MemberA_ID = MemberProfiles.MemberID) AND (MemberB_ID = @ownMemberID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL))) AND (NOT EXISTS (SELECT MemberA_ID FROM Friends AS Friends_1 WHERE (MemberA_ID = @ownMemberID) AND (MemberB_ID = MemberProfiles.MemberID) AND (StartDate IS NULL) AND (EndDate IS NULL) AND (RequestRejectDate IS NULL))) AND (Friends.RequestRejectDate IS NULL) AND (Friends.StartDate IS NULL) AND (Friends.EndDate IS NULL)">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT DISTINCT MemberProfiles.VisibleUsername, Friends.RequestSendDate, Friends.MemberA_ID, Friends.MemberB_ID, Friends.RequestRejectDate, Friends.StartDate FROM Friends INNER JOIN MemberProfiles ON Friends.MemberB_ID = MemberProfiles.MemberID WHERE (Friends.MemberA_ID = @ownMemberID) AND (NOT EXISTS (SELECT MemberA_ID FROM Friends AS Friends_2 WHERE (MemberA_ID = @ownMemberID) AND (MemberB_ID = MemberProfiles.MemberID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL) OR (MemberA_ID = MemberProfiles.MemberID) AND (MemberB_ID = @ownMemberID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL))) AND (NOT EXISTS (SELECT MemberA_ID FROM Friends AS Friends_1 WHERE (MemberA_ID = MemberProfiles.MemberID) AND (MemberB_ID = @ownMemberID) AND (StartDate IS NULL) AND (EndDate IS NULL) AND (RequestRejectDate IS NULL))) AND (Friends.RequestRejectDate IS NULL) AND (Friends.RequestRejectDate IS NULL) AND (Friends.RequestRejectDate IS NULL) AND (Friends.StartDate IS NULL) AND (Friends.EndDate IS NULL)">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="messageData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT Messages.Subject, Messages.Text, Messages.DateSent, MemberProfiles.Username, MemberProfiles.VisibleUsername, Messages.MessageID, Messages.DateRead FROM Messages INNER JOIN MemberProfiles ON Messages.SenderID = MemberProfiles.MemberID WHERE (Messages.DateDeleted IS NULL) AND (Messages.ReceiverID = @ownMemberID) AND (Messages.DateRead IS NULL) ORDER BY Messages.DateSent DESC">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label5" runat="server" Text="My Updates" Font-Bold="True" Font-Underline="True"></asp:Label>
    <br />
    <br />
    <table style="width: 81%;">
        <tr>
            <td height="22">
                <asp:Label ID="unreadMessagesLabel" runat="server" Text="You have no unread messages."></asp:Label>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Friends/GetMessages.aspx"
                    ForeColor="Blue" Visible="False">Click here to view</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td height="22">
                <asp:Label ID="Label4" runat="server" Text="You have no pending friend requests received."></asp:Label>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Friends/FriendInvitesReceived.aspx"
                    ForeColor="Blue" Visible="False">Click here to view</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td height="22">
                <asp:Label ID="Label3" runat="server" Text="You have no pending friend requests sent."></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Friends/FriendInvitesSent.aspx"
                    ForeColor="Blue" Visible="False">Click here to view</asp:HyperLink>
            </td>
        </tr>
    </table>
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater2_ItemCommand">
        <HeaderTemplate>
            <table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:HyperLink ID="friendUserName" runat="server" Text='<%# SessionManager.GetOtherUsername((int)Eval("MemberA_ID"),(int)Eval("MemberB_ID"))%>'
                        Font-Bold="True" ForeColor="#3366FF" Style="text-decoration: none" NavigateUrl='<%#String.Format("~/Account/PublicProfile.aspx?Username={0}", SessionManager.GetOtherUsername((int)Eval("MemberA_ID"),(int)Eval("MemberB_ID"))) %>'>HyperLink</asp:HyperLink>
                    <asp:Label ID="Label2" runat="server" Text='<%# String.Format(SetMessage(Eval("RequestRejectDate"),Eval("StartDate"),Eval("EndDate"))) %>'></asp:Label>
                </td>
                <td>
                    <asp:Button ID="okButton" runat="server" Text="OK" CausesValidation="False" />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"
        Text="Select one of your interests to view posts"></asp:Label>
    <br />
    <asp:SqlDataSource ID="memberInterestData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT MemberToInterests.InterestID, Interests.Name, MemberToInterests.MemberID FROM MemberToInterests INNER JOIN Interests ON MemberToInterests.InterestID = Interests.InterestID WHERE (Interests.DateDeleted IS NULL) AND (MemberToInterests.DateDropped IS NULL) AND (MemberToInterests.MemberID = @MemberID)">
        <SelectParameters>
            <asp:SessionParameter Name="MemberID" SessionField="MemberID" Type="Int32" DefaultValue="-1" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="memberInterestData" OnItemDataBound="Repeater1_OnItemDataBound">
        <HeaderTemplate>
            <table border="1">
                <tr>
                    <th>
                        <b>Interest</b>
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:HyperLink ID="interestLink" runat="server" NavigateUrl='<%#String.Format("~/InterestPages/InterestNews.aspx?InterestName={0}&InterestID={1}", Eval("Name"), Eval("InterestID")) %>'
                        Text='<%# Eval("Name")%>'>>HyperLink</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:HyperLink ID="addInterestHyperlink" runat="server" ForeColor="Blue" NavigateUrl="~/InterestPages/InterestEdit.aspx"
        Visible="False">Click here to add interests</asp:HyperLink>
    <br />
</asp:Content>
