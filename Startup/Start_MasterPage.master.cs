using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Invester_In_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["st_id"].ToString() == null)
        {
            Response.Redirect("../home.aspx");

            
        }
        DisplayStartupDetails();
    }


    private void DisplayStartupDetails()
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["LIS"];
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string query = "SELECT  [FirmName]" +
                           "FROM [Star_UpRegistration] WHERE [st_id] = @st_id";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@st_id", Session["st_id"]);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        lblshow.Text = dr["FirmName"].ToString();
                        

                       

                        // Set the startup logo image
                       
                    }
                    else
                    {
                        // Handle case where the startup is not found in the database
                        Response.Redirect("../home.aspx");
                    }
                }
            }
        }
    }



}
