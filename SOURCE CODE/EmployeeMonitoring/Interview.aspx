<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Interview.aspx.cs" Inherits="EmployeeMonitoring.Interview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: left;
            }
        .auto-style4 {
            width: 215px;
        }
        .auto-style5 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
             <asp:HiddenField  ID="hfid" runat="server" />
            <table style="margin-top:100px; margin-left:300px" cellpadding="3" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style3" colspan="2">
                        <asp:Label ID="Label1" runat="server" ForeColor="#FF0066" Text="Candidate Interview For the Job" CssClass="auto-style5" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Apply Job</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Useremail</td>
                    <td>
                        <asp:TextBox ID="TextBoxuser" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Obtain Score</td>
                    <td>
                        <asp:TextBox ID="TextBoxobtain" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Total Score</td>
                    <td>
                        <asp:TextBox ID="TextBoxtotal" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Select For the Job</td>
                    <td>
                        <asp:CheckBoxList ID="CheckBoxListselect" runat="server">
                            <asp:ListItem>Selected</asp:ListItem>
                            <asp:ListItem>Not Selected</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Button ID="SaveButton" runat="server" OnClick="Button1_Click" Text="Save" />
                        <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click"/>
                        <asp:Button ID="ClearButton" runat="server" Text="Clear" OnClick="ClearButton_Click" />
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
             <asp:GridView style="margin-left:300px" ID="GVProject" runat="server" AutoGenerateColumns="False">
            <columns>
               <asp:BoundField DataField="Apply_Job" HeaderText="Apply_Job"/>
                <asp:BoundField DataField="UserEmail" HeaderText="UserEmail"/>
                <asp:BoundField DataField="Obtain_Score" HeaderText="Obtain_Score"/>
                <asp:BoundField DataField="Total_Score" HeaderText="Total_Score" />
                <asp:BoundField DataField="Select_For_Job" HeaderText="Select_For_Job" />
             <asp:TemplateField>
               <ItemTemplate>
                   <asp:LinkButton ID="lnkview" runat="server"   
                       CommandArgument='<%#Eval("id")%>'
                       onclick="lnk_Click">View 

                   </asp:LinkButton> 
                    
               </ItemTemplate>
           </asp:TemplateField>
        
            </columns>
        </asp:GridView>
        </div>
   </asp:Content>
