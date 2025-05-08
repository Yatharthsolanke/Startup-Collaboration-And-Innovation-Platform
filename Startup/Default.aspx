<%@ Page Title="" Language="C#" MasterPageFile="~/Startup/Start_MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Startup_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="startup-details-container">
        <h2>Startup Profile</h2>
        
        <asp:Image ID="StartupLogo" runat="server" Width="100" Height="100" />
        <h3><asp:Label ID="lblFirmName" runat="server" Text="Firm Name"></asp:Label></h3>
        <p><strong>Investor Name:</strong> <asp:Label ID="lblInvestorName" runat="server" Text="Investor Name"></asp:Label></p>
        <p><strong>Registration Number:</strong> <asp:Label ID="lblRegistrationNumber" runat="server" Text="Registration Number"></asp:Label></p>
        <p><strong>GST Number:</strong> <asp:Label ID="lblGSTNumber" runat="server" Text="GST Number"></asp:Label></p>
        <p><strong>Mobile Number:</strong> <asp:Label ID="lblMobileNumber" runat="server" Text="Mobile Number"></asp:Label></p>
        <p><strong>Category:</strong> <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label></p>
        <p><strong>Email Address:</strong> <asp:Label ID="lblEmail" runat="server" Text="Email Address"></asp:Label></p>
        <p><strong>Website:</strong> <asp:HyperLink ID="hlWebsite" runat="server" NavigateUrl="#" Text="Visit Website"></asp:HyperLink></p>
        
      
    </div>
    <style>

        .startup-details-container {
    width: 70%;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
    border: 1px solid #ddd;
    border-radius: 10px;
    background-color: #f9f9f9;
}

.startup-details-container h2 {
    text-align: center;
    color: #333;
}

.startup-details-container img {
    border-radius: 50%;
    margin: 10px 0;
}

.startup-details-container p {
    font-size: 1.2em;
    margin: 10px 0;
}

.startup-details-container .back-btn {
    margin-top: 20px;
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.startup-details-container .back-btn:hover {
    background-color: #0056b3;
}



    </style>

</asp:Content>


