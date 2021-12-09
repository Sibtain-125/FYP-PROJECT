<%@ Page Language="C#"  MasterPageFile="~/Admin.Master"  AutoEventWireup="true" CodeBehind="Recruitment.aspx.cs" Inherits="EmployeeMonitoring.Recruitment" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title></title>
      <style type="text/css">
        .auto-style1 {
            width: 100%;
            /*background-color:cornsilk;*/
            height: 50px;
        }
        .auto-style2 {
            width: 313px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style4 {
            margin-left: 35px;
        }
    </style>
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
       <div style="margin-left:300px;margin-top:130px">
             <asp:HiddenField  ID="hfID" runat="server" />
    <table cellpadding="2" cellspacing="3" class="auto-style1">
        <tr>
            <td colspan="2" style="text-align:left;color:brown"><h2>Add New Job</h2></td>
        </tr>
         <tr>
            <td class="auto-style2">Job Title</td>
            <td>
                <asp:TextBox ID="NameTextBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Business Name</td>
            <td>
                <asp:TextBox ID="BusinessTextBox" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"> Job Description</td>
            <td>
                <asp:TextBox ID="DiscTextBox0"   runat="server" Width="250px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Job Criteria</td>
            <td>
                <asp:TextBox ID="JobTextBox0" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
         
        <%--<tr>
            <td class="auto-style2">Account Type</td>
            <td>
                <asp:DropDownList ID="TypeList" runat="server" Height="27px" Width="250px">
                    <asp:ListItem>Select Type</asp:ListItem>
                     <asp:ListItem>HR</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                   <asp:ListItem>Employee</asp:ListItem>
                    <asp:ListItem>Team Leader</asp:ListItem>
                    <asp:ListItem>Applicant</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>--%>
        <tr>
            <td class="auto-style2">Salary Type</td>
            <td>
                <asp:DropDownList ID="DropDownListsalary" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>per Month</asp:ListItem>
                     <asp:ListItem>per Hours</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
         
        <tr>
            <td class="auto-style2">Minimum Salary</td>
            <td>
                <asp:TextBox ID="minimumTextBox0" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
         
        <tr>
            <td class="auto-style2">Maximum Salary</td>
            <td>
                <asp:TextBox ID="maximumTextBox1" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
         
        <tr>
            <td class="auto-style2">Work Location</td>
            <td>
                <asp:TextBox ID="locationTextBox1" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
         
        <tr>
            <td class="auto-style2">Job Type</td>
            <td>
                <asp:DropDownList ID="DropDownListjob" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Full Time</asp:ListItem>
                    <asp:ListItem>Part Time</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
         
        <tr>
            <td class="auto-style2">No of Vacancies</td>
            <td>
                <asp:TextBox ID="TextBoxVacancies" runat="server"></asp:TextBox>
            </td>
        </tr>
         
        <tr>
            <td colspan="2" style=" background-color:coral">
                <asp:Button ID="SaveButton" runat="server" Text="Save" Width="239px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="CreateButton_Click" CssClass="auto-style3" />
                <asp:Button ID="DeleteButton" runat="server" Text="Delete" Width="239px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="DeleteButton_Click" CssClass="auto-style4" />
                <asp:Button ID="ClearButton" runat="server" Text="Clear" Width="239px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="ClearButton_Click" CssClass="auto-style4" />
            </td>
        </tr>
        <%-- <tr>
            <td colspan="2" style="text-align:center; color:blue">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Click Here to Register</asp:LinkButton>
            </td>
        </tr>--%>
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
        </table>
        <asp:GridView ID="GVProject" runat="server" AutoGenerateColumns="False">
            <columns>
                <asp:BoundField DataField="Job_Title" HeaderText="Job_Title"/>
                <asp:BoundField DataField="Business_Name" HeaderText="Business_Name"/>
            <asp:BoundField DataField="Job_Description" HeaderText="Job_Description"/>
                <asp:BoundField DataField="Job_Criteria" HeaderText="Job_Criteria" />
                <asp:BoundField DataField="Salary_Type" HeaderText="Salary_Type" />
                <asp:BoundField DataField="Minimum_Salary" HeaderText="Minimum_Salary" />
                <asp:BoundField DataField="Maximum_Salary" HeaderText="Maximum_Salary" />
                <asp:BoundField DataField="Work_Location" HeaderText="Work_Location" />
                <asp:BoundField DataField="Job_Type" HeaderText="Job_Type" />
                 <asp:BoundField DataField="No_of_Vacancies" HeaderText="No_of_Vacancies" />
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
        </div>
     </asp:Content>
