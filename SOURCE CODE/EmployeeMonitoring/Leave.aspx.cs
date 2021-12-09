using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeMonitoring
{
    public partial class Leave : System.Web.UI.Page
    {
        Connection objCS = new Connection();
       // string cs = ConfigurationManager.ConnectionStrings["DBME"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxsubmission.Text = System.DateTime.Now.ToString();
            if (!IsPostBack)
            {
                this.GridView1_SelectedIndexChanged(GridView1, EventArgs.Empty);
            }
            string email = "";
            if (Session["Email"] != null)
                email = Session["Email"].ToString();
            TextBoxuser.Text = email;
            

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(objCS.Conn()); con = objCS.conOpen();
            string q = "insert into Leaveapplication(UserEmail,Type_of_Leave,Leave_Required_From,Till_Date,No_of_Days,Purpose_of_Leave,I_will_Report_Back_on,Form_Submission_Date,Status,Leave_Status)values(@UserEmail,@TypeofLeave,@LeaveRequiredFrom,@Till_Date,@NoofDays,@PurposeofLeave,@ReportBack,@SubmitDate,@Status,@Leave_Status)";

            SqlCommand cmd = new SqlCommand(q, con);
            string email="";
            if (Session["Email"] != null)
                
                email = Session["Email"].ToString();
            
            cmd.Parameters.AddWithValue("@UserEmail", email);
            cmd.Parameters.AddWithValue("@TypeofLeave", DropDownListtype.Text);
            cmd.Parameters.AddWithValue("@LeaveRequiredFrom", TextBoxleaver.Text);
            cmd.Parameters.AddWithValue("@Till_Date", TextBoxto.Text);
            cmd.Parameters.AddWithValue("@NoofDays", DropDownListdays.Text);
            cmd.Parameters.AddWithValue("@PurposeofLeave", TextBoxpleave.Text);
            cmd.Parameters.AddWithValue("@ReportBack", TextBoxreport.Text);
            cmd.Parameters.AddWithValue("@SubmitDate", TextBoxsubmission.Text);
            cmd.Parameters.AddWithValue("@Status", "");
            cmd.Parameters.AddWithValue("@Leave_Status", "");

            cmd.ExecuteNonQuery();
            GridView1_SelectedIndexChanged(GridView1, EventArgs.Empty);
            objCS.conClose();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(objCS.Conn()); con = objCS.conOpen();
            string qq = "select * from Leaveapplication";
            SqlCommand cmd = new SqlCommand(qq, con);
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            DataTable td = new DataTable();
            dt.Fill(td);
            GridView1.DataBind();
           
            cmd.ExecuteNonQuery();
            objCS.conClose();
        }

        protected void lnk_Click(object sender, EventArgs e)
        {
           
            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            string status = "Approve";
            ChangeStatus(ID,status);

        }
        protected void lnk1_Click(object sender, EventArgs e)
        {

            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            string status = "DisApprove";
            ChangeStatus(ID,status);

        }

        private void  ChangeStatus(int ID,string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(objCS.Conn()); con = objCS.conOpen();
                if (con.State == System.Data.ConnectionState.Closed)
                    con.Open();

                string qq = "update Leaveapplication set Status='"+ status + "' Where id='" + ID + "'";
                SqlCommand cmd = new SqlCommand(qq, con);
                cmd.ExecuteNonQuery();
                objCS.conClose();
                this.GridView1_SelectedIndexChanged(GridView1, EventArgs.Empty);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void lnk2_Click(object sender, EventArgs e)
        {

            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            string lstatus = "Paid";
            ChangeStatus1(ID, lstatus);
        }
        protected void lnk3_Click(object sender, EventArgs e)
        {

            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            string lstatus = "UnPaid";
            ChangeStatus1(ID, lstatus);
        }
        private void ChangeStatus1(int ID, string lstatus)
        {
            try
            {
                SqlConnection con = new SqlConnection(objCS.Conn()); con = objCS.conOpen();
                if (con.State == System.Data.ConnectionState.Closed)
                    con.Open();

                string qq = "update Leaveapplication set Leave_Status='" + lstatus + "' Where id='" + ID + "'";
                SqlCommand cmd = new SqlCommand(qq, con);
                cmd.ExecuteNonQuery();
                objCS.conClose();
                this.GridView1_SelectedIndexChanged(GridView1, EventArgs.Empty);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }





        //    protected void Button2(object sender, EventArgs e)
        //{
        //     SqlConnection con = new SqlConnection(objCS.Conn()); con = objCS.conOpen();
        //    int ID = Convert.ToInt32((sender as Button).CommandArgument);
        //    if (con.State == System.Data.ConnectionState.Closed)
        //        con.Open();

        //    string qq = "update Leaveapplication set Status='Approve' Where id='"+ID+"'";
        //    SqlCommand cmd = new SqlCommand(qq, con);
        //    cmd.ExecuteNonQuery();
        //    objCS.conClose();
        //    // SqlDataAdapter sqlda = new SqlDataAdapter("RecruitmentViewbyID", con);
        //    // sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
        //    // sqlda.SelectCommand.Parameters.AddWithValue("@ID", ID);

        //    //System.Data.DataTable dtbl = new System.Data.DataTable();
        //    //sqlda.Fill(dtbl);
        //    //con.Close();
        //    //hfid.Value = ID.ToString();
        //}
    }
}