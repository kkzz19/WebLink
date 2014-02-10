<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetSentMessages.aspx.cs" Inherits="GetSentMessages" MasterPageFile="~/Site.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"
        Text="Messages Sent"></asp:Label>
    <br />
    <asp:SqlDataSource ID="messageData" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    
        
        
    
        SelectCommand="SELECT Messages.Subject, Messages.Text, Messages.DateSent, MemberProfiles.Username, MemberProfiles.VisibleUsername, Messages.MessageID, Messages.DateRead FROM Messages INNER JOIN MemberProfiles ON Messages.ReceiverID = MemberProfiles.MemberID WHERE (Messages.SenderID = @ownMemberID) ORDER BY Messages.DateSent DESC">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="noPosts" runat="server" 
    Text="You have not sent any messages.&lt;br/&gt;" Visible="False"></asp:Label>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="messageData" 
        OnItemDataBound="Repeater1_OnItemDataBound">
        <HeaderTemplate>
            <table border="1">
            <tr>
            <td style="font-weight: bold">Subject (Click to view message)</td>
            <td style="font-weight: bold">Recipient</td>
            <td style="font-weight: bold">Date Sent</td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
        <tr style="height: 40px">
            
            <td width="350"> 
               
                <asp:HyperLink ID="Label4" runat="server" Text='<%#Eval("Subject")%>'
                    
                     NavigateUrl='<%#String.Format("~/Friends/Message.aspx?SentMessage=1&MessageID={0}", Eval("MessageID").ToString()) %>'>HyperLink</asp:HyperLink>
            </td>
            
            <td width = "175">
                <asp:HyperLink ID="InterestTableName" runat="server" Text='<%# Eval("VisibleUsername")%>'
                    ForeColor="#3366FF" Style="text-decoration: none" 
                    NavigateUrl='<%#String.Format("~/Account/PublicProfile.aspx?Username={0}", Eval("UserName")) %>'>HyperLink</asp:HyperLink>
             
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Text='<%#String.Format("Sent on {0:d} at {0:h:mm tt}", Eval("DateSent"))%>'
                    Font-Italic="True" Font-Size="Small"></asp:Label>
            </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <asp:Button ID="backButton" runat="server" OnClick="Button2_Click" Text="Back" Width="60px"
        PostBackUrl="~/MemberWelcome.aspx" />
</asp:Content>
