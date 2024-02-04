<template class="register">
  <div class="main">
      <div class="container">
      <div class="left_container">

      </div>
      <div class="rigt_container">
          <h2 class="lbRegister">Đăng ký</h2>
          <img class="logo" src="../imgs/logo.jpg" alt="">
          <br>
          <label for="uname"><b class="lbTitle">Tên đăng nhập</b><b class="lbSt">*</b></label><br>
          <input class="form" type="text" placeholder="Nhập tên tài khoản" name="uname" required>
          <br>

          <br><label for="number"><b class="lbTitle">Số điện thoại</b><b class="lbSt">*</b></label><br>
          <input class="form" type="text" placeholder="Nhập số điện thoại" name="number" required>
          <br>

          <br><label for="pass"><b class="lbTitle">Mật khẩu</b><b class="lbSt">*</b></label><br>
          <input class="form" type="text" placeholder="Nhập mật khẩu" name="pass" required>
          <br>

          <br><label for="rePass"><b class="lbTitle">Nhập lại mật khẩu</b><b class="lbSt">*</b></label><br>
          <input class="form" type="text" placeholder="Nhập mật khẩu" name="rePass" required>
          <br>

          <br><button class="btnRegister" type="submit">Đăng ký</button>
          <br>
      </div>
  </div>
  </div>
</template>
<script>
import '../css/register.css'
export default {
  name: "Register",
};
</script>