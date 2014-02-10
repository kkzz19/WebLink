<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessagePostSuccess.aspx.cs" Inherits="Friends_MessagePostSuccess" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="Black" Text="Message Successfully Posted"></asp:Label>
    <br />
        <asp:Button ID="Button1" runat="server"  Text="OK" 
            Width="60px" onclick="Button1_Click" />
        </asp:Content>