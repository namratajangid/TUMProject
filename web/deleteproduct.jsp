<%-- 
    Document   : deleteCustomer1
    Created on : 29 Jun, 2017, 2:00:11 AM
    Author     : hp
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
    <head class='body'>
        <meta class='body' http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title class='body'>Delete Product Details</title>
    </head>
    <body class='body'>
    <body align="center">
        <br><br><br><br><br><br><br><br><br>
        <h2 class='body' align="center">Delete Customer Details</h2>
        
        <hr><br>
        <form action="deleteproduct2.jsp">
            Select Product ID to be Deleted: <select name="productList"> 
                <option selected="selected"><-Product ID-></option><br>
                <%
                    Connection con = null;
                    Statement st = null;
                    ResultSet rs = null;
                    String url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        con = DriverManager.getConnection(url);
                        String SQL = "select * from products";
                        st = con.createStatement();
                        rs = st.executeQuery(SQL);
                        while (rs.next()) {%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

                <%}
                    } catch (Exception m) {
                        System.out.println(m.getMessage());
                    }%> 
                <hr><br>
                <input class="button" type="submit" value="Delete" />
                <br><br><hr>
                <br>
                </form>
                <form action="products.jsp">
    <input class="button" type="submit" value="Back to 'Products'" />
       </form>
                
                <%--a href="products.jsp">Back to 'Products'</a--%>
        </form>
    </body>
</body>
</html>
