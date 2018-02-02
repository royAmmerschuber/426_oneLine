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
    <title>Startseite</title>
</head>
<body>
<div class="colorchill">
    <jsp:include page="header.jsp"/>

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
                            "SELECT p.name,p.price,p.id,i.image FROM product as p " +
                            "left join image as i on i.productFK=p.id " +
                            "WHERE amount>0 AND lower(name) REGEXP lower(?) OR lower(description) REGEXP lower(?)");
                    p.setString(1,search);
                    p.setString(2,search);
                    ResultSet rs=p.executeQuery();
                    String path;
                    while(rs.next()){
                        if(rs.getString(4)!=null) {
                            path = base + "/images/products/" + rs.getString(4);
                        }else{
                            path="https://placehold.it/150x80?text=IMAGE";
                        }
                        s.append(generateElem(rs.getString(1),rs.getString(2),rs.getInt(3),path));
                    }
                }catch (Exception e){
                    return e.toString();
                }
                return s.toString();

            }

            private String generateElem(String name,String price,int id,String image){
                String s="";
                s+="<div class=\"col-sm-4\">";
                s+="<div class=\"panel panel-primary\">";
                s+="<div class=\"panel-heading\">"+name+"</div>";
                s+="<a href='/Shop/Details?id="+id+"'><div class=\"panel-body\"><img src=\""+image+"\" class=\"img-responsive\" alt=\"Image\"></div></a>";
                s+="<div class=\"panel-footer\">Preis: "+price+"CHF<br>";
                s+="<form action=\"/Shop/Buy\">";
                s+="<input value=\"1\" type=\"number\" name=amount class=\"sell_amount\"/>";
                s+="<button class='btn btn-success' name='id' value='"+id+"'>Buy</button>";
                s+="</form>";
                s+="</div></div></div>";
                return s;
            }
        %>
        <%
            out.println(generateElems(request.getParameter("search"),request.getContextPath()));
        %>
        <%--<div class="col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                <div class="panel-footer">Preis: 70€<br>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
            </div>
        </div>--%>

    </div>
</div><br>


<br><br>

    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
