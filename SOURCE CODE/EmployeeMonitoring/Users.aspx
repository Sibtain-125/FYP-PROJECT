<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="EmployeeMonitoring.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
         <asp:HiddenField  ID="hfID" runat="server" />
    <table style= "margin-left:210px" cellpadding="2" cellspacing="3" class="auto-style1">
        <tr>
            <td colspan="2" style="text-align:center;color:brown"><h2> Employee Profiles</h2></td>
        </tr>
        <tr>
            <td class="auto-style2"> Name</td>
            <td>
                <asp:TextBox ID="NameBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="auto-style2"> User Name</td>
            <td>
                <asp:TextBox ID="UNameBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"> Email</td>
            <td>
                <asp:TextBox ID="Mailbox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"> Password</td>
            <td>
                <asp:TextBox ID="PassBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"> Confirm Password</td>
            <td>
                <asp:TextBox ID="CPassBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="auto-style2"> Contact</td>
            <td>
                <asp:TextBox ID="ContactBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"> Address</td>
            <td>
                <asp:TextBox ID="AddBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
       
        <tr>
            <td class="auto-style2"> CNIC</td>
            <td>
                <asp:TextBox ID="CNICBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"> Bank Account</td>
            <td>
                <asp:TextBox ID="Bankbox" runat="server" Width="248px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"> Designation Type</td>
            <td>
                <asp:DropDownList ID="TypeList" runat="server" Height="27px" Width="250px">
                    <asp:ListItem>Select Type</asp:ListItem>
                     <asp:ListItem>HR Team</asp:ListItem>
                     <asp:ListItem>Team Leader</asp:ListItem>
                    <asp:ListItem>Employee</asp:ListItem>                   
                    <asp:ListItem>Applicant</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
         <tr>
            <td class="auto-style2"> Status</td>
            <td>
                <asp:DropDownList ID="StatusList" runat="server" Height="27px" Width="250px">
                    <asp:ListItem>Select Type</asp:ListItem>
                     <asp:ListItem>Approved</asp:ListItem>
                     <asp:ListItem>UnApproved</asp:ListItem>
                    
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style=" background-color:coral">
                <asp:Label ID="SuccessLable" runat="server" forColor="Green">
                    </asp:Label>

            </td>
        </tr>
        <tr>
            <td colspan="2" style=" background-color:coral">
                <asp:Label ID="ErrorLable" runat="server" forColor="Red">
                    </asp:Label></td>
        </tr>
        
        <tr>
            <td colspan="2" style="background-color:coral">
                 <asp:Button ID="SaveButton" runat="server" Text="Save" Width="133px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="SaveButton_Click" />
                <asp:Button ID="DeleteButton" runat="server" Text="Delete" Width="133px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="DeleteButton_Click" CssClass="auto-style4" />
                <asp:Button ID="ClearButton" runat="server" Text="Clear" Width="133px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="ClearButton_Click" CssClass="auto-style3" />
            
             </td>
        </tr>
        
    </table>
         <asp:GridView style= "margin-left:250px" ID="GVUsers" runat="server" AutoGenerateColumns="false">
            <columns>
                <asp:BoundField DataField="Name" HeaderText="Name"/>
                <asp:BoundField DataField="UserName" HeaderText="User Name"/>
                <asp:BoundField DataField="Email" HeaderText="Email"/>
            <asp:BoundField DataField="Password" HeaderText="Password"/>
            <asp:BoundField DataField="CPassword" HeaderText="Confirm Password"/>
            <asp:BoundField DataField="Contact" HeaderText="Contact"/>
            <asp:BoundField DataField="Address" HeaderText="Address"/>
            <asp:BoundField DataField="CNIC" HeaderText="CNIC"/>
             <asp:BoundField DataField="Bank" HeaderText="Bank No"/>
             <asp:BoundField DataField="Type" HeaderText="Account Type"/>
              <asp:BoundField DataField="Status" HeaderText="Status"/>
            <asp:TemplateField>
               <ItemTemplate>
                   <asp:LinkButton ID="lnkview" runat="server"   
                       CommandArgument='<%#Eval("ID")%>'
                       onclick="lnk_Click">View 

                   </asp:LinkButton> 
                    
               </ItemTemplate>
           </asp:TemplateField>
        
            </columns>
        </asp:GridView>
    
</asp:Content>