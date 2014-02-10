<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMessages.aspx.cs" Inherits="SendMessages" 
MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

        .style2
        {
            height: 22px;
        }
    .style3
    {
        width: 124px;
    }
</style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="title" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="Black" Text="Send Message"></asp:Label>
    <br />
    <br />
        <asp:Button ID="backButton" runat="server" onclick="Button2_Click" 
            Text="Back" Width="60px" PostBackUrl="~/MemberWelcome.aspx" 
        CausesValidation="False" />
    <br />
    <br />
<asp:Label ID="selectFriendLabel" runat="server"></asp:Label>
<br />
<asp:DropDownList ID="friendDropDown" runat="server" 
        ondatabound="DataBounded">
</asp:DropDownList>
<br />
    <br />
    <asp:Label ID="sendMessageLabel" runat="server" Font-Bold="True"></asp:Label>
    <table>
        <tr>
            <td class="style3">
                <asp:Label ID="Label4" runat="server" Text="Subject (Optional)"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="titleBox" runat="server" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label5" runat="server" Text="Message Text"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="messageBox" runat="server" Height="122px" Width="330px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="messageBox" ErrorMessage="Enter a message" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Button ID="addInterestButton" runat="server" Text="Send" 
                    OnClick="addInterestButton_Click" />
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="sendSuccessFail" runat="server"></asp:Label>
                <br />
                <br />
            </td>
            <td class="style2">
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </asp:Content>

