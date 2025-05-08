<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sign_in.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <style>
             .af {
    max-width: 35.375rem;
}
         </style>


  <img src="images/shape-06.png" alt="Shape" class="h j k" />
        <img src="images/shape-03.png" alt="Shape" class="h l m" />
        <img src="images/shape-17.png" alt="Shape" class="h n o" />
        <img src="images/shape-18.png" alt="Shape" class="h p q" />

        <div
          class="animate_top bb af i va sg hh sm vk xm yi _n jp hi ao kp">
          <!-- Bg Border -->
          <span class="rc h r s zd/2 od zg gh"></span>
          <span class="rc h r q zd/2 od xg mh"></span>

          <div class="rj">
            <h2 class="ek ck kk wm xb">Sign in to your Account</h2>
             </div>
             
    
            <div class="wb">
              <label class="rc kk wm vb" for="username">Select login</label>
             
                 
                <asp:DropDownList ID="ddlUserType" runat="server"  class="vd hh rg zk _g ch hm dm fm pl/50 xi mi sm xm pm dn/40 kk wm "    >
                    <asp:ListItem>Select</asp:ListItem>
                      <asp:ListItem   Value="InvestorRegistration"  >Investor</asp:ListItem>
                      <asp:ListItem   Value="Star_UpRegistration"  >startup</asp:ListItem>
                    <asp:ListItem   Value="Registration"  >Student</asp:ListItem>
                     
                </asp:DropDownList>
            </div>




          
            <div class="wb">
              <label class="rc kk wm vb" for="username">Username</label>
             
                 <asp:TextBox ID="txtuname"   placeholder="example@gmail.com"  class="vd hh rg zk _g ch hm dm fm pl/50 xi mi sm xm pm dn/40  kk wm"  runat="server"></asp:TextBox>

            </div>



             

            <div class="wb">
              <label class="rc kk wm vb" for="password">Password</label>
              
                  <asp:TextBox ID="txtpassword"   placeholder="**************"
                class="vd hh rg zk _g ch hm dm fm pl/50 xi mi sm xm pm dn/40 kk wm "    TextMode="Password"   type="password"  runat="server"></asp:TextBox>

            </div>

           
              <asp:Button ID="btnsig_in"  class="vd rj ek rc rg gh lk ml il _l gi hi"  runat="server" Text="Sign In"   OnClick="btnsig_in_Click" />


            <p class="sj hk xj rj ob">
              Don't have an account?
              <a class="mk" href="signup.aspx"> Sign Up </a>
            </p>
         
             <div class="wb">
             
                 <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
            
</div>
        </div>

</asp:Content>

