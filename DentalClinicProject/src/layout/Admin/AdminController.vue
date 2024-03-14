<template>
  <div>
    <div class="container-Admin">
      <TheSidebar @navigate="handleNavigation"></TheSidebar>
      <!-- <component :is="currentView"> </component> -->
    </div>
  </div>
</template>

<script>
import TheSidebar from "./TheSidebar.vue";
export default {
  name: "AdminController",
  components: {
    TheSidebar,
  },
  data() {
    return {
      currentView: "Revenue",
    };
  },
  methods: {
    handleNavigation(view) {
      this.currentView = view;
    },
  },
};
</script>

<style scoped></style>
