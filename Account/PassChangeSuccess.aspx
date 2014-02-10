<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PassChangeSuccess.aspx.cs" Inherits="Account_PassChangeSuccess" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
        ForeColor="Black" Text="You have successfully changed your password."></asp:Label>
    <br />
        <asp:Button ID="Button1" runat="server" Text="OK" 
            Width="60px" PostBackUrl="~/MemberWelcome.aspx" />
        </asp:Content>
