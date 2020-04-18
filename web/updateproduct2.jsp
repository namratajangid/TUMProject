<%-- 
    Document   : updateCustomer2
    Created on : 29 Jun, 2017, 3:09:01 AM
    Author     : hp
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
    <head class="body">
        <meta class="body" http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title class="body">Update Product Details</title>
    </head>
    <body class="body" align="center">
        <br><br><br><br><br><br><br><br><br>
        <h2 class="body" align="center">Update Product Details</h2>
        <hr>
        <br>
        <form action="updateproduct3.jsp">
            <%
                Integer selectedID = Integer.parseInt(request.getParameter("productList"));
                Connection con = null;
                Statement st = null;
                PreparedStatement stat;
                ResultSet rs = null;
                int ID = 0;
                String NAME = "";
                float COSTPRICE = 0;
                float PROFITPERCENT = 0;
                String url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    con = DriverManager.getConnection(url);
                    String SQL = "select * from products where ID=" + selectedID + "";
                    st = con.createStatement();
                    rs = st.executeQuery(SQL);
                    while (rs.next()) {
                        ID = Integer.parseInt(rs.getString(1));
                        NAME = rs.getString(2);
                        COSTPRICE = Float.parseFloat(rs.getString(3));
                        PROFITPERCENT = Float.parseFloat(rs.getString(6));
                    }%>
            ID: <%=ID%>
            <br>
            <br>
            Product Name: <input type="text" name="NAME" value="<%=NAME%>" required/>
            Cost Price: <input type="text" name="COSTPRICE" value="<%=COSTPRICE%>" required/>
            Profit Percentage: <input type="text" name="PROFITPERCENT" value="<%=PROFITPERCENT%>" required/>
            <br><br>
            <%
                    request.getSession().setAttribute("ID", ID);
                
                } catch (Exception E) {
                    out.println(E.getMessage());
                }%>
            <input type="submit" value="Update"/>
            <br><br><hr>
            <br>
            <form action="products.jsp">
    <input class="button" type="submit" value="Back to 'Customers'" />
       </form>
            
            <%--a href="products.jsp">Back to 'Customers'</a--%>
            <br>
            <form action="updateproduct1.jsp">
    <input class="button" type="submit" value="Back to 'Update Product Details'" />
       </form>
            
            <%--a href="updateproduct1.jsp">Back to 'Update Product Details'</a--%>
        </form>
    </body>
</html>
