<%@ Page Title="" Language="C#" MasterPageFile="~/Startup/Start_MasterPage.master" AutoEventWireup="true" CodeFile="UploadProjectIdea.aspx.cs" Inherits="Startup_UploadProjectIdea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
    <!-- Include the jQuery UI library -->
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
    <%-- <asp:UpdatePanel ID="upPnl" runat="server" ChildrenAsTriggers="true" >
        <ContentTemplate>--%>

     <script src="http://code.jquery.com/jquery-1.10.2min.js" type="text/javascript"></script>


     <script type="text/javascript">
        $(document).ready(function () {
            // Search functionality in the modal
            $("#<%= txtName.ClientID %>").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#repeaterTable tbody tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>

    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(250);
                };
                reader.readAsDataURL(input.files[0]);
                }
        }

    </script>

   <script type="text/javascript">
       // This function updates the iframe source based on the user input
function updateIframeSource() {
    var videoLink = document.getElementById('<%= txtvideolink.ClientID %>').value; // Get the video link from the input field
    var iframe = document.getElementById('<%= iframeVideo.ClientID %>'); // Get the iframe element by its ID
    
    // If the link is not empty, set the iframe's src to the video URL
    if (videoLink) {
        iframe.src = videoLink;
    } else {
        iframe.src = ''; // Clear iframe if input is empty
    }
}

