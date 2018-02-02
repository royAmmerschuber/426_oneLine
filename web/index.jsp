<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Persistence.Database" %>
<%@ page import="java.sql.ResultSet" %><%--
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
    <script src="https://ajax.googleapis.   com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/diashow.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Startseite</title>
</head>
<body>
<div class="colorchill">

<jsp:include page="header.jsp"/>

<div class="container">
    <div class="row">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/images/mode.jpg" alt="Chania">
                    <div class="carousel-caption">
                        <h3>Price Fair</h3>
                    </div>
                </div>

                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/luxus.jpg" alt="Chicago">
                    <div class="carousel-caption">
                        <h3>Comfortable</h3>
                    </div>
                </div>

                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/juwelen.jpg" alt="New York">
                    <div class="carousel-caption">
                        <h3>Easy</h3>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div><br><br>

<div class="container">
    <div class="row">
        <%!
            private String generateElems(String search,String base) {
                if(search==null){
                    search="";
                }
                StringBuilder s= new StringBuilder();
                try {
                    PreparedStatement p = Database.getConnection().prepareStatement(
                            "SELECT p.name,p.price,p.id,i.image,p.discPrice FROM product as p " +
                                    "left join image as i on i.productFK=p.id " +
                                    "WHERE amount>0 and " +
                                    "p.discPrice is not NULL");
                    ResultSet rs=p.executeQuery();
                    String path;
                    while(rs.next()){
                        if(rs.getString(4)!=null) {
                            path = base + "/images/products/" + rs.getString(4);
                        }else{
                            path="https://placehold.it/150x80?text=IMAGE";
                        }
                        s.append(generateElem(rs.getString(1),rs.getString(2),rs.getInt(3),path,rs.getString(5)));
                    }
                }catch (Exception e){
                    return e.toString();
                }
                return s.toString();

            }

            private String generateElem(String name,String price,int id,String image,String pPrice){
                String s="";
                s+="<div class='col-sm-4'>";
                s+="<div class='panel panel-primary'>";
                s+="<div class='panel-heading'>"+name+"</div>";
                s+="<a href='/Shop/Details?id="+id+"'><div class='panel-body'><img src='"+image+"' class='img-responsive' alt='Image'></div></a>";
                s+="<div class='panel-footer'>";
                s+= "Preis: "+pPrice+" <p class='oldPrice'>"+price+"</p> CHF<br>";
                s+="<form action='/Shop/Buy'>";
                s+="<input value='1' type='number' name=amount class='sell_amount'/>";
                s+="<button class='btn btn-success' name='id' value='"+id+"'>Buy</button>";
                s+="</form>";
                s+="</div></div></div>";
                return s;
            }
        %>
        <%
            out.println(generateElems(request.getParameter("search"),request.getContextPath()));
        %>
    </div>
</div><br>


    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
