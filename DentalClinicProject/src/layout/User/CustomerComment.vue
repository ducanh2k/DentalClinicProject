<template>
  <div class="container">
    <div class="dentalHeader">
      <div class="certi-header">
        <h2><strong>Các bình luận của khách hàng</strong></h2>
      </div>
      <div class="certi-description">
        <h4>Hãy cùng nghe ý kiến của các khách hàng quen thuộc</h4>
      </div>
    </div>
    <div class="container-picture">
      <div class="picture pic1"></div>
      <div class="picture pic2"></div>
      <div class="picture pic3"></div>
      <div class="picture pic4"></div>
    </div>
    <button type="button" class="btn btn-primary" @click="seeAll()">
      <strong>Xem tất cả</strong>&nbsp; 
    </button>
  </div>
</template>

<script>
import "https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js";
import "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js";
export default {
  name: "CustomerComment",
  methods: {
    seeAll() {
      this.$router.push({ name: "CommentHP" });
    },
  },
};
</script>

<style scoped>
.container {
  width: 100%;
  background-color: rgb(237, 237, 240);
}
.certi-header {
  color: rgb(216, 172, 83);
  margin-top: 2%;
  justify-content: center;
  align-content: center;
  text-align: center;
}
.certi-description {
  justify-content: center;
  text-align: center;
  align-content: center;
  margin-bottom: 10%;
  margin-top: 2%;
}
.container-picture {
  margin-top: -10%;
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
  background-image: url("../../imgs/MrA.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic2 {
  background-image: url("../../imgs/MrB.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic3 {
  background-image: url("../../imgs/MrC.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic4 {
  background-image: url("../../imgs/MrD.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.btn-primary {
  padding-left: 1%;
  font-size: 1.5rem;
  width: 6%;
  height: 4vh;
  background-color: rgb(237, 237, 240);
  color: rgb(212, 162, 62);
  border-radius: 10px;
  border: 0.5px solid rgb(201, 201, 201);
  margin-bottom: 2%;
  margin-left: 46%;
}
.btn-primary:hover,
.btn-primary:focus {
  transition: background-color 0.5s ease, color 0.5s ease;
  background-color: #e3e3e3;
  border: 1px solid rgb(224, 196, 140);
  color: rgb(74, 85, 110);
}
@media (max-width: 1500px) {
  .picture {
    border-radius: 12px;
    margin: 0 13px;
    width: 22.3%;
    height: 65%;
  }
  .btn-primary {
    margin-left: 47%;
    height: 7vh;
    width: 8%;
  }
}
</style>
