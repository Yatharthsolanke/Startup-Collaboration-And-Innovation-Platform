using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Startup_UploadProjectIdea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataSource22.SelectCommand = @" SELECT * FROM [Upload_Project_Idea] ";
            btndelet.Visible = false;
            btnupdate.Visible = false;
            btnSubmit.Visible = true;

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ppath;
        string file;


        if (FileUpload1.HasFile == true)
        {
            ppath = Server.MapPath("~/Startup/logo/") + "/" + FileUpload1.FileName;

            FileUpload1.SaveAs(ppath);
            file = FileUpload1.FileName;
        }
        else
        {
            file = "cusdummy.png";
        }






        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Upload_Project_Idea (Projectname, Description, Technology, Budget, videolink,ProjectImage,P_Category ,Pub_date ,Website ,st_id) " +
                              "VALUES (@Projectname, @Description, @Technology, @Budget, @videolink,@ProjectImage ,@P_Category ,@Pub_dat , @Website ,@st_id )";


            cmd.Parameters.AddWithValue("@Projectname", txtprojectname.Text);
            cmd.Parameters.AddWithValue("@Description", txtdescription.Text);
            cmd.Parameters.AddWithValue("@Technology", txttechnology.Text);
            cmd.Parameters.AddWithValue("@Budget", txtbudget.Text);
            cmd.Parameters.AddWithValue("@videolink", txtvideolink.Text);
            cmd.Parameters.AddWithValue("@ProjectImage", file);
            cmd.Parameters.AddWithValue("@P_Category", ddlCategory.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Pub_dat", txtdate.Text);
            cmd.Parameters.AddWithValue("@Website", txtwebsite.Text);
            cmd.Parameters.AddWithValue("@st_id", Session["st_id"]);
            
            


            // Execute the command
            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                Response.Write("<script>alert('Idea Upload successfully!');</script>");


                txtprojectname.Text = "";
                txtdescription.Text = "";
                txttechnology.Text = "";
                txtbudget.Text = "";
                txtvideolink.Text = "";
                txtwebsite.Text = "";
                
            }
            else
            {
                Response.Write("<script>alert('Error in Idea. Please try again.');</script>");
                Response.Write("<script>window.location.href='UploadProjectIdea.aspx';</script>");
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
            int pi_id = Convert.ToInt32(e.CommandArgument);

            ViewState["SelectedPiId"] = pi_id;


            // Fetch project details from the database based on pi_id
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Upload_Project_Idea WHERE pi_id = @pi_id", con);
            cmd.Parameters.AddWithValue("@pi_id", pi_id);

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    // Populate the controls with the project details
                    string projectImage = reader["ProjectImage"].ToString();
                    string projectName = reader["Projectname"].ToString();
                    string description = reader["Description"].ToString();
                    string technology = reader["Technology"].ToString();
                    string budget = reader["Budget"].ToString();
                    string videoLink = reader["videolink"].ToString();
                    string category = reader["P_Category"].ToString();

                    if (reader["Pub_date"] != DBNull.Value)
                    {
                        DateTime pubDate = Convert.ToDateTime(reader["Pub_date"]);
                        txtdate.Text = pubDate.ToString("yyyy-MM-dd"); // Set the date in the correct format
                    }
                    else
                    {
                        txtdate.Text = ""; // Set to empty string if Pub_dat is NULL
                    }


                    string website = reader["Website"].ToString();

                    // Update the controls with the retrieved data
                    Image1.ImageUrl = "~/Startup/logo/" + projectImage; // Set the image URL
                    txtprojectname.Text = projectName; // Set Project Name TextBox
                    txtdescription.Text = description; // Set Description TextBox
                    txttechnology.Text = technology; // Set Technology TextBox
                    txtbudget.Text = budget; // Set Budget TextBox
                    txtvideolink.Text = videoLink; // Set Video Link TextBox
                   


                    txtwebsite.Text = website; // Set Website TextBox

                    // Set the Category DropdownList selection
                    ddlCategory.SelectedValue = category;

                    btndelet.Visible = true; 
                    btnupdate.Visible = true;
                    btnSubmit.Visible = false;
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                // Handle any potential errors
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
        string ppath;
        string file;

        // Check if a new image is uploaded
        if (FileUpload1.HasFile)
        {
            ppath = Server.MapPath("~/Startup/logo/") + "/" + FileUpload1.FileName;
            FileUpload1.SaveAs(ppath);
            file = FileUpload1.FileName;
        }
        else
        {
            // If no new image, keep the current image
            file = Image1.ImageUrl.Substring(Image1.ImageUrl.LastIndexOf('/') + 1);
        }

        // Update the project in the database
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Upload_Project_Idea SET Projectname = @Projectname, Description = @Description, " +
                              "Technology = @Technology, Budget = @Budget, videolink = @videolink, ProjectImage = @ProjectImage, " +
                              "P_Category = @P_Category, Pub_date = @Pub_dat, Website = @Website , st_id=@st_id WHERE pi_id = @pi_id";

            cmd.Parameters.AddWithValue("@Projectname", txtprojectname.Text);
            cmd.Parameters.AddWithValue("@Description", txtdescription.Text);
            cmd.Parameters.AddWithValue("@Technology", txttechnology.Text);
            cmd.Parameters.AddWithValue("@Budget", txtbudget.Text);
            cmd.Parameters.AddWithValue("@videolink", txtvideolink.Text);
            cmd.Parameters.AddWithValue("@ProjectImage", file);
            cmd.Parameters.AddWithValue("@P_Category", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@Pub_dat", txtdate.Text);
            cmd.Parameters.AddWithValue("@Website", txtwebsite.Text);
            cmd.Parameters.AddWithValue("@st_id", Session["st_id"]);
            cmd.Parameters.AddWithValue("@pi_id", ViewState["SelectedPiId"]);  //\\ Assuming you store the pi_id in ViewState

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                Response.Write("<script>alert('Project updated successfully!');</script>");
                // Hide buttons after update
                btndelet.Visible = false;
                btnupdate.Visible = false;
                btnSubmit.Visible = true;


                txtprojectname.Text = "";
                txtdescription.Text = "";
                txttechnology.Text = "";
                txtbudget.Text = "";
                txtvideolink.Text = "";
                txtwebsite.Text = "";


            }
            else
            {
                Response.Write("<script>alert('Error updating project. Please try again.');</script>");
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


    protected void btndelet_Click(object sender, EventArgs e)
    {
        int pi_id = Convert.ToInt32(ViewState["SelectedPiId"]); // Retrieve the selected pi_id from ViewState

        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        SqlCommand cmd = new SqlCommand("DELETE FROM Upload_Project_Idea WHERE pi_id = @pi_id", con);
        cmd.Parameters.AddWithValue("@pi_id", pi_id);

        try
        {
            con.Open();
            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                Response.Write("<script>alert('Project deleted successfully!');</script>");
                // Hide the buttons after deletion
                btndelet.Visible = false;
                btnupdate.Visible = false;
                btnSubmit.Visible = true;
                // Optionally, reset form fields
                txtprojectname.Text = "";
                txtdescription.Text = "";
                txttechnology.Text = "";
                txtbudget.Text = "";
                txtvideolink.Text = "";
                txtwebsite.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Error deleting project. Please try again.');</script>");
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