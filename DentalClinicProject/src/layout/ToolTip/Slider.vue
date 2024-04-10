<template>
  <div>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link
          rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
        />
      </head>
      <body>
        <div class="container">
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <!-- <ol class="carousel-indicators">
              <li
                data-target="#myCarousel"
                data-slide-to="0"
                class="active"
              ></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol> -->

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
              <div class="item active">
                <img
                  src="../../imgs/Dental-clinic.jpg"
                  alt="Los Angeles"
                  style="width: 100%"
                />
                <div class="carousel-caption">
                  <h3>Dental-clinic</h3>
                  <p>Picture demo</p>
                </div>
              </div>

              <div class="item">
                <img
                  src="../../imgs/clicnic4.png"
                  alt="Chicago"
                  style="width: 100%"
                />
                <div class="carousel-caption">
                  <h3>Dental-clinic</h3>
                  <p>Picture demo</p>
                </div>
              </div>

              <div class="item">
                <img
                  src="../../imgs/clinic3.webp"
                  alt="New York"
                  style="width: 100%"
                />
                <div class="carousel-caption">
                  <h3>Dental-clinic</h3>
                  <p>Picture demo</p>
                </div>
              </div>
            </div>

            <a
              class="left carousel-control"
              href="#myCarousel"
              data-slide="prev"
            >
              <span class="glyphicon glyphicon-chevron-left"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a
              class="right carousel-control"
              href="#myCarousel"
              data-slide="next"
            >
              <span class="glyphicon glyphicon-chevron-right"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          <div class="about-us-container">
            <div class="about-us-content">
              <h3><strong>ABOUT US</strong></h3>
              <p style="font-size: 16px">
                Ra đời từ giữa năm 2009, có thể nói Nha khoa của chúng tôi là
                một trong số ít phòng khám nha khoa tại Hà Nội có đội ngũ bác sĩ
                thông thạo tiếng Anh và tiếng Nhật (được đào tạo tại Đức và Nhật
                Bản). Được trang bị máy móc hiện đại và áp dụng các kỹ thuật nha
                khoa chất lượng cao trong các dịch vụ nha khoa tổng quát, nha
                khoa thẩm mỹ, nha khoa trẻ em, chỉnh nha bằng mắc cài và
                Invisalign, cấy ghép implant…
              </p>
              <br />
              <p style="font-size: 16px">
                Năm 2019, phòng khám chúng tôi là nhà cung cấp Bạch Kim và nằm
                trong top nhà cung cấp dịch vụ chỉnh nha không mắc cài
                INVISALIGN tốt nhất tại Việt Nam. Nguyên tắc hành nghề của iMed
                Dental là coi bệnh nhân như người nhà.
              </p>
              <br />
              <p style="font-size: 16px">
                “Giải pháp tối ưu, can thiệp tối thiểu” – cũng là khẩu hiệu và
                mục tiêu mà iMed Dental đã và đang theo đuổi trong suốt quá
                trình hoạt động của mình.
              </p>
              <div class="btnlearn"></div>
              <button type="button" class="btn btn-primary">
                <strong>Tìm hiểu về chúng tôi</strong>
              </button>
            </div>
            <div class="about-us-picture"></div>
          </div>
        </div>
      </body>
    </html>
  </div>
</template>

<script>
import "https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js";
import "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js";
export default {
  name: "slider",
};
</script>
<style scoped>
.container {
  width: 100%;
  height: 100%;
}
.carousel-inner {
  width: 100%;
}
.item {
  width: 100%;
  height: 100%;
}
.about-us-container {
  margin-top: 10vh;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 40vh;
  display: flex;
}
.about-us-content {
  /* background-color: black; */
  height: fit-content;
  margin-right: 2%;
  font-size: 10px;
  font-family: sans-serif;
  width: 35%;
  height: 100%;
  transition: width 0.3s ease;
}
.about-us-picture {
  width: 25%;
  transition: width 0.3s ease;
  /* background-color: rgb(224, 196, 140); */
  background-image: url("../../imgs/about-us.jpg");
  background-size: cover;
  /* background-attachment: fixed; */
  background-repeat: no-repeat;
  background-position: center;
  height: 100%;
}
h3 {
  color: rgb(224, 196, 140);
  font-size: 30px;
}
@media (max-width: 1500px) {
  .about-us-content {
    /* background-color: black; */
    height: 100%;
    width: 100%;
  }
  .about-us-picture {
    margin-top: 50px;
    height: 80%;
    width: 100%;
  }
  .about-us-container {
    height: 70vh;
  }
}

.btn-primary {
  background-color: #fff;
  color: rgb(224, 196, 140);
  border-radius: 6px;
  border: 0.5px solid rgb(201, 201, 201);
}

.btn-primary:hover,
.btn-primary:focus {
  transition: background-color 0.5s ease, color 0.5s ease;
  background-color: #e3e3e3;
  border: 1px solid rgb(224, 196, 140);
  color: rgb(74, 85, 110);
}

.item {
  background-color: black;
  height: 70vh;
}
/* img{
  height: 200px;
} */
</style>
