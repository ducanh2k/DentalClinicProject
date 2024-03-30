<template>
  <div>
    <div class="dentalHeader">
      <div class="headerDental">
        <h2><strong>DENTAL SERVICES</strong></h2>
      </div>
      <div class="headerDental1">
        <h4>
          We provide top service with the philosophy of "Optimal solution,
          minimal interference"
        </h4>
      </div>
    </div>
    <div class="dentalservice-row1">
      <div class="service-card">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Implant</strong></h3>
        <p>
          The solution to restore aesthetic function and optimal chewing
          function for people who have lost teeth
        </p>
      </div>
      <div class="service-card">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Orthodontic braces</strong></h3>
        <p>Orthodontic treatment is an effective method for healthy teeth</p>
      </div>
      <div class="service-card">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Children’s Dentistry</strong></h3>
        <p>Give your child a healthy set of teeth for a bright smile</p>
      </div>
    </div>
    <div class="dentalservice-row1">
      <div class="service-card">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Orthodontic jaw surgery</strong></h3>
        <p>
          Solve both functional and aesthetic problems for patients, improve
          quality of life
        </p>
      </div>
      <div class="service-card">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Orthodontic jaw surgery</strong></h3>
        <p>
          Solve both functional and aesthetic problems for patients, improve
          quality of life
        </p>
      </div>
      <div class="service-card">
        <div class="icon-container">
          <img src="" alt="" />
        </div>
        <h3><strong>Wisdom tooth extration</strong></h3>
        <p>
          Safe and gentle minor surgery with modern machinery and a team of
          highly skilled doctors
        </p>
      </div>
    </div>
    <button type="button" class="btn btn-primary">
      <strong>View All &nbsp;&nbsp;&nbsp;</strong>>
    </button>
    <div class="parallax">
      <div class="stats-container">
        <div class="stat-item">
          <span class="stat-icon">📈</span>
          <h3 class="stat-number">14+</h3>
          <p class="stat-description">
            Forming and developing the iMed Dental brand
          </p>
        </div>
        <div class="stat-item">
          <span class="stat-icon">👥</span>
          <h3 class="stat-number">20,560+</h3>
          <p class="stat-description">
            Customers are treated at iMed Dental Clinic
          </p>
        </div>
        <div class="stat-item">
          <span class="stat-icon">🏥</span>
          <h3 class="stat-number">7,489,000+</h3>
          <p class="stat-description">
            The surgical treatment is performed by the dental team
          </p>
        </div>
        <div class="stat-item">
          <span class="stat-icon">💡</span>
          <h3 class="stat-number">3327+</h3>
          <p class="stat-description">The surgical treatment is performed by the dental team</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "DentalService",
};
</script>

<style scoped>
.h3 {
  color: rgb(74, 85, 110);
}
.headerDental {
  color: rgb(224, 196, 140);
  margin-top: 10%;
  margin-left: 45%;
  justify-content: center;
  align-content: center;
}
.headerDental1 {
  margin-left: 31%;
  justify-content: center;
  align-content: center;
  margin-bottom: 10%;
  margin-top: 2%;
}
.dentalHeader {
  margin-left: 5%;
  justify-content: center;
  align-content: center;
}
.dentalservice-row1 {
  display: flex;
  margin-top: 5%;
}
.service-card {
  text-align: center;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 20px;
  background: #ffffff;
  position: relative;
  max-width: 400px;
  margin: auto;
}

.icon-container {
  background-color: rgb(224, 196, 140);
  border-radius: 50%;
  width: 70px;
  height: 70px;
  padding: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin: 0 auto 20px;
  position: absolute;
  top: -30px;
  left: 0;
  right: 0;
}

.service-card h3 {
  margin-top: 40px;
  margin-bottom: 10px;
}

.service-card p {
  color: #666;
  font-size: 14px;
  margin-bottom: 0;
}
.btn-primary{
  margin-left: 35%;
}
@media (max-width: 1500px) {
  .headerDental1 {
    margin-left: 22%;
    justify-content: center;
    align-content: center;
    margin-bottom: 10%;
  }
  .service-card {
    max-width: 300px;
  }
  .btn-primary {
    margin-left: 35%;
  }
  .headerDental {
    margin-left: 40%;
  }
}
.btn-primary {
  margin-top: 2%;
  font-size: 1.5rem;
  width: 30%;
  height: 8vh;
  background-color: #fff;
  color: rgb(224, 196, 140);
  border-radius: 6px;
  border: 0.5px solid rgb(201, 201, 201);
  margin-bottom: 2%;
}
.btn-primary:hover,
.btn-primary:focus {
  transition: background-color 0.5s ease, color 0.5s ease;
  background-color: #e3e3e3;
  border: 1px solid rgb(224, 196, 140);
  color: rgb(74, 85, 110);
}

.service-card:focus,
.service-card:hover {
  background-color: #e3e3e3;
  /* color: rgb(224, 196, 140); */
  cursor: pointer;
  transition: background-color 0.5s ease, color 0.5s ease;
}
.stats-container {
  height: 60vh;
  background-image: url("../../imgs/nhakhoavietsing3.jpg");
  background-size: cover;
  background-attachment: fixed;
  background-repeat: no-repeat;
  background-position: center;
}
.stats-container {
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding: 20px;
  background-color: #fff; 
  border-radius: 10px; 
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
}

.stat-item {
  height: 40%;
  text-align: center;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 20px;
  background: #ffffff;
  position: relative;
  max-width: 300px;
  margin: 20px;
  text-align: center;
  flex-basis: 25%; 
}

.stat-icon {
  display: block;
  margin: 0 auto 10px; 
  font-size: 24px; 
}

.stat-number {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 5px; 
}

.stat-description {
  font-size: 16px; 
  color: #666; 
}

/* Add responsive design as needed */
@media (max-width: 1500px) {
  .stats-container {
    /* flex-direction: column;  */
  }
  .stat-item {
    height: 65%;
    margin-bottom: 20px; 
  }
}
</style>
