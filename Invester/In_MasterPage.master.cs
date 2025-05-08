using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Invester_In_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["in_id"].ToString() == null)
        {
            Response.Redirect("../home.aspx");

            LoadInvestorDetails();
        }



    }


    private void LoadInvestorDetails()
    {
        // Connection string from web.config or app settings
        string connectionString = ConfigurationManager.AppSettings["LIS"];

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            try
            {
                con.Open();
                string query = "SELECT  InvestorName ,Category FROM InvestorRegistration where in_id=" + Session["in_id"];

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    lblshow.Text = dr.GetString(0);
                    lbldata.Text = dr.GetString(1);
                    Session.Add("Category", dr.GetString(1));



                }
            }
            catch (Exception ex)
            {
                // Log the error or display a user-friendly error message
                Response.Write("<script>alert('Error loading investor details: " + ex.Message + "');</script>");
            }
        }
    }


}
