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
            <button class="btnAdd" type="submit">Thêm mới nhân viên</button>
            <table class="table table-striped table-hover">
  <thead>
    <tr>
      <th scope="col">Họ và tên</th>
      <th scope="col">CCCD</th>
      <th scope="col">Số điện thoại</th>
      <th scope="col">Địa chỉ</th>
      <th scope="col">Chức vụ</th>
      <th scope="col">Mức lương</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Văn Phú, Hà Nội</td>
      <td>Bác sĩ</td>
      <td>7.000.000 đ</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Văn Phú, Hà Nội</td>
      <td>Bác sĩ</td>
      <td>7.000.000 đ</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Văn Phú, Hà Nội</td>
      <td>Bác sĩ</td>
      <td>7.000.000 đ</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Văn Phú, Hà Nội</td>
      <td>Bác sĩ</td>
      <td>7.000.000 đ</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>1111111111323</td>
      <td>0366658911</td>
      <td>Văn Phú, Hà Nội</td>
      <td>Bác sĩ</td>
      <td>7.000.000 đ</td>
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
    import '/src/css/employeeManagement.css'
    export default {
    name: "EmployeeManagement",
  };
  </script>
  
  