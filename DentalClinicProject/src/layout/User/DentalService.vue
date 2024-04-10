<template>
  <div>
    <div class="dentalHeader">
      <div class="headerDental">
        <h1><strong>DỊCH VỤ NHA KHOA</strong></h1>
      </div>
      <div class="headerDental1">
        <h4>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chúng tôi cung cấp dịch vụ hàng
          đầu với triết lý “Giải pháp tối ưu, sự can thiệp tối thiểu"
        </h4>
      </div>
    </div>
    <div class="dentalservice-row1">
      <div class="service-card" @click="goService(1)">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Cấy ghép Implant</strong></h3>
        <p>
          Giải pháp phục hồi chức năng thẩm mỹ và ăn nhai tối ưu chức năng cho
          người bị mất răng
        </p>
      </div>
      <div class="service-card" @click="goService(6)">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Chỉnh nha mắc cài</strong></h3>
        <p>Nắn chỉnh răng là phương pháp hiệu quả cho một hàm răng khỏe mạnh</p>
      </div>
      <div class="service-card" @click="goService(7)">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Nha khoa trẻ em</strong></h3>
        <p>
          Mang đến cho trẻ em một hàm răng khỏe mạnh để nụ cười luôn rạng rỡ
        </p>
      </div>
    </div>
    <div class="dentalservice-row1">
      <div class="service-card" @click="goService(17)">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Phẫu thuật chỉnh hình xương hàm</strong></h3>
        <p>
          Giải quyết cả vấn đề chức năng và thẩm mỹ cho bệnh nhân, nâng cao chất
          lượng cuộc sống
        </p>
      </div>
      <div class="service-card" @click="goService(16)">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Nha khoa thẩm mỹ</strong></h3>
        <p>
          Mang đến cho bạn những nụ cười bạn mà luôn luôn mơ ước và tặng bạn sự
          tự tin bạn mong muốn
        </p>
      </div>
      <div class="service-card" @click="goService(3)">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Nhổ răng khôn</strong></h3>
        <p>
          Tiểu phẫu an toàn,nhẹ nhàng với hệ thống máy móc hiện đại và đội ngũ
          bác sĩ tay nghề cao
        </p>
      </div>
    </div>
    <!-- <button type="button" class="btn btn-primary">
      <strong>View All &nbsp;&nbsp;&nbsp;</strong>>
    </button> -->
    <div class="parallax">
      <div class="stats-container">
        <div class="stat-item">
          <span class="stat-icon">📈</span>
          <h3 class="stat-number">14+</h3>
          <p class="stat-description">
            Sự hình thành và phát triển thương hiệu
          </p>
        </div>
        <div class="stat-item">
          <span class="stat-icon">👥</span>
          <h3 class="stat-number">20,560+</h3>
          <p class="stat-description">Khách hàng được điều trị</p>
        </div>
        <div class="stat-item">
          <span class="stat-icon">🏥</span>
          <h3 class="stat-number">7,489,000+</h3>
          <p class="stat-description">
            Quá trình điều trị phẫu thuật được thực hiện bởi đội ngũ nha khoa
          </p>
        </div>
        <div class="stat-item">
          <span class="stat-icon">💡</span>
          <h3 class="stat-number">3327+</h3>
          <p class="stat-description">
            Quá trình điều trị phẫu thuật được thực hiện bởi đội ngũ nha khoa
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "DentalService",
  methods: {
    goService(id) {
      localStorage.setItem("ServiceId", id);
      this.$router.push({ name: "Service" });
    },
  },
};
</script>

<style scoped>
.h3 {
  color: rgb(74, 85, 110);
}
.headerDental {
  color: rgb(224, 196, 140);
  margin-top: 10%;
  margin-left: 45%;
  justify-content: center;
  align-content: center;
}
.headerDental1 {
  margin-left: 31%;
  justify-content: center;
  align-content: center;
  margin-bottom: 10%;
  margin-top: 2%;
}
.dentalHeader {
  margin-left: 5%;
  justify-content: center;
  align-content: center;
}
.dentalservice-row1 {
  display: flex;
  margin-top: 5%;
}
.service-card {
  text-align: center;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 20px;
  background: #ffffff;
  position: relative;
  max-width: 400px;
  margin: auto;
}

.icon-container {
  background-color: rgb(224, 196, 140);
  border-radius: 50%;
  width: 70px;
  height: 70px;
  padding: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin: 0 auto 20px;
  position: absolute;
  top: -30px;
  left: 0;
  right: 0;
}

.service-card h3 {
  margin-top: 40px;
  margin-bottom: 10px;
}

.service-card p {
  color: #666;
  font-size: 14px;
  margin-bottom: 0;
}
.btn-primary {
  margin-left: 35%;
}
@media (max-width: 1500px) {
  .headerDental1 {
    margin-left: 22%;
    justify-content: center;
    align-content: center;
    margin-bottom: 10%;
  }
  .service-card {
    max-width: 300px;
  }
  .btn-primary {
    margin-left: 35%;
  }
  .headerDental {
    margin-left: 40%;
  }
}
.btn-primary {
  margin-top: 2%;
  font-size: 1.5rem;
  width: 30%;
  height: 8vh;
  background-color: #fff;
  color: rgb(224, 196, 140);
  border-radius: 6px;
  border: 0.5px solid rgb(201, 201, 201);
  margin-bottom: 2%;
}
.btn-primary:hover,
.btn-primary:focus {
  transition: background-color 0.5s ease, color 0.5s ease;
  background-color: #e3e3e3;
  border: 1px solid rgb(224, 196, 140);
  color: rgb(74, 85, 110);
}

.service-card:focus,
.service-card:hover {
  background-color: #e3e3e3;
  /* color: rgb(224, 196, 140); */
  cursor: pointer;
  transition: background-color 0.5s ease, color 0.5s ease;
}
.stats-container {
  height: 60vh;
  background-image: url("../../imgs/nhakhoavietsing3.jpg");
  background-size: cover;
  background-attachment: fixed;
  background-repeat: no-repeat;
  background-position: center;
}
.stats-container {
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.stat-item {
  height: 40%;
  text-align: center;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 20px;
  background: #ffffff;
  position: relative;
  max-width: 300px;
  margin: 20px;
  text-align: center;
  flex-basis: 25%;
}

.stat-icon {
  display: block;
  margin: 0 auto 10px;
  font-size: 24px;
}

.stat-number {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 5px;
}

.stat-description {
  font-size: 16px;
  color: #666;
}

/* Add responsive design as needed */
@media (max-width: 1500px) {
  .stats-container {
    /* flex-direction: column;  */
  }
  .stat-item {
    height: 65%;
    margin-bottom: 20px;
  }
}
</style>
