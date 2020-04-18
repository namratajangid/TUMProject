<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
    <head class='body'>
        <meta class='body' http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title class='body'>Place Order</title>
    </head>
    <body class='body' align="center">
        <br><br><br><br><br><br>
        <%
            int ID = (Integer) request.getSession().getAttribute("ID");
            String NAME = (String) request.getSession().getAttribute("NAME");
            float COSTPRICE = (Float) request.getSession().getAttribute("COSTPRICE");
            float SELLINGPRICE = (Float) request.getSession().getAttribute("SELLINGPRICE");
            int QUANTITY = Integer.parseInt(request.getParameter("QUANTITY"));
            float PROFIT = (Float) request.getSession().getAttribute("PROFIT");

            Connection con = null;
            PreparedStatement stat;

            String url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                stat = con.prepareStatement("insert into invoice values(?,?,?,?,?,?,?,?)");
                stat.setInt(1, ID);
                stat.setString(2, NAME);
                stat.setFloat(3, COSTPRICE);
                stat.setFloat(4, SELLINGPRICE);
                stat.setInt(5, QUANTITY);
                stat.setFloat(6, COSTPRICE * QUANTITY);
                stat.setFloat(7, SELLINGPRICE * QUANTITY);
                stat.setFloat(8, PROFIT * QUANTITY);
                stat.executeUpdate();
                con.close();
        %>
        <br>
        <h2 class='body' align="center" style="color:#76FF03">Product Added Successfully</h2>
        <br><br><hr>
        <br>
        
        <form action="orderretailer.jsp">
    <input class="button" type="submit" value="Add more Products" />
       </form>
        
        <form action="placeorder.jsp">
    <input class="button" type="submit" value="Place Order" />
       </form>
        
        <%--a href="orderretailer.jsp">Add More Products</a--%>/ 
        <%--a href="placeorder.jsp">Place Order</a--%>
        <%
        } catch (Exception m) {%>
        <br>
        <h2 class='body' align="center" style="color:#F44336">Product Could Not Be Added</h2>
        <br><br><hr>
        <br>
        <form action="orderretailer.jsp">
    <input class="button" type="submit" value="Back" />
       </form>
        
        <%--a href="orderretailer.jsp">Back</a--%>
        <%}%>
    </body>
</html>
