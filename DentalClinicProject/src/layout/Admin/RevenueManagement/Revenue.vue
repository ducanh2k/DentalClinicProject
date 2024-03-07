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
                {{ year }}
              </option>
            </select>
          </div>

          <div class="overview">
            <div class="revenue">
              <h3>Tổng thu</h3>
              <p>{{ revenue }} Triệu</p>
              <p>↑ 25%</p>
            </div>
            <div class="expenses">
              <h3>Tổng chi</h3>
              <p>{{ expenses }} Triệu</p>
              <p>↓ 30%</p>
            </div>
            <div class="profit">
              <h3>Lãi/lỗ so với năm ngoái</h3>
              <p>{{ profit }} Triệu</p>
              <p>↑ 25%</p>
            </div>
          </div>

          <div class="charts">
            <div class="pie-chart"></div>
            <div class="bar-chart"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import "/src/css/Admin/main.css";
import axios from "axios";
export default {
  name: "Service",
  components: {},
  data() {
    return {
      Revenues: [],
      modalTitle: "",
      id: 0,
      ToTalAmountInYear: 0,
      TotalAmountInMonth: 0,
      TotalAmountInWeek: 0,
      serviceName: "",
      briefInfo: "",
      description: "",
      price: "",
      deleteFlag: false,
      ID: 0,
      currentPage: 1,
      searchText: "",
      selectedYear: new Date().getFullYear(),
      years: [2024, 2023, 2022, 2021], // Ví dụ cho các năm có sẵn
      revenue: 320,
      expenses: 150,
      profit: 120,
    };
  },
  methods: {
    async fetchServices() {
      let apiURL = "https://localhost:7034/api/Revenue/list";
      apiURL =
        "https://localhost:7034/api/Revenue/list?pageNumber=" +
        this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.services = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
  },
  mounted: function () {
    this.fetchServices();
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
</style>
