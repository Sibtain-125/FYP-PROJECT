<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EmpTask.aspx.cs" Inherits="EmployeeMonitoring.EmpTask" %>
 
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
