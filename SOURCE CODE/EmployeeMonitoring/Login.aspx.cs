using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace EmployeeMonitoring
{
    public partial class Login : System.Web.UI.Page
    {
        Connection objCS = new Connection();
        //string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(objCS.Conn()); con = objCS.conOpen();
            //SqlConnection con = new SqlConnection(cs);
            string q = "Select * from users where Email = @Mail and Password = @Pass and Type=@Type";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.Parameters.AddWithValue("@Mail", MailTextBox.Text);
            cmd.Parameters.AddWithValue("@Pass", PassTextBox.Text);
            cmd.Parameters.AddWithValue("@Type", TypeList.SelectedItem.Value); ;
           
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Session["Email"] = MailTextBox.Text;
                Session["Type"] = TypeList.SelectedItem.Value;
                Response.Redirect("AdminDB.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed')</script>");
            }
            con.Close();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}