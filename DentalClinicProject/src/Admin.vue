<template>
  <div class="container-Admin">
    <TheSidebar></TheSidebar>
    <TheMain> </TheMain>
  </div>
</template>

<script>
import "./css/Admin/main.css";
import TheMain from "./layout/Admin/TheMain.vue";
import TheSidebar from "./layout/Admin/TheSidebar.vue";
export default {
  name: "Admin",
  components: {
    TheMain,
    TheSidebar,
  },
};
</script>

<style></style>
