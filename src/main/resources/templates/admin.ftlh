<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    <!-- DataTable-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#example').DataTable();
            $('#example1').DataTable();
            $('#example2').DataTable();
        });
    </script>

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
            min-height: 60vh;
            display: flex;
        }

        .div-3 {
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

        .pagination .page-item.active .page-link {
            background-color: #212529;
            border-color: white;
        }

        .anchorcontainer {
            position: relative;
        }

        .anchor {
            position: absolute;
            top: -15vh;
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

            <span style="margin-right: 10px"><button onclick="location.href='/user'" class="btn btn-dark btn-lg rounded-0" type="submit"> &nbsp;&nbsp;MY ACCOUNT&nbsp;&nbsp; </button></span>

            <form action="/logout" method="post" style="margin-right: 1vh">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-dark btn-lg rounded-0">&nbsp;&nbsp;LOGOUT&nbsp;&nbsp;</button>
            </form>

        </div>
    </div>
</nav>

<div class="div-2" style="margin-top: 15vh">
    <div class="container-xl bg-dark text-light">
        <div class="row" style="margin-top: 3vh">
            <div class="row">
                <div class="col-1">
                </div>
                    <div class="col-10">
                        <h1 style="font-family: Georgia">Users:</h1>
                        <table id="example" class="table table-striped table-dark" style="width:100%">
                            <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone number</th>
                                <th>Activity</th>
                                <th>Role</th>
                                <th>Ban</th>
                                <th>Change user role</th>
                                <th>More info</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list users as user>
                                <tr>
                                    <td>${user.id?c}</td>
                                    <td>${user.name}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phone}</td>
                                    <td><#if user.active>true<#else>false</#if></td>
                                    <td><#list user.roles as role>${role}</#list></td>
                                    <td>
                                        <form action="/admin/user/ban/${user.id?c}" method="post">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                                            <button type="submit" class="btn btn-sm btn-light rounded-0">BAN</button>
                                        </form>
                                    </td>
                                    <td><a href="/admin/user/edit/${user.id?c}" style="color: white">Change role</a></td>
                                    <td><a href="/user/${user.id?c}" style="color: white">More info</a> </td>
                                </tr>
                            <#else>
                                <h3>No users</h3>
                            </#list>
                            </tbody>
                        </table>
                        <br>
                        <br>
                    </div>
                <div class="col-1">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="div-3" style="margin-top: 5vh">
    <div class="container-xl bg-dark text-light">
        <div class="row" style="margin-top: 3vh">
            <div class="row">
                <div class="col-1">
                </div>
                <div class="col-10">

                    <div class="anchorcontainer">
                        <h1 style="font-family: Georgia">Rooms:</h1>
                        <a class="anchor" id="roomarea"></a>
                    </div>
                    <table id="example1" class="table table-striped table-dark" style="width:100%">
                        <thead class="thead-light">
                        <tr>
                            <th>ID</th>
                            <th>Number</th>
                            <th>Capacity</th>
                            <th>More info</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list rooms as room>
                            <tr>
                                <td>${room.id?c}</td>
                                <td>${room.number}</td>
                                <td>${room.level}</td>
                                <td><a href="/room/${room.id?c} " style="color: white">More info</a></td>
                            </tr>
                        <#else>
                            <h3>No rooms</h3>
                        </#list>
                        </tbody>
                    </table>

                    <form action="/room/create" method="post">
                        <h1 style="font-family: Georgia">Add room:</h1>
                    <div class="row">
                        <div class="col">
                            <input type="text" class="form-control bg-dark text-white rounded-0" placeholder="number" name="number" required/>
                        </div>
                        <div class="col">
                            <select name="level" id="level" class="form-control bg-dark text-white rounded-0">
                                <option value="1-2 Guests">1-2 Guests</option>
                                <option value="3-4 Guests">3-4 Guests</option>
                                <option value="5+ Guests">5+ Guests</option>
                            </select>
                        </div>
                        <div class="col">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <span class="d-grid gap-2" tabindex="0">
                                <button type="submit" class="btn btn-secondary rounded-0">ADD ROOM</button>
                            </span>
                        </div>
                    </div>
                    </form>
                    <#if errorMessage??>
                        <h2 style="color: red; text-align: center; margin-top: 1vh">${errorMessage}</h2>
                    </#if>
                    <br>
                    <br>
                </div>
                <div class="col-1">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="div-2" style="margin-top: 5vh">
    <div class="container-xl bg-dark text-light">
        <div class="row" style="margin-top: 3vh">
            <div class="row">
                <div class="col-1">
                </div>
                <div class="col-10">
                    <div class="anchorcontainer">
                        <h1 style="font-family: Georgia">Bookings:</h1>
                        <a class="anchor" id="bookingarea"></a>
                    </div>
                    <table id="example2" class="table table-striped table-dark" style="width:100%">
                        <thead class="thead-light">
                        <tr>
                            <th>ID</th>
                            <th>Check-in</th>
                            <th>Check-out</th>
                            <th>Price</th>
                            <th>Room number</th>
                            <th>User name</th>
                            <th>More info</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list bookings as booking>
                            <tr>
                                <td>${booking.id?c}</td>
                                <td>${booking.dateIn?date.iso?string("dd-MM-yyyy")}</td>
                                <td>${booking.dateOut?date.iso?string("dd-MM-yyyy")}</td>
                                <td>${booking.price} $</td>
                                <td><a href="/room/${booking.room.id?c}" style="color: white">${booking.room.number}</a></td>
                                <td><a href="/user/${booking.user.id?c}" style="color: white" >${booking.user.name}</a></td>
                                <td><a href="/booking/${booking.id?c} " style="color: white">More info</a></td>
                            </tr>
                        <#else>
                            <h3 style="font-family: Georgia; margin-top: 2vh">No bookings</h3>
                        </#list>
                        </tbody>
                    </table>
                    <br>
                    <br>
                </div>
                <div class="col-1">
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="bg-dark text-center text-lg-start text-white" style="margin-top: 10vh">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>