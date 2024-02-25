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
            <button class="btnAdd" type="submit">Thêm mới</button>
            <table class="table table-striped table-hover">
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
      </div>
    </div>
  </template>
  
  <script>
    import '@fortawesome/fontawesome-free/css/all.css'
    import '/src/css/materialManagement.css'
    export default {
    name: "MaterialManagement",
  };
  </script>
  
  