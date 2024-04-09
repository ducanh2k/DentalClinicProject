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
          <a class="navbar-brand" @click="backHome()">WebSiteName</a>
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

            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#"
                >Khách hàng</a
              >
            </li>
            <li class="nav-item">
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
    <div class="container-docTeam">
      <div class="pic-doc"></div>
      <div class="heade-doc"><strong>GẶP GỠ ĐỘI NGŨ BÁC SĨ</strong></div>
      <div class="listDoc">
        <div
          id="carouselExampleCaptions"
          class="carousel slide"
          data-bs-ride="carousel"
        >
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="caro-contain">
                <div class="d-block w-100" alt="..."></div>
                <div class="DoctorName">
                  <p>BS. Bùi Thị Bích Loan</p>
                </div>
              </div>
              <div class="caro-contain">
                <div class="d-block1 w-100" alt="..."></div>
                <div class="DoctorName">
                  <p>BS. Nguyễn Minh Thành</p>
                </div>
              </div>
              <div class="caro-contain">
                <div class="d-block2 w-100" alt="..."></div>
                <div class="DoctorName">
                  <p>BS. Nguyễn Thanh Tùng</p>
                </div>
              </div>
              <div class="caro-contain">
                <div class="d-block3 w-100" alt="..."></div>
                <div class="DoctorName">
                  <p>BS. Đinh Thị Dung</p>
                </div>
              </div>
            </div>
            <div
              class="carousel-item"
              v-for="(group, index) in groupedDoctors"
              :key="index"
            >
              <div
                class="caro-contain"
                v-for="(doctor) in group"
                :key="doctor.id"
              >
                <div class="d-block w-100" alt="..."></div>
                <div class="DoctorName">
                  <p>{{ doctor.name }}</p>
                </div>
              </div>
              <div class="caro-contain">
                <div class="d-block1 w-100" alt="`Doctor ${doctor.name}`"></div>

                <div class="DoctorName">
                  <p>{{ doctor.name }}</p>
                </div>
              </div>
              <div class="caro-contain">
                <div class="d-block2 w-100" alt="`Doctor ${doctor.name}`"></div>

                <div class="DoctorName">
                  <p>{{ doctor.name }}</p>
                </div>
              </div>
              <div class="caro-contain">
                <div class="d-block3 w-100" alt="`Doctor ${doctor.name}`"></div>

                <div class="DoctorName">
                  <p>{{ doctor.name }}</p>
                </div>
              </div>
            </div>
          </div>
          <button
            class="carousel-control-prev caroul-control"
            type="button"
            data-bs-target="#carouselExampleCaptions"
            data-bs-slide="prev"
          >
            <i class="fa-solid fa-arrow-left"></i>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next caroul-control"
            type="button"
            data-bs-target="#carouselExampleCaptions"
            data-bs-slide="next"
          >
            <i class="fa-solid fa-arrow-right"></i>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
      <div class="doc-detail">
        <div class="doc-picture"></div>
        <div class="doc-info">
          <div class="info-left">
            <div class="doc-certi">
              <h4>Bằng cấp:</h4>
              <div class="inner-content">
                <p class="inner-list">
                  Tốt nghiệp Tiến sĩ, chuyên ngành phẫu thuật miệng và hàm mặt,
                  khoa Y, Đại học Gifu, Nhật Bản
                </p>
                <p class="inner-list">
                  Tốt nghiệp Bác sĩ chuyên khoa Răng hàm mặt chính quy, Đại học
                  Y Hà Nội
                </p>
                <p class="inner-list">
                  Các khoá đào tạo chuyên ngành tại Hoa Kỳ, Nhật Bản, Hàn Quốc,
                  CHLB Đức, Singapore, Đài Loan, Thái Lan, Hy Lạp, Canada
                </p>
              </div>
            </div>
            <div class="doc-expertise">
              <h4>Lĩnh vực chuyên sâu:</h4>
              <div class="inner-content">
                <p class="inner-list">Cấy ghép Implant</p>
                <p class="inner-list">Phẫu thuật chỉnh hình xương hàm</p>
                <p class="inner-list">Nha khoa thẩm mỹ</p>
                <p class="inner-list">Phẫu thuật trong miệng</p>
                <p class="inner-list">Chỉnh nha</p>
              </div>
            </div>
          </div>
          <div class="info-right">
            <div class="doc-workingUnit">
              <h4>Đơn vị công tác và tổ chức tham gia:</h4>
              <div class="inner-content">
                <p class="inner-list">
                  Phó Giám đốc Bệnh viện Việt Nam – Cu Ba Hà Nội
                </p>
                <p class="inner-list">
                  Cố vấn chuyên môn hãng Implant nha khoa Dentium, Hàn Quốc
                </p>
                <p class="inner-list">
                  Thành viên Hội phẫu thuật răng miệng Nhật Bản
                </p>
                <p class="inner-list">Thành viên Hội nha khoa Hoa Kỳ (ADA)</p>
                <p class="inner-list">
                  Thành viên Hiệp hội Implant quốc tế (ITI)
                </p>
                <p class="inner-list">
                  Thành viên Hội phẫu thuật hàm mặt thế giới của Tổ chức AO (AO
                  CMF)
                </p>
              </div>
            </div>
            <div class="doc-certi">
              <h4>Ngoại ngữ:</h4>
              <div class="inner-content">
                <p class="inner-list">Tiếng Anh</p>
                <p class="inner-list">Tiếng Nhật</p>
              </div>
            </div>
          </div>
        </div>
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
            Dentistry focuses on building a dedicated, caring, friendly service
            model, giving customers a feeling of peace of mind and comfort as if
            they were in their own home. Our goal is to become a top quality
            dentist in Vietnam Operation License No. 196/HNO/GPHD issued by
            Hanoi Department of Health Practice certificate number
            000119/HNO-CCHN issued by Hanoi Department of Health
          </p>
          <div class="pic"></div>
        </div>

        <div class="footer-block" style="margin-left: 7%">
          <h4><strong>Thông tin</strong></h4>
          <ul class="footer-list">
            <li class="list-inner">Owner Information</li>
            <li class="list-inner">General trading conditions</li>
            <li class="list-inner">Payments</li>
            <li class="list-inner">Protecty personal Information</li>
          </ul>
        </div>
        <div class="footer-block" style="margin-left: 7%">
          <h4 class="service-footer"><strong>Dịch vụ</strong></h4>
          <ul class="footer-list">
            <li class="list-inner1">Implant</li>
            <li class="list-inner1">Invisalign orthodontics without braces</li>
            <li class="list-inner1">Traditional braces orthodontics</li>
            <li class="list-inner1">Orthopedic porcelain teeth</li>
            <li class="list-inner1">Cosmetic porcelain teeth</li>
            <li class="list-inner1">Wisdom tooth extraction</li>
            <li class="list-inner1">Children's Dentistry</li>
            <li class="list-inner1">General Dentistry</li>
            <li class="list-inner1">Removal dentures</li>
          </ul>
        </div>
        <div class="footer-block" style="margin-left: 7%">
          <h4><strong>Contact</strong></h4>
          <address>
            <i class="fa-solid fa-map-location-dot"></i>&nbsp; 3rd floor, 125
            Hoang Ngan building, Cau Giay, Hanoi<br />
            <i class="fa-solid fa-phone"></i>&nbsp; 972 435 008<br />
            <i class="fa-regular fa-envelope"></i>&nbsp;
            imednhakhoa@gmail.com<br />
            <i class="fa-solid fa-calendar-days"></i>&nbsp; 9am - 8pm Monday to
            Friday, 8am to 5pm Saturday
          </address>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
