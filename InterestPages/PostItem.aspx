<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PostItem.aspx.cs" Inherits="PostItem"
    MasterPageFile="~/Site.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style2
        {
            height: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="postItemTitle" runat="server" Font-Bold="True" Font-Size="XX-Large"
        ForeColor="Black"></asp:Label>
    <br />
    <table style="width: 427px; height: 142px">
        <tr>
            <td>
                <asp:Label ID="titleLabel" runat="server" Text="Title (optional)"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="titleBox" runat="server" MaxLength="255"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="textLabel" runat="server" Text="Message"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="messageBox" runat="server" Height="75px" Width="288px" 
                    TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="messageValidator" runat="server" 
                    ErrorMessage="You must enter a message." ControlToValidate="messageBox" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="submitPostButton" runat="server" OnClick="submitPostButton_Click"
        Text="Submit" Width="60px" />
    <asp:Button ID="backButton" runat="server" OnClick="backButton_Click" Text="Back"
        Width="60px" 
    CausesValidation="False" />
<br />
<br />
<asp:Label ID="postStatus" runat="server"></asp:Label>
<br />
<asp:HyperLink ID="postLink" runat="server" Visible="False">Click here to view your post</asp:HyperLink>
<br />
</asp:Content>
