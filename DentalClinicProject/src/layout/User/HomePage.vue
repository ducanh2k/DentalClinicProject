<template>
  <div>
  <SidebarBoostrap></SidebarBoostrap>
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
  }
};
</script>

<style scoped></style>
