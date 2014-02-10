<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessageDeleted.aspx.cs" Inherits="Friends_MessageDeleted" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        ForeColor="Black" Text="Message Successfully Deleted"></asp:Label>
    <br />
        <asp:Button ID="Button1" runat="server"  Text="OK" 
            Width="60px" 
        PostBackUrl="~/Friends/GetMessages.aspx" />
        </asp:Content>