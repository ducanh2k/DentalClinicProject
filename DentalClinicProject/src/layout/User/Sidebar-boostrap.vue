<template>
  <div>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link
          rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
        />
      </head>
      <body>
        <nav class="navbar navbar-inverse">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="#" style="color: rgb(74,85,110);">WebSiteName</a>
            </div>
            <ul class="nav navbar-nav" >
              <li class="dropdown">
                <a class="header-navbar" data-toggle="dropdown" href="#"
                style="color: rgb(74,85,110);"><strong>About us</strong> <span class="caret"></span
                ></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Page 1-1</a></li>
                  <li><a href="#">Page 1-2</a></li>
                  <li><a href="#">Page 1-3</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a class="header-navbar" data-toggle="dropdown" href="#"
                style="color: rgb(74,85,110);"><strong>Services</strong> <span class="caret"></span
                ></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Page 1-1</a></li>
                  <li><a href="#">Page 1-2</a></li>
                  <li><a href="#">Page 1-3</a></li>
                </ul>
              </li>
              <li><a class="header-navbar" href="#" style="color: rgb(74,85,110);"><strong>Price</strong></a></li>
              <li><a class="header-navbar" href="#" style="color: rgb(74,85,110);"><strong>Customer</strong></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li>
                <a class="header-navbar" href="#" style="color: rgb(74,85,110);"
                  ><strong>News</strong> <span><i class="fa-solid fa-caret-down"></i></span> </a
                >
              </li>
              <li>
                <a class="header-navbar" href="#" style="color: rgb(74,85,110);"
                  ><strong>Contact</strong></a
                >
              </li>
              <li>
                <a class="header-navbar" href="#" style="color: rgb(74,85,110); "><span></span><strong> English</strong></a>
              </li>
            </ul>
          </div>
        </nav>

        <div class="container"></div>
      </body>
    </html>
  </div>
</template>

<script>
// import 'bootstrap';
import 'https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'
import 'https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'
export default {
  name:'Sidebar-boostrap'
};
</script>

<style scoped>
.navbar-brand {
  background-color: rgb(226, 210, 183);
}
.navbar-inverse{
  color: rgb(74,85,110);
  background-color: #fff;
  position: fixed;
  width: 100%;
  z-index: 1000;
  border: 1px solid #ddd;
  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.5);
}
li:hover, li:focus{
  background-color: rgb(223, 223, 223);
  transition: background-color 0.5s ease, color 0.5s ease;
}

</style>
