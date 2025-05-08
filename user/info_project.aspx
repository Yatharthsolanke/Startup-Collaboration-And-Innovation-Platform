<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_MasterPage.master" AutoEventWireup="true" CodeFile="info_project.aspx.cs" Inherits="Invester_info_project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="mx-auto max-w-screen-2xl bg-white p-4 md:p-6 2xl:p-10">
        <div class="card">
            <div class="bb ze ki xn 2xl:ud-px-0">
                <div class="tc sf yo zf kq">
                    <div class="ro">
                        <asp:Repeater ID="EventRepeater" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="event-item mb-4 p-4 border border-secondary rounded">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <!-- Project Image -->
                                            <img src='<%# "../Startup/logo/" + Eval("ProjectImage") %>' alt="Project Image" class="img-fluid rounded">
                                        </div>
                                        <div class="col-md-8">
                                            <!-- Project Details -->
                                            <h3 class="event-title"><%# Eval("Projectname") %></h3>
                                            <p class="event-description"><%# Eval("Description") %></p>
                                            
                                            <ul class="list-unstyled">
                                                <li><span class="font-weight-bold">Author: </span><b><%# Eval("FirmName") %></b></li>
                                                <li><span class="font-weight-bold">Published On: </span><b><%# Eval("date_posted", "{0:dd-MM-yyyy}") %></b></li>
                                                <li><span class="font-weight-bold">Required Skills: </span><b><%# Eval("req_skill") %></b></li>
                                                <li><span class="font-weight-bold">Salary Range: </span><b><%# Eval("salary_range") %></b></li>
                                                <li><span class="font-weight-bold">Location: </span><b><%# Eval("location") %></b></li>
                                                <li><span class="font-weight-bold">Requirements: </span><b><%# Eval("requirements") %></b></li>
                                            </ul>
                                            
                                            <div class="mt-3">
                                                <!-- Video Link -->
                                                <a href='<%# Eval("videolink") %>' class="btn btn-primary" target="_blank">Watch Video</a>
                                                <!-- Website Link -->
                                                <a href='<%# Eval("Website") %>' class="btn btn-secondary" target="_blank">Visit Website</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:StarupConnectionString %>" 
                               SelectCommand="
                               SELECT u.Projectname, u.Description, u.ProjectImage, u.videolink, u.Website, s.FirmName, 
                                      r.req_skill, r.requirements, r.salary_range, r.location, r.date_posted, r.status 
                               FROM Project_Requirement r
                               JOIN Upload_Project_Idea u ON r.pi_id = u.pi_id  
                               JOIN Star_UpRegistration s ON r.st_id = s.st_id;">
            </asp:SqlDataSource>

        </div>

        <!-- Query Section -->
        <div class="bb ze ki xn 2xl:ud-px-0 mt-4">
            <div class="row">
                <label for="txtFirmName" class="form-label"><strong>Upload Resume</strong></label>
                <label for="txtFirmName" class="form-label text-danger"><strong>* If you're interested, please Upload Resume  and the Startup will contact you</strong></label>
                <!-- Query Textbox -->
                <div class="col-lg-4">
                    <div class="form-group">
                        <asp:FileUpload ID="furesume" runat="server" class="form-control" />
                       
                        
                    </div>
                </div>
                <div class="col-lg-8">
                    &nbsp;&nbsp;&nbsp;
                </div>
                <br />
                <div class="col-lg-3">
                    <div class="form-group">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-block" OnClick="btnSubmit_Click" />
                    </div>
                </div>
                <div class="col-lg-9">
                    <asp:Label ID="lblshow" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>



    <style>
    .event-item {
        margin-bottom: 30px;
        border-radius: 8px;
        background-color: #f9f9f9;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .event-image {
        width: 100%;
        border-radius: 8px;
    }

    .event-title {
        font-size: 1.75rem;
        font-weight: bold;
        color: #333;
        margin-bottom: 15px;
    }

    .event-description {
        font-size: 1rem;
        color: #555;
        line-height: 1.6;
        margin-bottom: 15px;
    }

    .event-details li {
        margin-bottom: 5px;
    }

    .btn {
        margin-right: 10px;
    }

    /* Query Section */
    .query-section .form-label {
        font-size: 1rem;
        font-weight: normal;
        color: #333;
    }

    .query-section .form-control {
        margin-top: 10px;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
    }

    @media (max-width: 768px) {
        .col-md-4, .col-md-8 {
            flex: 1 1 100%;
        }

        .event-title {
            font-size: 1.5rem;
        }
    }
</style>

</asp:Content>







