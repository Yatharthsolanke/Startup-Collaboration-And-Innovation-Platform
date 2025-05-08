using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Startup_Show_Investor_intrest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource22.SelectCommand= @"SELECT  u.Projectname,  s.StudentName, s.logo, s.EmailAddress,  si.resume_file,  si.date_applied
FROM  student_intrest si  JOIN  Upload_Project_Idea u ON si.pi_id = u.pi_id JOIN  Students_Registration s ON si.StudentID = s.StudentID  where  s.StudentID='" + Session["StudentID"].ToString() + "'  ORDER BY   si.date_applied DESC  ";
    
    
    
    }
}