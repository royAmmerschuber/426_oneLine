
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
            <%--<small class="headname">oneLine</small>--%>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="/Shop/Main">Home</a></li>
                    <li><a href="/Shop/List">Store</a></li>
                    <li><a href="/Shop/Sell">Sale</a></li>
                    <li><a href="/Auth/Register">Profile</a></li>^
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <form class="form-inline" action="/Shop/List">
                            <input type="text" class="form-control" name="search" size="50" placeholder="Search...">
                        </form>
                    </li>
                    <li><a href="/Auth/Login"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
                </ul>
            </div>
        </div>
    </nav>