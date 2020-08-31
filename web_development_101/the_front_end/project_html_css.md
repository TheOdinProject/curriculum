<!DOCTYPE html>
    
    <style>
        .navbar{
            height: 10px;
            position:absolute;
            top: 0;
            width: 100%
        }
        .navbar a{
            display: inline-block;
            color: rgb(36, 36, 36);
            font-family: Arial, Helvetica, sans-serif;
            vertical-align: center;
            text-decoration:none;
            font-size: 13px;
            margin: 10px;
            margin-top:20px;
            margin-right: 20px;
        }
        .right_lower{
            float:right;
            margin-right: 20px;
        }
        .active{
            background-color:rgb(63, 165, 228);
            color:white!important;
            padding:8px;
            margin-top:11px!important;
        }
        .grid{
            display: grid;
            grid-template-columns: repeat(3, 5px);
            grid-template-rows: repeat(3, 5px);
            grid-gap: 2px;
            margin: 13px;
            margin-top: 18px;
        }
        .cell{
            justify-content: center;
            align-items:center;
            display: flex;
            font-size: 0px;
            background: gray;
        }
        #logo{
            position: fixed;
            top: 29.8%;
            left: 50%;
            margin-top: -50px;
            margin-left: -100px;
        }
        .input-icons{
            display: flex;
            width: 360px;
            margin-bottom:15px;
        }
        .input-field{
            position:fixed;
            top: 40%;
            left: 50%;
            margin-left:-235px;
            width: 35%;
            padding: 15px;
            text-align: left;
            background-color: white;
            border-style: solid;
            border-width: 0.5px;
            border-color: lightgrey;
            border-radius: 50px;
        }
        .input-field:focus{
            outline:none;
        }
        .footer{
            overflow:hidden;
            position:fixed;
            bottom: 0;
            width: 100%;
            background-color: rgb(240, 239, 239);
            padding: 10px;
        }
        .footer a{
            text-decoration: none;
            color: rgb(88, 88, 88);
            padding-right: 15px;
            font-family:Arial, Helvetica, sans-serif;
            font-size: 13px;
        }

    </style>

    <body>
        <!-- Top NavBar-->
        <div class="navbar">
                <a href="#about">About</a>
                <a href="#store">Store</a>
                <a href="#signin" class="active" style="float:right;"><strong>Sign In</strong></a>
                <a href="#grid"></a>
                    <div class="grid" style="float:right;">
                        <div class="cell" id="1">1</div>
                        <div class="cell" id="2">2</div>
                        <div class="cell" id="3">3</div>
                        <div class="cell" id="4">4</div>
                        <div class="cell" id="5">5</div>
                        <div class="cell" id="6">6</div>
                        <div class="cell" id="7">7</div>
                        <div class="cell" id="8">8</div>
                        <div class="cell" id="9">9</div>
                    </div>
                <a href="#images" style="float:right;">Images</a>
                <a href="gmail" style="float:right;">Gmail</a>
                </div>

        <!--Center Page-->
            <img id="logo" src="https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png">    
        <form action="/action_page.php">    
            <div class="input-icons">
                <!--
                <i class="fa fa-search"></i>-->
                <input class="input-field" type="text">
            </div>
        </form>

        <!--Bottom NavBar-->
        <div class="footer">
                <a href="advert">Advertising</a>
                <a href="bus">Business</a>
                <a href="search">How Search Works</a>
                <a href="settings" class="right_lower">Settings</a>
                <a href="terms" class="right_lower">Terms</a>
                <a href="privacy" class="right_lower">Privacy</a>
        </div>
    </body>

</html>
