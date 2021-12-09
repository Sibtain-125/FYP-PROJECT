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
    public partial class Project : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
            SqlCommand sqlcmd = new SqlCommand("ProjectCreateOrUpdate", con);
            sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ID", (hfID.Value == "" ? 0 : Convert.ToInt32(hfID.Value)));
            sqlcmd.Parameters.AddWithValue("@pname", NameTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@date", DeadTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@cost", CostTextBox.Text.Trim()); 
            sqlcmd.Parameters.AddWithValue("@Disc", DiscTextBox.Text.Trim());
            sqlcmd.ExecuteNonQuery();
            con.Close();
            Clear();
            string AccountID = hfID.Value;
            if (AccountID == "")
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
            hfID.Value="";
            NameTextBox.Text =  
            DeadTextBox.Text =  
            CostTextBox.Text =  
            DiscTextBox.Text = 
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
            SqlCommand cmd = new SqlCommand("ProjectDeletebyID", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(hfID.Value));
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
            SqlDataAdapter sqlda = new SqlDataAdapter("ProjectViewAll", con);
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
            if ( con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("ProjectViewbyID", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@ID", ID);

            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            hfID.Value = ID.ToString();
            NameTextBox.Text = dtbl.Rows[0]["Name"].ToString();
            CostTextBox.Text = dtbl.Rows[0]["Cost"].ToString();
            DeadTextBox.Text = dtbl.Rows[0]["Date"].ToString();
            DiscTextBox.Text = dtbl.Rows[0]["Discription"].ToString();
            SaveButton.Text = "Update";
            DeleteButton.Enabled = true;
            SaveButton.Enabled = true;
             
        }
    }
    
}