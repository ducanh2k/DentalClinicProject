<template>
    <div class="container">
      <TheSidebar></TheSidebar>
      <TheMain>
      </TheMain>
    </div>
  </template>
  
  <script>
  import './css/main.css'
  import TheMain from "./TheMain.vue";
  import TheSidebar from "./TheSidebar.vue";
  export default {
    name: "Admin",
    components: {
      TheMain,
      TheSidebar,
    },
  };
  </script>
  
  <style>
  </style>
  