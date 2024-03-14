<template>
  <div class="sidebar">
    <div class="header__logo">
      <div class="logo__picture">
        <button class="logo"></button>
      </div>
    </div>
    <div class="sidebar-main">
      <div class="item1" tabindex="1">
        <router-link to="/service" class="item1__content">
          <div class="item1-inner">Quản lý dịch vụ</div>
        </router-link>
      </div>
      <div class="item1" tabindex="2" >
        <router-link to="/user" class="item1__content">
          <div class="item1-inner">Quản lý người dùng</div>
        </router-link>
      </div>
      <div class="item1" tabindex="3">
        <router-link to="/material" class="item1__content">
          <div class="item1-inner">Vật tư - vật liệu</div>
        </router-link>
      </div>
      <div class="item1" tabindex="4" v-if="role === 'Admin'">
        <div class="item1__content"></div>
        <router-link to="/admin" class="item1__content">
          <div class="item1-inner">Doanh thu</div>
        </router-link>
      </div>
      <div class="item1" tabindex="5">
        <router-link to="/appointment" class="item1__content">
          <div class="item1-inner">Lịch hẹn</div>
        </router-link>
      </div>
      <div class="item1" tabindex="6">
        <router-link to="/medicalRecord" class="item1__content">
          <div class="item1-inner">Hồ sơ bệnh án</div>
        </router-link>
      </div>
      <div class="item1" tabindex="7">
        <router-link to="/medicine" class="item1__content">
          <div class="item1-inner">Thuốc</div>
        </router-link>
      </div>
      <div class="item1" tabindex="8" v-if="role === 'Admin'">
        <router-link to="/invoice" class="item1__content">
          <div class="item1-inner">Hóa đơn</div>
        </router-link>
      </div>
      <div class="item1" tabindex="9">
        <router-link to="/news" class="item1__content">
          <div class="item1-inner">Tin tức</div>
        </router-link>
      </div>
      <div class="item1" tabindex="10">
        <router-link to="/pre" class="item1__content">
          <div class="item1-inner">Đơn thuốc</div>
        </router-link>
      </div>
      <div class="item1" tabindex="11">
        <router-link to="/comment" class="item1__content">
          <div class="item1-inner">Bình luận</div>
        </router-link>
      </div>
      <div class="item1" tabindex="11">
        <router-link to="/comment" class="item1__content">
          <div class="item1-inner">Thông tin cá nhân</div>
        </router-link>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "TheSidebar",
  data() {
    return {
      role: "",
    };
  },
  methods: {
    CheckRole() {
      this.role = localStorage.getItem("userRole");
    },
  },
  mounted() {
    this.CheckRole();
  }
};
</script>

<style scoped></style>
