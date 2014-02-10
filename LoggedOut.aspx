<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoggedOut.aspx.cs" Inherits="LoggedOut" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="Black" Text="You have successfully logged out."></asp:Label>
    <br />
        <asp:Button ID="Button1" runat="server" Text="Ok" 
            Width="60px" PostBackUrl="~/Default.aspx" />
        </asp:Content>