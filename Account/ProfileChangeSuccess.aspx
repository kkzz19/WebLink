<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfileChangeSuccess.aspx.cs" Inherits="Account_ProfileChangeSuccess" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
        ForeColor="Black" Text="Profile changes have been saved."></asp:Label>
    <br />
        <asp:Button ID="Button1" runat="server" Text="OK" 
            Width="60px" PostBackUrl="~/MemberWelcome.aspx" />
        </asp:Content>
