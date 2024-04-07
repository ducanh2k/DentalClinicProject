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
          <a class="navbar-brand" @click="backHome()">WebSiteName</a>
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a
                class="nav-link active"
                aria-current="page"
                href="#"
                data-toggle="dropdown"
                >Về chúng tôi <span class="caret"></span
              ></a>
              <ul class="dropdown-menu">
                <li class="li-service">
                  <a class="a-service" @click="Overview()"
                    >Tổng quan phòng khám</a
                  >
                </li>
                <li class="li-service">
                  <a class="a-service" href="#">Cơ sở vật chất hiện đại</a>
                </li>
                <li class="li-service">
                  <a class="a-service" @click="teamDoctor()">Đội ngũ bác sĩ</a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a
                class="nav-link active"
                aria-current="page"
                href="#"
                data-toggle="dropdown"
                >Dịch vụ <span class="caret"></span
              ></a>
              <ul class="dropdown-menu dropdown-service">
                <li
                  class="li-service"
                  v-for="service in filteredServices"
                  :key="service.serviceId"
                >
                  <a class="a-service" @click="goService(service.serviceId)">
                    {{ service.serviceName }}
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item" @click="PriceList()">
              <a class="nav-link active" aria-current="page" href="#"
                >Bảng giá</a
              >
            </li>

            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#"
                >Khách hàng</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">News</a>
            </li>
          </ul>
          <div v-if="role != null" class="log-out" @click="logOut()">
            Đăng xuất
          </div>
          <div v-if="role != null" class="profile" @click="checkProfile()">
            Thông tin cá nhân
          </div>
          <div v-if="role === null" class="log-out" @click="logIn()">
            Đăng nhập
          </div>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
import Overview from "./OverviewClinic/Overview.vue";
import axios from "axios";

export default {
  name: "Sidebar-boostrap",
  components: {},
  data() {
    return {
      role: "",
      action: "",
      services: [],
    };
  },
  methods: {
    async fetchServices() {
      let apiURL = "https://localhost:7034/api/Service/list";
      axios
        .get(apiURL)
        .then((response) => {
          this.services = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    CheckRole() {
      this.role = localStorage.getItem("userRole");
    },
    logIn() {
      this.role = null;
      localStorage.removeItem("userRole");
      this.$emit("log-in");
      this.$router.push({ name: "Login" });

    },
    logOut() {
      this.action = "log-out";
      localStorage.removeItem("userRole");
      this.role = null;
      this.$emit("log-out", this.action);
      this.$router.push({ name: "Login" });
    },
    teamDoctor() {
      this.$router.push({ name: "TeamDoctor" });
    },
    Overview() {
      this.$router.push({ name: "Overview" });
    },
    checkProfile() {
      this.$router.push({ name: "Profile" });
    },
    PriceList() {
      this.$router.push({ name: "PriceList" });
    },
    backHome() {
      this.$router.push({ name: "Home" });
    },
    goService(id) {
      localStorage.setItem("ServiceId", id);
      this.$router.push({ name: "Service" });
    },
  },
  computed: {
    filteredServices() {
      return this.services.filter((service) => service.briefInfo === "title");
    },
  },
  mounted: function () {
    this.fetchServices();
    this.CheckRole();
  },
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
  cursor: pointer;

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
  padding: 20px;
  margin-top: auto;
  margin-left: 130px !important;
  width: 240px !important;
}
.dropdown-service {
  padding: 20px;
  margin-top: auto;
  margin-left: 270px !important;
  width: 300px !important;
}
li .li-service {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100% !important;
}
.a-service:hover,
.a-service:active {
  cursor: pointer;
  background-color: #ddd;
  background-color: none;
  transition: background-color 0.5s ease, color 0.5s ease;
}
.btn-outline-success {
  margin-right: 220px;
}
.log-out {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(205, 230, 230);
  width: 100px;
  height: 35px;
  cursor: pointer;
  margin-right: 10px;
  position: absolute;
  right: 0;
}
.profile {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(205, 230, 230);
  width: 100px;
  height: 35px;
  cursor: pointer;
  margin-right: 10px;
  position: absolute;
  right: 116px;
}
.a-service {
  padding: 4%;
  width: 100% !important;
  background-color: none !important;
}
@media (max-width: 1300px) {
  .dropdown-menu {
    margin-top: auto;
    margin-left: 133px;
    width: 15%;
  }
  li {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 53px;
    width: 100px;
  }
  .dropdown-service {
    margin-left: 233px;
    width: 15%;
  }
  li .li-service {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 188px;
  }
  .nav-item {
    width: 130px;
  }
}
</style>
