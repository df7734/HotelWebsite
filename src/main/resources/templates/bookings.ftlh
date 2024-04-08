<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    <style>
        body {
            background-image: url('https://i.imgur.com/f5wasLC.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;

            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        footer{
            margin-top: auto;
        }
        .div-1 {
            min-height: 80vh;
            display: flex;
        }

        .div-2 {
            min-height: 20vh;
            display: flex;
        }
        .div-3 {
            z-index:5;
            min-height: 70vh;
            display: flex;
        }
        .div-4 {
            min-height: 65vh;
            display: flex;
        }
        .navbar{
            z-index:10;
            position: fixed; /* Set the navbar to fixed position */
            top: 0; /* Position the navbar at the bottom of the page */
            width: 100%; /* Full width */
            box-shadow: 0 2px 4px 0 rgba(0,0,0,.2);
        }

        .carousel-item{
            height: 650px;
        }
        .carousel-item img{
            height: 650px;
        }
    </style>

    <title>Bali Royal Resort</title>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/5130/5130993.png">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="/">
            <img src="https://cdn0.iconfinder.com/data/icons/political-signs/512/royal-bosnian-lily-emblem-sign-512.png" alt="" width="55" height="55"
                 class="d-inline-block align-text-bottom">
        </a>
        <a class="navbar-brand" href="/">
            <span style="font-size: 180%; font-family: Georgia">&nbsp; Bali Royal Resort</span>
        </a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-nav me-auto mb-2 mb-lg-0">
            </div>

            <#if currentUser.email??>
                <#list currentUser.roles as role>
                    <#if role == "ROLE_ADMIN">
                        <button onclick="location.href='/admin'" class="btn btn-lg rounded-0" type="submit" style="background-color: darkred; color: white; margin-right: 1vh"> &nbsp;&nbsp;ADMIN&nbsp;&nbsp; </button>
                    </#if>
                </#list>
            </#if>


            <#if currentUser.email??>
                <span style="margin-right: 1vh"><button onclick="location.href='/user'" class="btn btn-dark btn-lg rounded-0" type="submit"> &nbsp;&nbsp;MY ACCOUNT&nbsp;&nbsp; </button></span>
                <#else>
                <span style="margin-right: 1vh"><button onclick="location.href='/login'" class="btn btn-dark btn-lg rounded-0" type="submit"> &nbsp;&nbsp;SIGN IN&nbsp;&nbsp; </button></span>
            </#if>

            <#if currentUser.email??>
                <form action="/logout" method="post" style="margin-right: 1vh">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-dark btn-lg rounded-0">&nbsp;&nbsp;LOGOUT&nbsp;&nbsp;</button>
                </form>
            </#if>
        </div>
    </div>
</nav>

<div class="div-1"></div>
<div class="div-2 bg-dark text-white">
            <div class="container-lg">
                <br>
                <span style="font-size: 150%; font-family: Georgia">MAKE A RESERVATION</span>
                <form action="/bookings/create" method="post">
                    <div class="row" style="margin-top: 1vh">
                        <div class="col">
                            <input type="date" name="dateIn" id="checkIn" onchange="updatedate();" class="form-control bg-dark text-white rounded-0" placeholder="Check-in" required>
                        </div>
                        <div class="col">
                            <input type="date" name="dateOut" id="checkOut" min="" class="form-control bg-dark text-white rounded-0" placeholder="Check-out" required>
                        </div>
                        <div class="col">
                            <select name="level" id="level" class="form-control bg-dark text-white rounded-0">
                                <option value="1-2 Guests">1-2 Guests</option>
                                <option value="3-4 Guests">3-4 Guests</option>
                                <option value="5+ Guests">5+ Guests</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 2vh; text-align: center">
                        <div class="col-8" style="margin-top: 0.75vh">
                            <#if errorMessage??>
                                <h6 style="color: red; text-align: center; font-family: Georgia">${errorMessage}</h6>
                            </#if>

                            <#if !currentUser.email??>
                                <span style="font-size: 100%; font-family: Georgia">YOU NEED TO BE <a href="/login" style="color: white">LOGGED IN</a> TO MAKE A RESERVATION</span>
                            </#if>
                        </div>
                        <div class="col-4">
                            <div class="d-grid gap-2">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">

                                <#if currentUser.email??>
                                    <button type="submit" class="btn btn-secondary rounded-0">MAKE A RESERVATION</button>
                                <#else>
                                    <span class="d-grid gap-2" tabindex="0" data-toggle="tooltip" title="You need to be signed in">
                                <button class="btn btn-secondary rounded-0" style="pointer-events: none;" type="button" disabled>MAKE A RESERVATION</button>
                            </span>
                                </#if>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
</div>
<div class="div-3 bg-light">
    <div class="container-lg">
        <div class="row" style="margin-top: 4vh">
            <div class="col">
                <img src="https://i.imgur.com/pxfsJsY.png" alt="" style="width:600px;height:400px;">
            </div>
            <div class="col">
                <img src="https://i.imgur.com/K3C8bA1.jpg" alt="" style="width:600px;height:400px;">
            </div>
        </div>
        <div class="row" style="margin-top: 2vh">
            <div class="col">
                <span style="font-size: 150%; font-family: Georgia">JOURNEY INTO THE BALI R.R.</span>
            </div>
            <div class="col">
                <span style="font-size: 150%; font-family: Georgia">THE WORLD AWAITS</span>
            </div>
        </div>
        <div class="row" style="margin-top: 1vh">
            <div class="col">
                <span style="font-size: 100%; font-family: Georgia">Welcome to Bali Royal Resort, where magnificent nature of Indonesia meets style and comfort.
                Perfect destination for business travelers, leisure seekers, and families looking for a memorable stay.</span>
            </div>
            <div class="col">
                <span style="font-size: 100%; font-family: Georgia">The world awaits, and there's no better way to explore its wonders than by immersing yourself in Bali`s stunning natural landscapes. From the lush green jungles to the vast, blue ocean, there's something for everyone to discover and enjoy.</span>
            </div>
        </div>
        <div class="row" style="margin-top: 4vh">
            <div class="col-3">
                <span style="font-size: 150%; font-family: Georgia">PERFECT ROOMS</span><br>
                <div style="margin-top: 1vh">
                    <span style="font-size: 100%; font-family: Georgia">
                       <p>Our houses are designed to blend seamlessly with the surrounding natural landscape,
                        creating a unique experience that combines comfort with the beauty of nature.</p>
                    <p>The rooms are the epitome of comfort and luxury, offering all the necessary
                        facilities to make your stay as enjoyable and convenient as possible.</p>
                    </span>
                </div>
            </div>
            <div class="col-9">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="margin-right: 3.7vh">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://i.imgur.com/kjI9HTr.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="https://i.imgur.com/u86QuKv.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="https://i.imgur.com/TJqpLDv.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 4vh">
            <div class="col">
                <img src="https://i.imgur.com/FMuzKnU.jpg" alt="" style="width:600px;height:400px;">
            </div>
            <div class="col">
                <img src="https://i.imgur.com/S5Zl2oU.jpg" alt="" style="width:600px;height:400px;">
            </div>
        </div>
        <div class="row" style="margin-top: 2vh">
            <div class="col">
                <span style="font-size: 150%; font-family: Georgia">JOURNEY DEEPER</span>
            </div>
            <div class="col">
                <span style="font-size: 150%; font-family: Georgia">CULINARY ADVENTURES</span>
            </div>
        </div>
        <div class="row" style="margin-top: 1vh">
            <div class="col">
                <span style="font-size: 100%; font-family: Georgia">
                    Discover the wonders of nature and culture with our exhilarating tours.
                    Explore the jungle's hidden gems or immerse yourself in the history and culture of ancient island.
                    With comfortable transportation and expert guides, our tours offer a journey you won't forget.
                    Book your adventure today and dive into the enigmatic Bali.
                </span>
            </div>
            <div class="col">
                <span style="font-size: 100%; font-family: Georgia">
                    Take your taste buds on a journey with our best chefs.
                    Only fresh, locally sourced ingredients to create delicious dishes that highlight the unique flavors of the island.
                    Enjoy a romantic meal with your half as you take in the breathtaking views of the ocean.
                    Come and experience the taste of the ocean and jungle with us.
                </span>
            </div>
        </div>
    </div>
</div>
<div class="div-4 bg-light">
    <div class="container-lg">
        <div class="row" style="margin-top: 4vh">
            <div class="col-8">
                <img src="https://i.imgur.com/m3xbU2M.jpg" alt="" style="width:900px;height:500px;">
            </div>
            <div class="col-3">
                <div class="container" style="margin-left: 4vh">
                    <span style="font-size: 150%; font-family: Georgia">ICONIC YACHTING PLAYGROUNDS</span><br>
                </div>
                <div class="container" style="margin-left: 4vh; margin-top: 1vh">
                    <span style="font-size: 100%; font-family: Georgia;">Sail the crystal-clear waters on a yacht or traditional Jukung and explore hidden coves and secluded beaches.
                        Take in the stunning beauty of the ocean sunset as you sip on a cocktail and enjoy the company of your loved ones.</span>
                </div>
            </div>
            <div class="col-1">

            </div>
        </div>
    </div>
</div>
<footer class="bg-dark text-center text-lg-start text-white">
    <div class="container p-4" style="min-height: 15vh">
        <div class="row">
            <div class="col" style="text-align: center">
                <h5 class="text-uppercase" style="margin-top: 1vh">Follow us</h5>
                    <div class="row" style="margin-top: 3vh">
                        <div class="col">
                            <a href="https://www.youtube.com/" class="text-white">YouTube</a>
                        </div>
                        <div class="col">
                            <a href="https://www.instagram.com/" class="text-white">Instagram</a>
                        </div>
                        <div class="col">
                            <a href="https://uk-ua.facebook.com/" class="text-white">Facebook</a>
                        </div>
                        <div class="col">
                            <a href="https://twitter.com/" class="text-white">Twitter</a>
                        </div>
                        <div class="col">
                            <a href="https://bali.com/" class="text-white">Bali Group</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        © 2023 Dmitry Fedotov
    </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("checkIn").setAttribute("min", today);


    function updatedate() {
        var firstdate = document.getElementById("checkIn").value;
        document.getElementById("checkOut").value = "";
        document.getElementById("checkOut").setAttribute("min",firstdate);
    }
</script>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>
</body>
</html>
