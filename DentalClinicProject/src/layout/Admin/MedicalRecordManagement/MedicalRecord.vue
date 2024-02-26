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
            <table class="table table-striped table-hover" style="height: 30%">
              <thead>
                <tr>
      <th scope="col">Mã hồ sơ</th>
      <th scope="col">Họ tên</th>
      <th scope="col">Tuổi</th>
      <th scope="col">Giới tính</th>
      <th scope="col">Điện thoại</th>
      <th scope="col">Địa chỉ</th>
      <th scope="col">Ghi chú</th>
      <th scope="col">Ngày nhập</th>
      <th scope="col">Lý do khám bệnh</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td>1</td>
      <td>Nguyễn Việt Hoàn</td>
      <td>24</td>
      <td>Nam</td>
      <td>0366658911</td>
      <td>Hà Nội</td>
      <td>Dạ dày</td>
      <td>07/12/2023</td>
      <td>Đau răng hàm</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
        <td>1</td>
      <td>Nguyễn Việt Hoàn</td>
      <td>24</td>
      <td>Nam</td>
      <td>0366658911</td>
      <td>Hà Nội</td>
      <td>Dạ dày</td>
      <td>07/12/2023</td>
      <td>Đau răng hàm</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
        <td>1</td>
      <td>Nguyễn Việt Hoàn</td>
      <td>24</td>
      <td>Nam</td>
      <td>0366658911</td>
      <td>Hà Nội</td>
      <td>Dạ dày</td>
      <td>07/12/2023</td>
      <td>Đau răng hàm</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
              </tbody>
            </table>
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
  import "/src/css/Admin/main.css";
  import TheSidebar from "../TheSidebar.vue";
  export default {
    name: "MedicalRecord",
    components: {
      TheSidebar,
    },
  };
  </script>
  
  <style scoped></style>
  