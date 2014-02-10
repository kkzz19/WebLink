<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="MemberProfile.aspx.cs"
    Inherits="MemberProfile" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 198px;
        }
        .style2
        {
            width: 165px;
            height: 29px;
        }<a href="MemberProfile.aspx">MemberProfile.aspx</a>
        .style3
        {
            height: 29px;
        }
        .style4
        {
        width: 165px;
        height: 29px;
    }
        .style5
        {
            height: 29px;
            width: 373px;
        }
        .style6
        {
            height: 29px;
            width: 373px;
        }
        .style7
        {
            width: 165px;
            height: 58px;
        }
        .style8
        {
            height: 58px;
        }
    .style9
    {
            width: 165px;
        }
        .style10
        {
            height: 29px;
            width: 49px;
        }
        .style11
        {
            width: 132px;
        }
        .style12
        {
            height: 29px;
            width: 49px;
        }
        .style14
        {
            width: 49px;
        }
        .style15
        {
            width: 165px;
            height: 29px;
        }
        .style16
        {
            height: 29px;
            width: 373px;
        }
        .style17
        {
            width: 373px;
        }
        .style18
        {
            width: 165px;
            height: 24px;
        }
        .style19
        {
            width: 49px;
            height: 24px;
        }
        .style20
        {
            width: 373px;
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <asp:Label ID="tableTitle" runat="server" Text="Enter in data fields. An asterisk indicates a required field."
        Font-Bold="True" Font-Size="Large"></asp:Label>
    &nbsp;<table style="width: 800px; margin-right: 0px;">
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="userNameLabel" runat="server" Text="User Name*"></asp:Label>
            </td>
            <td align="left" class="style10">
                <asp:TextBox ID="userNameBox" runat="server" Height="20px" Width="120px" Style="vertical-align: top;"
                    MaxLength="20"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                <asp:Label ID="usernameTakenLabel" runat="server" ForeColor="Red"></asp:Label>
                <asp:RequiredFieldValidator ID="userNameValidator" runat="server" ControlToValidate="userNameBox"
                    ErrorMessage="Enter in user name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                First Name<asp:Label ID="a2" runat="server" Text="*"></asp:Label>
            </td>
            <td align="left" class="style10">
                <asp:TextBox ID="firstNameBox" runat="server" Height="20px" Width="120px"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="firstNameBox"
                    ErrorMessage="Enter in first name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                Middle Initial
            </td>
            <td align="left" class="style14">
                <asp:TextBox ID="middleInitialBox" runat="server" Height="20px" Width="120px" MaxLength="1"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style18" align="left">
                Last Name<asp:Label ID="a3" runat="server" Text="*"></asp:Label>
            </td>
            <td id="lastNameBox" align="left" class="style19">
                <asp:TextBox ID="lastNameBox" runat="server" Height="20px" Width="120px" MaxLength="20"></asp:TextBox>
            </td>
            <td id="lastNameBox" align="left" class="style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="lastNameBox"
                    ErrorMessage="Enter in last name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9" align="left">
                Address
            </td>
            <td align="left" class="style14">
                <asp:TextBox ID="addressBox" runat="server" Height="20px" Width="120px" MaxLength="30"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                City
            </td>
            <td align="left" class="style10">
                <asp:TextBox ID="cityBox" runat="server" Height="20px" Width="120px" MaxLength="30"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style9" align="left">
                Region/State<asp:Label ID="a4" runat="server" Text="*"></asp:Label>
            </td>
            <td align="left" class="style14">
                <asp:TextBox ID="regionBox" runat="server" Height="20px" Width="120px" MaxLength="30"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="regionBox"
                    ErrorMessage="Enter in region/state" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9" align="left">
                Postal code<asp:Label ID="a5" runat="server" Text="*"></asp:Label>
            </td>
            <td align="left" class="style14">
                <asp:TextBox ID="postalBox" runat="server" Height="20px" Width="120px" MaxLength="30"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="postalBox"
                    Display="Dynamic" ErrorMessage="Enter in postal code" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style15" align="left">
                Country<asp:Label ID="a6" runat="server" Text="*"></asp:Label>
            </td>
            <td align="left" class="style12">
                <asp:TextBox ID="countryBox" runat="server" Height="20px" Width="120px" MaxLength="25"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="countryBox"
                    ErrorMessage="Enter in country" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                Home Phone
            </td>
            <td align="left" class="style10">
                <asp:TextBox ID="homePhone1" runat="server" Width="120px" Height="20px" MaxLength="20"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="homePhone1"
                    Display="Dynamic" ErrorMessage="Enter in valid home phone number" ForeColor="Red"
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style9" align="left">
                Work Phone
            </td>
            <td align="left" class="style14">
                <asp:TextBox ID="workPhone1" runat="server" Width="120px" Height="20px" MaxLength="20"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="workPhone1"
                    Display="Dynamic" ErrorMessage="Enter in valid work phone number" ForeColor="Red"
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                Cell Phone
            </td>
            <td align="left" class="style14">
                <asp:TextBox ID="cellPhone1" runat="server" Width="120px" Height="20px" MaxLength="20"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="cellPhone1"
                    Display="Dynamic" ErrorMessage="Enter in valid cell phone number" ForeColor="Red"
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style15" align="left">
                Email Address<asp:Label ID="a7" runat="server" Text="*"></asp:Label>
            </td>
            <td align="left" class="style12">
                <asp:TextBox ID="emailBox" runat="server" Height="20px" Width="120px" MaxLength="50"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="emailBox"
                    Display="Dynamic" ErrorMessage="Enter in valid email address" ForeColor="Red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="emailBox"
                    Display="Dynamic" ErrorMessage="Enter in email address" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9" align="left">
                Gender<asp:Label ID="a8" runat="server" Text="*"></asp:Label>
            </td>
            <td align="left" class="style11" colspan="2">
                <asp:RadioButtonList ID="genderSelect" runat="server" Width="189px">
                    <asp:ListItem Value="0">Male</asp:ListItem>
                    <asp:ListItem Value="1">Female</asp:ListItem>
                    <asp:ListItem Value="2">Prefer not to specify</asp:ListItem>
                </asp:RadioButtonList>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="genderSelect"
                    ErrorMessage="Select a gender" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                Date of birth
            </td>
            <td align="left" colspan="2">
                <asp:DropDownList ID="monthDropDown" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="dayDropDown" runat="server">
                </asp:DropDownList>
                <asp:DropDownList ID="yearDropDown" runat="server">
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Label ID="errorDate" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7" align="left">
                Check this if you would like to receive email from our website<asp:Label ID="a9"
                    runat="server" Text="*"></asp:Label>
            </td>
            <td align="left" colspan="2">
                <asp:CheckBox ID="spamCheckBox" runat="server" Text="Check here" Checked="True" />
            </td>
            <td align="left" class="style8">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style15" align="left">
                Membership Level<asp:Label ID="a10" runat="server" Text="*"></asp:Label>
            </td>
            <td align="left" class="style12">
                <asp:DropDownList ID="membershipBox" runat="server">
                    <asp:ListItem>Guest</asp:ListItem>
                    <asp:ListItem>Bronze</asp:ListItem>
                    <asp:ListItem>Silver</asp:ListItem>
                    <asp:ListItem>Gold</asp:ListItem>
                    <asp:ListItem>Platinum</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="left" class="style5">
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <table style="width: auto; margin-right: 0px;">
        <tr>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="submitButton" runat="server" Font-Bold="True" Font-Size="Large" Text="Next"
        OnClick="submitButton_Click" CausesValidation="False" EnableTheming="True" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="cancelButton" runat="server" Font-Bold="True" Font-Size="Large" Font-Strikeout="False"
        OnClick="cancelButton_Click" Text="Cancel" CausesValidation="False" />
    <br />
    <asp:Label ID="errorLabel" runat="server" Visible="False" ForeColor="Red" EnableViewState="False">Errors in submission</asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />
    </asp:Content>