// Automatically trigger the function when the page loads or when the video link changes
window.onload = function () {
    document.getElementById('<%= txtvideolink.ClientID %>').oninput = updateIframeSource; // Listen for input changes on the video link field
};

    </script>

    <div class="container hh gj hj" style="border-radius:50px">
    <h2 class="mt-4" style="text-align:center"  Font-Bold="true"  >Upload Project Idea</h2>
        <br />
    <div class="row">
       
         <div class="col-lg-6">
       
                 <div class="form-group">
                           <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/ADMIN1.png" Height="130px" Width="130px" />
                     </div>
               <div class="row">
                   <div class="col-lg-4">
                           <asp:UpdatePanel ID="FileUploadUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                          
                       <div class="form-group" >
                           <asp:Label ID="lblMsg" runat="server"  Font-Bold="true"  > Upload Idea image</asp:Label>
                           <asp:FileUpload ID="FileUpload1" runat="server"  onchange="ImagePreview(this);"  />
                            
                            
                           </div>

    </ContentTemplate>
                        </asp:UpdatePanel>

                       </div>
                   </div>
                   
               </div>
              <div class="col-lg-4"></div>
                  
         <div class="col-lg-2">

                 <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#tableModal">
                Edit Project Idea
            </button>


         </div>
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtFirmName" class="form-label"  Font-Bold="true" >Project Name :</label>
                <asp:TextBox ID="txtprojectname" runat="server" class="form-control" placeholder="Enter Project Name"  ValidationGroup="er"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirmName" runat="server" 
                    ControlToValidate="txtprojectname" ErrorMessage="Project Name is required!"   ForeColor="Red"   ValidationGroup="er"  
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
        </div>

        <!-- Investor Name -->
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtInvestorName" class="form-label"  Font-Bold="true" >Description:</label> <b>*Please provide detailed information.</b>
                <asp:TextBox ID="txtdescription" runat="server" class="form-control" placeholder="Description" TextMode="MultiLine"  ValidationGroup="er"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorInvestorName" runat="server" 
                    ControlToValidate="txtdescription" ErrorMessage="Investor Name is required!"   ForeColor="Red"   ValidationGroup="er"  
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
        </div>

        <!-- Registration Number -->
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtRegistrationNumber" class="form-label"  Font-Bold="true" >Technology:</label>
                <asp:TextBox ID="txttechnology" runat="server" class="form-control" placeholder="Enter Technology "  ValidationGroup="er"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegistrationNumber" runat="server"   ForeColor="Red"  ValidationGroup="er"   
                    ControlToValidate="txttechnology" ErrorMessage="Registration Number is required!" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
        </div>

        <!-- GST Number -->
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtGSTNumber" class="form-label"  Font-Bold="true" >Budget:</label>
                <asp:TextBox ID="txtbudget" runat="server" class="form-control" placeholder="Enter Budget"  ValidationGroup="er"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGSTNumber" runat="server" 
                    ControlToValidate="txtbudget" ErrorMessage="GST Number is required!"   ForeColor="Red"   ValidationGroup="er"  
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
            
            </div>
        </div>

        <div class="col-lg-6">

            <div class="from-group">
                <label  class="form-label" Font-Bold="true">Category </label>
                      <asp:DropDownList ID="ddlCategory"  class="form-control" runat="server">                    
                      <asp:ListItem>Money market funds</asp:ListItem>
                      <asp:ListItem>Retirement plans</asp:ListItem>
                      <asp:ListItem>Insurance policies</asp:ListItem> 
                      <asp:ListItem>Corporate investors</asp:ListItem>
                      <asp:ListItem>Institutional investors</asp:ListItem>
                      <asp:ListItem>Angel investors</asp:ListItem>
                      <asp:ListItem>Mutual funds</asp:ListItem>
                      <asp:ListItem>Equity</asp:ListItem>
                      <asp:ListItem>Cash or cash equivalents</asp:ListItem>
                      </asp:DropDownList>


            </div>


        </div>

        
         <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtvideo" class="form-label" Font-Bold="true">Published Date</label>
                    <asp:TextBox ID="txtdate" runat="server" class="form-control"  TextMode="Date" ></asp:TextBox>
                </div>
            </div>

       <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtvideo" class="form-label" Font-Bold="true">Upload Video</label>
                    <asp:TextBox ID="txtvideolink" runat="server" class="form-control" placeholder="Enter Video Link"></asp:TextBox>
                </div>
            </div>

         <div class="col-lg-6">
            <div class="form-group">
                <label for="txtEmail" class="form-label"  Font-Bold="true" >Website:</label>
                <asp:TextBox ID="txtwebsite" runat="server" class="form-control" placeholder="Enter Website Address"   ValidationGroup="er"   ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   ValidationGroup="er"  
                    ControlToValidate="txtwebsite" ErrorMessage="website is required!"   ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="col-lg-6">
                <div class="form-group">
                    <iframe id="iframeVideo" runat="server" width="350" height="235" title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"  allowfullscreen   ></iframe>
                </div>
            </div>
       

         <div class="col-lg-12"></div>
        <div class="col-lg-5">
            </div>
        <!-- Submit Button -->
        <div class="col-lg-6">
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success "   OnClick="btnSubmit_Click"   ValidationGroup="er"  />
             <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn  btn-warning "   OnClick="btnupdate_Click"   ValidationGroup="er"  />
            
                 <asp:Button ID="btndelet" runat="server" Text="Delete" CssClass="btn  btn-danger "   OnClick="btndelet_Click"   ValidationGroup="er"  />
            
            
            </div>
        </div>



        <div class="modal fade" id="tableModal" tabindex="-1" role="dialog" aria-labelledby="tableModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content"  style="margin-left:50px" >
                        <div class="modal-header">
                            <h5 class="modal-title" id="tableModalLabel">Project Idea </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Search input inside the modal -->
                            <div class="form-group">
                                <label for="txtName" class="form-label">Search:</label>
                                <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Search..."></asp:TextBox>
                            </div>

                            <!-- Table inside the modal -->
                            <table id="repeaterTable" class="table">
                                <thead>
                                    <tr>
                                         <th>Id</th>
                                        <th>Project Image</th>
                                        <th>Project name</th>
                                        <th>Project Category</th>
                                        <th>Technology</th>
                                        <th>Budget</th>
                                      
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource22">
                                        <ItemTemplate>
                                            <tr>

                                                  <td><%# Eval("pi_id") %></td>
                                                <td class="h-12 w-12 rounded-full">
                                                    <img src="logo/<%# Eval("ProjectImage") %>" alt="Brand">
                                                </td>
                                                <td><%# Eval("Projectname") %></td>
                                                <td><%# Eval("P_Category") %></td>
                                                <td><%# Eval("Technology") %></td>
                                                <td><%# Eval("Budget") %></td>
                                               <td>
                <!-- Pass the pi_id to the button -->
                <asp:Button ID="btnshow" runat="server" Text="Select" 
                            CommandName="SelectProject" 
                            CommandArgument='<%# Eval("pi_id") %>' OnCommand="btnshow_Command" ValidationGroup="wf" CssClass="btn btn-warning" />
            </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
         <asp:SqlDataSource ID="SqlDataSource22" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StarupConnectionString %>" 
        SelectCommand="SELECT * FROM [Upload_Project_Idea]">
    </asp:SqlDataSource>








    </div>
</div>
</asp:Content>

