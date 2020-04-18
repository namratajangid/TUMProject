
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
    <head class='body'>
        <meta class='body' http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title class='body'>Delete Customer Details</title>
    </head>
    <body class='body' align="center">
        <%
            String ID = request.getParameter("productList");
            //out.print(name);
            Connection con = null;
            PreparedStatement stat;
            String url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                stat = con.prepareStatement("delete from products where ID=" + ID + "");
                stat.executeUpdate();%>
        <br><br><br><br><br><br><br>
        <h2 class='body' align="center" style="color:#76FF03">Successfully Deleted</h2>
        <%} catch (Exception E) {%>
        <br><br><br><br><br><br><br><br><br>
        <h2 class='body' align="center" style="color:#F44336">Could Not Be Deleted</h2>
        <%}%>
        <br><hr>
    <br><br>
    <form action="products.jsp">
    <input class="button" type="submit" value="Products" />
       </form>
    <%--a href="products.jsp">Back to 'Products'</a--%>
    <br>
    <form action="welcomewholeseller.jsp">
    <input class="button" type="submit" value="<< Back to 'Wholesaler'" />
       </form>
    <%--a href="deleteproduct.jsp">Back to 'Delete Product Details'</a--%>
    </body>
</html>
