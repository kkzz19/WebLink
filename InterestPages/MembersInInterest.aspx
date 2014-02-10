<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MembersInInterest.aspx.cs"
    Inherits="InterestPages_MembersInInterest" MasterPageFile="~/Site.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="titleLabel" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"></asp:Label>
    <br />
    <asp:SqlDataSource ID="memberInterestData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT MemberProfiles.Username, MemberProfiles.Visibleusername
FROM MemberProfiles
INNER JOIN MemberToInterests
ON MemberToInterests.MemberID = MemberProfiles.MemberID
WHERE (MemberToInterests.DateDropped IS NULL) AND (MemberToInterests.InterestID = @interestID)
">
        <SelectParameters>
            <asp:QueryStringParameter Name="interestID" QueryStringField="InterestID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="memberInterestData" RowDataBound="GridView1_OnRowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="Member Username">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl='<%#String.Format("~/Account/PublicProfile.aspx?Username={0}", Eval("Visibleusername")) %>'
                        Text=<%# Eval("Visibleusername")%> Font-Bold="True" ForeColor="#0066FF"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="noMembersLabel" runat="server" 
        Text="(No members exist for this interest)" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Button ID="backButton" runat="server" OnClick="Button2_Click" Text="Back" Width="60px" />
</asp:Content>
