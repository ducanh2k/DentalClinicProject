<template>
  <div class="sidebar">
    <div class="header__logo">
      <div class="logo__picture">
        <button class="logo"></button>
      </div>
    </div>
    <div class="sidebar-main">
      <div class="item1" tabindex="1" @click="$emit('navigate', 'Service')">
        <div class="item1__content">Quản lý dịch vụ</div>
      </div>
      <div class="item1" tabindex="2" @click="$emit('navigate', 'User')">
        <div class="item1__content">Quản lý người dùng</div>
      </div>
      <div class="item1" tabindex="3" @click="$emit('navigate', 'Material')">
        <div class="item1__content">Vật tư - vật liệu</div>
      </div>
      <div class="item1" tabindex="4" @click="$emit('navigate', 'Revenue')">
        <div class="item1__content">Doanh thu</div>
      </div>
      <div class="item1" tabindex="5">
        <div class="item1__content">Lịch hẹn</div>
      </div>
      <div class="item1" tabindex="6" @click="$emit('navigate', 'Appointment')">
        <div class="item1__content">Hồ sơ bệnh án</div>
      </div>
      <div class="item1" tabindex="7" @click="$emit('navigate', 'Medicine')">
        <div class="item1__content">Thuốc</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "TheSidebar",
};
</script>

<style scoped></style>
