<template>
  <div>
    <LoginVue v-if="!isLoggedIn" @login-success="handleLoginSuccess"></LoginVue>
    <router-view v-if="isLoggedIn" />
    <!-- <HomePage></HomePage> -->
  </div>
</template>

<script>
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
import TeamDoctorListVue from "./layout/User/TeamDoctor/TeamDoctorList.vue";
import LoginVue from "./Login/Login.vue";
import Invoice from "./layout/Admin/Invoice/Invoice.vue";
export default {
  name: "App",
  components: {
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
    TeamDoctorListVue,
    SidebarBoostrap,
    LoginVue,
    Invoice,
  },
  data() {
    return {
      isLoggedIn: false,
      role: null,
    };
  },
  methods: {
    handleLoginSuccess(role) {
      this.isLoggedIn = true;
      this.role = role;
    },
  },
};
</script>

<style></style>
