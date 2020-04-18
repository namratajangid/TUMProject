<%-- 
    Document   : updateCustomer3
    Created on : 29 Jun, 2017, 3:23:25 AM
    Author     : hp
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
    <head class="body">
        <meta class="body" http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title class="body">3</title>
    </head>
    <body class="body" align="center"><br><br><br><br><br><br>
        <%
            int ID = (Integer) request.getSession().getAttribute("ID");
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
                stat = con.prepareStatement("update products set productNAME=?, productCP=?, productSP=?, productPROFIT=?, productPROFITPERCENT=? where ID=" + ID + "");
                stat.setString(1, NAME);
                stat.setFloat(2, COSTPRICE);
                stat.setFloat(3, SELLINGPRICE);
                stat.setFloat(4, SELLINGPRICE-COSTPRICE);
                stat.setFloat(5, PROFITPERCENT);
                stat.executeUpdate();%>
        <br>
        <h2 class="body" align="center" style="color:#76FF03">Successfully Updated</h2>
        <%} catch (Exception E) {
            out.println(E.getMessage());%>
        <br>
        <h2 class="body" align="center" style="color:#F44336"><%=E.getMessage()%></h2>
        <%}%>
        <br><hr>
        <br>
        <form action="products.jsp">
    <input class="button" type="submit" value="<< Back to 'Products'" />
       </form>
        
        <%--a href="products.jsp">Back to 'Products'</a--%>
        <br>
        <form action="updateproduct1.jsp">
    <input class="button" type="submit" value="<< Back to 'Update Product Details'" />
       </form>
        
        <%--a href="updateproduct1.jsp">Back to 'Update Product Details'</a--%>
</html>
