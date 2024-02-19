<template>
  <div class="container">
    <div class="dentalHeader">
      <div class="certi-header">
        <h2><strong>CERTIFICATE</strong></h2>
      </div>
      <div class="certi-description">
        <h4>
          Dental’s team of doctors is regularly updated with professional
          knowledge and trained through courses training, conferences, domestic
          and international technology transfer
        </h4>
      </div>
    </div>
    <div class="certi-picture">
      <div class="certi pic1"></div>
      <div class="certi pic2"></div>
      <div class="certi pic3"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Certificate",
};
</script>

<style scoped>
.container {
  width: 100%;
  height: 50vh;
}
.certi-header {
  color: rgb(216, 172, 83);
  margin-top: 10%;
  margin-left: 42%;
  justify-content: center;
  align-content: center;
}
.certi-description {
  justify-content: center;
  text-align: center;
  align-content: center;
  margin-bottom: 10%;
  margin-top: 2%;
}
.certi-picture {
  width: 100%;
  height: 60%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.certi {
  margin: 0 10px;
  width: 60%;
  height: 36vh;
  margin-bottom: 10%;
}
.pic1 {
  width: 24%;
  border-radius: 10px;
  background-image: url("../../imgs/Certi-05.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic2 {
  width: 24%;
  border-radius: 10px;
  background-image: url("../../imgs/seminar-taiwan-2018.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic3 {
  width: 24%;
  border-radius: 10px;
  background-image: url("../../imgs/invi-thailand-2018.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
</style>
