<template>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Password</th>
        <th>Role</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>NumOfLogins</th>
        <th class="text-center">Edit</th>
        <th class="text-center">Delete</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(item, index) in users" :key="index"></tr>
    </tbody>
  </table>
</template>

<script>
export default {
  name: "AdminTable",
  data() {
    return {
      users: [{}],
    };
  },
};
</script>

<style scoped></style>
