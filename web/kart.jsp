<%@ page import="Persistence.Database" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: vmadmin
  Date: 25.01.2018
  Time: 09:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>oneLine Shop</title>
</head>
<body>
<div class="colorchill">
    <jsp:include page="header.jsp"/>

<div class="container">
    <div class="row">
        <%!
            private String generateElems(String search,String base,int UID) {
                if(search==null){
                    search="";
                }
                StringBuilder s= new StringBuilder();
                try {
                    PreparedStatement p = Database.getConnection().prepareStatement(
                            "SELECT p.name,p.price,p.id,i.image,p.discPrice, k.amount, p.amount FROM product as p\n" +
                            "left join image as i on i.productFK=p.id\n" +
                            "left join kart as k on k.productFK=p.id "+
                            "WHERE k.userFK=?");
                    p.setInt(1,UID);
                    ResultSet rs=p.executeQuery();
                    String path;
                    while(rs.next()){
                        if(rs.getString(4)!=null) {
                            path = base + "/images/products/" + rs.getString(4);
                        }else{
                            path="https://placehold.it/150x80?text=IMAGE";
                        }
                        s.append(generateElem(rs.getString(1),rs.getString(2),rs.getInt(3),path,rs.getString(5),rs.getInt(6),rs.getInt(7)));
                    }
                }catch (Exception e){
                    return e.toString();
                }
                return s.toString();

            }

            private String generateElem(String name,String price,int id,String image,String pPrice,int kAmount,int pAmount){
                String s="";
                s+="<div class='col-sm-4'>";
                s+="<div class='panel panel-primary'>";
                s+="<div class='panel-heading'>"+name;
                s+="<a class='xButton' href='/Shop/Kart?amount=0&id="+id+"'>X</a>";
                s+="</div>";
                
                s+="<a href='/Shop/Details?id="+id+"'><div class='panel-body'><img src='"+image+"' class='img-responsive' alt='Image'></div></a>";
                s+="<div class='panel-footer'>";
                if(pPrice==null) {
                    s += "Preis: " + price + "CHF<br>";
                }else{
                    s+= "Preis: "+pPrice+" <p class='oldPrice'>"+price+"</p> CHF<br>";
                }
                s+="<form action='/Shop/Kart'>";
                s+="<input value='"+kAmount+"' type='number' name=amount class='sell_amount' max='"+pAmount+"' min='1'/>/"+pAmount;
                s+="<button class='btn btn-success' name='id' value='"+id+"'>Set</button>";
                s+="</form>";
                s+="</div></div></div>";
                return s;
            }
        %>
        <%
            out.println(generateElems(request.getParameter("search"),request.getContextPath(),(int)request.getSession().getAttribute("id")));
        %>
    </div>
</div>
<div>
    <p>Preis: <%
        try {
            PreparedStatement p = Database.getConnection().prepareStatement(
                    "SELECT SUM(IF(p.discPrice is not NULL, p.discPrice,p.price )*k.amount) " +
                            "FROM kart AS k " +
                            "LEFT JOIN product AS p ON p.id=k.productFK " +
                            "WHERE userFK=?"
            );
            p.setInt(1,(int)request.getSession().getAttribute("id"));
            ResultSet rs=p.executeQuery();
            rs.next();
            out.print(rs.getDouble(1));
        }catch (Exception e){
            e.printStackTrace();
        }

    %>CHF</p>
    <a href="/Shop/Buy" class="btn btn-success">Kaufen</a>
</div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
