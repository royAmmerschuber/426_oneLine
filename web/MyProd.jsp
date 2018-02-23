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
                                "SELECT p.name,p.price,p.id,i.image,p.discPrice FROM product as p\n" +
                                        "left join image as i on i.productFK=p.id\n" +
                                        "WHERE p.sellerFK=?");
                        p.setInt(1,UID);
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
                    //language=HTML
                    String s="<div class='col-sm-4'>"+
                            "<div class='panel panel-primary'>"+
                            "<div class='panel-heading'>"+name+
                           // "<a class='xButton' href='/Shop/Kart?amount=0&id="+id+"'>X</a>"+
                            "</div>"+
                            "<a href='/Shop/Details?id="+id+"'><div class='panel-body'><img src='"+image+"' class='img-responsive' alt='Image'></div></a>"+
                            "<div class='panel-footer'>";
                    //language=HTML
                    s+= "<div class='dropdown'>\n" +
                            "    <button class='btn btn-primary dropdown-toggle' id='menu1' type='button' data-toggle='dropdown'>M\n" +
                            "    <span class='caret'></span></button>\n" +
                            "    <ul class='dropdown-menu' role='menu' aria-labelledby='menu1'>\n" /*+
                        "      <li role='presentation'><a role='menuitem' tabindex='-1' href='#'>Edit</a></li>\n" +*/;
                    if(pPrice==null){
                        //language=HTML
                        s+= "      <li role='presentation'><a role='menuitem' tabindex='-1' href='#' onclick=\"addDiscWindow('"+name+"',"+id+")\">add Discount</a></li>\n";
                    }else{
                        //language=HTML
                        s+= "      <li role='presentation'><a role='menuitem' tabindex='-1' href='#' onclick=\"addDiscWindow('"+name+"',"+id+")\">edit Discount</a></li>" +
                                "      <li role='presentation'><a role='menuitem' tabindex='-1' href='#' onclick=\"deleteDiscWindow('"+name+"',"+id+")\">remove Discount</a></li>";
                    }
                    //language=HTMl
                    s+= "      <li role='presentation'><a role='menuitem' tabindex='-1' href='#' onclick=\"deleteWindow('"+name+"',"+id+")\">Remove Product</a></li>\n" +
                            "    </ul>\n" +
                            "  </div>";

                    if(pPrice==null) {
                        //language=HTML
                        s += "Preis: " + price + "CHF";
                    }else{
                        //language=HTML
                        s+= "Preis: "+pPrice+"CHF <p class='oldPrice'>"+price+"CHF</p>";
                    }
                    //language=HTML
                    s+= "</div>" +
                        "</div>" +
                        "</div>";
                    return s;
                }
            %>
            <%
                out.println(generateElems(request.getParameter("search"),request.getContextPath(),(int)request.getSession().getAttribute("id")));
            %>

        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<div class="dim-panel hidden" id="dimmer"></div>
<div class="edit-menu hidden" id="delWin">
    <p>are you sure you want to delete:<br><b></b></p>
    <div>
        <a class="btn btn-success" id="delOk">jes</a>
        <a class="btn" href="#" onclick="deleteWindow()">no</a>
    </div>
</div>
<div class="edit-menu hidden" id="delDiscWin">
    <p>are you sure you want to delete:<br><b></b></p>
    <div>
        <a class="btn btn-success" id="delDiscOk">jes</a>
        <a class="btn" href="#" onclick="deleteDiscWindow()">no</a>
    </div>
</div>
<div class="edit-menu hidden" id="setDiscWin">
    <p>please enter discount price for<br><b></b></p>
    <form action="/Shop/Edit">
        <input name="price">
        <input name="id" class="hidden" id="setDiscId">
        <button class="btn btn-success" name="act" value="setDisc">set Discount</button>
    </form>
    <a href="#" class="btn" onclick="addDiscWindow()">abort</a>
</div>
<script src="${pageContext.request.contextPath}/js/edit.js"></script>
</body>
</html>
