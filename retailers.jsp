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
    <head class="body">
        <meta class="body" http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title class="body">Retailers</title>
    </head>
    <body class="body">
        <br><br><br><br><br><br><br>
        <h2 class="body" align="center">Retailers</h2>
        <hr>
        <br>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            ArrayList<Integer> IDArrayList = new ArrayList<Integer>();
            ArrayList<String> NAMEArrayList = new ArrayList<String>();
            ArrayList<String> ADDArrayList = new ArrayList<String>();
            ArrayList<Integer> CONTACTArrayList = new ArrayList<Integer>();

            String url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                String SQL = "select * from retailers";
                st = con.createStatement();
                rs = st.executeQuery(SQL);
                while (rs.next()) {
                    IDArrayList.add(Integer.parseInt(rs.getString(1)));
                    NAMEArrayList.add(rs.getString(2));
                    ADDArrayList.add(rs.getString(3));
                    CONTACTArrayList.add(Integer.parseInt(rs.getString(4)));
                }
            } catch (Exception m) {
                System.out.println(m.getMessage());
            }
            if (IDArrayList.size() == 0) {%>
        <h3 class="body" align="center" style="color:#F44336">No Products</h3>
        <%} else {%>
        <table align = "center" border="1">
            <tr align = "center" style="background-color:black">
                <td  style="color:white">Retailer ID</td>
                <td  style="color:white">Retailer Name</td>
                <td  style="color:white">Address</td>
                <td  style="color:white">Contact Number</td>
            </tr>
            <%for (int i = 0; i < IDArrayList.size(); i++) {%>
            <tr align = "center">
                <td><%=IDArrayList.get(i)%></td>
                <td><%=NAMEArrayList.get(i)%></td>
                <td><%=ADDArrayList.get(i)%></td>
                <td><%=CONTACTArrayList.get(i)%></td>
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
