<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InterestNews.aspx.cs" Inherits="InterestNews" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="interestNewsTitle" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="Black"></asp:Label>
    <br />
    <asp:SqlDataSource ID="postsData" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT InterestPosts.Title, InterestPosts.Text, InterestPosts.PostDate, MemberProfiles.Username, MemberProfiles.VisibleUsername FROM InterestPosts INNER JOIN MemberProfiles ON InterestPosts.PosterID = MemberProfiles.MemberID WHERE (InterestPosts.InterestID = @interestID) AND (InterestPosts.DeleteDate IS NULL)
ORDER BY InterestPosts.PostDate DESC;">
        <SelectParameters>
            <asp:QueryStringParameter Name="interestID" QueryStringField="InterestID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="noPosts" runat="server" 
        Text="No posts have been submitted for this interest yet.&lt;br/&gt;" 
    Visible="False"></asp:Label>
    <br />
        <asp:Button ID="postItem" runat="server" onclick="postItem_Click" 
        Text="Post an item" Width="94px" />
        <asp:Button ID="viewMembersButton" runat="server" 
        onclick="viewMembersButton_Click" Text="View Members" Width="110px" />
        <asp:Button ID="backButton" runat="server" onclick="Button2_Click" 
            Text="Back" Width="73px" />
    
       <br />
    <br />
    
       <asp:Repeater ID="Repeater1" runat="server" DataSourceID="postsData" OnItemDataBound="Repeater1_OnItemDataBound"
        >
        <HeaderTemplate>
            <table border="1">
                <tr>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td  style="width: 800px">
                    <asp:HyperLink ID="InterestTableName" runat="server" Text=<%# Eval("VisibleUsername")%> Font-Bold="True" ForeColor="#3366FF" style="text-decoration:none"
                        NavigateUrl='<%#String.Format("~/Account/PublicProfile.aspx?Username={0}", Eval("UserName")) %>'
                        >HyperLink</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" Text=<%#String.Format("Posted on {0:d} at {0:h:mm tt}", Eval("PostDate"))%> Font-Italic="True" Font-Size="Small"></asp:Label>
                    <br /><br />
                    
                    <asp:Label ID="Label2" runat="server" Text=<%#String.Format("{0}<br /><br />", Eval("Title"))%> Font-Bold="True" Font-Underline="True" 
                    Visible='<%# ShowTitle(Eval("Title").ToString()) %>'></asp:Label>
                    
                    
                    <asp:Label ID="Label1" runat="server" Text=<%# Eval("Text")%>></asp:Label>
                    <br /><br />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>

     <br />
            
       </asp:Content>