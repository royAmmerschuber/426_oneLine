<%@ page import="Persistence.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: vmadmin
  Date: 31.01.2018
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.   com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/diashow.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Startseite</title>
</head>





<body>
<div class="colorchill">
    <jsp:include page="header.jsp"/>
    <%
        ResultSet rs=null;
        try {
            PreparedStatement p=Database.getConnection().prepareStatement(
                    "SELECT p.name,p.amount,p.description,p.price,u.userName,c.name,i.image FROM product AS p \n" +
                    "\tLEFT JOIN user AS u ON u.id=p.sellerFK\n" +
                    "    LEFT JOIN category AS c ON c.id=p.categoryFK\n" +
                    "Left Join image as i on p.id=i.productFK"+
                    "    WHERE p.id=?");
            p.setInt(1,Integer.parseInt(request.getParameter("id")));
            rs=p.executeQuery();
            rs.next();
            String x;
            for(int i=1;i<=7;i++){
                x=rs.getString(i);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
<div class="container">
    <div class="row">
        <div class="col-xs-4 item-photo">
            <img style="max-width:100%;" src="${pageContext.request.contextPath}/images/products/<%try{out.print(rs.getString(7));}catch (Exception e){e.printStackTrace();}%>" />
        </div>
        <div class="col-xs-5">
            <!-- Datos del vendedor y titulo del producto -->
            <h3 style="color: white"><%try{out.print(rs.getString(1));}catch (Exception e){e.printStackTrace();}%></h3>
            <!-- Precios -->
            <h4  style="color: black;"><small>Price</small></h4>
            <h6 style="margin-top:0px; color: white;"><%try{out.print(rs.getString(4));}catch (Exception e){e.printStackTrace();}%></h6>

            <h4  style="color: black;"><small>Seller</small></h4>
            <h6 style="margin-top:0px; color: white;"><%try{out.print(rs.getString(5));}catch (Exception e){e.printStackTrace();}%></h6>

            <!-- Detalles especificos del producto -->
            <div class="section" style="padding-bottom:20px;">
                <h4 class="title-attr" style="color: black;"><small>Menge</small></h4>
                <div>
                    <form action="/Shop/Buy">
                        <input value="1" type="number" name=amount class="sell_amount"/>/<%try{out.print(rs.getString(2));}catch (Exception e){e.printStackTrace();}%>
                        <button class="btn btn-success" name="id" value="<%out.print(request.getParameter("id"));%>">Buy</button>
                    </form>
                </div>
            </div>

        </div>

        <div class="col-xs-9">
            <ul class="menu-items" style="color: white"><%try{out.print(rs.getString(6));}catch (Exception e){e.printStackTrace();}%>
            </ul>
            <div style="width:100%;border-top:1px solid silver">
                <p style="padding:15px;">
                    <small style="color: white">
                        <%try{out.print(rs.getString(3));}catch (Exception e){e.printStackTrace();}%>
                    </small>
                </p>
            </div>
        </div>
    </div>
</div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
