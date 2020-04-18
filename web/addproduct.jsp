<%-- 
    Document   : addCustomer
    Created on : 28 Jun, 2017, 9:54:51 PM
    Author     : hp
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
    <head class="body">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body class="body" align="center">
        <%
            String ID = request.getParameter("ID");
            String NAME = request.getParameter("NAME");
            float COSTPRICE = Float.parseFloat(request.getParameter("COSTPRICE"));
            float PROFITPERCENT = Float.parseFloat(request.getParameter("PROFITPERCENT"));
            float SELLINGPRICE = ((COSTPRICE * PROFITPERCENT) / 100) + COSTPRICE;

            Connection con = null;
            PreparedStatement stat;

            String url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                stat = con.prepareStatement("insert into products values(?,?,?,?,?,?)");
                stat.setInt(1, Integer.parseInt(ID));
                stat.setString(2, NAME);
                stat.setFloat(3, COSTPRICE);
                stat.setFloat(4, SELLINGPRICE);
                stat.setFloat(5, SELLINGPRICE - COSTPRICE);
                stat.setFloat(6, PROFITPERCENT);
                stat.executeUpdate();
                con.close();%>
                
        <br><br><br><br><br><br>
        <h2 class="body" align="center" style="color:#76FF03">Successfully Saved</h2>
        <%} catch (Exception E) {%>
        <br>
        <h2 class="body" align="center" style="color:#F44336">Could Not Be Saved</h2>
        <%}%>
        <br><hr>
        <br>
        
        <form  action="welcomewholeseller.jsp">
            
    <input class="button" type="submit" value="Wholesaler"/>
</form>
        
        <form  action="addproducthtml.html">
            
    <input class="button" type="submit" value="Add Product"/>
</form>
        
        <%--a href="products.jsp">Back to 'Products'</a> <br>
<a href="addproducthtml.html">Back to 'Add Product'</a--%>
        
        
    </body>
</html>
