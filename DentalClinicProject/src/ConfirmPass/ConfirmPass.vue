<template class="confirmPass">
    <div class="main">
        <div class="container">
        <div class="left_container">

        </div>
        <div class="rigt_container">
            <h2 class="lbConfirmPass">Đặt lại mật khẩu</h2>
            <img class="logo" src="../imgs/logo.jpg" alt="">
            <br>
            <label for="pass"><b class="lbTitle">Mật khẩu</b><b class="lbSt">*</b></label><br>
            <input class="form" type="text" placeholder="Nhập mật khẩu" name="uname" required>
            <br>
            <br><label for="rePass"><b class="lbTitle">Nhập lại mật khẩu</b><b class="lbSt">*</b></label><br>
            <input class="form" type="text" placeholder="Nhập mật khẩu" name="rePass" required>
            <br>
            <br><button class="btnConfirmPass" type="submit">Xác nhận</button>
        </div>
    </div>
    </div>
</template>
<script>
import '../css/confirmPass.css'
export default {
  name: "ConfirmPass",
};
</script>