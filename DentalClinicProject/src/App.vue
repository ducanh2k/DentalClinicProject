<template>
  <div class="container-Admin">
    <TheSidebar @navigate="handleNavigation"></TheSidebar>
    <component :is="currentView"></component>
  </div>
  <!-- <HomePage></HomePage> -->
</template>

<script>
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
  },
  data() {
    return {
      currentView: null,
    };
  },
  methods: {
    handleNavigation(view) {
      this.currentView = view;
    },
  },
};
</script>

<style></style>
