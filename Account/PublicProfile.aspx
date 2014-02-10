<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PublicProfile.aspx.cs" Inherits="Account_PublicProfile" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

        .style10
        {
            height: 29px;
            width: 162px;
        }
        .style14
        {
            width: 162px;
        }
        .style4
        {
            width: 122px;
            height: 26px;
        }
        .style12
        {
            height: 26px;
            width: 162px;
        }
        .style15
    {
        height: 29px;
        width: 141px;
    }
    .style16
    {
        width: 141px;
    }
    .style17
    {
        height: 26px;
        width: 141px;
    }
        </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="profileTitle" runat="server" Font-Bold="True" 
        Font-Size="X-Large"></asp:Label>
    <br />
    <asp:SqlDataSource ID="IsFriendData" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT MemberA_ID, MemberB_ID, RequestSendDate, RequestRejectDate, StartDate, EndDate, IsRead, DropperID FROM Friends WHERE (MemberA_ID = @ownMemberID) AND (MemberB_ID = @profileID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL) AND (RequestRejectDate IS NULL) OR (MemberA_ID = @profileID) AND (MemberB_ID = @ownMemberID) AND (StartDate IS NOT NULL) AND (EndDate IS NULL) AND (RequestRejectDate IS NULL)">
        <SelectParameters>
            <asp:SessionParameter Name="ownMemberID" SessionField="OwnMemberID" />
            <asp:SessionParameter DefaultValue="" Name="profileID" 
                SessionField="ProfileID" />
        </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SentRequestData" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT MemberA_ID, MemberB_ID, RequestSendDate, RequestRejectDate, StartDate, EndDate, IsRead, DropperID FROM Friends WHERE (MemberA_ID = @ownMemberID) AND (MemberB_ID = @profileID) AND (StartDate IS NULL) AND (EndDate IS NULL) AND (RequestRejectDate IS NULL)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="" Name="ownMemberID" 
            SessionField="OwnMemberID" />
        <asp:SessionParameter DefaultValue="" Name="profileID" 
            SessionField="ProfileID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="ReceivedRequestData" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT MemberA_ID, MemberB_ID, RequestSendDate, RequestRejectDate, StartDate, EndDate, IsRead, DropperID FROM Friends WHERE (MemberA_ID = @profileID) AND (MemberB_ID = @ownMemberID) AND (StartDate IS NULL) AND (EndDate IS NULL) AND (RequestRejectDate IS NULL)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="" Name="profileID" 
            SessionField="ProfileID" />
        <asp:SessionParameter DefaultValue="" Name="ownMemberID" 
            SessionField="OwnMemberID" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
<asp:Button ID="Button1" runat="server" Text="Back" onclick="Button1_Click" />
    <br />
    <br />
    <table style="width: auto; margin-right: 0px;" border="1">
        <tr>
            <td class="style15" align="left">
                First Name</td>
            <td align="left" class="style10">
                <asp:Label ID="firstNameBox" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15" align="left">
                Middle Initial
            </td>
            <td align="left" class="style14">
                <asp:Label ID="middleInitialBox" runat="server" Height="20px" Width="120px" 
                    ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style16" align="left">
                Last Name</td>
            <td id="lastNameBox0" align="left" class="style14">
                <asp:Label ID="lastNameBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="20" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style16" align="left">
                Address
            </td>
            <td align="left" class="style14">
                <asp:Label ID="addressBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="30" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15" align="left">
                City
            </td>
            <td align="left" class="style10">
                <asp:Label ID="cityBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="30" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style16" align="left">
                Region/State</td>
            <td align="left" class="style14">
                <asp:Label ID="regionBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="30" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style16" align="left">
                Postal code</td>
            <td align="left" class="style14">
                <asp:Label ID="postalBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="30" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style17" align="left">
                Country</td>
            <td align="left" class="style12">
                <asp:Label ID="countryBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="25" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15" align="left">
                Home Phone
            </td>
            <td align="left" class="style10">
                <asp:Label ID="homePhone1" runat="server" Width="120px" Height="20px" 
                    MaxLength="20" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style16" align="left">
                Work Phone
            </td>
            <td align="left" class="style14">
                <asp:Label ID="workPhone1" runat="server" Width="120px" Height="20px" 
                    MaxLength="20" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15" align="left">
                Cell Phone
            </td>
            <td align="left" class="style14">
                <asp:Label ID="cellPhone1" runat="server" Width="120px" Height="20px" 
                    MaxLength="20" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style17" align="left">
                Email Address</td>
            <td align="left" class="style12">
                <asp:Label ID="emailBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="50" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style16" align="left">
                Gender</td>
            <td align="left" class="style14">
                
                <asp:Label ID="genderBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="50" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15" align="left">
                Date of birth
            </td>
            <td align="left" class="style14" >
                <asp:Label ID="dateOfBirthBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="50" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style17" align="left">
                Membership Level</td>
            <td align="left" class="style12">
                <asp:Label ID="membershipLevelBox" runat="server" Height="20px" Width="120px" 
                    MaxLength="50" ReadOnly="True" Enabled="False"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
<asp:Label ID="status" runat="server"></asp:Label>
<br />
<asp:Button ID="button" runat="server" onclick="button_Click" Visible="False" 
    Width="132px" />
<br />
    <br />
        </asp:Content>

