using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Threading;

namespace SpaceApp
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }
        protected void Render(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string data = null;
            string date = GetMonth(DDListMonth.SelectedValue.ToString()) + " " + DDListYear.SelectedValue.ToString();
            string title = "Land Water in Saudi Arabia in " + date;
            dt = GetData("SELECT * FROM LandWater WHERE Dt LIKE '" + DDListYear.SelectedValue.ToString() + "-" + DDListMonth.SelectedValue.ToString() + "%'");
            foreach (DataRow dr in dt.Rows)
            {
                data += "{ 'lat':'" + dr["lat"].ToString()
                     + "', 'long':'" + dr["long"].ToString()
                     + "', 'name':'', 'size':'" + dr["value"].ToString() + "'},";
            }
            ScriptManager.RegisterStartupScript(Page, GetType(), date, "map([" + data + "], '" + title + "');", true);
        }

        // FUNCTIONS //
        public System.Data.DataTable GetData(string Query)
        {
            SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString.ToString());
            System.Data.DataTable dt = new System.Data.DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter cmd = new SqlDataAdapter(Query, conn);
                cmd.Fill(dt);
                cmd.Dispose();
            }
            catch (Exception ex) { throw ex; }
            finally { conn.Close(); conn.Dispose(); }
            return dt;
        }
        public string GetMonth(string no)
        {
            string month = null;
            switch (no)
            {
                case "01": month = "JAN"; break;
                case "02": month = "FEB"; break;
                case "03": month = "MAR"; break;
                case "04": month = "APR"; break;
                case "05": month = "MAY"; break;
                case "06": month = "JUN"; break;
                case "07": month = "JUL"; break;
                case "08": month = "AUG"; break;
                case "09": month = "SEP"; break;
                case "10": month = "OCT"; break;
                case "11": month = "NOV"; break;
                case "12": month = "DEC"; break;
            }
            return month;
        }
    }
}