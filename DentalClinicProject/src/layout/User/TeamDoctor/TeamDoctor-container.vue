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
          <a class="navbar-brand" href="#">WebSiteName</a>
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                About Us
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li>
                  <a class="dropdown-item" href="#">Something else here</a>
                </li>
              </ul>
            </li>

            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdownMenuLink"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Service
              </a>
              <ul
                class="dropdown-menu"
                aria-labelledby="navbarDropdownMenuLink"
              >
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <a class="dropdown-item" href="#">Something else here</a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Price</a>
            </li>

            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#"
                >Customer</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">News</a>
            </li>
          </ul>
          <form class="d-flex">
            <button class="btn btn-outline-success" type="submit">
              Contact
            </button>
          </form>
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
            <div class="carousel-item">
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
                <p class="inner-list">Phó Giám đốc Bệnh viện Việt Nam – Cu Ba Hà Nội</p>
                <p class="inner-list">Cố vấn chuyên môn hãng Implant nha khoa Dentium, Hàn Quốc</p>
                <p class="inner-list">Thành viên Hội phẫu thuật răng miệng Nhật Bản</p>
                <p class="inner-list">Thành viên Hội nha khoa Hoa Kỳ (ADA)</p>
                <p class="inner-list">Thành viên Hiệp hội Implant quốc tế (ITI)</p>
                <p class="inner-list">Thành viên Hội phẫu thuật hàm mặt thế giới của Tổ chức AO (AO CMF)</p>
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
          <h4><strong>Information</strong></h4>

          <!-- <img src="path-to-logo.png" alt="iMed Logo" class="footer-logo" /> -->
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
          <h4><strong>Information</strong></h4>
          <ul class="footer-list">
            <li>Owner Information</li>
            <li>General trading conditions</li>
            <li>Payments</li>
            <li>Protecty personal Information</li>
          </ul>
        </div>
        <div class="footer-block" style="margin-left: 7%">
          <h4><strong>Services</strong></h4>
          <ul class="footer-list">
            <li>Implant</li>
            <li>Invisalign orthodontics without braces</li>
            <li>Traditional braces orthodontics</li>
            <li>Orthopedic porcelain teeth</li>
            <li>Cosmetic porcelain teeth</li>
            <li>Wisdom tooth extraction</li>
            <li>Children's Dentistry</li>
            <li>General Dentistry</li>
            <li>Removal dentures</li>
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
export default {
  name: "TeamDocContainer",
  data() {
    return {
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
        // ... more employees
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
  font-size: 1.5rem;
  display: flex;
  justify-content: center;
  align-items: center;
}
li {
  display: flex;
  justify-content: center;
  align-items: center;
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
@media (max-width: 1300px) {
  li {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .nav-item {
    width: 100px;
    height: 50px;
  }
}
</style>