import "../../../css/User/contactUs.css";
import "../../../css/User/footerMain.css";
import "../../../css/User/teamDoc.css";
import axios from "axios";

export default {
  name: "TeamDocContainer",
  data() {
    return {
      role: "",
      action: "",
      services: [],
      doctors: [],
      employeeList: [
        {
          id: "nguyenkhanhlong",
          name: "TS.BS. Nguyễn Khánh Long",
          qualifications: "...",
          specialization: "...",
        },
        {
          id: "nguyenminhthanh",
          name: "BS. Nguyễn Minh Thanh",
          qualifications: "...",
          specialization: "...",
        },
      ],
      selectedEmployee: null,
    };
  },
  methods: {
    showDetails(employeeId) {
      this.selectedEmployee = this.employeeList.find(
        (employee) => employee.id === employeeId
      );
    },
    async fetchServices() {
      let apiURL = "https://localhost:7034/api/Service/listall";
      axios
        .get(apiURL)
        .then((response) => {
          this.services = response.data;
          console.log(this.services);
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    async fetchDoctors() {
      let apiURL = "https://localhost:7034/api/User/doctor/list";
      axios
        .get(apiURL)
        .then((response) => {
          this.doctors = response.data;
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
    Overview() {
      this.$router.push({ name: "Overview" });
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
    PriceList() {
      this.$router.push({ name: "PriceList" });
    },
  },
  computed: {
    filteredServices() {
      return this.services.filter((service) => service.briefInfo === "title");
    },
    groupedDoctors() {
      let groups = [];
      for (let i = 0; i < this.doctors.length; i += 4) {
        groups.push(this.doctors.slice(i, i + 4));
      }
      return groups;
    },
  },
  mounted: function () {
    this.fetchServices();
    this.fetchDoctors();
    this.CheckRole();
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
  margin-left: 200px;
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
