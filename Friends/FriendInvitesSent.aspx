<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FriendInvitesSent.aspx.cs" Inherits="Friends_FriendInvitesSent" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="Black" Text="Your sent friend requests"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        
        
        
        
        
        SelectCommand="SELECT DISTINCT MemberProfiles.VisibleUsername, Friends.RequestSendDate, Friends.MemberA_ID, Friends.MemberB_ID, Friends.RequestRejectDate, Friends.StartDate FROM Friends INNER JOIN MemberProfiles ON Friends.MemberB_ID = MemberProfiles.MemberID WHERE (Friends.MemberA_ID = @ownMemberID) AND (NOT EXISTS (SELECT MemberA_ID FROM Friends AS Friends_2 WHERE (MemberA_ID = @ownMemberID) AND (MemberB_ID = MemberProfiles.MemberID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL) OR (MemberA_ID = MemberProfiles.MemberID) AND (MemberB_ID = @ownMemberID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL))) AND (NOT EXISTS (SELECT MemberA_ID FROM Friends AS Friends_1 WHERE (MemberA_ID = MemberProfiles.MemberID) AND (MemberB_ID = @ownMemberID) AND (StartDate IS NULL) AND (EndDate IS NULL) AND (RequestRejectDate IS NULL))) AND (Friends.RequestRejectDate IS NULL) AND (Friends.RequestRejectDate IS NULL) AND (Friends.RequestRejectDate IS NULL) AND (Friends.StartDate IS NULL) AND (Friends.EndDate IS NULL)">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="noSent" runat="server" Text="(No friend invites currently sent)" 
        Visible="False"></asp:Label>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1"  OnItemDataBound="Repeater1_OnItemDataBound"
        onitemcommand="Repeater1_ItemCommand">
        <HeaderTemplate>
            <table border="1">
                <tr>
                    <th>
                        <b>Invitee</b>
                    </th>
                    <th>
                        <b>Date Sent</b>
                    </th>
                    <th>
                        <b>Drop this request</b>
                    </th>
                    
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                <asp:HyperLink ID="userName" runat="server" Text=<%# Eval("Visibleusername")%> Font-Bold="True" ForeColor="#3366FF" style="text-decoration:none"
                        NavigateUrl='<%#String.Format("~/Account/PublicProfile.aspx?Username={0}",Eval("Visibleusername"))%>'
                    ></asp:HyperLink>
                </td>
                <td>
                    <%# Eval("RequestSendDate")%>
                </td>
                
                <td align="center">
                    <asp:Button ID="drop" runat="server" Text="Drop" CausesValidation="False" />
                </td>
                
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <asp:Label ID="status" runat="server"></asp:Label>
    <br />
    <br />
    <table>
        <tr>
            <td>
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
