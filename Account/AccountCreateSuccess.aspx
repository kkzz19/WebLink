<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountCreateSuccess.aspx.cs" Inherits="Account_AccountCreateSuccess" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
        ForeColor="Black" Text="You have successfully created an account."></asp:Label>
    <br />
        <asp:Button ID="Button1" runat="server" Text="OK" 
            Width="50px" PostBackUrl="~/MemberWelcome.aspx" Height="30px" />
        </asp:Content>
