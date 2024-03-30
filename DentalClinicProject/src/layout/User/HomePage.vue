<template>
  <div>
  <SidebarBoostrap @log-in="handleLogin"></SidebarBoostrap>
  <HPBody></HPBody>
  </div>
</template>

<script>
import SidebarBoostrap from './Sidebar-boostrap.vue';
import HPBody from './HPBody.vue';
export default {
  name: "HomePage",
  components:{
    SidebarBoostrap,
    HPBody
  },
  methods: {
    
    handleLogin() {
      this.$emit("log-in");
    },
    
  },
};
</script>

<style scoped></style>
