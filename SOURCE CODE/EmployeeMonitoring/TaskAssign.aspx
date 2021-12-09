<%@ Page Language="C#"  MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TaskAssign.aspx.cs" Inherits="EmployeeMonitoring.TeamAssign" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
           /* background-color:cornsilk;*/
            height: 50px;
        }
        .auto-style2 {
            width: 200px;
        }
        .auto-style3 {
            margin-left: 34px;
        }
        .auto-style4 {
            margin-left: 37px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:300px;margin-top:130px">
     <asp:HiddenField  ID="hfID" runat="server" />
    <table cellpadding="2" cellspacing="3" class="auto-style1">
        <tr>
            <td colspan="2" style="text-align:left;color:brown"><h2>Assign Task</h2></td>
        </tr>
        <tr>
            <td class="auto-style2">Task Name</td>
            <td>
                <asp:TextBox ID="TaskTextBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Project</td>
            <td>
                <asp:DropDownList ID="ProjectList" runat="server" Height="27px" Width="250px">
                    <asp:ListItem>Select Type</asp:ListItem>
                    <asp:ListItem>Employee</asp:ListItem>
                    <asp:ListItem>Team Leader</asp:ListItem>
                    <asp:ListItem>Applicant</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Team Member</td>
            <td>
                <asp:DropDownList ID="MemberList" runat="server" Height="27px" Width="250px">
                    <asp:ListItem>Select Type</asp:ListItem>
                    <asp:ListItem>Employee</asp:ListItem>
                    <asp:ListItem>Team Leader</asp:ListItem>
                    <asp:ListItem>Applicant</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
          <tr>
            <td class="auto-style2">Deadline</td>
            <td>
                <asp:TextBox ID="DeadTextBox" runat="server" Width="250px" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
          <tr>
            <td class="auto-style2">Discription</td>
            <td>
                <asp:TextBox ID="DiscTextBox" runat="server" Width="250px" TextMode="MultiLine"></asp:TextBox>
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
        <asp:GridView ID="GVTask" runat="server" AutoGenerateColumns="false">
            <columns>
                <asp:BoundField DataField="Name" HeaderText="TaskName"/>
                <asp:BoundField DataField="Member" HeaderText="Team Member"/>
                <asp:BoundField DataField="Date" HeaderText="DeadLine"/>
            <asp:BoundField DataField="Discription" HeaderText="Discrition"/>
           
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
