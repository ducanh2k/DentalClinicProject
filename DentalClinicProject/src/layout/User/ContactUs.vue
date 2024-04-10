<template>
  <div class="container">
    <div class="dentalHeader">
      <div class="certi-header">
        <h2><strong>LIÊN HỆ VỚI CHÚNG TÔI</strong></h2>
      </div>
    </div>
    <div class="container-picture">
      <div class="picture pic1">
        <div class="contact-title" style="font-size: 2rem">
          <i class="fa-solid fa-phone-volume"></i> <strong>HotLine</strong>
        </div>
        <br />
        <div class="contact-content">
          Tư vấn nha khoa +84 972 435 008 Lịch làm việc: 09:00 - 20:00 các ngày
          thứ 3 - thứ 5; 14:00 - 20:00 thứ 2, thứ 6; 08:00 - 17:00 thứ 7. Nghỉ
          chủ nhật và các ngày lễ tết. Vui lòng đặt lịch hẹn trước khi đến.
        </div>
      </div>
      <div class="picture pic2">
        <div class="contact-title" style="font-size: 2rem">
          <i class="fa-brands fa-facebook"></i><strong> Facebook</strong>
        </div>
        <br />
        <div class="contact-content">
          Luôn trả lời các thông tin nhanh nhất thông qua các phản hồi trên
          Facebook.
        </div>
      </div>
      <div class="picture pic3">
        <div class="contact-title" style="font-size: 2rem">
          <i class="fa-solid fa-book"></i>
          <strong> Hiểu biết về nha khoa</strong>
        </div>
        <br />
        <div class="contact-content">
          Luôn cập nhật những kiến thức cơ bản cần nhớ để có hàm răng khoẻ và
          đẹp
        </div>
      </div>
      <div class="picture pic4">
        <div class="contact-title" style="font-size: 2rem">
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
</template>

<script>
export default {
  name: "ContactUs",
};
</script>

<style scoped>
.container {
  width: 100%;
  background-color: rgb(216, 172, 83);
}
.certi-header {
  color: rgb(255, 255, 255);
  margin-top: 1%;
  justify-content: center;
  align-content: center;
  text-align: center;
}

.container-picture {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 400px;
  margin-top: -2%;
}
.picture {
  font-size: 1.6rem;
  border-radius: 12px;
  margin: 0 13px;
  width: 17.3%;
  height: 75%;
}
.pic1 {
  padding: 1%;
  background-color: rgb(255, 255, 255);
}
.pic2 {
  padding: 1%;

  background-color: rgb(255, 255, 255);
}
.pic3 {
  padding: 1%;

  background-color: rgb(255, 255, 255);
}
.pic4 {
  padding: 1%;

  background-color: rgb(255, 255, 255);
}

@media (max-width: 1500px) {
  .picture {
    border-radius: 12px;
    margin: 0 13px;
    width: 22.3%;
    height: 65%;
  }
}
</style>
