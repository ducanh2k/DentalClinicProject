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
      <th scope="col">Vật tư - Vật liệu</th>
      <th scope="col">Đơn vị</th>
      <th scope="col">Đơn giá</th>
      <th scope="col">Hạn sử dụng</th>
      <th scope="col">Nhà cung cấp</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Che nướu</td>
      <td>Tuýp</td>
      <td>105.000</td>
      <td>10/12/2025</td>
      <td>CÔNG TY CỔ PHẦN XUẤT NHẬP KHẨU BẢO MINH</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Che nướu</td>
      <td>Tuýp</td>
      <td>105.000</td>
      <td>10/12/2025</td>
      <td>CÔNG TY CỔ PHẦN XUẤT NHẬP KHẨU BẢO MINH</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Che nướu</td>
      <td>Tuýp</td>
      <td>105.000</td>
      <td>10/12/2025</td>
      <td>CÔNG TY CỔ PHẦN XUẤT NHẬP KHẨU BẢO MINH</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Che nướu</td>
      <td>Tuýp</td>
      <td>105.000</td>
      <td>10/12/2025</td>
      <td>CÔNG TY CỔ PHẦN XUẤT NHẬP KHẨU BẢO MINH</td>
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
    name: "Material",
    components: {
      TheSidebar,
    },
  };
  </script>
  
  <style scoped></style>
  