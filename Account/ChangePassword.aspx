<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" MasterPageFile="~/Site.master"%>

<script runat="server">

</script>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

        .style2
        {
            width: 198px;
            height: 29px;
        }
        .style6
        {
            height: 29px;
        }
        </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
<asp:Label ID="setOrChange" runat="server" 
        Font-Bold="True" Font-Size="Large">Set Password</asp:Label>
    <br />
    <table style="width:auto" id="changePassTable">
        <tr>
            <td class="style2" align="left">
                    <asp:Label ID="oldPassLabel" runat="server" Text="Enter in current password"></asp:Label>
            </td>
            <td align="left" class="style6">
                <asp:TextBox ID="oldPassBox" runat="server" TextMode="Password" Height="20px" 
                        Width="120px" MaxLength="25"></asp:TextBox>
                <asp:Label ID="oldPassMismatch" runat="server" 
                    Text="Password is not current password" ForeColor="Red"></asp:Label>
                <asp:RequiredFieldValidator ID="oldPassReqValidator" runat="server" 
                        ControlToValidate="oldPassBox" ErrorMessage="Enter in old password" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                    Enter in new password</td>
            <td align="left" class="style6">
                <asp:TextBox ID="newPassBox" runat="server" TextMode="Password" Height="20px" 
                        Width="120px" MaxLength="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                        ControlToValidate="newPassBox" ErrorMessage="Enter in new password" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                    Confirm new password</td>
            <td align="left" class="style6">
                <asp:TextBox ID="confirmPassBox" runat="server" TextMode="Password" Height="20px" 
                        Width="120px" MaxLength="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ControlToValidate="confirmPassBox" Display="Dynamic" 
                        ErrorMessage="Retype new password" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="newPassBox" ControlToValidate="confirmPassBox" 
                        Display="Dynamic" ErrorMessage="Password does not match" 
                    ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
    </table>
    <asp:Button ID="submitButton" runat="server" Font-Bold="True" Font-Size="Large" 
        Text="Submit" onclick="submitButton_Click" 
            EnableTheming="True" />
        <asp:Button ID="cancelButton" runat="server" Font-Bold="True" Font-Size="Large" 
            Font-Strikeout="False" Text="Back" 
            CausesValidation="False" onclick="cancelButton_Click" Width="87px" />
        <br />
    <asp:Label ID="errorConnectDatabase" runat="server" ForeColor="Red" 
        Text="Error updating database; check your connection or try again later" 
        Visible="False"></asp:Label>
    <br />
        </asp:Content>