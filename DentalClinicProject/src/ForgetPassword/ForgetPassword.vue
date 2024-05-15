<template class="forgetPassword">
  <!-- Password Reset 8 - Bootstrap Brain Component -->
  <section class="bg-light p-3 p-md-4 p-xl-5">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-xxl-11">
          <div class="card border-light-subtle shadow-sm">
            <div class="row g-0" style="display: flex">
              <div
                class="col-12 col-md-6"
                style="background-color: aqua; width: 45%"
              >
                <img
                  class="img-fluid rounded-start w-100 h-100 object-fit-cover"
                  loading="lazy"
                  src="../imgs/logo-img-1.webp"
                  alt="Welcome back you've been missed!"
                />
              </div>
              <div
                class="col-12 col-md-6 d-flex align-items-center justify-content-center"
              >
                <div class="col-12 col-lg-11 col-xl-10">
                  <div class="card-body p-3 p-md-4 p-xl-5">
                    <div class="row">
                      <div class="col-12">
                        <div class="mb-5">
                          <!-- <div class="text-center mb-4">
                            <a href="#!">
                              <img
                                src="./assets/img/bsb-logo.svg"
                                alt="BootstrapBrain Logo"
                                width="175"
                                height="57"
                              />
                            </a>
                          </div> -->
                          <h2 class="h4 text-center">Đặt lại mật khẩu</h2>
                          <h3
                            class="fs-6 fw-normal text-secondary text-center m-0"
                          >
                            Cung cấp địa chỉ email được liên kết với tài khoản
                            của bạn để khôi phục mật khẩu.
                          </h3>
                        </div>
                      </div>
                    </div>
                    <form action="#!">
                      <div class="row gy-3 overflow-hidden">
                        <div class="col-12">
                          <div class="form-floating mb-3">
                            <input
                              type="email"
                              class="form-control"
                              name="email"
                              id="email"
                              placeholder="name@example.com"
                              v-model="email"
                              required
                            />
                            <label for="email" class="form-label">Email</label>
                          </div>
                        </div>
                        <div class="col-12">
                          <div class="d-grid">
                            <button
                              class="btn btn-dark btn-lg"
                              @click="resetClick()"
                            >
                            Đặt lại mật khẩu
                            </button>
                          </div>
                        </div>
                      </div>
                    </form>
                    <div class="row">
                      <div class="col-12">
                        <div
                          class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-center mt-5"
                        >
                          <a
                            href="#!"
                            class="link-secondary text-decoration-none"
                            @click="loginClick()"
                            >Đăng nhập</a
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
import axios from "axios";
export default {
  name: "ForgetPassword",
  data() {
    return {
      email: "",
    };
  },
  methods: {
    resetClick() {
      let modifiedEmail = this.email.replace("@", "%40");
      axios
        .post(
          "https://localhost:7034/api/Auth/restPassword?request=" +
            modifiedEmail
        )
        .then((response) => {
          alert("Mật khẩu đã được đổi thành công và gửi qua email.");
        })
        .catch((error) => {
          alert(error.response.data);
        });
    },
    loginClick() {
      localStorage.removeItem("userRole");
      this.$router.push({ name: "Login" });
    },
  },
};
</script>
