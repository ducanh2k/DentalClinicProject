<template>
  <HomePage></HomePage>
  <!-- <AdminVue></AdminVue> -->
</template>

<script>
import '@fortawesome/fontawesome-free/css/all.css'
import HomePage from './layout/User/HomePage.vue';
// import AdminVue from './Admin.vue';
export default {
  name: "App",
  components: {
    // AdminVue,
    HomePage
  },
};
</script>

<style>
</style>