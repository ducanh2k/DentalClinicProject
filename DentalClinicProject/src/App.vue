<template>
  <!-- <HomePage></HomePage> -->
  <!-- <AdminVue></AdminVue> -->
  <Service></Service>
  <!-- <User></User> -->
</template>

<script>
import "@fortawesome/fontawesome-free/css/all.css";
import HomePage from './layout/User/HomePage.vue';
import AdminVue from './Admin.vue';
import Service from "./layout/Admin/ServiceManagement/Service.vue";
import User from "./layout/Admin/UserManagement/User.vue";
export default {
  name: "App",
  components: {
    Service,
    User,
    AdminVue,
    HomePage,
  },
};
</script>

<style></style>
