<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="loginBlock"> 
    <h2 style="color: #000000; text-decoration: underline; font-weight: bold;">
        Login</h2>
        <br />
    <h2 
            style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: normal;
        font-style: normal; font-variant: normal; text-transform: none; color: #000000; width: 344px;">
        Username</h2>
        <h2 
            style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: normal;
        font-style: normal; font-variant: normal; text-transform: none; color: #000000; width: 344px;">
            <asp:TextBox ID="UsernameBox" runat="server" style="margin-left: 0px"></asp:TextBox>
        <br />
        Password
        </h2>
        <h2 
            style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: normal;
        font-style: normal; font-variant: normal; text-transform: none; color: #000000; width: 344px;">
        <asp:TextBox ID="PasswordBox" runat="server" TextMode="Password" 
                style="margin-left: 0px"></asp:TextBox>
    </h2>
    <h2 style="font-family: 'Times New Roman', Times, serif; font-size: small; font-weight: normal;
        font-style: normal; font-variant: normal; text-transform: none; color: #000000;">
        Not a member? Click <a href = "MemberProfile.aspx" > here</a > to join</h2>
    <h2 style="font-family: 'Times New Roman', Times, serif; font-size: x-small; font-weight: normal;
        font-style: normal; font-variant: normal; text-transform: none; color: #000000;">
        <br />
        &nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" 
            Width="60px" />
    &nbsp;
        <asp:Button ID="backButton" runat="server" onclick="Button2_Click" 
            Text="Back" Width="60px" />
    </h2>
    <p style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: normal;
        font-style: normal; font-variant: normal; text-transform: none; color: #FF0000;"
        id="Incorrectlogin" runat="server">
        Please enter a valid username and password</p>
        <p 
            style="font-family: 'Times New Roman', Times, serif; font-size: x-large; font-weight: bold;
        font-style: normal; font-variant: normal; text-transform: none; color: #000080; line-height: normal;" 
            runat="server">
            &nbsp;</p>
        <p 
            style="font-family: 'Times New Roman', Times, serif; font-size: x-large; font-weight: bold;
        font-style: normal; font-variant: normal; text-transform: none; color: #000080; line-height: normal; width: 800px;" 
            runat="server">
            Our mission is to provide a fun and easy-to-use social networking site that 
            allows you to connect to anybody, anywhere. We provide blogs and interests to 
            facilitate discussions between friends. We hope that you find our site 
            enjoyable and accessible. </p>
</div>
</asp:Content>
