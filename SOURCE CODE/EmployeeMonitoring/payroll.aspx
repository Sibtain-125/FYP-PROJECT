<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="payroll.aspx.cs" Inherits="EmployeeMonitoring.payroll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            width: 147px;
        }
        .auto-style4 {
            height: 23px;
            width: 147px;
        }
        .auto-style5 {
            width: 147px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="margin-left:300px;margin-top:130px">
        
       <div class="clearfix" ;></div>
    <div>
             <asp:HiddenField  ID="hfid" runat="server" />
        
        <br />
            <table class="auto-style1">
              <tr>
                    <td class="auto-style3" colspan="2">
                        <h2>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Payroll for Employee"></asp:Label>
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Employee</td>
                    <td>
                           <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>select</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                               <asp:ListItem>Team Leader</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
              
                 <tr>
                    <td class="auto-style3">Employee Work Hours</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="singleline"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Salary Type</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                         <asp:ListItem>Monthly</asp:ListItem>
                            <asp:ListItem>Hours</asp:ListItem>
                            </asp:RadioButtonList>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Salary Amount</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="singleline"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Total Days</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="singleline"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Working Days</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="singleline"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Total Hours</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="singleline"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Working Hours</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="singleline"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Total Absent</td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" TextMode="singleline"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Total Leaves</td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" TextMode="singleline"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Net Salary</td>
                    <td>
                        <asp:TextBox ID="TextBox9" runat="server" TextMode="singleline"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
            <td colspan="2" style=" background-color:coral">
                <asp:Button ID="SaveButton" runat="server" Text="Save" Width="239px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="CreateButton_Click" CssClass="auto-style3" />
                <asp:Button ID="DeleteButton" runat="server" Text="Delete" Width="239px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="DeleteButton_Click" CssClass="auto-style4" />
                <asp:Button ID="ClearButton" runat="server" Text="Clear" Width="239px" Height="36px" BackColor="#663300" BorderColor="Black" BorderStyle="Solid" ForeColor="White" OnClick="ClearButton_Click" CssClass="auto-style4" />
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
            </table>
        </div>
      <asp:GridView ID="GVProject" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                 <asp:BoundField DataField="Employee_work_hours" HeaderText="Employee_work_hours" SortExpression="Employee_work_hours" />
                
                <asp:BoundField DataField="Salary_type" HeaderText="Salary_type" SortExpression="Salary_type" />
                <asp:BoundField DataField="Salary_amount" HeaderText="Salary_amount" SortExpression="Salary_amount" />
                <asp:BoundField DataField="Total_days" HeaderText="Total_days" SortExpression="Total_days" />
                <asp:BoundField DataField="working_days" HeaderText="working_days" SortExpression="working_days" />
                <asp:BoundField DataField="Total_hours" HeaderText="Total_hours" SortExpression="Total_hours" />
                <asp:BoundField DataField="Working_hours" HeaderText="Working_hours" SortExpression="Working_hours" />
                <asp:BoundField DataField="Total_absent" HeaderText="Total_absent" SortExpression="Total_absent" />
                 <asp:BoundField DataField="Total_leaves" HeaderText="Total_leaves" SortExpression="Total_leaves" />
                 <asp:BoundField DataField="Net_salary" HeaderText="Net_salary" SortExpression="Net_salary" />
                  <asp:TemplateField>
               <ItemTemplate>
                   <asp:LinkButton ID="lnkview" runat="server"   
                       CommandArgument='<%#Eval("id")%>'
                       onclick="lnk_Click">View 

                   </asp:LinkButton> 
                    
               </ItemTemplate>
           </asp:TemplateField>
                

               
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBEM %>" DeleteCommand="DELETE FROM [Leaveapplication] WHERE [id] = @id" InsertCommand="INSERT INTO [Leaveapplication] ([Type_of_Leave], [Leave_Required_From], [Till_Date], [No_of_Days], [Purpose_of_Leave], [I_will_Report_Back_on], [Form_Submission_Date],[Status],[Leave_Status]) VALUES (@Type_of_Leave, @Leave_Required_From, @Till_Date, @No_of_Days, @Purpose_of_Leave, @I_will_Report_Back_on, @Form_Submission_Date,@Status,@Leave_Status)" SelectCommand="SELECT * FROM [Leaveapplication]" UpdateCommand="UPDATE [Leaveapplication] SET [Type_of_Leave] = @Type_of_Leave, [Leave_Required_From] = @Leave_Required_From, [Till_Date] = @Till_Date, [No_of_Days] = @No_of_Days, [Purpose_of_Leave] = @Purpose_of_Leave, [I_will_Report_Back_on] = @I_will_Report_Back_on, [Form_Submission_Date] = @Form_Submission_Date WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Type_of_Leave" Type="String" />
                <asp:Parameter DbType="Date" Name="Leave_Required_From" />
                <asp:Parameter DbType="Date" Name="Till_Date" />
                <asp:Parameter Name="No_of_Days" Type="String" />
                <asp:Parameter Name="Purpose_of_Leave" Type="String" />
                <asp:Parameter DbType="Date" Name="I_will_Report_Back_on" />
                <asp:Parameter Name="Form_Submission_Date" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Leave_Status" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type_of_Leave" Type="String" />
                <asp:Parameter DbType="Date" Name="Leave_Required_From" />
                <asp:Parameter DbType="Date" Name="Till_Date" />
                <asp:Parameter Name="No_of_Days" Type="String" />
                <asp:Parameter Name="Purpose_of_Leave" Type="String" />
                <asp:Parameter DbType="Date" Name="I_will_Report_Back_on" />
                <asp:Parameter Name="Form_Submission_Date" Type="String" />
                 <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Leave_Status" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

         </div> 


</asp:Content>
