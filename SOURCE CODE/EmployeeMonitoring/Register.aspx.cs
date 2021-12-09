using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace EmployeeMonitoring
{
    public partial class Register : System.Web.UI.Page
    {
        Connection objCS = new Connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
           
            SqlConnection con = new SqlConnection(objCS.Conn()); con = objCS.conOpen();
            string query = "insert into Users(Name, UserName, Email, Password, Contact, Address, CNIC, Bank, Type, Status) values(@Name, @UserName, @Email, @Password, @Contact, @Address, @CNIC, @Bank, @Type, @Status)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@UserName", txtUName.Text);
            cmd.Parameters.AddWithValue("@Email", txtMail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPass.Text);
            cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@CNIC", txtCNIC.Text);
            cmd.Parameters.AddWithValue("@Bank", txtBAccount.Text);
            cmd.Parameters.AddWithValue("@Type", TypeList.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Status", "Active");

            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {

                ClientScript.RegisterStartupScript(typeof(Page), "Script", "alert('Signup Successfully " + txtUName.Text + " ');", true);
                Response.Redirect("Login.aspx");
                //ClearControls();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Signup Failed !!')</script>");




            }



            objCS.conClose();
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}