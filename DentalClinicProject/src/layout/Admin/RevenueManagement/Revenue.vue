<template>
  <div class="container-Admin">
    <div class="main">
      <div class="main-header">
        <div class="title">
          <div class="title__toggle">
            <i class="fa-solid fa-bars fa-xl"></i>
          </div>
          <div class="title__company">Nha khoa Dentistry</div>
          <div class="exit__button">
            <i class="fa-solid fa-right-from-bracket fa-xl"></i>
          </div>
        </div>
      </div>
      <div class="main-body">
        <div id="dashboard">
          <div class="dropdown-year">
            <select v-model="selectedYear">
              <option v-for="year in years" :key="year" :value="year">
                năm {{ year }}
              </option>
            </select>
          </div>
          <div class="overview">
            <div class="revenue">
              <h5>Tổng thu</h5>
              <h1>{{ revenue }} Triệu</h1>
              <h5 style="color: rgb(58, 197, 8)">↑ 25%</h5>
            </div>
            <div class="expenses">
              <h5>Tổng chi</h5>
              <h1>{{ expenses }} Triệu</h1>
              <h5 style="color: rgb(255, 64, 64)">↓ 30%</h5>
            </div>
            <div class="profit">
              <h5>Lãi/lỗ so với năm ngoái</h5>
              <h1>{{ profit }} Triệu</h1>
              <h5 style="color: rgb(58, 197, 8)">↑ 25%</h5>
            </div>
          </div>
        </div>
        <div class="charts">
          <div class="bar-line">
            <div class="first-chart">
              <div class="Title-chart">Biểu đồ cột 12 tháng</div>
              <canvas id="myChart"></canvas>
            </div>
            <div class="second-chart">
              <div class="Title-chart">Biểu đồ line 12 tháng</div>
              <canvas id="myLineChart"></canvas>
            </div>
          </div>
          <div class="polar-radar">
            <div class="third-chart">
              <div class="Title-chart">Biểu đồ tròn 12 tháng</div>
              <canvas id="myPolarAreaChart"></canvas>
            </div>
            <div class="forth-chart">
              <div class="Title-chart">Biểu đồ radar 12 tháng</div>
              <canvas id="myRadarChart"></canvas>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import "https://cdn.jsdelivr.net/npm/chart.js";
import Chart from "chart.js";
import "/src/css/Admin/main.css";
import axios from "axios";
export default {
  name: "Revenue",
  components: {},
  data() {
    return {
      Revenues: [],
      ToTalAmountInYear: 0,
      TotalAmountInMonth: 0,
      TotalAmountInWeek: 0,
      selectedYear: new Date().getFullYear(),
      years: [2024, 2023, 2022, 2021],
      revenue: 320,
      expenses: 150,
      profit: 120,
    };
  },
  mounted() {
    this.barChart();
    this.LineChart();
    this.PolarAreaChart();
    this.RadarChart();
  },
  methods: {
    barChart() {
      const ctx = document.getElementById("myChart").getContext("2d");
      const myChart = new Chart(ctx, {
        type: "bar",
        data: {
          labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
          barPercentage: 0.5,
          barThickness: 6,
          maxBarThickness: 8,
          minBarLength: 2,
          datasets: [
            {
              data: [10, 20, 30, 40, 50, 60, 70],
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
          labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
          datasets: [
            {
              data: [65, 59, 80, 81, 56, 55, 40],
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
          labels: ["Red", "Green", "Yellow", "Grey", "Blue"],
          datasets: [
            {
              label: "My First Dataset",
              data: [11, 16, 7, 3, 15],
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
    RadarChart() {
      const ctx = document.getElementById("myRadarChart").getContext("2d");
      const myChart = new Chart(ctx, {
        type: "radar",
        data: {
          labels: [
            "Eating",
            "Drinking",
            "Sleeping",
            "Designing",
            "Coding",
            "Cycling",
            "Running",
          ],
          datasets: [
            {
              label: "My First Dataset",
              data: [65, 59, 90, 81, 56, 55, 40],
              fill: true,
              backgroundColor: "rgba(255, 99, 132, 0.2)",
              borderColor: "rgb(255, 99, 132)",
              pointBackgroundColor: "rgb(255, 99, 132)",
              pointBorderColor: "#fff",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgb(255, 99, 132)",
            },
            {
              label: "My Second Dataset",
              data: [28, 48, 40, 19, 96, 27, 100],
              fill: true,
              backgroundColor: "rgba(54, 162, 235, 0.2)",
              borderColor: "rgb(54, 162, 235)",
              pointBackgroundColor: "rgb(54, 162, 235)",
              pointBorderColor: "#fff",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgb(54, 162, 235)",
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
          elements: {
            line: {
              borderWidth: 3,
            },
          },
        },
      });
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
  height: 888px;
  overflow-y: auto;
}
.dropdown-year {
  margin-left: 240px;
  margin-top: 50px;
  width: 13%;
  height: 30%;
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
