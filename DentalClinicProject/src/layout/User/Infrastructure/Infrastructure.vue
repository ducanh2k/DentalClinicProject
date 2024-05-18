<template>
  <div style="width: 100%; height: 100%">
    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarTogglerDemo01"
          aria-controls="navbarTogglerDemo01"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
          <a class="navbar-brand" @click="backHome()"></a>
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Về chúng tôi
              </a>
              <ul class="dropdown-menu">
                <li class="li-service">
                  <a class="a-service" @click="Overview()"
                    >Tổng quan phòng khám</a
                  >
                </li>
                <li class="li-service">
                  <a class="a-service" href="#">Cơ sở vật chất hiện đại</a>
                </li>
                <li class="li-service">
                  <a class="a-service" @click="teamDoctor()">Đội ngũ bác sĩ</a>
                </li>
              </ul>
            </li>

            <li class="nav-item">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdownMenuLink"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Dịch vụ
              </a>
              <ul class="dropdown-menu dropdown-service">
                <li
                  class="li-service"
                  v-for="service in filteredServices"
                  :key="service.serviceId"
                >
                  <a class="a-service" @click="goService(service.serviceId)">{{
                    service.serviceName
                  }}</a>
                </li>
              </ul>
            </li>
            <li class="nav-item" @click="PriceList()">
              <a class="nav-link active" aria-current="page" href="#"
                >Bảng giá</a
              >
            </li>

            <li class="nav-item" @click="DentalKnowledge()">
              <a class="nav-link active" aria-current="page" href="#"
                >Tin tức</a
              >
            </li>
          </ul>
          <div v-if="role != null" class="log-out" @click="logOut()">
            Đăng xuất
          </div>
          <div v-if="role != null" class="profile" @click="checkProfile()">
            Thông tin cá nhân
          </div>
          <div v-if="role === null" class="log-out" @click="logIn()">
            Đăng nhập
          </div>
        </div>
      </div>
    </nav>
    <div class="container-overview1">
      <div class="pic-overview1"></div>
      <div class="header-overview1">Cơ sở vật chất hiện đại</div>
      <div class="location-section">
        <h2>VỊ TRÍ THUẬN LỢI – TRUNG TÂM THÀNH PHỐ HÀ NỘI</h2>
        <p>
          Toạ lạc tại tòa nhà 125 Hoàng Ngân có vị trí thuận tiện, có chỗ đỗ ô
          tô. Nha khoa iMed sở hữu một vị trí giao thông thuận tiện, chỗ đỗ xe
          rộng rãi.
        </p>
      </div>
      <div class="gallery-container">
        <div class="gallery-header">KHÔNG GIAN PHÒNG KHÁM</div>
        <p class="gallery-description">
          Nha khoa chúng tôi gây ấn tượng bởi thiết kế trang nhã mang đậm phong cách
          Nhật Bản và châu Âu cùng phòng chờ tiện nghi sang trọng.
        </p>
        <div class="row">
          <!-- Replace # with your image paths -->
          <div class="gallery-image" style="background-image: url('')"></div>
          <div class="gallery-image" style="background-image: url('#')"></div>
          <div class="gallery-image" style="background-image: url('#')"></div>
          <div class="gallery-image" style="background-image: url('#')"></div>
        </div>
        <div class="row">
          <div class="gallery-image" style="background-image: url('#')"></div>
          <div class="gallery-image" style="background-image: url('#')"></div>
          <div class="gallery-image" style="background-image: url('#')"></div>
          <div class="gallery-image" style="background-image: url('#')"></div>
        </div>
      </div>
      <div class="location-section">
        <h2>TRANG THIẾT BỊ HIỆN ĐẠI</h2>
        <p>
          Toàn bộ ghế răng, hệ thống máy phẫu thuật, máy cấy implant và các vật
          liệu sử dụng đều xuất xứ từ những hãng uy tín nhất của Nhật Bản và Hoa
          Kỳ như YOSHIDA, NSK, 3M…
        </p>
      </div>
      <div class="row">
        <div class="gallery-image" style="background-image: url('#')"></div>
        <div class="gallery-image" style="background-image: url('#')"></div>
        <div class="gallery-image" style="background-image: url('#')"></div>
      </div>
      <div class="location-section">
        <h2>TIÊN PHONG CÔNG NGHỆ HÀNG ĐẦU TRONG NHA KHOA</h2>
      </div>
      <div class="row">
        <div class="gallery-image" style="background-image: url('#')"></div>
        <!-- <p>Hệ thống chụp X-Quang cắt lớp 3 chiều</p> -->
        <div class="gallery-image" style="background-image: url('#')"></div>
        <!-- <p>Máy scan 3D iTERO Element 2 và 3Shape TRIOS</p> -->
      </div>
    </div>
    <div class="container-contact-main">
      <div class="dentalHeader">
        <div class="certi-header">
          <h2><strong>LIÊN HỆ VỚI CHÚNG TÔI</strong></h2>
        </div>
      </div>
      <div class="container-picture">
        <div class="picture pic1">
          <div class="contact-title" style="font-size: 1rem">
            <i class="fa-solid fa-phonea-volume"></i> <strong>HotLine</strong>
          </div>
          <br />
          <div class="contact-content">
            Tư vấn nha khoa +84 972 435 008 Lịch làm việc: 09:00 - 20:00 các
            ngày thứ 3 - thứ 5; 14:00 - 20:00 thứ 2, thứ 6; 08:00 - 17:00 thứ 7.
            Nghỉ chủ nhật và các ngày lễ tết. Vui lòng đặt lịch hẹn trước khi
            đến.
          </div>
        </div>
        <div class="picture pic2">
          <div class="contact-title" style="font-size: 1rem">
            <i class="fa-brands fa-facebook"></i><strong> Facebook</strong>
          </div>
          <br />
          <div class="contact-content">
            Luôn trả lời các thông tin nhanh nhất thông qua các phản hồi trên
            Facebook.
          </div>
        </div>
        <div class="picture pic3">
          <div class="contact-title" style="font-size: 1rem">
            <i class="fa-solid fa-book"></i>
            <strong> Hiểu biết về nha khoa </strong>
          </div>
          <br />
          <div class="contact-content">
            Luôn cập nhật những kiến thức cơ bản cần nhớ để có hàm răng khoẻ và
            đẹp
          </div>
        </div>
        <div class="picture pic4">
          <div class="contact-title" style="font-size: 1rem">
            <i class="fa-solid fa-comment-dots"></i
            ><strong> Chat trên web và điện thoại</strong>
          </div>
          <br />
          <div class="contact-content">
            Luôn có người trực chat để trả lời câu hỏi của các bạn nhanh và hiệu
            quả nhất suốt 365 ngày/năm.
          </div>
        </div>
      </div>
    </div>
    <footer class="site-footer">
      <div class="footer-container">
        <div class="footer-block">
          <h4><strong>Thông tin</strong></h4>

          <p>
            Nha khoa chú trọng xây dựng dịch vụ tận tình, chu đáo, thân thiện
            mẫu mã, mang đến cho khách hàng cảm giác an tâm, thoải mái như thể
            họ đã ở trong nhà riêng của họ. Mục tiêu của chúng tôi là trở thành
            một công ty có chất lượng hàng đầu Giấy phép hoạt động nha khoa tại
            Việt Nam số 196/HNO/GPHD do Số chứng chỉ hành nghề của Sở Y tế Hà
            Nội 000119/HNO-CCHN do Sở Y tế Hà Nội cấp
          </p>
          <div class="pic"></div>
        </div>

        <div class="footer-block" style="margin-left: 7%">
          <h4><strong>Thông tin</strong></h4>
          <ul class="footer-list">
            <li class="list-inner">Thông tin của chủ sở hữu</li>
            <li class="list-inner">Điều kiện giao dịch chung</li>
            <li class="list-inner">Các phương thức thanh toán</li>
            <li class="list-inner">Bảo vệ thông tin cá nhân</li>
          </ul>
        </div>
        <div class="footer-block" style="margin-left: 7%">
          <h4 class="service-footer"><strong>Dịch vụ</strong></h4>
          <ul class="footer-list">
            <li class="list-inner1">Cấy ghép Implant</li>
            <li class="list-inner1">Chỉnh nha không mắc cài Invisalign</li>
            <li class="list-inner1">Nhổ răng khôn</li>
            <li class="list-inner1">Chỉnh nha mắc cài truyền thống</li>
            <li class="list-inner1">Nha khoa trẻ em</li>
            <li class="list-inner1">Nha khoa tổng quát</li>
            <li class="list-inner1">Nha khoa thẩm mĩ</li>
            <li class="list-inner1">Phẫu thuật chỉnh hình xương hàm</li>
            <li class="list-inner1">Răng giả tháo lắp</li>
          </ul>
        </div>
        <div class="footer-block" style="margin-left: 7%">
          <h4><strong>Contact</strong></h4>
          <address>
            <i class="fa-solid fa-map-location-dot"></i>&nbsp; Tầng 3, 125 Tòa
            nhà Hoàng Ngân, Cầu Giấy, Hà Nội<br />
            <i class="fa-solid fa-phone"></i>&nbsp; 972 435 008<br />
            <i class="fa-regular fa-envelope"></i>&nbsp;
            imednhakhoa@gmail.com<br />
            <i class="fa-solid fa-calendar-days"></i>&nbsp; 9 giờ sáng - 8 giờ
            tối Thứ Hai đến Thứ Sáu, 8 giờ sáng - 5 giờ chiều Thứ Bảy
          </address>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
