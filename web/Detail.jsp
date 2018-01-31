<%--
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
<div class="container">
    <div class="row">
        <div class="col-xs-4 item-photo">
            <img style="max-width:100%;" src="https://placehold.it/150x80?text=IMAGE" />
        </div>
        <div class="col-xs-5">
            <!-- Datos del vendedor y titulo del producto -->
            <h3 style="color: white">Samsung Galaxy S4 I337 16GB 4G LTE Unlocked GSM Android Cell Phone</h3>
            <!-- Precios -->
            <h4  style="color: black;"><small>Price</small></h4>
            <h6 style="margin-top:0px; color: white;">€ 399.00</h6>

            <h4  style="color: black;"><small>Seller</small></h4>
            <h6 style="margin-top:0px; color: white;">Martin</h6>

            <!-- Detalles especificos del producto -->
            <div class="section" style="padding-bottom:20px;">
                <h4 class="title-attr" style="color: black;"><small>Menge</small></h4>
                <div>
                    <input value="1" />
                </div>
            </div>

            <!-- Botones de compra -->
            <div class="section" style="padding-bottom:20px;">
                <button class="btn btn-success">Buy</button>
            </div>
        </div>

        <div class="col-xs-9">
            <ul class="menu-items" style="color: white">Fish
            </ul>
            <div style="width:100%;border-top:1px solid silver">
                <p style="padding:15px;">
                    <small style="color: white">
                        beschreibung
                    </small>
                </p>
            </div>
        </div>
    </div>
</div>
        <footer class="container-fluid text-center">
            <p>oneLine Shop Copyright</p>

        </footer>
</div>
</body>
</html>
