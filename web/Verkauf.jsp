<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/styles.css">
    <title>One Line Sell</title>
</head>
<body>
<div class="colorchill">
<div class="jumbotron">
    <div class="container text-center">
        <h1>Online Store</h1>
        <p>Mission, Vission & Values</p>
    </div>
</div>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <small class="headname">oneLine</small>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/list.jsp">Store</a></li>
                <li><a href="${pageContext.request.contextPath}/Verkauf.jsp">Sale</a></li>
                <li><a href="${pageContext.request.contextPath}/Register.jsp">Profile</a></li>^
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <form class="form-inline">
                        <input type="text" class="form-control" size="50" placeholder="Search...">
                    </form>
                </li>
                <li><a href="${pageContext.request.contextPath}/login.jsp"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-xs-4 item-photo">
            <img style="max-width:100%;" src="images/product.jpg" />
        </div>
        <div class="col-xs-5" style="border:0px solid gray">
            <!-- Datos del vendedor y titulo del producto -->
            <h3>Add a new Product</h3><br>
            <h5 style="color:#337ab7">add Product name:</h5>
            <input id="product_weight" name="product_weight" placeholder="PRODUCT WEIGHT" class="inputfields" required="" type="text">

            <!-- Precios --><br><br>
            <h5 style="color:#337ab7">set Price:</h5>
            <input id="product_weight" name="product_weight" placeholder="PRODUCT WEIGHT" class="inputfields" required="" type="text">

            <br><br>
            <h5 style="color:#337ab7">add Image</h5><br>
            <input id="filebutton" name="filebutton" class="input-file" type="file"><br><br>
            <h5 style="color:#337ab7">add a Description</h5>
            <div class="textareaa">
                <textarea class="form-control" id="product_description" name="product_description"></textarea>
            </div>
            <!-- Detalles especificos del producto -->
            <div class="section">
                <h6 class="title-attr" style="margin-top:15px;" ></h6>
                <div>
                    <div class="attr" style="width:25px;background:#5a5a5a;"></div>
                    <div class="attr" style="width:25px;background:white;"></div>
                </div>
            </div>
            <div class="section" style="padding-bottom:5px;">

            </div>
            <div class="section" style="padding-bottom:20px;">
                <h5 style="color:#337ab7">Amount </h5>
                <div>
                    <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                    <input value="1" />
                    <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                </div>
            </div>

            <!-- Botones de compra -->
            <div class="section" style="padding-bottom:20px;">
                <button class="btn btn-success"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> publish Product</button>
                <h6><a href="#"><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer;"></span> Agregar a lista de deseos</a></h6>
            </div>
        </div>


    </div>
</div>
</div>
</body>


<footer class="container-fluid text-center">
    <p>Online Store Copyright</p>

</footer>
</html>