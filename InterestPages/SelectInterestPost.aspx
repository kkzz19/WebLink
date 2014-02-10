<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectInterestPost.aspx.cs" Inherits="InterestPages_SelectInterestPost" MasterPageFile="~/Site.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="selectInterestPostTitle" runat="server" Font-Bold="True" 
        Font-Size="XX-Large" ForeColor="Black"
        Text="Choose one of your interests to post in"></asp:Label>
    <br />
    <asp:SqlDataSource ID="memberInterestData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT MemberToInterests.InterestID, Interests.Name, MemberToInterests.MemberID FROM MemberToInterests INNER JOIN Interests ON MemberToInterests.InterestID = Interests.InterestID WHERE (Interests.DateDeleted IS NULL) AND (MemberToInterests.DateDropped IS NULL) AND (MemberToInterests.MemberID = @MemberID)">
        <SelectParameters>
            <asp:SessionParameter Name="MemberID" SessionField="MemberID" Type="Int32" 
                DefaultValue="-1" />
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
                    <asp:HyperLink ID="interestLink" runat="server" 
                    NavigateUrl='<%#String.Format("~/InterestPages/PostItem.aspx?InterestName={0}&InterestID={1}", Eval("Name"), Eval("InterestID")) %>'
                    Text='<%# Eval("Name")%>'>>HyperLink</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <asp:Button ID="backButton" runat="server" OnClick="Button2_Click" Text="Back" 
        Width="60px" />
    </asp:Content>
