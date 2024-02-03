<template>
    <div class="container">
      <TheSidebar></TheSidebar>
      <TheMain>
      </TheMain>
      <h1>hello</h1>
    </div>
  </template>
  
  <script>
  import './css/Admin/main.css'
  import TheMain from './layout/Admin/TheMain.vue';
  import TheSidebar from './TheSidebar.vue';
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
  