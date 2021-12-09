using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Leave : System.Web.UI.Page
{

    string cs = ConfigurationManager.ConnectionStrings["DBME"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GridView1_SelectedIndexChanged(GridView1, EventArgs.Empty);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con=new SqlConnection(cs);
        string q = "insert into Leaveapplication(Type_of_Leave,Leave_Required_From,Till_Date,No_of_Days,Purpose_of_Leave,I_will_Report_Back_on,Form_Submission_Date,Status)values(@TypeofLeave,@LeaveRequiredFrom,@Till_Date,@NoofDays,@PurposeofLeave,@ReportBack,@SubmitDate,@Status1)";

        SqlCommand cmd=new SqlCommand(q,con);
        cmd.Parameters.AddWithValue("@TypeofLeave", DropDownListtype.Text);
        cmd.Parameters.AddWithValue("@LeaveRequiredFrom", TextBoxleaver.Text);
        cmd.Parameters.AddWithValue("@Till_Date", TextBoxto.Text);
        cmd.Parameters.AddWithValue("@NoofDays", DropDownListdays.Text);
        cmd.Parameters.AddWithValue("@PurposeofLeave", TextBoxpleave.Text);
        cmd.Parameters.AddWithValue("@ReportBack", TextBoxreport.Text);
        cmd.Parameters.AddWithValue("@SubmitDate",TextBoxsubmission.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView1_SelectedIndexChanged(GridView1,EventArgs.Empty);
        con.Close();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cs);
        string qq = "select * from Leaveapplication";
        SqlCommand cmd=new SqlCommand(qq,con);
        SqlDataAdapter dt=new SqlDataAdapter(cmd);
        DataTable td = new DataTable();
        dt.Fill(td);
        GridView1.DataBind();
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}