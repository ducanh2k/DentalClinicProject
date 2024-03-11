<template class="login">
    <div class="mainLogin">
        <div class="containerLogin">
        <div class="left_containerLogin">

        </div>
        <div class="rigt_containerLogin">
            <h2 class="lbLogin">Đăng nhập</h2>
            <img class="logoLogin" src="../imgs/logo.jpg" alt="">
            <br>
            <label for="email"><b class="lbTitle">Tên đăng nhập</b><b class="lbSt">*</b></label><br>
            <input class="formLogin" type="text" placeholder="Nhập email" name="email" required>
            <br>
            <br><label for="pass"><b class="lbTitle">Mật khẩu</b><b class="lbSt">*</b></label><br>
            <input class="formLogin" type="text" placeholder="Nhập mật khẩu" name="pass" required>
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