<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="Friends_Message" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style2
        {
            width: 84px;
        }
        .style3
        {
            width: 84px;
            height: 22px;
        }
        .style4
        {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <asp:Button ID="BackButton" runat="server" onclick="BackButton_Click" 
        Text="Back" />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Messages] WHERE ([MessageID] = @MessageID)">
        <SelectParameters>
            <asp:SessionParameter Name="MessageID" SessionField="MessageID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table style="width: 47%; margin-right: 50px;">
        <tr>
            <td class="style2">
                Subject:</td>
            <td>
                <asp:Label ID="subjectLabel" runat="server" Font-Bold="True" 
                    Font-Underline="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                From:</td>
            <td>
                <asp:HyperLink ID="fromLink" runat="server" style="text-decoration:none">[fromLink]</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style3">
                To:</td>
            <td class="style4">
                <asp:HyperLink ID="toLink" runat="server" style="text-decoration:none">[fromLink]</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Send Date:</td>
            <td>
                <asp:Label ID="sendDateLabel" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:TextBox ID="messageText" runat="server" Font-Names="Arial" Height="200px" 
        ReadOnly="True" TextMode="MultiLine" Width="612px"></asp:TextBox>
    <br />
    <br />
        <asp:Button ID="deleteButton" runat="server" onclick="deleteButton_Click" 
        Text="Delete this message" Width="141px" />
    </asp:Content>
