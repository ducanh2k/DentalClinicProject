<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha384-GLhlTQ8iUNdK6dAy+gT/RB3eZ9qI1aWPPPfOMb7Fqz/3L2gCFs8L4Mz5FZf2J98" crossorigin="anonymous"></link>
<template>
    <div class="containerEm">
      <div class="leftEm">
        <h1>sidebar</h1>
      </div>
      <div class="rightEm">
          <div class="headEm">
            <i class="fa-solid fa-bars"></i>
            <label class="titleEm">Nha khoa Dentistry</label>
            <div class="logoutEm">
              <i class="fa-solid fa-right-from-bracket"></i>
            </div>
          </div>
          <div class="mainEm">
            <input class="formEm" type="text" placeholder="Nhập từ khóa" name="key" required>
            <button class="btnSearch" type="submit">Tìm kiếm</button>
            <button class="btnAdd" type="submit">Thêm mới hồ sơ</button>
            <table class="table table-striped table-hover">
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
      </div>
    </div>
  </template>
  
  <script>
    import '@fortawesome/fontawesome-free/css/all.css'
    import '/src/css/medicalRecordManagement.css'
    export default {
    name: "MedicalRecordManagement",
  };
  </script>
  
  