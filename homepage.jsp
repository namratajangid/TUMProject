<%-- 
    Document   : homepage
    Created on : 5 Nov, 2017, 11:44:04 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
     
    <head class='body'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><center>Home Page</center></title>
    </head>
    <div class='body'>
    <body ><br><br><br><br>
        <%--h1><center></center></h1><br--%>
        <br><br><br><br>
    
    <div class="topnav" id="myTopnav">
  <a href="navbardetails.html">About Us</a>
  <a href="navbardetails.html">Trading Policy</a>
  <a href="navbardetails.html">Contact Us</a>
  <a href="navbardetails.html">Logout</a>
  
</div>
    
    <br>
    <br><br><br>
    <center><br>
        <form action="welcomeretailer.jsp">
    <input class="button" type="submit" value="Retailer" />
       </form>
        <%--a href="welcomeretailer.jsp">Retailer</a---%>
    </center><br>
    <center>
        <form  action="welcomewholeseller.jsp">       
        <input class="button" type="submit" value="Wholesaler"/>
        </form>
        <%--a href="welcomewholeseller.jsp">Wholesaler</a--%>
    </center>
</body>
</div>
</html>
