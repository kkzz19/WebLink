<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Mortgage.aspx.cs" Inherits="Mortgage" MasterPageFile="~/Site.master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

        .style5
        {
            width: 630px;
        }

    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <table style="width:800px;">
    <asp:Label ID="Label1" runat="server" Text="Mortgage Calculator" 
        Font-Bold="True" Font-Size="X-Large"></asp:Label>
        
        <tr>
            <td>
                Principle </td>
            <td valign="middle" class="style5">
                <asp:TextBox ID="principleBox" runat="server"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="principleBox" Display="Dynamic" 
                    ErrorMessage="Enter in principle" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="principleBox" Display="Dynamic" 
                    ErrorMessage="Principle must be a number greater than or equal to zero" 
                    ForeColor="Red" MaximumValue="2000000000" MinimumValue="0" Type="Double"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                Rate</td>
            <td class="style5">
                <asp:TextBox ID="rateBox" runat="server"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="rateBox" Display="Dynamic" ErrorMessage="Enter in rate" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                    ControlToValidate="rateBox" Display="Dynamic" 
                    ErrorMessage="Rate must be between 0 and 100" ForeColor="Red" 
                    MaximumValue="100" MinimumValue="0" Type="Double"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                Number of Payments</td>
            <td class="style5">
                <asp:TextBox ID="paymentNumBox" runat="server"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="paymentNumBox" Display="Dynamic" 
                    ErrorMessage="Enter in number of payments" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator3" runat="server" 
                    ControlToValidate="paymentNumBox" Display="Dynamic" 
                    ErrorMessage="Number of payments must be a positive, non-zero integer number" 
                    ForeColor="Red" MaximumValue="2000000000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
    </table>
    <br/>
    &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Submit" 
        onclick="Button1_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="backButton" runat="server" onclick="backButton_Click" 
        Text="Back" CausesValidation="False" />
    <br/>
    <br/>
    <asp:Label ID="monthlyPaymentLabel1" runat="server" Text="Monthly Payment:" 
        Visible="False" Font-Bold="True"></asp:Label>
&nbsp;
    <asp:Label ID="monthlyPaymentLabel2" runat="server" Visible="False" 
        Font-Bold="True"></asp:Label>
</asp:Content>