<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="EmployeeMonitoring.Leave" %>

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
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Apply for Leave"></asp:Label>
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">UserEmail</td>
                    <td>
                        <asp:TextBox ID="TextBoxuser" runat="server"></asp:TextBox>
                    </td>
                </tr>
              
                <tr>
                    <td class="auto-style3">Type of&nbsp; Leave</td>
                    <td>
                        <asp:DropDownList ID="DropDownListtype" runat="server">
                            <asp:ListItem>select</asp:ListItem>
                            <asp:ListItem>Casual Leave</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Leave Required From</td>
                    <td>
                        <asp:TextBox ID="TextBoxleaver" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">To</td>
                    <td>
                        <asp:TextBox ID="TextBoxto" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">No. of Days</td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="DropDownListdays" runat="server">
                            <asp:ListItem>select</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Purpose of Leave</td>
                    <td>
                        <asp:TextBox ID="TextBoxpleave" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">I will report back on</td>
                    <td>
                        <asp:TextBox ID="TextBoxreport" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                  <tr>
                    <td class="auto-style4">Form Submission Date</td>
                    <td class="auto-style2">
                      <asp:TextBox ID="TextBoxsubmission" runat="server" TextMode="DateTime"></asp:TextBox>
                    </td>
                </tr>
                  <tr>
                    <td class="auto-style4">Status</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDownListstatus" runat="server">
                            <asp:ListItem>select</asp:ListItem>
                            <asp:ListItem>Approve</asp:ListItem>
                            <asp:ListItem>Disapprove</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                  <tr>
                    <td class="auto-style4">Leave_Status</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDownListlstatus" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Paid</asp:ListItem>
                            <asp:ListItem>Unpaid</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" />
                    </td>
                </tr>
            </table>
        </div>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="auto-style7" Width="768px">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                 <asp:BoundField DataField="UserEmail" HeaderText="UserEmail" SortExpression="UserEmail" />
                <asp:BoundField DataField="Type_of_Leave" HeaderText="Type_of_Leave" SortExpression="Type_of_Leave" />
                <asp:BoundField DataField="Leave_Required_From" HeaderText="Leave_Required_From" SortExpression="Leave_Required_From" />
                <asp:BoundField DataField="Till_Date" HeaderText="Till_Date" SortExpression="Till_Date" />
                <asp:BoundField DataField="No_of_Days" HeaderText="No_of_Days" SortExpression="No_of_Days" />
                <asp:BoundField DataField="Purpose_of_Leave" HeaderText="Purpose_of_Leave" SortExpression="Purpose_of_Leave" />
                <asp:BoundField DataField="I_will_Report_Back_on" HeaderText="I_will_Report_Back_on" SortExpression="I_will_Report_Back_on" />
                <asp:BoundField DataField="Form_Submission_Date" HeaderText="Form_Submission_Date" SortExpression="Form_Submission_Date" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                 <asp:BoundField DataField="Leave_Status" HeaderText="Leave_Status" SortExpression="Leave_Status" />
                <asp:TemplateField HeaderText="Operation">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update">Update</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
               <asp:TemplateField>
               <ItemTemplate>
               <asp:LinkButton ID="lnkview" runat="server"   
                    CommandArgument='<%#Eval("id")%>'
                     onclick="lnk_Click">Approve 
                  </asp:LinkButton> 
              </ItemTemplate>
             </asp:TemplateField>
                <asp:TemplateField>
                  <ItemTemplate>
                   <asp:LinkButton ID="lnkview1" runat="server"   
                       CommandArgument='<%#Eval("id")%>'
                       onclick="lnk1_Click">DisApprove 
                   </asp:LinkButton>                   
               </ItemTemplate>
           </asp:TemplateField>
                     <asp:TemplateField>
                  <ItemTemplate>
                   <asp:LinkButton ID="lnkview2" runat="server"   
                       CommandArgument='<%#Eval("id")%>'
                       onclick="lnk2_Click">Paid 
                   </asp:LinkButton>                   
               </ItemTemplate>
           </asp:TemplateField>
                  <asp:TemplateField>
                  <ItemTemplate>
                   <asp:LinkButton ID="lnkview3" runat="server"   
                       CommandArgument='<%#Eval("id")%>'
                       onclick="lnk3_Click">UnPaid 
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
