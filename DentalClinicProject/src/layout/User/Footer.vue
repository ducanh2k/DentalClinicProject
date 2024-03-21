<template>
  <div>
    <footer class="site-footer">
      <div class="footer-container">
        <div class="footer-block">
          <h4><strong>Information</strong></h4>

          <!-- <img src="path-to-logo.png" alt="iMed Logo" class="footer-logo" /> -->
          <p>
            Dentistry focuses on building a dedicated, caring, friendly service
            model, giving customers a feeling of peace of mind and comfort as if
            they were in their own home. Our goal is to become a top quality
            dentist in Vietnam Operation License No. 196/HNO/GPHD issued by
            Hanoi Department of Health Practice certificate number
            000119/HNO-CCHN issued by Hanoi Department of Health
          </p>
          <div class="pic"></div>
        </div>

        <div class="footer-block" style="margin-left: 7%">
          <h4><strong>Information</strong></h4>
          <ul class="footer-list">
            <li>Owner Information</li>
            <li>General trading conditions</li>
            <li>Payments</li>
            <li>Protecty personal Information</li>
          </ul>
        </div>
        <div class="footer-block" style="margin-left: 7%">
          <h4><strong>Services</strong></h4>
          <ul class="footer-list">
            <li>Implant</li>
            <li>Invisalign orthodontics without braces</li>
            <li>Traditional braces orthodontics</li>
            <li>Orthopedic porcelain teeth</li>
            <li>Cosmetic porcelain teeth</li>
            <li>Wisdom tooth extraction</li>
            <li>Children's Dentistry</li>
            <li>General Dentistry</li>
            <li>Removal dentures</li>
          </ul>
        </div>
        <div class="footer-block" style="margin-left: 7%">
          <h4><strong>Contact</strong></h4>
          <address>
            <i class="fa-solid fa-map-location-dot"></i>&nbsp; 3rd floor, 125
            Hoang Ngan building, Cau Giay, Hanoi<br />
            <i class="fa-solid fa-phone"></i>&nbsp; 972 435 008<br />
            <i class="fa-regular fa-envelope"></i>&nbsp;
            imednhakhoa@gmail.com<br />
            <i class="fa-solid fa-calendar-days"></i>&nbsp; 9am - 8pm Monday to
            Friday, 8am to 5pm Saturday
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
