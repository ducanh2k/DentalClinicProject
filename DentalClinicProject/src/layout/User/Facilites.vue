<template>
  <div class="container">
    <div class="feature-section">
      <div class="feature-content">
        <h2 style="color: rgb(218, 174, 88)">
          <strong>MODERN FACILITIES</strong>
        </h2>
        <p>
          The system of modern equipment is imported from foreign countries, and
          certified for safety by the Ministry of Health. 5-star facilities give
          customers a relaxing and secure space to experience the service. The
          equipment used in the clinic stand is imported from Japan, Europe and
          the US.
        </p>
        <a href="#" class="feature-link"><strong>More</strong></a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Facilities",
};
</script>

<style scoped>
.container {
  width: 100%;
  height: 800px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.feature-section {
  width: 75%;
  margin-top: 20%;
  position: relative;
  background-image: url("../../imgs/Image-1-1.jpg");
  background-size: cover;
  background-position: center;
  height: 500px;
  margin-right: 1%;
  margin-left: 1%;
  border-radius: 10px;
  margin-bottom: 10%;
}

.feature-content {
  margin-top: -7%;
  margin-left: -28%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 40%;
  height: 55%;
  background: rgba(255, 255, 255, 0.925);
  padding: 20px;
  box-sizing: border-box;
  border-radius: 10px;
}

.feature-section h2 {
  color: #333;
  margin-bottom: 0.5em;
}

.feature-section p {
  color: #666;
}

.feature-link {
  border: 1px solid rgb(206, 206, 206);
  display: inline-block;
  margin-top: 1em;
  padding: 6px 20px;
  background-color: #fff;
  color: rgb(221, 177, 88);
  text-decoration: none;
  border-radius: 3px;
}

.feature-link:hover {
  background-color: #e3e3e3;
  transition: background-color 0.5s ease, color 0.5s ease;
  color: #003d82;
}
@media (max-width: 1500px) {
  .feature-section {
    width: 100%;
  }
  .feature-content {
    margin-top: -8%;
  }
}
</style>
