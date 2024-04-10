<template>
  <div>
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
export default {
  name: "Footer",
};
</script>

<style scoped>
.site-footer {
  background-color: #f8f9fa;
  padding: 20px 0;
  font-family: Arial, sans-serif;
}

.footer-container {
  display: flex;
  justify-content: space-around;
  max-width: 1200px;
  margin: auto;
  margin-left: 14%;
}

.footer-block {
  width: 20%;
}

.footer-logo {
  width: 100px;
  margin-bottom: 10px;
}

.footer-list {
  list-style: none;
  padding: 0;
}

.footer-list li {
  padding: 5px 0;
}

footer address {
  font-style: normal;
  line-height: 1.6;
}
.pic {
  width: 100%;
  height: 30%;
  background-image: url("../../imgs/logoSaleNoti.png");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
@media (max-width: 1500px) {
  .footer-container {
    margin-left: 4%;
    font-size: 1.5rem;
  }
  .pic {
    width: 115%;
  }
}
</style>
