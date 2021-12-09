<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EmployeeMonitoring.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color:cornsilk;
            height: 259px;
        }
        .auto-style2 {
            width: 313px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="2" cellspacing="3" class="auto-style1">
        <tr>
            <td colspan="2" style="text-align:center;color:brown"><h2>Welcome to Employee Monitoring</h2></td>
        </tr>
         <tr>
            <td class="auto-style2">Email</td>
            <td>
                <asp:TextBox ID="MailTextBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Password</td>
            <td>
                <asp:TextBox ID="PassTextBox" type="Password" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
         
        <tr>
            <td class="auto-style2">Account Type</td>
            <td>
                <asp:DropDownList ID="TypeList" runat="server" Height="27px" Width="250px">
                    <asp:ListItem>Select Type</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                     <asp:ListItem>HR Team</asp:ListItem>
                     <asp:ListItem>Team Leader</asp:ListItem>
                    <asp:ListItem>Employee</asp:ListItem>                   
                    <asp:ListItem>Applicant</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;background-color:coral">
                <asp:Button ID="LoginButton" runat="server" Text="Login" Width="239px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="LoginButton_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center; color:blue">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Click Here to Register</asp:LinkButton>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
