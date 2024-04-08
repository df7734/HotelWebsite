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

        .div-2 {
            min-height: 75vh;
            display: flex;
        }
        .navbar{
            z-index:10;
            position: fixed; /* Set the navbar to fixed position */
            top: 0; /* Position the navbar at the bottom of the page */
            width: 100%; /* Full width */
            box-shadow: 0 2px 4px 0 rgba(0,0,0,.2);
        }

        a:link {
            color: white;
        }

        .anchorcontainer {
            position: relative;
        }

        .anchor {
            position: absolute;
            top: -60vh;
        }

    </style>

    <title>Bali Royal Resort</title>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/5130/5130993.png">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a href="/">
            <img src="https://cdn0.iconfinder.com/data/icons/political-signs/512/royal-bosnian-lily-emblem-sign-512.png" alt="" width="55" height="55" class="d-inline-block align-text-bottom">
        </a>
        <a class="navbar-brand" href="/">
            <span style="font-size: 180%; font-family: Georgia">&nbsp; Bali Royal Resort</span>
        </a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-nav me-auto mb-2 mb-lg-0">
            </div>

                <#list user.roles as role>
                    <#if role == "ROLE_ADMIN">
                        <button onclick="location.href='/admin'" class="btn btn-lg rounded-0" type="submit" style="background-color: darkred; color: white; margin-right: 1vh"> &nbsp;&nbsp;ADMIN&nbsp;&nbsp; </button>
                    </#if>
                </#list>

            <form action="/logout" method="post" style="margin-right: 1vh">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-dark btn-lg rounded-0">&nbsp;&nbsp;LOGOUT&nbsp;&nbsp;</button>
            </form>
        </div>
    </div>
</nav>

<div class="div-2" style="margin-top: 15vh">
    <div class="container-xl bg-dark text-light">
        <div class="row" style="margin-top: 3vh; margin-left: 1vh">
            <div class="col-9">
                <span style="font-size: 150%; font-family: Georgia">YOUR BOOKINGS</span>
                <br>
                <#list bookings as booking>
                    <div style="font-family: 'Times New Roman'; font-size: 125%; margin-top: 1vh">
                        <#if booking?is_last>
                            <#if posted??>
                                <div id="colorSection">
                            <#else>
                                <div>
                            </#if>
                                <div class="anchorcontainer">
                                    <a class="anchor" id="bookingarea"></a>
                                </div>
                                <h6>Check-in: ${booking.dateIn?date.iso?string("dd-MM-yyyy")}</h6>
                                <h6>Check-out: ${booking.dateOut?date.iso?string("dd-MM-yyyy")}</h6>
                                <h6>Room type: ${booking.room.level}</h6>
                                <p><b>${booking.price} $ | </b><#if (booking.paid)><b>PAID</b><#else><a href="/bookings/pay/${booking.id?c}"><b style="color: red;">NOT PAID</b></#if></a></p>
                            </div>
                            <#else>
                                <div>
                                    <h6>Check-in: ${booking.dateIn?date.iso?string("dd-MM-yyyy")}</h6>
                                    <h6>Check-out: ${booking.dateOut?date.iso?string("dd-MM-yyyy")}</h6>
                                    <h6>Room type: ${booking.room.level}</h6>
                                    <p><b>${booking.price} $ | </b><#if (booking.paid)><b>PAID</b><#else><a href="/bookings/pay/${booking.id?c}"><b style="color: red;">NOT PAID</b></#if></a></p>
                                </div>
                        </#if>
                        <hr style="border: 2px solid white">
                    </div>
                <#else>
                    <h3 style="font-family: Georgia; margin-top: 2vh">No bookings</h3>
                </#list>
            </div>
            <div class="col-3" style="font-family: Georgia">
                <span style="font-size: 170%">${user.name}</span>
                <h5>Phone number:  ${user.phone} </h5>
                <h5>Email: ${user.email} </h5>

                <button onclick="location.href='/user/change'" class="btn btn-lg rounded-0" type="submit" style="background-color: darkred; color: white; margin-right: 1vh"> &nbsp;&nbsp;EDIT INFO&nbsp;&nbsp; </button>
            </div>
        </div>
    </div>
</div>

<footer class="bg-dark text-center text-lg-start text-white" style="margin-top: 13vh">
    <!-- Grid container -->
    <div class="container p-4" style="min-height: 15vh">
        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col" style="text-align: center">
                <h5 class="text-uppercase" style="margin-top: 1vh">Follow us</h5>
                <div class="row" style="margin-top: 3vh">
                    <div class="col">
                        <a href="#" class="text-white">YouTube</a>
                    </div>
                    <div class="col">
                        <a href="#" class="text-white">Instagram</a>
                    </div>
                    <div class="col">
                        <a href="#" class="text-white">Facebook</a>
                    </div>
                    <div class="col">
                        <a href="#" class="text-white">Twitter</a>
                    </div>
                    <div class="col">
                        <a href="#" class="text-white">Bali Group</a>
                    </div>
                </div>
            </div>
            <!--Grid column-->
        </div>
        <!--Grid row-->
    </div>
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        © 2023 Dmitry Fedotov
    </div>
</footer>
<script>
    document.getElementById("colorSection").style.color = "#48e372";


    setTimeout(function(){
        document.getElementById("colorSection").style.color = "#FFFFFF";
    },1250);

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>