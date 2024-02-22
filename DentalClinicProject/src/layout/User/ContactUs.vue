<template>
  <div class="container">
    <div class="dentalHeader">
      <div class="certi-header">
        <h2><strong>CONTACT US</strong></h2>
      </div>
    </div>
    <div class="container-picture">
      <div class="picture pic1">
        <div class="contact-title" style="font-size: 2rem">
          <i class="fa-solid fa-phone-volume"></i> <strong>HotLine</strong>
        </div>
        <br />
        <div class="contact-content">
          Dental consultation +84 972 435 008 Working schedule: 09:00 - 20:00 on
          Tuesdays - Thursdays; 14:00 - 20:00 Monday, Friday; 08:00 - 17:00
          Saturday. Closed on Sunday and public holidays. Please make an
          appointment before coming
        </div>
      </div>
      <div class="picture pic2">
        <div class="contact-title" style="font-size: 2rem">
          <i class="fa-brands fa-facebook"></i><strong> Facebook</strong>
        </div>
        <br />
        <div class="contact-content">
          Always respond to the fastest information through Facebook responses.
        </div>
      </div>
      <div class="picture pic3">
        <div class="contact-title" style="font-size: 2rem">
          <i class="fa-solid fa-book"></i> <strong> Dental Knowledge</strong>
        </div>
        <br />
        <div class="contact-content">
          Always update the basic knowledge to remember to have healthy and
          beautiful teeth
        </div>
      </div>
      <div class="picture pic4">
        <div class="contact-title" style="font-size: 2rem">
          <i class="fa-solid fa-comment-dots"></i
          ><strong> Chat in web & mobile</strong>
        </div>
        <br />
        <div class="contact-content">
          There is always someone on chat to answer your questions quickly and
          effectively 365 days a year.
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
