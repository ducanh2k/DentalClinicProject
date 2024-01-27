<template>
  <div class="container">
    <TheMain></TheMain>
    <TheSidebar></TheSidebar>
  </div>
</template>

<script>
import TheMain from "./TheMain.vue";
import TheSidebar from "./TheSidebar.vue";
export default {
  name: "App",
  components: {
    TheMain,
    TheSidebar,
  },
};
</script>
<style>
@import url(./css/main.css);
</style>
