<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
    <head class="body">
        <meta class="body" http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title class="body">Place Order</title>
    </head>
    <body class="body" align="center"><br><br><br><br><br><br><br><br>
        <%
            float totalCP = 0;
            float totalSP = 0;
            float totalQTY = 0;
            float totalPROFIT = 0;
            ArrayList<Integer> IDArrayList = new ArrayList<Integer>();
            ArrayList<String> NAMEArrayList = new ArrayList<String>();
            ArrayList<Float> CPArrayList = new ArrayList<Float>();
            ArrayList<Integer> QTYArrayList = new ArrayList<Integer>();
            ArrayList<Float> TOTALCPArrayList = new ArrayList<Float>();

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            PreparedStatement stat;

            String url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                String SQL = "select * from invoice";
                st = con.createStatement();
                rs = st.executeQuery(SQL);
                while (rs.next()) {
                    totalCP = totalCP + Float.parseFloat(rs.getString(6));
                    totalSP = totalSP + Float.parseFloat(rs.getString(7));
                    totalPROFIT = totalPROFIT + Float.parseFloat(rs.getString(8));
                    totalQTY = totalQTY + Float.parseFloat(rs.getString(5));
                }
            } catch (Exception m) {
                System.out.println(m.getMessage());
            }
            url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                stat = con.prepareStatement("insert into orders values(?,?,?,?)");
                stat.setFloat(1, totalQTY);
                stat.setFloat(2, totalCP);
                stat.setFloat(3, totalSP);
                stat.setFloat(4, totalPROFIT);
                stat.executeUpdate();
                con.close();
        %>
        <br><br><br><br><br>
        <h2 class="body" align="center" style="color:#76FF03">Order Placed Successfully</h2>
        <br><<hr>
        <br>
        <%} catch (Exception m) {%>
        <br>
        <h2 class="body" align="center" style="color:#F44336">Order Could Not be Placed</h2>
        <hr>
        <br>
        <%}
            url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                String SQL = "select * from invoice";
                st = con.createStatement();
                rs = st.executeQuery(SQL);
                while (rs.next()) {
                    IDArrayList.add(Integer.parseInt(rs.getString(1)));
                    NAMEArrayList.add(rs.getString(2));
                    CPArrayList.add(Float.parseFloat(rs.getString(3)));
                    QTYArrayList.add(Integer.parseInt(rs.getString(5)));
                    TOTALCPArrayList.add(Float.parseFloat(rs.getString(6)));

                }
            } catch (Exception m) {
                System.out.println(m.getMessage());
            }
            if (IDArrayList.size() == 0) {%>
        <h3 class="body" align="center" style="color:#F44336">No Products in Order</h3>
        <%} else {%>
        <br><br>
    <center>INVOICE</center>
    <table align = "center" border="1">
        <tr align = "center" style="background-color:black">
            <td  style="color:white">Product ID</td>
            <td  style="color:white">Name</td>
            <td  style="color:white">Price</td>
            <td  style="color:white">Quantity</td>
            <td  style="color:white">Total Price</td>
        </tr>
        <%for (int i = 0; i < IDArrayList.size(); i++) {%>
        <tr align = "center">
            <td><%=IDArrayList.get(i)%></td>
            <td><%=NAMEArrayList.get(i)%></td>
            <td><%=CPArrayList.get(i)%></td>
            <td><%=QTYArrayList.get(i)%></td>
            <td><%=TOTALCPArrayList.get(i)%></td>
        </tr>
        <%}%>
        <%}%>
        <%url = "jdbc:sqlserver://localhost:1433;databaseName=seprojectdb;integratedSecurity=true";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                con = DriverManager.getConnection(url);
                stat = con.prepareStatement("delete from invoice");
                stat.executeUpdate();
            } catch (Exception E) {
                System.out.println(E.getMessage());
            }
        %>
        <br><br><hr>
        <br>
        
        <form action="orderretailer.jsp">
    <input class="button" type="submit" value="Place another Order" />
       </form>
        <br><br>
        <form action="welcomeretailer.jsp">
    <input class="button" type="submit" value="<< Back to 'Main'" />
       </form>
        
        <%--a href="orderretailer.jsp">Place another Order</a--%>
        <%--a href="welcomeretailer.jsp">Back to 'Main'</a--%>
    </body>
</html>
