<%-- 
    Document   : products
    Created on : 23 Oct, 2017, 10:50:20 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
    <head class='body'>
        <meta class='body' http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title class='body'>Orders</title>
    </head>
    <body class='body'>
        <br><br><br><br><br><br><br><br><br>
        <h2 class='body' align="center">Orders</h2>
        <hr>
        <br>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            ArrayList<Integer> IDArrayList = new ArrayList<Integer>();
            ArrayList<Integer> QUANTITYArrayList = new ArrayList<Integer>();
            ArrayList<Float> CPArrayList = new ArrayList<Float>();
            ArrayList<Float> SPArrayList = new ArrayList<Float>();
            ArrayList<Float> PROFITArrayList = new ArrayList<Float>();

            String url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                String SQL = "select * from orders";
                st = con.createStatement();
                rs = st.executeQuery(SQL);
                while (rs.next()) {
                    IDArrayList.add(Integer.parseInt(rs.getString(1)));
                    QUANTITYArrayList.add(Integer.parseInt(rs.getString(2)));
                    CPArrayList.add(Float.parseFloat(rs.getString(3)));
                    SPArrayList.add(Float.parseFloat(rs.getString(4)));
                    PROFITArrayList.add(Float.parseFloat(rs.getString(5)));
                }
            } catch (Exception m) {
                System.out.println(m.getMessage());
            }
            if (IDArrayList.size() == 0) {%>
        <h3 class='body' align="center" style="color:#F44336">No Orders</h3>
        <%} else {%>
        <table align = "center" border="1">
            <tr align = "center" style="background-color:black">
                <td  style="color:white">Order ID</td>
                <td  style="color:white">Total Quantity</td>
                <td  style="color:white">Total Cost Price</td>
                <td  style="color:white">Total Selling Price</td>
                <td  style="color:white">Total Profit</td>
            </tr>
            <%for (int i = 0; i < IDArrayList.size(); i++) {%>
            <tr align = "center">
                <td><%=IDArrayList.get(i)%></td>
                <td><%=QUANTITYArrayList.get(i)%></td>
                <td><%=CPArrayList.get(i)%></td>
                <td><%=SPArrayList.get(i)%></td>
                <td><%=PROFITArrayList.get(i)%></td>
            </tr>
            <%}%>
            <%}%>
        </table>
        <br>
    <center>
        <form action="welcomewholeseller.jsp">
    <input class="button" type="submit" value="<< Back" />
       </form>
        <%--a href="welcomewholeseller.jsp">Back</a--%></center>

</body>
</html>
