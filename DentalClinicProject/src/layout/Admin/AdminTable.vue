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
    <!-- <tr>
      <th>Họ và tên</th>
      <th>CCCD</th>
      <th>Số điện thoại</th>
      <th>Địa chỉ</th>
      <th>Chức vụ</th>
      <th>Mức lương</th>
      <th class="text-center">Edit</th>
      <th class="text-center">Delete</th>
    </tr>
    <tr>
      <td>Hoan</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Văn Phú, Hà Nội</td>
      <td>Bác sĩ</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Hung</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lê Văn Lương, Hà Nội</td>
      <td>Bác sĩ</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Lam</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lò Đúc, Hà Nội</td>
      <td>Nhân Viên</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Hung</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lê Văn Lương, Hà Nội</td>
      <td>Nhân Viên</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Dung</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lê Lai, Hà Nội</td>
      <td>Nhân Viên</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Hung</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lê Văn Lương, Hà Nội</td>
      <td>Nhân viên</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Hoan</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Văn Phú, Hà Nội</td>
      <td>Bác sĩ</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Hung</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lê Văn Lương, Hà Nội</td>
      <td>Bác sĩ</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Lam</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lò Đúc, Hà Nội</td>
      <td>Nhân Viên</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Hung</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lê Văn Lương, Hà Nội</td>
      <td>Nhân Viên</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Dung</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lê Lai, Hà Nội</td>
      <td>Nhân Viên</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr>
    <tr>
      <td>Hung</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Lê Văn Lương, Hà Nội</td>
      <td>Nhân viên</td>
      <td>7.000.000 đ</td>
      <td class="text-center icon">✏️</td>
      <td class="text-center icon">🗑️</td>
    </tr> -->
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
