<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_MasterPage.master" AutoEventWireup="true" CodeFile="View_post.aspx.cs" Inherits="user_View_post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <style>
   .jwe {
    padding-top: 2rem;
    padding-bottom: 5rem;



}

   .c:hover .im {
    --tw-translate-y: 0px;
    transform: translate(var(--tw-translate-x), var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y));
}

   .il {
    transition-duration: 300ms;
}


   .nl {
    transition-timing-function: linear;
}

</style>
        <link rel="icon" href="favicon.ico"><link href="css/style.css" rel="stylesheet">

  
     <div class="mx-auto max-w-screen-2xl bg-white  p-4 md:p-6 2xl:p-10">  
<div class="wc .jwe pn xo  ">

    <!-- Repeater Control to Display Projects -->
    <asp:Repeater ID="EventRepeater" runat="server" DataSourceID="SqlDataSource1">
         <ItemTemplate>


<div class="animate_top sg vk rm xm">
<div class="c rc i z-1 pg">
<img  src='<%# "../Startup/logo/" + Eval("ProjectImage") %>' alt="Blog">
<div class="im h r s df vd yc wg tc wf xf al hh/20 nl il z-10">

    <a href="info_project.aspx?pi_id=<%# Eval("pi_id") %>&st_id=<%# Eval("st_id")  %>&req_id=<%# Eval("req_id")  %> " 
   class="vc ek rg lk gh sl ml il gi hi text-blue-500 hover:underline">
   Apply
</a>

</div>
</div>
<div class="yh">
<div class="tc uf wf ag jq">
<div class="tc wf ag">
<%--<img src="../images/icon-man.png" alt="User">--%>
<b><p><%# Eval("Projectname") %></p></b>
</div>

</div>
<h6 class="ek tj ml il kk wm xl eq lb">
<p>Requirements: <%# Eval("requirements") %></p>

</h6>
    <p style="color:blue" >Required Skills :  <%# Eval("req_skill") %></p>
</div>
</div>




</ItemTemplate>

  </asp:Repeater>
    </div>



</div>

        
           
    <!-- SqlDataSource -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:StarupConnectionString %>" 
                       SelectCommand="SELECT  u.ProjectImage,  u.Projectname, r.requirements ,r.req_skill , r.req_id,  r.pi_id,r.st_id
FROM   Project_Requirement r JOIN  Upload_Project_Idea u ON r.pi_id = u.pi_id">
    </asp:SqlDataSource>


    <script defer="" src="js/bundle.js"></script><script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'8d6124ae9c3406bc',t:'MTcyOTUxMjYxNC4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script><iframe height="1" width="1" style="position: absolute; top: 0px; left: 0px; border: none; visibility: hidden;"></iframe><script defer="" src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015" data-cf-beacon="{" rayid":"8d6124ae9c3406bc","version":"2024.10.1","r":1,"token":"9a6015d415bb4773a0bff22543062d3b","servertiming":{"name":{"cfextpri":true,"cfl4":true,"cfspeedbrain":true,"cfcachestatus":true}}}"="" crossorigin="anonymous"></script>

       
</asp:Content>

