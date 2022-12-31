<!DOCTYPE html>
<html>
<head>
  <title>Video Player</title>
  <style>
    /* CSS styles go here */
    body {
  font-family: Arial, sans-serif;
}

header {
  background-color: #333;
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
}

nav li {
  flex: 1;
}

nav a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

nav a:hover {
  background-color: #111;
}

main {
  display: flex;
  margin: 20px;
}

#video {
  width: 560px;
}

aside {
  width: 240px;
  margin-left: 20px;
}

aside h2 {
  margin-bottom: 10px;
}

aside ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

aside li {
  margin-bottom: 10px;
}

footer {
  background-color: #eee;
  padding: 20px;
  text-align: center;
}

  </style>
</head>
<body>
  <header>
    <!-- navbar content goes here -->
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Videos</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </nav>
  </header>
  <main>
    <!-- main content goes here -->
    <div id="video">
      <!-- embed YouTube video here -->
      <iframe width="560" height="315" src="https://www.youtube.com/embed/lJIrF4YjHfQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    <aside>
      <!-- sidebar content goes here -->
      <h2>Suggested Videos</h2>
      <ul>
        <li><img src="thumbnail-1.jpg" alt="Vida thumbnail"></li>
        <li><img src="thumbnail-2.jpg" alt="Vida thumbnail"></li>
        <li><img src="thumbnail-3.jpg" alt="Vida thumbnail"></li>
      </ul>
    </aside>
  </main>
  <footer>
    <!-- footer content goes here -->
    <p>Copyright 2023</p>
  </footer>
</body>
</html>



