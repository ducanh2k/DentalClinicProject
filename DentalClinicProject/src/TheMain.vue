<template>
  <div class="main">
    <div class="main-header">
      <div class="title">
        <div class="title__toggle"></div>
        <div class="title__company">Nha khoa Dentistry</div>
        <div class="exit__button"></div>
        <!-- <i class="fa-solid fa-arrow-right-from-bracket "></i> -->
      </div>
    </div>
    <div class="main-body">
      <div class="search-container">
        <input type="text" placeholder="Nhập từ khóa" class="search-box" />
        <button class="search-button">Tìm kiếm</button>
        <div class="addnew">
          <button class="button-create">Thêm mới nhân viên</button>
        </div>
      </div>
      <AdminTable></AdminTable>
      <div class="under-table">
        <div class="sum__staff">Tổng số nhân viên: <strong>14</strong></div>
        <div class="pagination">
          <li><a href="#" class="page-1">1</a></li>
          <li><a href="#" class="page-2">2</a></li>
          <li><a href="#" class="page-3">3</a></li>
          <li><a href="#" class="Next-page">Next ></a></li>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AdminTable from "./AdminTable.vue";
export default {
  name: "TheMain",
  components: {
    AdminTable,
  },
};
</script>

<style scoped></style>
