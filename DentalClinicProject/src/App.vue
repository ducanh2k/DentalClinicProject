<template>
  <!-- <HomePage></HomePage> -->
  <!-- <AdminVue></AdminVue> -->
  <Service></Service>
</template>

<script>
import '@fortawesome/fontawesome-free/css/all.css'
import HomePage from './layout/Admin/HomePage.vue';
import Service from './layout/Admin/ServiceManagement/Service.vue';
// import AdminVue from './Admin.vue';
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
