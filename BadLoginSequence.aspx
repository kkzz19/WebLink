<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BadLoginSequence.aspx.cs" Inherits="BadLoginSequence" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="Black" Text="Error: Bad Login Sequence"></asp:Label>
    <br />
    <br />
        <asp:Button ID="Button1" runat="server" Text="Home Page" 
            Width="83px" PostBackUrl="~/Default.aspx" />
        </asp:Content>