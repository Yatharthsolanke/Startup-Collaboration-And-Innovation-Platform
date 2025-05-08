using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Invester_ViewStartups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = @"SELECT   upi.ProjectImage,upi.pi_id, upi.st_id, upi.Website,  upi.Projectname, sur.FirmName
FROM Upload_Project_Idea upi JOIN  Star_UpRegistration sur ON upi.st_id = sur.st_id  where Category='"+ Session["Category"] + "' ";
    }
}