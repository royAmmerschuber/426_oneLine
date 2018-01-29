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
    <script src="js/diashow.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Startseite</title>
</head>
<body>
<div class="colorchill">
<div class="jumbotron">
    <div class="container text-center">
        <h1>oneLine</h1>
        <p>Egzon, Roy und Lucas</p>
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
            <a class="navbar-brand" href="#">Logo</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/list.jsp">Store</a></li>
                <li><a href="${pageContext.request.contextPath}/Verkauf.jsp">Sale</a></li>
                <li><a href="${pageContext.request.contextPath}/ProfileEdit.jsp">Profile</a></li>^
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <form class="form-inline">
                        <input type="text" class="form-control" size="50" placeholder="Search...">
                    </form>
                </li>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
            </ul>
        </div>
    </div>
</nav>

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
                    <img src="images/mode.jpg" alt="Chania">
                    <div class="carousel-caption">
                        <h3>Price Fair</h3>
                    </div>
                </div>

                <div class="item">
                    <img src="images/luxus.jpg" alt="Chicago">
                    <div class="carousel-caption">
                        <h3>Comfortable</h3>
                    </div>
                </div>

                <div class="item">
                    <img src="images/juwelen.jpg" alt="New York">
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
        <div class="col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                <div class="panel-footer">Price: 70.-<br>
                    <button type="button" class="btn btn-success">Buy</button>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                <div class="panel-footer">Price: 70.-<br>
                    <button type="button" class="btn btn-success">Buy</button>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                <div class="panel-footer">Price: 70.-<br>
                    <button type="button" class="btn btn-success">Buy</button>
                </div>
            </div>
        </div>
    </div>
</div><br>


<footer class="container-fluid text-center">
    <p>oneLine Shop Copyright</p>

</footer>
</div>
</body>
</html>
