﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetMessages.aspx.cs" Inherits="GetMessages"
    MasterPageFile="~/Site.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"
        Text="Current Messages"></asp:Label>
    <br />
    <asp:SqlDataSource ID="messageData" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    
        
        SelectCommand="SELECT Messages.Subject, Messages.Text, Messages.DateSent, MemberProfiles.Username, MemberProfiles.VisibleUsername, Messages.MessageID, Messages.DateRead FROM Messages INNER JOIN MemberProfiles ON Messages.SenderID = MemberProfiles.MemberID WHERE (Messages.DateDeleted IS NULL) AND (Messages.ReceiverID = @ownMemberID) ORDER BY Messages.DateSent DESC">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="noPosts" runat="server" 
    Text="You have no current messages.&lt;br/&gt;" Visible="False"></asp:Label>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="messageData" 
        OnItemDataBound="Repeater1_OnItemDataBound">
        <HeaderTemplate>
            <table border="1">
            <tr>
            <td style="font-weight: bold">Read?</td>
            <td style="font-weight: bold">Subject (Click to view message)</td>
            <td style="font-weight: bold">Sender</td>
            <td style="font-weight: bold">Date Sent</td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
        <tr style="height: 40px">
            <td>
                <asp:Label ID="Label2" runat="server" Text='<%#String.Format(ReadOrNot(Eval("DateRead")))%>'
                Font-Bold='<%#IsBold(Eval("DateRead"))%>' ForeColor='<%#SetColor(Eval("DateRead"))%>'>
                </asp:Label></td>
            
            <td width="350"> 
               
                <asp:HyperLink ID="Label4" runat="server" Text='<%#Eval("Subject")%>'
                    Font-Bold='<%#IsBold(Eval("DateRead"))%>'
                     NavigateUrl='<%#String.Format("~/Friends/Message.aspx?MessageID={0}", Eval("MessageID").ToString()) %>'>HyperLink</asp:HyperLink>
            </td>
            
            <td width = "175">
                <asp:HyperLink ID="InterestTableName" runat="server" Text='<%# Eval("VisibleUsername")%>'
                    Font-Bold='<%#IsBold(Eval("DateRead"))%>' ForeColor="#3366FF" Style="text-decoration: none" 
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
