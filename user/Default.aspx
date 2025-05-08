<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Startup_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="student-details-container">
        <h2>Student Profile</h2>
        
        <asp:Image ID="StudentLogo" runat="server" Width="100" Height="100" />
        <h3><asp:Label ID="lblStudentName" runat="server" Text="Student Name"></asp:Label></h3>
        <p><strong>College Name:</strong> <asp:Label ID="lblCollegeName" runat="server" Text="College Name"></asp:Label></p>
        <p><strong>Degree:</strong> <asp:Label ID="lblDegree" runat="server" Text="Degree"></asp:Label></p>
        <p><strong>Experience:</strong> <asp:Label ID="lblExperience" runat="server" Text="Experience"></asp:Label></p>
        <p><strong>Languages:</strong> <asp:Label ID="lblLanguages" runat="server" Text="Languages"></asp:Label></p>
        <p><strong>Mobile Number:</strong> <asp:Label ID="lblMobileNumber" runat="server" Text="Mobile Number"></asp:Label></p>
        <p><strong>Email Address:</strong> <asp:Label ID="lblEmailAddress" runat="server" Text="Email Address"></asp:Label></p>
        <p><strong>Portfolio:</strong> <asp:HyperLink ID="hlPortfolioLink" runat="server" NavigateUrl="#" Text="Visit Portfolio"></asp:HyperLink></p>
        <p><strong>Resume:</strong> <asp:HyperLink ID="hlResume" runat="server" NavigateUrl="#" Text="Download Resume"></asp:HyperLink></p>
        
        <!-- Button to go back to the previous page -->
       
    </div>


    <style>

        .student-details-container {
    width: 70%;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
    border: 1px solid #ddd;
    border-radius: 10px;
    background-color: #f9f9f9;
}

.student-details-container h2 {
    text-align: center;
    color: #333;
}

.student-details-container img {
    border-radius: 50%;
    margin: 10px 0;
}

.student-details-container p {
    font-size: 1.2em;
    margin: 10px 0;
}

.student-details-container .back-btn {
    margin-top: 20px;
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.student-details-container .back-btn:hover {
    background-color: #0056b3;
}


    </style>
</asp:Content>



