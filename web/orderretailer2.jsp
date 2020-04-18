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
        <title class="body">Place Order</title>
    </head>
    <body class="body" align="center">
        <br><br><br><br><br><br><br>
        <h2 class="body" align="center">Place Order</h2>
        <hr>
        <br>
        <form class="body" action="orderretailer3.jsp">
            <%
                Integer selectedID = Integer.parseInt(request.getParameter("productListOrder"));
                Connection con = null;
                Statement st = null;
                PreparedStatement stat;
                ResultSet rs = null;
                int ID = 0;
                String NAME = "";
                float COSTPRICE = 0;
                float SELLINGPRICE = 0;
                float PROFIT = 0;
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
                        SELLINGPRICE = Float.parseFloat(rs.getString(4));
                        PROFIT = Float.parseFloat(rs.getString(5));
                    }%>

            <br>
            <br>
            <table align="center" border="1">
                <tr>    
                    <td>ID</td>
                    <td>Product Name</td>
                    <td>Cost Per Piece</td>
                </tr>
                <tr>    
                    <td><%=ID%></td>
                    <td><%=NAME%></td>
                    <td><%=SELLINGPRICE%></td>
                </tr>
            </table>
            <br>    
            Enter Quantity: <input type="text" name="QUANTITY" required/>

            <br><br>
            <%
                    request.getSession().setAttribute("ID", ID);
                    request.getSession().setAttribute("NAME", NAME);
                    request.getSession().setAttribute("COSTPRICE", COSTPRICE);
                    request.getSession().setAttribute("SELLINGPRICE", SELLINGPRICE);
                    request.getSession().setAttribute("PROFIT", PROFIT);

                } catch (Exception E) {
                    out.println(E.getMessage());
                }%>
            <input class="button" type="submit" value="Add Product"/>
        </form>
    </body>
</html>
