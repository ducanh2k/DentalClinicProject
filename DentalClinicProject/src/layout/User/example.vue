<template>
  <div>
    <div class="container-picture">
      <div class="picture pic1"></div>
      <div class="picture pic2"></div>
      <div class="picture pic3"></div>
      <div class="picture pic4"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Example",
};
</script>

<style scoped>
.container-picture {
  margin-top: -5%;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 400px;
}
.picture {
  border-radius: 12px;
  margin: 0 13px;
  width: 17.3%;
  height: 75%;
}
.pic1 {
  background-image: url("../../imgs/Rectangle-7654.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic2 {
  background-image: url("../../imgs/Rectangle-7655.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic3 {
  background-image: url("../../imgs/Rectangle-7656.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic4 {
  background-image: url("../../imgs/Rectangle-7657.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
</style>
