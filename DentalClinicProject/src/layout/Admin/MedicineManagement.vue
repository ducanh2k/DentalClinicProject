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
            <button class="btnAdd" type="submit">Thêm mới thuốc</button>
            <table class="table table-striped table-hover">
  <thead>
    <tr>
      <th scope="col">Tên thuốc</th>
      <th scope="col">Đơn vị</th>
      <th scope="col">Lượng dùng</th>
      <th scope="col">Công dụng</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Alphachoay</td>
      <td>Viên</td>
      <td>Ngày 4 viên 2 lần sau ăn</td>
      <td>Kháng viêm</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Alphachoay</td>
      <td>Viên</td>
      <td>Ngày 4 viên 2 lần sau ăn</td>
      <td>Kháng viêm</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Alphachoay</td>
      <td>Viên</td>
      <td>Ngày 4 viên 2 lần sau ăn</td>
      <td>Kháng viêm</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Alphachoay</td>
      <td>Viên</td>
      <td>Ngày 4 viên 2 lần sau ăn</td>
      <td>Kháng viêm</td>
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
    import '/src/css/medicineManagement.css'
    export default {
    name: "MedicineManagement",
  };
  </script>
  
  