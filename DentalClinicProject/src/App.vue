<template>
  <!-- <HomePage></HomePage> -->
  <!-- <AdminVue></AdminVue> -->
  <Service></Service>
</template>

<script>
import "@fortawesome/fontawesome-free/css/all.css";
// import HomePage from "./layout/User/HomePage.vue";
import AdminVue from "./Admin.vue";
import Service from "./layout/Admin/ServiceManagement/Service.vue";
export default {
  name: "App",
  components: {
    Service
    // AdminVue,
    // HomePage,
  },
};
</script>

<style></style>
