<%-- 
    Document   : updateCustomer1
    Created on : 29 Jun, 2017, 3:06:30 AM
    Author     : hp
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
    <head class='body'>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place Order</title>
    </head>
    <body class='body' align="center">
        <br>
        
        <br><br><br><br><br><br><br>
        <h2 class='body' align="center">Place Order</h2>
        
        <hr>
        <br>
        <form action="orderretailer2.jsp">
            Select Product ID: <select name="productListOrder"> 
                <option selected="selected"><-Product ID-></option>
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
                <br>
                <br>
                  <input type="submit" value="Select" />
                <br><br><hr>
                <br>
                </form>
                <form action="welcomeretailer.jsp">
    <input class="button" type="submit" value="Back to 'Main'" />
</form>
                <%--a href="welcomeretailer.jsp">Back to 'Main'</a--%>
        </form>
    </body>
</html>
