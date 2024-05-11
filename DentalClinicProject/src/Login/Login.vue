<template class="login">
  <div class="mainLogin">
    <div class="containerLogin">
      <div class="left_containerLogin"></div>
      <div class="rigt_containerLogin">
        <h2 class="lbLogin">Đăng nhập</h2>
        <img class="logoLogin" src="../imgs/logo.jpg" alt="" />
        <br />
        <label for="email"
          ><b class="lbTitle">Tên đăng nhập</b><b class="lbSt">*</b></label
        ><br />
        <input
          class="formLogin"
          type="text"
          placeholder="Nhập email"
          name="email"
          v-model="email"
          required="true"
        />
        <br />
        <br /><label for="pass"
          ><b class="lbTitle">Mật khẩu</b><b class="lbSt">*</b></label
        ><br />
        <input
          class="formLogin"
          type="password"
          placeholder="Nhập mật khẩu"
          v-model="password"
          name="pass"
          required
        />
        <br />
        <br /><button class="btnLogin" @click="loginClick()" type="button">
          Đăng nhập
        </button>
        <br />
        <br />
        <div class="lnkForget" style="cursor: pointer">
          <a class="txtForget" @click="forgetClick()" target="_blank"
            >Quên mật khẩu?</a
          >
        </div>
      </div>
    </div>
  </div>
</template>
<script>
// import { getUserFromToken } from "../js/getUser.js";
import axios from "axios";
import "../css/login.css";
export default {
  name: "Login",
  data() {
    return {
      email: "",
      password: "",
      userData: null,
    };
  },
  methods: {
    forgetClick() {
      this.$router.push({ name: "forgetPass" });
    },
    loginClick() {
      if (this.email === "" || this.password === "") {
        alert("Email hoặc mật khẩu không được để trống!");
        return;
      }
      axios
        .post("https://localhost:7034/api/Auth/login", {
          email: this.email,
          password: this.password,
        })
        .then((response) => {
          const userRole = response.data.role;
          const id = response.data.id;
          this.$emit("login-success", userRole);
          localStorage.setItem("userRole", userRole);
          sessionStorage.setItem("firstRole", "false");
          localStorage.setItem("UserId", id);
          if (response.data.role === "Admin") {
            this.$router.push({ name: "Admin" });
          } else if (response.data.role === "Staff") {
            this.$router.push({ name: "Staff" });
          } else if (response.data.role === "Doctor") {
            this.$router.push({ name: "Doctor" });
          } else {
            this.$router.push({ name: "Patient" });
          }
        })
        .catch((error) => {
          alert(error.response.data);
        });
    },
  },
};
</script>
