<template>
  <div class="container-Admin">
    <TheSidebar @navigate="handleNavigation"></TheSidebar>
    <component :is="currentView"></component>
  </div>
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
