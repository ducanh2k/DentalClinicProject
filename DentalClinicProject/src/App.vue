<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Implant from "./layout/User/Service/Implant.vue";
import CKEditor from "./layout/User/Service/CKEditor.vue";
import Profile from "./layout/User/Profile/Profile.vue";
import Overview from "./layout/User/OverviewClinic/Overview.vue";
import SidebarBoostrap from "./layout/User/Sidebar-boostrap.vue";
import Appointment from "./layout/Admin/Appointment/Appointment.vue";
import "@fortawesome/fontawesome-free/css/all.css";
import TheSidebar from "./layout/Admin/TheSidebar.vue";
import HomePage from "./layout/User/HomePage.vue";
import Admin from "./Admin.vue";
import Service from "./layout/Admin/ServiceManagement/Service.vue";
import User from "./layout/Admin/UserManagement/User.vue";
import Medicine from "./layout/Admin/MedicineManagement/Medicine.vue";
import Material from "./layout/Admin/MaterialManagement/Material.vue";
import MedicalRecord from "./layout/Admin/MedicalRecordManagement/MedicalRecord.vue";
import Comment from "./layout/Admin/Comment/Comment.vue";
import Prescription from "./layout/Admin/Prescription/Prescription.vue";
import News from "./layout/Admin/NewsManagement/News.vue";
import Revenue from "./layout/Admin/RevenueManagement/Revenue.vue";
import TeamDoctorContainerVue from "./layout/User/TeamDoctor/TeamDoctor-container.vue";
import LoginVue from "./Login/Login.vue";
import Invoice from "./layout/Admin/Invoice/Invoice.vue";
export default {
  name: "App",
  components: {
    Implant,
    CKEditor,
    Profile,
    Appointment,
    TheSidebar,
    Service,
    User,
    Admin,
    HomePage,
    Medicine,
    Material,
    MedicalRecord,
    Comment,
    Prescription,
    News,
    Revenue,
    TeamDoctorContainerVue,
    SidebarBoostrap,
    LoginVue,
    Invoice,
    Overview,
  },
  data() {
    return {
      isLoggedIn: false,
      role: null,
      doing: null,
    };
  },
  computed: {
    isHomePageVisible() {
      if (
        this.$route.name === "Home" ||
        typeof this.$route.name === "undefined" ||
        this.$route.name === "/"
      ) {
        return true;
      }
    },
  },
  methods: {
    handleLoginSuccess(role) {
      this.isLoggedIn = true;
      this.role = role;
      this.$router.push({ name: "Login" });
    },
    handleLogin() {
      this.isLoggedIn = true;
      localStorage.removeItem("userRole");
      this.$router.push({ name: "Login" });
    },
    handleLogOut() {
      this.isLoggedIn = false;
      this.role = null;
      this.$router.push({ name: "Login" });
    },
  },
  created() {
    this.$router.push("");
    // window.addEventListener("beforeunload", () => {
    //   sessionStorage.removeItem("firstLoadDone");
    // });ee
  },
  mounted() {
    // if (!sessionStorage.getItem("pageLoaded")) {
    //   sessionStorage.setItem("pageLoaded", "true");
    //   alert("ko co");
    // }
    // else{
    //   alert("co'")
    // }
    // window.addEventListener("beforeunload", function (event) {
    //   if (!sessionStorage.getItem("pageLoaded")) {
    //     alert("Trang được đóng");
    //   } else {
    //     alert("Trang được tải lại");
    //   }
    // });
    localStorage.setItem("userRole", null);
    if (!sessionStorage.getItem("firstLoadDone")) {
      localStorage.removeItem("currentPath");
      sessionStorage.setItem("firstLoadDone", "true");
      sessionStorage.setItem("firstRole", "true");
      this.$router.push({ name: "Home" });
    } else {
      const currentPath = localStorage.getItem("currentPath");
      if (currentPath) {
        this.$router.push(currentPath);
      } else {
        // this.$router.push({ name: "Home" });
      }
    }
  },
};
</script>

<style></style>
