<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentRegistration.aspx.cs" Inherits="Investor_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <!-- Include the jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
    <!-- Include the jQuery UI library -->
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>

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

    <div class="container card " style="border-radius:30px">
        <h2 class="mt-4" style="text-align:center">Student Registration</h2>
        <br />
        <div class="row">
            <!-- Image Upload Section -->
            <div class="col-lg-6">
                <div class="form-group">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/hero.png" Height="130px" Width="130px" />
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <asp:UpdatePanel ID="FileUploadUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="form-group">
                                    <asp:Label ID="lblMsg" runat="server"> &nbsp;&nbsp;&nbsp;</asp:Label>
                                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="ImagePreview(this);" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <!-- Student Name -->
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtStudentName" class="form-label">Student Name:</label>
                    <asp:TextBox ID="txtStudentName" runat="server" class="form-control" placeholder="Enter Student Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorStudentName" runat="server" ControlToValidate="txtStudentName" ErrorMessage="Student Name is required!" ForeColor="Red" CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- College Name -->
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtCollegeName" class="form-label">College Name:</label>
                    <asp:TextBox ID="txtCollegeName" runat="server" class="form-control" placeholder="Enter College Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCollegeName" runat="server" ControlToValidate="txtCollegeName" ErrorMessage="College Name is required!" ForeColor="Red" CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- Degree -->
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtDegree" class="form-label">Degree:</label>
                    <asp:TextBox ID="txtDegree" runat="server" class="form-control" placeholder="Enter Degree"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDegree" runat="server" ControlToValidate="txtDegree" ErrorMessage="Degree is required!" ForeColor="Red" CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- Expertise -->
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtExpertise" class="form-label">Experience:</label>
                    <asp:TextBox ID="txtExpertise" runat="server" class="form-control" placeholder="Enter Expertise"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorExpertise" runat="server" ControlToValidate="txtExpertise" ErrorMessage="Expertise is required!" ForeColor="Red" CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- Languages -->
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtLanguages" class="form-label">Languages:</label>
                    <asp:TextBox ID="txtLanguages" runat="server" class="form-control" placeholder="Enter Languages"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLanguages" runat="server" ControlToValidate="txtLanguages" ErrorMessage="Languages are required!" ForeColor="Red" CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- Mobile Number -->
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtMobile" class="form-label">Mobile Number:</label>
                    <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Enter Mobile Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile Number is required!" ForeColor="Red" CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegexValidatorMobile" runat="server" ControlToValidate="txtMobile" ValidationExpression="^\d{10}$" ForeColor="Red" ErrorMessage="Invalid Mobile Number!" CssClass="error-message" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
            </div>

            <!-- Email Address -->
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtEmail" class="form-label">Email Address:</label>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Email Address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required!" ForeColor="Red" CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegexValidatorEmail" runat="server" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Invalid Email Address!" CssClass="error-message" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
            </div>

            <!-- Password -->
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtPassword" class="form-label">Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" placeholder="****"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required!" ForeColor="Red" CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg-6"></div>
            <div class="col-lg-4"></div>
            <!-- Submit Button -->
            <div class="col-lg-6">
                <div class="form-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-block" OnClick="btnSubmit_Click" />
                </div>
            </div>
            <br />
        </div>
    </div>
</asp:Content>


