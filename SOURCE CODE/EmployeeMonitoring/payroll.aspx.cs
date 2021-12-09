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
    public partial class payroll : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DeleteButton.Enabled = false;
            }
            Fillgrid();

        }
        protected void CreateButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand sqlcmd = new SqlCommand("employeepayrollCreateOrUpdate", con);
            sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@id", (hfid.Value == "" ? 0 : Convert.ToInt32(hfid.Value)));
            sqlcmd.Parameters.AddWithValue("@Employee_work_hours", TextBox1.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Salary_type", RadioButtonList1.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Salary_amount", TextBox2.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Total_days", TextBox3.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@working_days", TextBox4.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Total_hours", TextBox5.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Working_hours", TextBox6.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Total_absent", TextBox7.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Total_leaves", TextBox8.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Net_salary", TextBox9.Text.Trim());
            sqlcmd.ExecuteNonQuery();
          
            con.Close();
            Clear();
            string employeepayrollID = hfid.Value;
            if (employeepayrollID == "")
            {
                SuccessLable.Text = "Saved Successfully";
                //Session["status"] = StatusDownList.Text;
            }
            else
            {
                SuccessLable.Text = "Updated Successfully";
                //Session["status"] = StatusDownList.Text;
            }
            Fillgrid();
            //Session["status"] = StatusDownList.Text;
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            hfid.Value = "";
            TextBox1.Text =
            RadioButtonList1.Text =
            TextBox2.Text =
            TextBox3.Text =
             TextBox4.Text =
              TextBox5.Text =
               TextBox6.Text =
                TextBox7.Text =
                 TextBox8.Text =
                  TextBox9.Text =
            SuccessLable.Text =
            ErrorLable.Text = "";
            SaveButton.Text = "Save";
            DeleteButton.Enabled = false;

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand("employeepayrollDeletebyID", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(hfid.Value));
            cmd.ExecuteNonQuery();
            con.Close();
            Clear();
            Fillgrid();
            //ErrorLabel.Text = "Account Successfully Deleted";
        }
        public void Fillgrid()
        {
            SqlConnection con = new SqlConnection(cs);

            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("employeepayrollViewAll", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            GVProject.DataSource = dtbl;
            GVProject.DataBind();

        }

        protected void lnk_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("employeepayrollViewbyID", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@id", ID);

            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            hfid.Value = ID.ToString();
            TextBox1.Text = dtbl.Rows[0]["Employee_work_hours"].ToString();
            RadioButtonList1.Text = dtbl.Rows[0]["Salary_type"].ToString();
            TextBox2.Text = dtbl.Rows[0]["Salary_amount"].ToString();
            TextBox3.Text = dtbl.Rows[0]["Total_days"].ToString();
            TextBox4.Text = dtbl.Rows[0]["working_days"].ToString();
            TextBox5.Text = dtbl.Rows[0]["Total_hours"].ToString();
            TextBox6.Text = dtbl.Rows[0]["Working_hours"].ToString();
            TextBox7.Text = dtbl.Rows[0]["Total_absent"].ToString();
            TextBox8.Text = dtbl.Rows[0]["Total_leaves"].ToString();
            TextBox9.Text = dtbl.Rows[0]["Net_salary"].ToString();

            SaveButton.Text = "Update";
            DeleteButton.Enabled = true;
            SaveButton.Enabled = true;

        }
    }

}
    
