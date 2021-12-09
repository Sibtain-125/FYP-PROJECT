using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EmployeeMonitoring
{
    public class Connection
    {
        string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        public string Conn()
        {
            try
            {
                //string cs = ConfigurationManager.ConnectionStrings["E_School"].ConnectionString;
                return cs;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public SqlConnection conOpen()
        {
            SqlConnection con = new SqlConnection(cs);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            return con;
        }
        public SqlConnection conClose()
        {
            SqlConnection con = new SqlConnection(cs);
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
            return con;
        }
    }
}