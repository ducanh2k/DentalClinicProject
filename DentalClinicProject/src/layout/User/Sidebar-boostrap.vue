<template>
  <div>
    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarTogglerDemo01"
          aria-controls="navbarTogglerDemo01"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
          <a class="navbar-brand" href="#">WebSiteName</a>
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a
                class="nav-link active"
                aria-current="page"
                href="#"
                data-toggle="dropdown"
                >About us <span class="caret"></span
              ></a>
              <ul class="dropdown-menu">
                <li class="li-service">
                  <a class="a-service" href="#">Page 1-1</a>
                </li>
                <li class="li-service">
                  <a class="a-service" href="#">Page 1-2</a>
                </li>
                <li class="li-service">
                  <a class="a-service" href="#">Page 1-2</a>
                </li>
                <li class="li-service">
                  <a class="a-service" href="#">Page 1-2</a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a
                class="nav-link active"
                aria-current="page"
                href="#"
                data-toggle="dropdown"
                >Services <span class="caret"></span
              ></a>
              <ul class="dropdown-menu dropdown-service">
                <li class="li-service">
                  <a class="a-service" href="#">Page 1-1</a>
                </li>
                <li class="li-service">
                  <a class="a-service" href="#">Page 1-2</a>
                </li>
                <li class="li-service">
                  <a class="a-service" href="#">Page 1-3</a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Price</a>
            </li>

            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#"
                >Customer</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">News</a>
            </li>
          </ul>
          <form class="d-flex">
            <button class="btn btn-outline-success" type="submit">
              Contact
            </button>
          </form>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
// import "https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js";
// import "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js";
export default {
  name: "Sidebar-boostrap",
};
</script>

<style scoped>
.navbar-expand-lg {
  background-color: rgb(204, 204, 204);
  color: rgb(74, 85, 110);
  background-color: #fff;
  position: fixed;
  margin: 0;
  width: 100%;
  height: 9%;
  z-index: 1000;
  border: 1px solid #ddd;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5);
}
a {
  text-decoration: none;
  font-size: 1.5rem;
}
.navbar-brand {
  font-size: 2rem;
  display: flex;
  justify-content: center;
  align-items: center;
}
li {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 76px;
  width: 160px;
}
li:hover,
li:focus {
  background-color: #ddd;
  transition: background-color 0.5s ease, color 0.5s ease;
}
.btn {
  color: rgb(224, 196, 140);
  border: 1px solid rgb(196, 196, 196);
  font-size: 1.5rem;
  width: 150px;
  height: 40px;
}
.btn:hover,
.btn:focus {
  color: #fff;
  background-color: rgb(224, 196, 140);
  border: 1px solid rgb(196, 196, 196);
}
.btn:active {
  color: #fff !important;
  background-color: rgb(224, 196, 140) !important;
  border: 1px solid rgb(196, 196, 196) !important;
  border: none !important;
}
.dropdown-menu {
  margin-top: auto;
  margin-left: 150px;
  width: 200px;
}
.dropdown-service {
  margin-left: 310px;
  width: 200px;
}
li .li-service {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 198px;
}
.a-service:hover {
  background-color: #ddd;
  transition: background-color 0.5s ease, color 0.5s ease;
}
@media (max-width: 1300px) {
  .dropdown-menu {
    margin-top: auto;
    margin-left: 173px;
    width: 98px;
  }
  li {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 53px;
    width: 100px;
  }
  .dropdown-service {
    margin-left: 273px;
    width: 100px;
  }
  li .li-service {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 98px;
  }
}
</style>
