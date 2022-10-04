//HTML CODE FOR THE LOGIN PAGE

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Google Form</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
    
    <div class="header">
        
        <div class="container">
            <video autoplay muted loop id="video-container" class="container">
                <source src="./video/video nature4.mp4">
            </video>
            <form>
                <h1>LOGIN HERE</h1>
                <input type="text" id="name" placeholder="Your Name" required>
                <input type="email" id="Email" placeholder="Email id" required>
                <input type="text" id="Phone" placeholder="Phone Number" required>
                <textarea id="message" placeholder="How can I help you?" required></textarea>
                <button type="submit">LOGIN</button>
                <p>If you are't a registered user.</p>
                <a href="./register.html" target="_blank">REGISTER HERE!</a>
                <script src="https://kit.fontawesome.com/73fcf64c3f.js" crossorigin="anonymous"></script>
                <i class="fab fa-facebook fa-2x"></i>
                <i class="fab fa-twitter fa-2x"></i>
                <i class="fab fa-instagram fa-2x"></i>
            </form>
        </div>
      
    </div>
    
</body>
</html> 


//CSS CODE FOR THE ABOVE

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'poppins',sans-serif;
}



.container{
    position: absolute;
    width: 100%;
    height: 100%;

    display: flex;
    align-items: center;
    justify-content: center;
}
#video-container{
    position: fixed;
  object-fit: cover;
  
  }

form{
    width: 400px;
    height: 500px;
    justify-content: center;
    text-align: center;
    background:radial-gradient( circle farthest-corner at 10% 20%,  rgba(141,252,167,1) 0%, rgba(244,251,153,1) 90% );
    opacity: 0.9;
    border-radius: 10px;
}

form h1{
    margin-top: 10px;
    margin-bottom:2rem;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}

form input,textarea,Button{
    display: block;
    content: '';
    clear: both;
    padding: 10px;
    border-radius: 10px;
    margin-left: 6.5rem;
    margin-top: 10px;
    border: 0.9px solid white ;
}

form a{
    display: block;
    content: '';
    clear: both;
    padding: 10px;
    border-radius: 10px;
    

}
form Button{
    margin-left: 10rem;
    background: #ddd;
    margin-bottom: 20px;
}

Button:hover{
    color: white;
    background:linear-gradient( 68.3deg,  rgba(245,177,97,1) 0.4%, rgba(236,54,110,1) 100.2% );
    cursor: pointer;
}

form i{
    margin-top: 20px;
    padding: 25px;
}

i:hover{
    color:white;
}
