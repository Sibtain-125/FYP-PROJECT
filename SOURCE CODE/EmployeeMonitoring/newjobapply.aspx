<%@ Page Title="" Language="C#"  MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="newjobapply.aspx.cs" Inherits="EmployeeMonitoring.newjobapply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 192px;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            width: 192px;
            height: 32px;
        }
        .auto-style5 {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="margin-left:300px;margin-top:130px">
        <div>
             <asp:HiddenField  ID="hfid" runat="server" />
            <table style="margin-left:100px;margin-top:50px" cellpadding="3" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style3" colspan="2">
                        <h2>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Apply For New Job"></asp:Label>
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Useremail</td>
                    <td>
                        <asp:TextBox ID="TextBoxuser" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Available Jobs</td>
                    <td>
                        <asp:DropDownList ID="DropDownListavailable" runat="server">
                            <asp:ListItem>Select Job</asp:ListItem>
                            <asp:ListItem>HR Manager</asp:ListItem>
                            <asp:ListItem>Computer Assisstant</asp:ListItem>
                            <asp:ListItem>Accountant</asp:ListItem>
                            <asp:ListItem>Network Engineer</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Cover Title</td>
                    <td>
                        <asp:TextBox ID="TextBoxcover" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Expected Salary</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBoxexpected" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Clear" />
                    </td>
                </tr>
            </table>




        </div>
        <asp:GridView style="margin-left:100px" ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="828px" Height="320px">
                <columns>
                <asp:BoundField DataField="UserEmail" HeaderText="UserEmail"/>
                <asp:BoundField DataField="Available_Job" HeaderText="Available_Job"/>
                <asp:BoundField DataField="Cover_Title" HeaderText="Cover_Title"/>
                <asp:BoundField DataField="Expected_Salary" HeaderText="Expected_Salary" />
             <asp:TemplateField>
           </asp:TemplateField>
        
            </columns>
        </asp:GridView>
   </div>
</asp:Content>
