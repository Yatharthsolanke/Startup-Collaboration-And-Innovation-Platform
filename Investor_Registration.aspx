<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Investor_Registration.aspx.cs" Inherits="Investor_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style type="text/css" >

        .checkbox-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3 columns */
    gap: 10px; /* Adjust the gap between the check boxes */
    margin-left: 0; /* Optional: removes left margin */
    padding-left: 0; /* Optional: removes padding on the left */
}

.checkbox-grid li {
    display: flex;
    align-items: center; /* Align check box and text vertically */
}




        /* Button Styling */
        .btn {
            padding: 12px 20px;
            background-color: #4caf50;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .btn-block {
            display: block;
        }



    </style>
    
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>   
     <script src="http://code.jquery.com/jquery-1.10.2min.js" type="text/javascript"></script>
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
    <div class="container hh gj hj" style="border-radius:50px">
    <h2 class="mt-4" style="text-align:center" >Investor Registration </h2>
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
                           <asp:Label ID="lblMsg" runat="server"> &nbsp;&nbsp;&nbsp;</asp:Label>
                           <asp:FileUpload ID="FileUpload1" runat="server"  onchange="ImagePreview(this);"  />
                            
                            
                           </div>

    </ContentTemplate>
                        </asp:UpdatePanel>

                       </div>
                   </div>
                   
               </div>
         <div class="col-lg-6"></div>
        <!-- Firm Name -->
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtFirmName" class="form-label">Firm Name:</label>
                <asp:TextBox ID="txtFirmName" runat="server" class="form-control" placeholder="Enter Firm Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirmName" runat="server" 
                    ControlToValidate="txtFirmName" ErrorMessage="Firm Name is required!"   ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
        </div>

        <!-- Investor Name -->
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtInvestorName" class="form-label">Investor Name:</label>
                <asp:TextBox ID="txtInvestorName" runat="server" class="form-control" placeholder="Enter Investor Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorInvestorName" runat="server" 
                    ControlToValidate="txtInvestorName" ErrorMessage="Investor Name is required!"   ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
        </div>

        <!-- Registration Number -->
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtRegistrationNumber" class="form-label">Registration Number:</label>
                <asp:TextBox ID="txtRegistrationNumber" runat="server" class="form-control" placeholder="Enter Registration Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegistrationNumber" runat="server"   ForeColor="Red" 
                    ControlToValidate="txtRegistrationNumber" ErrorMessage="Registration Number is required!" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
        </div>

        <!-- GST Number -->
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtGSTNumber" class="form-label">GST Number:</label>
                <asp:TextBox ID="txtGSTNumber" runat="server" class="form-control" placeholder="Enter GST Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGSTNumber" runat="server" 
                    ControlToValidate="txtGSTNumber" ErrorMessage="GST Number is required!"   ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
              
            </div>
        </div>



        


         <div class="col-lg-6">
    <div class="form-group">
        <label for="txtCategory" class="form-label">Category Of Funding :</label>

        <!-- CheckBoxList for categories -->
        <asp:CheckBoxList ID="cblCategory" runat="server" class="form-control" />

       
        
    </div>
</div>

        <!-- Mobile Number -->
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtMobile" class="form-label">Mobile Number:</label>
                <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Enter Mobile Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server"   ForeColor="Red" 
                    ControlToValidate="txtMobile" ErrorMessage="Mobile Number is required!" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegexValidatorMobile" runat="server" 
                    ControlToValidate="txtMobile" ValidationExpression="^\d{10}$"   ForeColor="Red" 
                    ErrorMessage="Invalid Mobile Number!" CssClass="error-message" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </div>
        </div>

         <div class="col-lg-6">
            <div class="form-group">
                <label for="txtMobile" class="form-label">Contact Number:</label>
                <asp:TextBox ID="txtcontact" runat="server" class="form-control" placeholder="Enter Contact Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"   ForeColor="Red" 
                    ControlToValidate="txtcontact" ErrorMessage="Mobile Number is required!" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtcontact" ValidationExpression="^\d{10}$"   ForeColor="Red" 
                    ErrorMessage="Invalid Contact Number!" CssClass="error-message" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </div>
        </div>


        <!-- Email Address -->
        <div class="col-lg-6">
            <div class="form-group">
                <label for="txtEmail" class="form-label">Email Address:</label>
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Email Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Email is required!"   ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegexValidatorEmail" runat="server"   ForeColor="Red" 
                    ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                    ErrorMessage="Invalid Email Address!" CssClass="error-message" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </div>
        </div>

          <div class="col-lg-6">
            <div class="form-group">
                <label for="txtEmail" class="form-label">Website:</label>
                <asp:TextBox ID="txtwebsite" runat="server" class="form-control" placeholder="Enter Website Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtwebsite" ErrorMessage="Email is required!"   ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
               
            </div>
        </div>


          <div class="col-lg-6">
            <div class="form-group">
                <label for="txtEmail" class="form-label">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" placeholder="****"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Password is required!"   ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
               
            </div>
        </div>




         <div class="col-lg-12"></div>
        <div class="col-lg-3">
            </div>
        <!-- Submit Button -->
        <div class="col-lg-6">
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-block"   OnClick="btnSubmit_Click"/>
            </div>
        </div>
    </div>
</div>

</asp:Content>

