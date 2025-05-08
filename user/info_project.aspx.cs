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
        SqlDataSource1.SelectCommand = @" SELECT u.Projectname, u.Description, u.ProjectImage, u.videolink, u.Website, s.FirmName, 
                                       r.req_skill, r.requirements, r.salary_range, r.location, r.date_posted, r.status 
                                       FROM Project_Requirement r JOIN Upload_Project_Idea u ON r.pi_id = u.pi_id JOIN Star_UpRegistration s ON r.st_id = s.st_id   where r.req_id='"+ Request.QueryString["req_id"] + "'   ";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ppath;
        string file;

        
        if (furesume.HasFile == true)
        {
            ppath = Server.MapPath("~/user/Resume/") + "/" + furesume.FileName;

            furesume.SaveAs(ppath);
            file = furesume.FileName;
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            SqlCommand cmd = new SqlCommand();

            try
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO student_intrest (StudentID ,pi_id,req_id ,st_id ,date_applied,resume_file) " +
                                  "VALUES (@StudentID ,@pi_id,@req_id ,@date_applied, @st_id, @resume_file)";
                cmd.Parameters.AddWithValue("@StudentID", Session["StudentID"].ToString());
                cmd.Parameters.AddWithValue("@pi_id", Request.QueryString["pi_id"].ToString());
                cmd.Parameters.AddWithValue("@req_id", Request.QueryString["req_id"].ToString());
                cmd.Parameters.AddWithValue("@st_id", Request.QueryString["st_id"].ToString());
                cmd.Parameters.AddWithValue("@date_applied", DateTime.Now);
                cmd.Parameters.AddWithValue("@resume_file", file);
                // Execute the command
                int n = cmd.ExecuteNonQuery();

                if (n > 0)
                {
                    Response.Write("<script>alert('Resume Upload successfully!');</script>");

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
        else
        {
            lblshow.Text = "First Upload Resume";
        }



        
    }
}