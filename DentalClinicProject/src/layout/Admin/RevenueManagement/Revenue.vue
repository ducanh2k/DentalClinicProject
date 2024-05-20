<template>
  <div class="container-Admin">
    <TheSidebar v-if="isClicked === true"></TheSidebar>
    <div class="main">
      <div class="main-header">
        <div class="title">
          <div class="title__toggle" @click="openSideBar()">
            <i class="fa-solid fa-bars fa-xl"></i>
          </div>
          <div class="title__company">Nha khoa Dentistry</div>
          <div class="exit__button">
            <i
              class="fa-solid fa-right-from-bracket fa-xl"
              @click="logOut()"
            ></i>
          </div>
        </div>
      </div>
      <div class="main-body">
        <div id="dashboard">
          <div class="dropdown-year" style="width: 14%">
            <select v-model="selectedYear" @change="onYearChange">
              <option v-for="year in years" :key="year" :value="year">
                {{ year }}
              </option>
            </select>
          </div>
          <div
            class="overview"
            style="width: 140% !important; margin-left: -70%"
          >
            <div class="revenue">
              <h5>Tổng thu</h5>
              <h5>{{ totalRevenue.toLocaleString("vi-VN") }} VND</h5>
              <!-- <h5 style="color: rgb(58, 197, 8)">↑ 25%</h5> -->
            </div>
            <div class="expenses">
              <h5>Tổng chi</h5>
              <h5>{{ totalExpenses.toLocaleString("vi-VN") }} VND</h5>
              <!-- <h5 style="color: rgb(255, 64, 64)">↓ 30%</h5> -->
            </div>
            <div class="profit">
              <h5>Lãi/lỗ so với năm ngoái</h5>
              <h5>{{ profit.toLocaleString("vi-VN") }} VND</h5>
              <!-- <h5 style="color: rgb(58, 197, 8)">↑ 25%</h5> -->
            </div>
          </div>
        </div>
        <div class="charts">
          <div class="bar-line">
            <div class="first-chart">
              <div class="Title-chart">Doanh thu trong 12 tháng</div>
              <canvas id="myChart"></canvas>
            </div>
            <div class="second-chart">
              <div class="Title-chart">Các dịch vụ được sử dụng</div>
              <canvas id="myPolarAreaChart1"></canvas>
            </div>
          </div>
          <div class="polar-radar">
            <div class="third-chart">
              <div class="Title-chart">Số lượng khách hàng trong 12 tháng</div>
              <canvas id="myPolarAreaChart"></canvas>
            </div>
            <!-- <div class="forth-chart">
              <div class="Title-chart">
                Số liệu về Top vật liệu được sử dụng
              </div>
              <canvas id="myRadarChart"></canvas>
            </div> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import TheSidebar from "../TheSidebar.vue";