import "../../../css/User/contactUs.css";
import "../../../css/User/footerMain.css";
import "../../../css/User/infrastructure.css";
import axios from "axios";
import PriceList from "../Service/PriceList.vue";
import DentalKnowledge from "../News/DentalKnowledge.vue";
export default {
  name: "Infrastructure",
  data() {
    return {
      role: "",
      action: "",
      services: [],
      staffs: [],
      countStaff: 0,
      countDoctor: 0,
      countMaterial: 0,
      countService: 0,
    };
  },
  methods: {
    showDetails(employeeId) {
      this.selectedEmployee = this.employeeList.find(
        (employee) => employee.id === employeeId
      );
    },
    async fetchStaff() {
      let apiURL = "https://localhost:7034/api/User/staff/list";
      axios
        .get(apiURL)
        .then((response) => {
          this.staffs = response.data;
          this.countStaff = this.staffs.length;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    async fetchDoctor() {
      let apiURL = "https://localhost:7034/api/User/doctor/list";
      axios
        .get(apiURL)
        .then((response) => {
          this.countDoctor = response.data.length;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    async fetchMaterial() {
      let apiURL = "https://localhost:7034/api/Material/listall";
      axios
        .get(apiURL)
        .then((response) => {
          this.countMaterial = response.data.length;
          console.log(this.countMaterial);
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    async fetchServices() {
      let apiURL = "https://localhost:7034/api/Service/listall";
      axios
        .get(apiURL)
        .then((response) => {
          this.services = response.data;
          this.countService = this.services.length;
          console.log(this.countService);
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    CheckRole() {
      this.role = localStorage.getItem("userRole");
    },
    logIn() {
      this.role = null;
      localStorage.removeItem("userRole");
      this.$emit("log-in");
    },
    logOut() {
      this.action = "log-out";
      localStorage.removeItem("userRole");
      this.role = null;
      this.$emit("log-out", this.action);
      this.$router.push({ name: "Login" });
    },
    teamDoctor() {
      this.$router.push({ name: "TeamDoctor" });
    },
    PriceList() {
      this.$router.push({ name: "PriceList" });
    },
    Overview() {
      this.$router.push({ name: "Overview" });
    },
    DentalKnowledge() {
      this.$router.push({ name: "DentalKnowledge" });
    },
    checkProfile() {
      this.$router.push({ name: "Profile" });
    },
    backHome() {
      this.$router.push({ name: "Home" });
    },
    goService(id) {
      localStorage.setItem("ServiceId", id);
      this.$router.push({ name: "Service" });
    },
  },
  computed: {
    filteredServices() {
      return this.services.filter((service) => service.briefInfo === "title");
    },
  },
  mounted: function () {
    this.fetchServices();
    this.CheckRole();
    this.fetchStaff();
    this.fetchDoctor();
    this.fetchMaterial();
  },
};
</script>

<style scoped>
.navbar-expand-lg {
  background-color: rgb(204, 204, 204);
  color: rgb(74, 85, 110);
  background-color: #fff;
  position: fixed;
  margin: 0;
  width: 100%;
  height: 9%;
  z-index: 1000;
  border: 1px solid #ddd;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5);
}
a {
  text-decoration: none;
  font-size: 1rem;
}
.navbar-brand {
  width: 10%;
  height: 50px;
  background-image: url("../../../imgs/logoDental.png");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  cursor: pointer;
  font-size: 1.3rem;
  display: flex;
  justify-content: center;
  align-items: center;
}
li {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 76px;
  width: 160px;
}
li:hover,
li:focus {
  background-color: #e7e7e7;
  transition: background-color 0.5s ease, color 0.5s ease;
}
.btn {
  display: flex;
  justify-content: center;
  align-items: center;
  color: rgb(224, 196, 140);
  border: 1px solid rgb(196, 196, 196);
  width: 150px;
  height: 40px;
}
.btn:hover,
.btn:focus {
  color: #fff;
  background-color: rgb(224, 196, 140);
  border: 1px solid rgb(196, 196, 196);
}
.btn:active {
  color: #fff !important;
  background-color: rgb(224, 196, 140) !important;
  border: 1px solid rgb(196, 196, 196) !important;
  border: none !important;
}
.nav-item {
  width: 150px;
  height: 70px;
}
.container-contact-main {
  width: 100%;
  background-color: rgb(216, 172, 83);
  box-sizing: border-box;
}
.dropdown-menu {
  padding: 20px;
  margin-top: auto;
  margin-left: 130px !important;
  width: 240px !important;
}
.dropdown-service {
  padding: 20px;
  margin-top: auto;
  margin-left: 200px !important;
  width: 300px !important;
}
li .li-service {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100% !important;
}
.a-service:hover,
.a-service:active {
  cursor: pointer;
  background-color: #ddd;
  background-color: none;
  transition: background-color 0.5s ease, color 0.5s ease;
}
.btn-outline-success {
  margin-right: 220px;
}
.log-out {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(205, 230, 230);
  width: 100px;
  height: 35px;
  cursor: pointer;
  margin-right: 10px;
  position: absolute;
  right: 0;
}
.profile {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(205, 230, 230);
  width: 140px;
  height: 35px;
  cursor: pointer;
  margin-right: 10px;
  position: absolute;
  right: 116px;
}
.a-service {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  color: black;
  padding: 4%;
  width: 100% !important;
  background-color: none !important;
}
.nav-item-service {
  margin-left: 500px;
}
@media (max-width: 1300px) {
  .dropdown-menu {
    margin-top: auto;
    margin-left: 133px;
    width: 15%;
  }
  li {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 53px;
    width: 100px;
  }
  .nav-item {
    width: 130px;
    height: 50px;
  }
  .dropdown-service {
    margin-left: 233px;
    width: 15%;
  }
  li .li-service {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 188px;
  }
}
</style>
