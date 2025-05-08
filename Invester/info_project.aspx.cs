using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Invester_info_project : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT   s.FirmName,  p.Projectname, p.Description,  p.P_Category,  p.Technology,  p.Budget,  p.videolink, p.ProjectImage,   p.Website,   p.Pub_date FROM  Star_UpRegistration s INNER JOIN  Upload_Project_Idea p ON  s.st_id = p.st_id where pi_id='" + Request.QueryString["pi_id"]+"'";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Investor_intrest (in_id ,st_id,pi_id ,Query) " +
                              "VALUES (@in_id ,@st_id,@pi_id,@Query)";
            cmd.Parameters.AddWithValue("@st_id", Request.QueryString["st_id"].ToString());
            cmd.Parameters.AddWithValue("@in_id", Session["in_id"].ToString());
            cmd.Parameters.AddWithValue("@pi_id", Session["pi_id"].ToString());   
            cmd.Parameters.AddWithValue("@Query", txtquery.Text);

            // Execute the command
            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                Response.Write("<script>alert('intrest Upload successfully!');</script>");

            }
            
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('An error occurred:   " + ex.Message + "');</script>");
        }
        finally
        {
            con.Close();
        }

    }
}