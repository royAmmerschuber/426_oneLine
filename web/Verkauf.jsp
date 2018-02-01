<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>One Line Sell</title>
</head>
<body>
<div class="colorchill">
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-xs-4 item-photo">
            <img style="max-width:100%;" src="${pageContext.request.contextPath}/images/product.jpg" />
        </div>
        <div class="col-xs-5" style="border:0px solid gray">
            <form action="/Shop/Sell" method="post" enctype="multipart/form-data">
                <h3>Add a new Product</h3><br>
                <h5 style="color:#337ab7">add Product name:</h5>
                <input id="product_name" name="name" placeholder="PRODUCT NAME" class="inputfields" required="" type="text">

                <br><br>
                <h5 style="color:#337ab7">set Price:</h5>
                <input id="product_weight" name="price" placeholder="PRODUCT WEIGHT" class="inputfields" required="" type="text">

                <br><br>
                <h5 style="color:#337ab7">add Image</h5><br>
                <input id="filebutton" name="image" class="input-file" type="file"><br><br>
                <h5 style="color:#337ab7">add a Description</h5>
                <div class="textareaa">
                    <textarea class="form-control" id="product_description" name="descr"></textarea>
                </div>
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
                        <input type="number" name="amount" value="1" />
                    </div>
                </div>

                <div class="section" style="padding-bottom:20px;">
                    <button class="btn btn-success"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> publish Product</button>
                </div>
            </form>
        </div>


    </div>
</div>
</div>
</body>


<jsp:include page="footer.jsp"/>
</html>