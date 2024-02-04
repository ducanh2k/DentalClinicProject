<template class="forgetPassword">
    <div class="main">
        <div class="container">
        <div class="left_container">

        </div>
        <div class="rigt_container">
            <h2 class="lbForgetPassword">Quên mật khẩu</h2>
            <img class="logo" src="../imgs/logo.jpg" alt="">
            <br>
            <label for="uname"><b class="lbTitle">Tên đăng nhập</b><b class="lbSt">*</b></label><br>
            <input class="form" type="text" placeholder="Nhập tên tài khoản" name="uname" required>
            <br>
            <br><label for="number"><b class="lbTitle">Số điện thoại</b><b class="lbSt">*</b></label><br>
            <input class="form" type="text" placeholder="Nhập số điện thoại" name="number" required>
            <br>
            <br><button class="btnForgetPassword" type="submit">Xác nhận</button>
        </div>
    </div>
    </div>
</template>
<script>
import '../css/forgetPassword.css'
export default {
  name: "ForgetPassword",
};
</script>