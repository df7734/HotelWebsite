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

            <button onclick="location.href='/admin'" class="btn btn-lg rounded-0" type="submit" style="background-color: darkred; color: white; margin-right: 1vh"> &nbsp;&nbsp;ADMIN&nbsp;&nbsp; </button>

            <span style="margin-right: 1vh"><button onclick="location.href='/user'" class="btn btn-dark btn-lg rounded-0" type="submit"> &nbsp;&nbsp;MY ACCOUNT&nbsp;&nbsp; </button></span>

            <form action="/logout" method="post" style="margin-right: 1vh">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-dark btn-lg rounded-0">&nbsp;&nbsp;LOGOUT&nbsp;&nbsp;</button>
            </form>

        </div>
    </div>
</nav>

<div class="div-2" style="margin-top: 15vh">
    <div class="container-sm">
        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-6 bg-dark text-light" style="min-height: 50vh">
                <div style="margin-left: 1vh">
                    <h1 style="margin-top: 1vh">Edit user: ${user.name}</h1>
                    <form action="/user/change" method="post" oninput='password2.setCustomValidity(password.value !== password2.value ? "Passwords do not match." : "")'>
                        <label for="namefield" class="form-label" style="margin-top: 1vh">Full name</label>
                        <input type="text" name="name" class="form-control bg-dark text-white rounded-0" id="namefield" value="${user.name}" required>

                        <label for="phonefield" class="form-label" style="margin-top: 1vh">Phone number</label>
                        <input type="text" name="phone" class="form-control bg-dark text-white rounded-0" id="phonefield" value="${user.phone}" required>

                        <label for="passwordfield" class="form-label" style="margin-top: 1vh">New password</label>
                        <input type="password" name="password" class="form-control bg-dark text-white rounded-0" id="passwordfield" placeholder="**********">

                        <label for="passwordfield2" class="form-label" style="margin-top: 1vh">Confirm new password</label>
                        <input type="password" name="password2" class="form-control bg-dark text-white rounded-0" id="passwordfield2" placeholder="**********">

                        <input type="hidden" value="${user.id}" name="id">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <br>
                        <button class="btn btn-light btn-lg rounded-0" type="submit">&nbsp;&nbsp;Save&nbsp;&nbsp;</button>
                    </form>
                </div>
            </div>
            <div class="col-2 bg-dark">
            </div>
            <div class="col-2">
            </div>
        </div>
    </div>
</div>

<footer class="bg-dark text-center text-lg-start text-white" style="margin-top: 15vh">
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