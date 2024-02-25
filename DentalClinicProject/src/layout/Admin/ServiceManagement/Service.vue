<template>
  <div class="container-Admin">
    <TheSidebar></TheSidebar>
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
        <!-- <AddEButton></AddEButton> -->
        <div class="search-container">
          <input type="text" placeholder="Nhập từ khóa" class="search-box" />
          <button class="search-button">Tìm kiếm</button>
          <div class="addnew">
            <button class="button-create">Thêm mới</button>
          </div>
        </div>
        <div class="range">
          <div class="range">
            <table class="table table-striped table-hover" style="height: 30%">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">First</th>
                  <th scope="col">Last</th>
                  <th scope="col">Handle</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td colspan="2">Larry the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
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
  </div>
</template>

<script>
import "./css/Admin/main.css";
import TheSidebar from "../TheSidebar.vue";
export default {
  name: "Service",
  components: {
    TheSidebar,
  },
};
</script>

<style scoped></style>
