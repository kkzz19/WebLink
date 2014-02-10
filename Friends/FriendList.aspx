<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FriendList.aspx.cs" Inherits="Friends_FriendList" MasterPageFile="~/Site.master"%>

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
        ForeColor="Black" Text="Your Friends"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        
        
        
        SelectCommand="SELECT StartDate, MemberA_ID, MemberB_ID FROM Friends WHERE (StartDate IS NOT NULL) AND (EndDate IS NULL) AND (MemberA_ID = @ownMemberID) AND (RequestRejectDate IS NULL) OR (StartDate IS NOT NULL) AND (EndDate IS NULL) AND (MemberB_ID = @ownMemberID) AND (RequestRejectDate IS NULL)">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="noFriends" runat="server" Text="(No friends yet)" 
        Visible="False"></asp:Label>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1"  OnItemDataBound="Repeater1_OnItemDataBound"
        onitemcommand="Repeater1_ItemCommand">
        <HeaderTemplate>
            <table border="1">
                
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td width="50px">
                    <asp:HyperLink ID="friendUserName" runat="server" Text=<%# SessionManager.GetOtherUsername((int)Eval("MemberA_ID"),(int)Eval("MemberB_ID"))%> Font-Bold="True" ForeColor="#3366FF" style="text-decoration:none"
                        NavigateUrl='<%#String.Format("~/Account/PublicProfile.aspx?Username={0}", SessionManager.GetOtherUsername((int)Eval("MemberA_ID"),(int)Eval("MemberB_ID"))) %>'
                        >HyperLink</asp:HyperLink>
                </td>
                <td>
                    
                    <asp:Label ID="Label3" runat="server" Text=<%#String.Format("Friends since {0:d} at {0:h:mm tt}", Eval("StartDate"))%> Font-Italic="True" Font-Size="Small"></asp:Label>
                </td>
               
                <td>
                    <asp:Button ID="drop" runat="server" Text="Drop This Friend" CausesValidation="False" />
                </td>
                
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <asp:Label ID="status" runat="server" ForeColor="#006600"></asp:Label>
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