<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BadLogin.aspx.cs" Inherits="Account_BadLogin" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
        ForeColor="Red" 
    Text="You have submitted too many incorrect login attempts. Login will be disabled for a short time."></asp:Label>
    <br />
        <asp:Button ID="submitButton" runat="server" Text="OK" 
            Width="60px" PostBackUrl="~/Default.aspx" />
        </asp:Content>