import "https://cdn.jsdelivr.net/npm/chart.js";
import Chart from "chart.js";
import "/src/css/Admin/main.css";
import axios from "axios";
export default {
  name: "Revenue",
  components: { TheSidebar },
  data() {
    return {
      months: [],
      Revenues: [],
      monthsEx: [],
      totalRevenue: 0,
      totalRevenueLastYear: 0,
      totalExpenses: 0,
      totalExpensesLastYear: 0,
      totalSpentOfMonth: [],
      monthsPatient: [],
      totalPatientsPerMonth: [],
      totalPayOfMonth: [],
      topMaterial: [],
      totalQuantity: [],
      totalPay: [],
      ToTalAmountInYear: 0,
      TotalAmountInMonth: 0,
      TotalAmountInWeek: 0,
      selectedYear: new Date().getFullYear(),
      years: [],
      lastYear: 0,
      revenue: 320,
      expenses: 150,
      profit: 120,
      minus: 0,
      minusLast: 0,
      isClicked: true,
      percentage: [],
      serviceName: [],
    };
  },
  mounted() {
    if (this.selectedYear === null) {
      this.selectedYear = 2024;
    }
    this.lastYear = this.selectedYear - 1;
    this.generateLastFiveYears();
    this.fetchRevenueYearly();
    this.fetchServices();
    this.fetchPatients();
    // this.fetchTopMaterial();
    this.barChart();
    // this.LineChart();
    this.PolarAreaChart();
    this.PolarAreaChart1();

    // this.RadarChart();
  },
  methods: {
    openSideBar() {
      if (this.isClicked === true) this.isClicked = false;
      else if (this.isClicked === false) this.isClicked = true;
    },
    onYearChange() {
      if (this.selectedYear === null) {
        this.selectedYear = 2024;
      }
      this.lastYear = this.selectedYear - 1;
      this.fetchRevenueYearly();
      this.fetchServices();
      this.fetchPatients();
      // this.fetchTopMaterial();
    },
    fetchRevenueYearly() {
      if (this.selectedYear === null) {
        this.selectedYear = 2024;
      }
      let apiURL =
        "https://localhost:7034/api/Dashboard/revenue?year=" +
        this.selectedYear;
      let apiURLLastYear =
        "https://localhost:7034/api/Dashboard/revenue?year=" + this.lastYear;
      axios
        .get(apiURLLastYear)
        .then((response) => {
          this.totalPayOfMonth = response.data.map(
            (item) => item.totalPayOfMonth
          );
          this.totalPayOfMonth = [...new Set(this.totalPayOfMonth)];
          this.totalRevenueLastYear = this.totalPayOfMonth.reduce(
            (accumulator, currentValue) => accumulator + currentValue,
            0
          );
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
      axios
        .get(apiURL)
        .then((response) => {
          this.months = response.data.map((item) => item.month);
          this.months = [...new Set(this.months)];
          this.totalPayOfMonth = response.data.map(
            (item) => item.totalPayOfMonth
          );
          this.totalPayOfMonth = [...new Set(this.totalPayOfMonth)];
          this.totalRevenue = this.totalPayOfMonth.reduce(
            (accumulator, currentValue) => accumulator + currentValue,
            0
          );
          this.barChart();
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    fetchServices() {
      if (this.selectedYear === null) {
        this.selectedYear = 2024;
      }
      let apiURL = "https://localhost:7034/api/Dashboard/topService";
      // let apiURLLastYear =
      //   "https://localhost:7034/api/Dashboard/service?year=" + this.lastYear;
      // axios
      //   .get(apiURL)
      //   .then((response) => {
      //     this.percentage = response.data.map((item) => item.percentage);
      //     this.percentage = [...new Set(this.percentage)];
      //     this.serviceName = response.data.map((item) => item.serviceName);
      //     this.serviceName = [...new Set(this.serviceName)];
      //   })
      //   .catch((error) => {
      //     console.error("There has been a problem");
      //   });
      axios
        .get(apiURL)
        .then((response) => {
          // this.monthsEx = response.data.map((item) => item.month);
          // this.monthsEx = [...new Set(this.monthsEx)];
          this.percentage = response.data.topServicesPercentage.map((item) => item.percentage);
          this.percentage = [...new Set(this.percentage)];
          this.serviceName = response.data.topServicesPercentage.map((item) => item.serviceName);
          this.serviceName = [...new Set(this.serviceName)];
          this.PolarAreaChart1();
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    fetchPatients() {
      if (this.selectedYear === null) {
        this.selectedYear = 2024;
      }
      let apiURL =
        "https://localhost:7034/api/Dashboard/patient?year=" +
        this.selectedYear;

      axios
        .get(apiURL)
        .then((response) => {
          this.monthsPatient = response.data.map((item) => item.month);
          this.monthsPatient = [...new Set(this.monthsPatient)];
          this.totalPatientsPerMonth = response.data.map(
            (item) => item.totalPatientsPerMonth
          );
          this.totalPatientsPerMonth = [...new Set(this.totalPatientsPerMonth)];
          this.PolarAreaChart();
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    fetchTopMaterial() {
      let apiURL = "https://localhost:7034/api/Dashboard/topMaterial";
      axios
        .get(apiURL)
        .then((response) => {
          this.topMaterial = response.data.topMaterials.map(
            (item) => item.materialName
          );
          this.percentage = response.data.topMaterials.map(
            (item) => item.percentage
          );
          this.PolarAreaChart2();
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    generateLastFiveYears() {
      const currentYear = new Date().getFullYear();
      const year = [];
      for (let i = 0; i < 5; i++) {
        year.push(currentYear - i);
      }
      this.years = year;
    },
    barChart() {
      const ctx = document.getElementById("myChart").getContext("2d");
      const myChart = new Chart(ctx, {
        type: "bar",
        data: {
          labels: this.months,
          barPercentage: 0.5,
          barThickness: 6,
          maxBarThickness: 8,
          minBarLength: 2,
          datasets: [
            {
              data: this.totalPayOfMonth,
              backgroundColor: [
                "rgba(255, 99, 132, 0.2)",
                "rgba(255, 159, 64, 0.2)",
                "rgba(255, 205, 86, 0.2)",
                "rgba(75, 192, 192, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(153, 102, 255, 0.2)",
                "rgba(201, 203, 207, 0.2)",
              ],
              borderColor: [
                "rgb(255, 99, 132)",
                "rgb(255, 159, 64)",
                "rgb(255, 205, 86)",
                "rgb(75, 192, 192)",
                "rgb(54, 162, 235)",
                "rgb(153, 102, 255)",
                "rgb(201, 203, 207)",
              ],
              borderWidth: 1,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
    },
    LineChart() {
      const ctx = document.getElementById("myLineChart").getContext("2d");
      const myChart = new Chart(ctx, {
        type: "line",
        data: {
          labels: this.monthsEx,
          datasets: [
            {
              data: this.totalSpentOfMonth,
              fill: false,
              borderColor: "rgb(75, 192, 192)",
              tension: 0.1,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
    },
    PolarAreaChart() {
      const ctx = document.getElementById("myPolarAreaChart").getContext("2d");
      const myChart = new Chart(ctx, {
        type: "polarArea",
        data: {
          labels: this.monthsPatient,
          datasets: [
            {
              label: "My First Dataset",
              data: this.totalPatientsPerMonth,
              backgroundColor: [
                "rgb(255, 99, 132)",
                "rgb(75, 192, 192)",
                "rgb(255, 205, 86)",
                "rgb(201, 203, 207)",
                "rgb(54, 162, 235)",
              ],
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
    },
    PolarAreaChart1() {
      const ctx = document.getElementById("myPolarAreaChart1").getContext("2d");
      const myChart = new Chart(ctx, {
        type: "polarArea",
        data: {
          labels: this.serviceName,
          datasets: [
            {
              label: "My First Dataset",
              data: this.percentage,
              backgroundColor: [
                "rgb(255, 99, 132)",
                "rgb(75, 192, 192)",
                "rgb(255, 205, 86)",
                "rgb(201, 203, 207)",
                "rgb(54, 162, 235)",
              ],
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
    },
    // PolarAreaChart2() {
    //   const ctx = document.getElementById("myRadarChart").getContext("2d");
    //   const myChart = new Chart(ctx, {
    //     type: "polarArea",
    //     data: {
    //       labels: this.topMaterial,
    //       datasets: [
    //         {
    //           label: "My First Dataset",
    //           data: this.percentage,
    //           backgroundColor: [
    //             "rgb(255, 99, 132)",
    //             "rgb(75, 192, 192)",
    //             "rgb(255, 205, 86)",
    //             "rgb(201, 203, 207)",
    //             "rgb(54, 162, 235)",
    //           ],
    //         },
    //       ],
    //     },
    //     options: {
    //       scales: {
    //         y: {
    //           beginAtZero: true,
    //         },
    //       },
    //     },
    //   });
    // },
    // RadarChart() {
    //   const ctx = document.getElementById("myRadarChart").getContext("2d");
    //   const myChart = new Chart(ctx, {
    //     type: "radar",
    //     data: {
    //       labels: this.topMaterial,
    //       datasets: [
    //         {
    //           label: "My First Dataset",
    //           data: this.percentage,
    //           fill: true,
    //           backgroundColor: "rgba(255, 99, 132, 0.2)",
    //           borderColor: "rgb(255, 99, 132)",
    //           pointBackgroundColor: "rgb(255, 99, 132)",
    //           pointBorderColor: "#fff",
    //           pointHoverBackgroundColor: "#fff",
    //           pointHoverBorderColor: "rgb(255, 99, 132)",
    //         },
    //         // {
    //         //   label: "My Second Dataset",
    //         //   data: this.totalPay,
    //         //   fill: true,
    //         //   backgroundColor: "rgba(54, 162, 235, 0.2)",
    //         //   borderColor: "rgb(54, 162, 235)",
    //         //   pointBackgroundColor: "rgb(54, 162, 235)",
    //         //   pointBorderColor: "#fff",
    //         //   pointHoverBackgroundColor: "#fff",
    //         //   pointHoverBorderColor: "rgb(54, 162, 235)",
    //         // },
    //       ],
    //     },
    //     options: {
    //       scales: {
    //         y: {
    //           beginAtZero: true,
    //         },
    //       },
    //       elements: {
    //         line: {
    //           borderWidth: 3,
    //         },
    //       },
    //     },
    //   });
    // },
    logOut() {
      this.$router.push({ name: "Login" });
      localStorage.removeItem("userRole");
    },
  },
};
</script>

<style scoped>
.input-group-text {
  background-color: rgb(255, 255, 255);
  margin-right: 20%;
}
.form-control {
  margin-right: 30%;
  width: 80%;
}
.form-Des {
  width: 80%;
  height: 50%;
  word-wrap: break-word;
}
.btn-primary {
  margin-top: 3%;
}
.input-group-text {
  margin-top: 20px;
  width: 200px;
  margin-right: 100px;
}
.input-group-text {
  border: none;
}
.modal-content {
  width: 1000px;
}
.modal-body {
  width: 1000px;
}
.modal-body {
  height: auto;
}
.btn-primary {
  width: 150px;
  margin-right: 20px;
}
#dashboard {
  margin-left: 40px;
  width: 100%;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}
.overview {
  width: 1000px !important;
  display: flex;
  justify-content: space-between;
}
.charts {
  display: flex;
  justify-content: space-between;
}
.main-body {
  flex-wrap: wrap;
  width: 100%;
  height: 90vh;
  overflow-y: auto !important;
}
.dropdown-year {
  margin-top: 50px;
  width: 15%;
  height: 45%;
}
.dropdown-year select {
  border: 1px solid rgb(190, 190, 190);
  border-radius: 6px;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  padding: 0.5em;
  margin: 0;
}
.charts {
  flex-wrap: wrap;
  justify-content: space-around;
  width: 100%;
  padding: 30px;
}
.first-chart,
.second-chart,
.third-chart,
.forth-chart {
  padding: 20px;
  border: 1px solid rgb(190, 190, 190);
  border-radius: 10px;
  margin-right: 20px;
  margin-bottom: 30px;
  width: 100%;
  background-color: rgb(255, 255, 255);
}
.bar-line {
  width: 100%;
  display: flex;
}
.polar-radar {
  width: 100%;
  display: flex;
}
.dashboard {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.overview {
  margin-left: -500px;
  padding: 20px;
  border: 1px solid rgb(190, 190, 190);
  border-radius: 10px;
  width: 100%;
  background-color: rgb(255, 255, 255);
}
@media (max-width: 1300px) {
  .main-body {
    height: 550px;
    overflow-y: auto;
  }
  .dropdown-year {
    width: 20%;
    margin-left: -10px;
    margin-top: 75px;
  }
  .overview {
    width: 150%;
    margin-left: -450px;
    margin-top: 20px;
  }
}
</style>
