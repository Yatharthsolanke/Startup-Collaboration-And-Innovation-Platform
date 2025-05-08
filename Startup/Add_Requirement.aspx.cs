using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Startup_Add_Requirement : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string pi_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataSource22.SelectCommand = @"SELECT pr.req_id, pr.req_skill, pr.requirements, pr.salary_range, pr.status, upi.Projectname  
                                              FROM Project_Requirement pr  
                                              JOIN Upload_Project_Idea upi ON pr.pi_id = upi.pi_id";

            btndelet.Visible = false;
            btnupdate.Visible = false;
            btnSubmit.Visible = true;

            ddlidea.Items.Clear();
            ddlidea.Items.Add("Select");

            con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Projectname FROM Upload_Project_Idea WHERE st_id=@st_id";
            cmd.Parameters.AddWithValue("@st_id", Session["st_id"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ddlidea.Items.Add(dr.GetString(0));
            }
            con.Close();
        }
    }

    protected void ddlidea_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Ensure that the "Select" option is not selected
        if (ddlidea.SelectedValue != "Select")
        {
            con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT pi_id FROM Upload_Project_Idea WHERE st_id=@st_id AND Projectname=@Projectname";
            cmd.Parameters.AddWithValue("@st_id", Session["st_id"].ToString());
            cmd.Parameters.AddWithValue("@Projectname", ddlidea.SelectedValue.ToString());

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                pi_id = dr.GetInt32(0).ToString(); // Retrieve pi_id from the database
                hfpid.Value = dr.GetInt32(0).ToString();
            }
            con.Close();
        }
        else
        {
            // Reset pi_id if "Select" is chosen
            pi_id = string.Empty;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Check if pi_id is valid before proceeding
        if (string.IsNullOrEmpty(hfpid.Value))
        {
            Response.Write("<script>alert('Please select a project first.');</script>");
            return; // Prevent the SQL command from executing if pi_id is empty
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"INSERT INTO Project_Requirement (pi_id, st_id, req_skill, requirements, salary_range, location, date_posted, status) 
                                VALUES (@pi_id, @st_id, @req_skill, @requirements, @salary_range, @location, @date_posted, @status)";

            cmd.Parameters.AddWithValue("@pi_id", hfpid.Value);
            cmd.Parameters.AddWithValue("@st_id", Session["st_id"].ToString());
            cmd.Parameters.AddWithValue("@req_skill", txtreq_skill.Text);
            cmd.Parameters.AddWithValue("@requirements", txtrequirement.Text);
            cmd.Parameters.AddWithValue("@salary_range", txtsalary.Text);
            cmd.Parameters.AddWithValue("@location", txtlocation.Text);
            cmd.Parameters.AddWithValue("@date_posted", DateTime.Now);
            cmd.Parameters.AddWithValue("@status", ddlstatus.SelectedValue);

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                Response.Write("<script>alert('Requirement uploaded successfully!');</script>");
                // Clear the fields after submission
                txtreq_skill.Text = "";
                txtrequirement.Text = "";
                txtsalary.Text = "";
                txtlocation.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Error uploading the requirement. Please try again.');</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
        }
        finally
        {
            con.Close();
        }
    }

    protected void btnshow_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "SelectProject")
        {
            // Get the pi_id from the CommandArgument
            string[] commandArgs = e.CommandArgument.ToString().Split('|');

            int req_id = Convert.ToInt32(commandArgs[0]);
            string projectName = commandArgs[1];

            ViewState["Selectedreq_id"] = req_id;
            ViewState["SelectedProjectName"] = projectName;
            ddlidea.SelectedValue = projectName;

            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Project_Requirement WHERE req_id = @req_id", con);
            cmd.Parameters.AddWithValue("@req_id", req_id);

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtreq_skill.Text = reader["req_skill"].ToString();
                    txtrequirement.Text = reader["requirements"].ToString();
                    txtsalary.Text = reader["salary_range"].ToString();
                    txtlocation.Text = reader["location"].ToString();
                    ddlstatus.SelectedValue = reader["status"].ToString();
                    hfpid.Value  = reader["pi_id"].ToString();

                    if (reader["date_posted"] != DBNull.Value)
                    {
                        DateTime pubDate = Convert.ToDateTime(reader["date_posted"]);
                        hfdate.Value = pubDate.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        hfdate.Value = "";
                    }

                    btndelet.Visible = true;
                    btnupdate.Visible = true;
                    btnSubmit.Visible = false;
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        // Ensure that pi_id is valid before updating
        if (string.IsNullOrEmpty(hfpid.Value))
        {
            Response.Write("<script>alert('Please select a project first.');</script>");
            return;
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        SqlCommand cmd = new SqlCommand();
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = @"UPDATE Project_Requirement 
                            SET pi_id = @pi_id, st_id = @st_id, req_skill = @req_skill, requirements = @requirements, 
                                salary_range = @salary_range, location = @location, date_posted = @date_posted, status = @status 
                            WHERE req_id = @req_id";

        cmd.Parameters.AddWithValue("@pi_id", hfpid.Value);
        cmd.Parameters.AddWithValue("@st_id", Session["st_id"]);
        cmd.Parameters.AddWithValue("@req_skill", txtreq_skill.Text);
        cmd.Parameters.AddWithValue("@requirements", txtrequirement.Text);
        cmd.Parameters.AddWithValue("@salary_range", txtsalary.Text);
        cmd.Parameters.AddWithValue("@location", txtlocation.Text);
        cmd.Parameters.AddWithValue("@date_posted", DateTime.Now.ToString("dd/MM/yyyy"));
        cmd.Parameters.AddWithValue("@status", ddlstatus.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@req_id", ViewState["Selectedreq_id"]);

        int n = cmd.ExecuteNonQuery();

        if (n > 0)
        {
            Response.Write("<script>alert('Requirement updated successfully!');</script>");
            // Reset form fields
            txtreq_skill.Text = "";
            txtrequirement.Text = "";
            txtsalary.Text = "";
            txtlocation.Text = "";
            btndelet.Visible = false;
            btnupdate.Visible = false;
            btnSubmit.Visible = true;
        }
        else
        {
            Response.Write("<script>alert('Error updating the requirement. Please try again.');</script>");
        }

        con.Close();
    }

    protected void btndelet_Click(object sender, EventArgs e)
    {
        int req_id = Convert.ToInt32(ViewState["Selectedreq_id"]);

        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        SqlCommand cmd = new SqlCommand("DELETE FROM Project_Requirement WHERE req_id = @req_id", con);
        cmd.Parameters.AddWithValue("@req_id", req_id);

        try
        {
            con.Open();
            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                Response.Write("<script>alert('Requirement deleted successfully!');</script>");
                btndelet.Visible = false;
                btnupdate.Visible = false;
                btnSubmit.Visible = true;
                txtreq_skill.Text = "";
                txtrequirement.Text = "";
                txtsalary.Text = "";
                txtlocation.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Error deleting the project. Please try again.');</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
        }
        finally
        {
            con.Close();
        }
    }
}

