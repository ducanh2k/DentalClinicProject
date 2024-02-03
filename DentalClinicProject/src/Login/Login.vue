<template class="login">
    <div class="main">
        <div class="container">
        <div class="left_container">

        </div>
        <div class="rigt_container">
            <h2 class="lbLogin">Đăng nhập</h2>
            <img class="logo" src="../imgs/logo.jpg" alt="">
            <br>
            <label for="uname"><b class="lbTitle">Tên đăng nhập</b><b class="lbSt">*</b></label><br>
            <input class="form" type="text" placeholder="Nhập tên tài khoản" name="uname" required>
            <br>
            <br><label for="pass"><b class="lbTitle">Mật khẩu</b><b class="lbSt">*</b></label><br>
            <input class="form" type="text" placeholder="Nhập mật khẩu" name="pass" required>
            <br>
            <br><button class="btnLogin" type="submit">Đăng nhập</button>
            <br>
            <br><div class="lnkForget"><a class="txtForget" href="" target="_blank">Quên mật khẩu?</a></div>
        </div>
    </div>
    </div>
</template>
<script>
import '../css/login.css'
export default {
  name: "Login",
};
</script>