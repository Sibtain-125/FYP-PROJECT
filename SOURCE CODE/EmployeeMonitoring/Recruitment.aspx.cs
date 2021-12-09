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
    public partial class Recruitment : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                if (!IsPostBack)
                {
                    DeleteButton.Enabled = false;
                }
                Fillgrid();
            }

        }

        protected void CreateButton_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(cs);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand sqlcmd = new SqlCommand("RecruitmentCreateOrUpdate", con);
            sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ID", (hfID.Value == "" ? 0 : Convert.ToInt32(hfID.Value)));
            sqlcmd.Parameters.AddWithValue("@jobtitle", NameTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@BusinessName", BusinessTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@jobDescription", DiscTextBox0.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@JobCriteria", JobTextBox0.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@SalaryType", DropDownListsalary.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@MinimumSalary", minimumTextBox0.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@MaximumSalary", maximumTextBox1.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@WorkLocation", locationTextBox1.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@JobType", DropDownListjob.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@NoofVacancies", TextBoxVacancies.Text.Trim());
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
            hfID.Value = "";
            NameTextBox.Text = "";
            BusinessTextBox.Text = "";
            DiscTextBox0.Text = "";
            JobTextBox0.Text = "";
            DropDownListsalary.Text = "";
            minimumTextBox0.Text = "";
            maximumTextBox1.Text = "";
            locationTextBox1.Text = "";
            DropDownListjob.Text = "";
            SaveButton.Text = "Save";
            DeleteButton.Enabled = false;
            SuccessLable.Text = "";
            // ErrorLable.Text = "";
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand("RecruitmentDeletebyID", con);
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
            SqlDataAdapter sqlda = new SqlDataAdapter("RecruitmentViewAll", con);
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
            SqlDataAdapter sqlda = new SqlDataAdapter("RecruitmentViewbyID", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@ID", ID);

            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            hfID.Value = ID.ToString();
            NameTextBox.Text = dtbl.Rows[0]["Job_Title"].ToString();
            BusinessTextBox.Text = dtbl.Rows[0]["Business_Name"].ToString();
            DiscTextBox0.Text = dtbl.Rows[0]["Job_Description"].ToString();
            JobTextBox0.Text = dtbl.Rows[0]["Job_Criteria"].ToString();
            DropDownListsalary.Text = dtbl.Rows[0]["Salary_Type"].ToString();
            minimumTextBox0.Text = dtbl.Rows[0]["Minimum_Salary"].ToString();
            maximumTextBox1.Text = dtbl.Rows[0]["Maximum_Salary"].ToString();
            locationTextBox1.Text = dtbl.Rows[0]["Work_Location"].ToString();
            DropDownListjob.Text = dtbl.Rows[0]["Job_Type"].ToString();
            TextBoxVacancies.Text= dtbl.Rows[0]["No_of_Vacancies"].ToString();
            SaveButton.Text = "Update";
            DeleteButton.Enabled = true;
            SaveButton.Enabled = true;
        }
    }
}