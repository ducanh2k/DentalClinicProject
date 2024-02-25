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
            <button class="btnAdd" type="submit">Thêm mới lịch hẹn</button>
            <table class="table table-striped table-hover">
  <thead>
    <tr>
        <th scope="col">Tên khách hàng</th>
        <th scope="col">Số điện thoại</th>
      <th scope="col">Ngày giờ</th>
      <th scope="col">Bác sỹ</th>
      <th scope="col">Nội dung</th>
      <th scope="col">Ghi chú</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>0366658911</td>
      <td>12/11/2024 16:00</td>
      <td>Tâm</td>
      <td>Sâu răng hàm</td>
      <td>Tiền sử dạ dày</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>0366658911</td>
      <td>12/11/2024 16:00</td>
      <td>Tâm</td>
      <td>Sâu răng hàm</td>
      <td>Tiền sử dạ dày</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>0366658911</td>
      <td>12/11/2024 16:00</td>
      <td>Tâm</td>
      <td>Sâu răng hàm</td>
      <td>Tiền sử dạ dày</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>0366658911</td>
      <td>12/11/2024 16:00</td>
      <td>Tâm</td>
      <td>Sâu răng hàm</td>
      <td>Tiền sử dạ dày</td>
      <td><i class="fa-solid fa-pen"></i>&emsp;<i class="fa-solid fa-trash"></i></td>
    </tr>
    <tr>
      <td>Nguyễn Việt Hoàn</td>
      <td>0366658911</td>
      <td>12/11/2024 16:00</td>
      <td>Tâm</td>
      <td>Sâu răng hàm</td>
      <td>Tiền sử dạ dày</td>
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
    import '/src/css/bookingManagement.css'
    export default {
    name: "BookingManagement",
  };
  </script>
  
  