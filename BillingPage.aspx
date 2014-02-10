<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BillingPage.aspx.cs" Inherits="BillingPage" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="Black" Text="Billing Page"></asp:Label>
    <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" 
            Width="60px" />
        <asp:Button ID="backButton" runat="server"
            Text="Back" Width="60px" PostBackUrl="~/MemberWelcome.aspx" />
    </asp:Content>