<template>
  <div class="container">
    <div class="dentalHeader">
      <div class="certi-header">
        <h2><strong>DENTAL KNOWLEDGE</strong></h2>
      </div>
      <div class="certi-description">
        <h4>Basic knowledge to remember to have healthy and beautiful teeth</h4>
      </div>
    </div>
    <div class="container-picture">
      <div class="magazine1">
        <div class="maga-container">
          <div class="picture pic1"></div>
          <div class="date">24/10/2022</div>
          <div class="content">
            <strong
              >Frequently asked questions (FAQs) about wisdom tooth
              extraction</strong
            >
          </div>
        </div>
        <div class="maga-container">
          <div class="picture pic2"></div>
          <div class="date1">24/10/2022</div>
          <div class="content1">
            <strong>Foods that help keep dental diseases away</strong>
          </div>
        </div>
      </div>
      <div class="magazine2">
        <div class="maga-container1">
          <div class="picture1 pic3"></div>
          <div class="content2">
            <strong>Treatment of white spots on teeth</strong>
          </div>
        </div>
        <div class="maga-container1">
          <div class="picture1 pic4"></div>
          <div class="content2">
            <strong
              >Smile design – cosmetic technology that brings a perfect
              smile</strong
            >
          </div>
        </div>
        <div class="maga-container1">
          <div class="picture1 pic5"></div>
          <div class="content2">
            <strong>Invisalign orthodontic cases at iMed Dental</strong>
          </div>
        </div>
      </div>
    </div>
    <button type="button" class="btn btn-primary">
      <strong>More</strong>&nbsp; >
    </button>
  </div>
</template>

<script>
export default {
  name: "DentalKnowledge",
};
</script>

<style scoped>
.container-picture {
  width: 100%;
  height: 100%;
  /* background-color: aqua; */
}
.magazine1 {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 70%;
  height: 100%;
  /* background-color: black; */
}
.magazine2 {
  margin-top: 7%;
  width: 30%;
  height: 100%;
}
.maga-container {
  width: 100%;
  height: 70%;
  /* background-color: black; */
}
.maga-container1 {
  display: flex;
  width: 100%;
  height: 30%;
}
.container {
  width: 100%;
  background-color: rgb(255, 255, 255);
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
  width: 70%;
  margin-left: 20%;
  height: 90%;
}
.picture1 {
  border-radius: 12px;
  margin: 0 13px;
  width: 30%;
  height: 75%;
}
.date,
.content {
  font-size: 1.75rem;
  margin-top: 2%;
  margin-left: 40%;
}
.date1,
.content1 {
  font-size: 1.75rem;
  margin-top: 2%;
  margin-left: 20%;
}
.pic1 {
  margin-left: 40%;
  background-image: url("../../imgs/daurang.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic2 {
  background-image: url("../../imgs/food.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic3 {
  background-image: url("../../imgs/teeth.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic4 {
  width: 35%;
  background-image: url("../../imgs/smile.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.pic5 {
  width: 31%;
  background-image: url("../../imgs/child.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.btn-primary {
  margin-top: 3%;
  padding-left: 1%;
  font-size: 1.5rem;
  width: 18%;
  height: 4vh;
  background-color: rgb(255, 255, 255);
  color: rgb(212, 162, 62);
  border-radius: 10px;
  border: 0.5px solid rgb(201, 201, 201);
  margin-bottom: 2%;
  margin-left: 40%;
}
.btn-primary:hover,
.btn-primary:focus {
  transition: background-color 0.5s ease, color 0.5s ease;
  background-color: #e3e3e3;
  border: 1px solid rgb(224, 196, 140);
  color: rgb(74, 85, 110);
}
.container {
  color: #2e4963;
}
@media (max-width: 1500px) {
  .picture {
    margin-top: -5%;
    border-radius: 12px;
    width: 85%;
    margin-left: 5%;
    height: 80%;
  }
  .picture1 {
    border-radius: 12px;
    margin: 0 13px;
    width: 50%;
    height: 75%;
  }
  .date,
  .content {
    font-size: 1.75rem;
    margin-top: 2%;
    margin-left: 5%;
  }
  .date1,
  .content1 {
    font-size: 1.75rem;
    margin-top: 2%;
    margin-left: 5%;
  }
  .pic4 {
    width: 93%;
  }
  .pic5 {
    width: 65%;
  }
  .btn-primary {
    margin-left: 39%;
    height: 7vh;
    width: 25%;
  }
}
</style>
