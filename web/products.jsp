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
        <title class="body">Products</title><hr><br>
    </head>
    <body class="body"><br><br><br><br><br><br>
                <br>
        <h2 class="body" align="center">Products</h2>
        <hr><center>
        <form action="addproducthtml.html">
    <input class="button" type="submit" value="Add" />
       </form>
        <br>
        <form action="deleteproduct.jsp">
    <input class="button" type="submit" value="Delete" />
       </form>
        <br>
        <form action="updateproduct1.jsp">
    <input class="button" type="submit" value="Update" />
       </form></center>
        <br>
    <%--a href="addproducthtml.html"> Add</t></t></a>
        
     <a href="deleteproduct.jsp"> Delete</t></t></a>
        
    <a href="updateproduct1.jsp"> Update</a--%>
        
        <hr><br>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            ArrayList<Integer> IDArrayList = new ArrayList<Integer>();
            ArrayList<String> NAMEArrayList = new ArrayList<String>();
            ArrayList<Float> COSTPRICEArrayList = new ArrayList<Float>();
            ArrayList<Float> SELLINGPRICEArrayList = new ArrayList<Float>();
            ArrayList<Float> PROFITArrayList = new ArrayList<Float>();
            
            String url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                String SQL = "select * from products";
                st = con.createStatement();
                rs = st.executeQuery(SQL);
                while (rs.next()) {
                    IDArrayList.add(Integer.parseInt(rs.getString(1)));
                    NAMEArrayList.add(rs.getString(2));
                    COSTPRICEArrayList.add(Float.parseFloat(rs.getString(3)));
                    SELLINGPRICEArrayList.add(Float.parseFloat(rs.getString(4)));
                    PROFITArrayList.add(Float.parseFloat(rs.getString(5)));
                }
            } catch (Exception m) {
                System.out.println(m.getMessage());
            }
            if (IDArrayList.size() == 0) {%>
        <h3 class="body" align="center" style="color:#F44336">No Products</h3>
        <%} else {%>
        <table align = "center" border="1">
            <tr align = "center" style="background-color:black">
                <td  style="color:white">Product ID</td>
                <td  style="color:white">Name</td>
                <td  style="color:white">Cost Price</td>
                <td  style="color:white">Selling Price</td>
                <td  style="color:white">Profit</td>
            </tr>
            <%for(int i = 0 ; i < IDArrayList.size(); i++){%>
            <tr align = "center">
                <td><%=IDArrayList.get(i)%></td>
                <td><%=NAMEArrayList.get(i)%></td>
                <td><%=COSTPRICEArrayList.get(i)%></td>
                <td><%=SELLINGPRICEArrayList.get(i)%></td>
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
