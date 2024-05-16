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
        <div class="search-container">
          <input
            type="text"
            placeholder="Nhập từ khóa"
            class="search-box"
            v-model="searchText"
            @input="filterResults"
          />
          <button class="search-button" @click="filterResults">Tìm kiếm</button>
          <div class="addnew" v-if="role === 'Admin'">
            <button
              class="button-create"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
              @click="addClick()"
            >
              Thêm mới dịch vụ
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tên dịch vụ</th>
                <th scope="col">Nhóm dịch vụ</th>
                <th scope="col">Giá cả</th>
                <th scope="col" v-if="role === 'Admin'"></th>
                <th scope="col" v-if="role === 'Admin'"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="service in services" :key="service.serviceId">
                <th scope="row">{{ service.serviceId }}</th>
                <td>{{ service.serviceName }}</td>
                <td>{{ service.briefInfo }}</td>
                <td>{{ service.price.toLocaleString("vi-VN") }}.000 VND</td>
                <td v-if="role === 'Admin'">
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    @click="editClick(service)"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-pencil-square"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"
                      />
                      <path
                        fill-rule="evenodd"
                        d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"
                      />
                    </svg>
                  </button>
                </td>
                <td v-if="role === 'Admin'">
                  <button
                    type="button"
                    @click="deleteClick(service.serviceId)"
                    class="btn btn-light mr-1"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-trash-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"
                      />
                    </svg>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="under-table">
          <div class="sum__staff">
            Tổng số dịch vụ: <strong>{{ totalServices }}</strong>
          </div>
          <div class="pagination">
            <a @click="decreasePage()" class="page-link" v-if="currentPage > 1"
              >Previous</a
            >

            <a
              @click="changPageNumber(Page1)"
              v-if="Page1 <= totalPages"
              class="page-link"
              :class="{ 'active-page': currentPage === Page1 }"
              >{{ Page1 }}</a
            >

            <a
              @click="changPageNumber(Page2)"
              v-if="Page2 <= totalPages"
              class="page-link"
              :class="{ 'active-page': currentPage === Page2 }"
              >{{ Page2 }}</a
            >

            <a
              @click="changPageNumber(Page3)"
              v-if="Page3 <= totalPages"
              class="page-link"
              :class="{ 'active-page': currentPage === Page3 }"
              >{{ Page3 }}</a
            >

            <a
              @click="increasePage()"
              class="page-link"
              v-if="currentPage < totalPages"
              >Next</a
            >
          </div>
        </div>
      </div>
    </div>
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-header1">
              <h5 class="modal-title" id="exampleModalLabel">
                <strong>{{ modalTitle }}</strong>
              </h5>
            </div>
          </div>
          <div class="modal-body">
            <div class="input-group md-3">
              <div>
                <span class="input-group-text"
                  ><strong
                    >Tên dịch vụ
                    <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="serviceName"
                  placeholder="Nhập tên dịch vụ"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong
                    >Nhóm dịch vụ
                    <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="briefInfo"
                  placeholder="Nhập tên nhóm dịch vụ"
                />
              </div>

              <div>
                <span class="input-group-text"><strong>Giá thành</strong></span>
                <input
                  type="number"
                  class="form-control"
                  v-model="price"
                  placeholder="Nhập giá thành"
                />
                <div class="form-price">(nghìn VND)</div>
              </div>

              <div>
                <span class="input-group-text"><strong>Mô tả</strong></span>
                <textarea
                  type="text"
                  class="form-control form-Des"
                  v-model="description"
                  name=""
                  id=""
                  cols="30"
                  rows="10"
                  placeholder="Thêm mô tả"
                ></textarea>
              </div>
            </div>

            <div>
              <button
                type="button"
                @click="createClick()"
                v-if="ID === 0"
                class="btn btn-primary"
              >
                Lưu
              </button>

              <button
                type="button"
                @click="updateClick()"
                v-if="ID != 0"
                class="btn btn-primary"
              >
                Lưu
              </button>
              <button
                type="button"
                class="btn btn-primary"
                data-bs-dismiss="modal"
                aria-label="Close"
                style="background-color: rgb(77, 75, 75)"
              >
                Hủy
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import "/src/css/Admin/main.css";
import axios from "axios";
import TheSidebar from "../TheSidebar.vue";
export default {
  name: "Service",
  components: { TheSidebar },
  data() {
    return {
      role: "",
      services: [],
      modalTitle: "",
      serviceId: 0,
      serviceName: "",
      briefInfo: "",
      description: "",
      price: "",
      deleteFlag: false,
      ID: 0,
      currentPage: 1,
      searchText: "",
      isClicked: true,
      flag: 0,
      Page1: 1,
      Page2: 2,
      Page3: 3,
      flagNext: 0,
      totalServices: 0,
      allServices: [],
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.totalServices / 10);
    },
  },
  methods: {
    openSideBar() {
      if (this.isClicked === true) this.isClicked = false;
      else if (this.isClicked === false) this.isClicked = true;
    },
    CheckRole() {
      this.role = localStorage.getItem("userRole");
    },
    changPageNumber(number) {
      this.currentPage = number;
      this.fetchServices();
    },
    decreasePage() {
      if (this.currentPage > 1) {
        this.currentPage--;
        if (this.currentPage % 3 === 0) {
          this.Page1 = this.currentPage - 2;
          this.Page2 = this.currentPage - 1;
          this.Page3 = this.currentPage;
        }
        this.fetchServices();
      }
    },
    increasePage() {
      if (this.currentPage < this.totalPages) {
        if (this.currentPage % 3 === 0) {
          this.Page1 += 3;
          this.Page2 += 3;
          this.Page3 += 3;
        }
        this.flag = this.currentPage;
        this.currentPage++;
        this.fetchServices();
      }
    },
    async getAllServices() {
      let apiURL = "https://localhost:7034/api/Service/listall";
      axios
        .get(apiURL)
        .then((response) => {
          this.allServices = response.data;
          this.totalServices = response.data.length;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    async fetchServices() {
      const currentLength = this.services.length;
      let apiURL = "https://localhost:7034/api/Service/list";
      apiURL =
        "https://localhost:7034/api/Service/list?pageNumber=" +
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
    addClick() {
      this.modalTitle = "Thêm dịch vụ";
      this.ID = 0;
      this.serviceName = "";
      this.briefInfo = "";
      this.description = "";
      this.deleteFlag = false;
      this.price = 0;
    },
    editClick(u) {
      this.modalTitle = "Sửa dịch vụ";
      this.ID = u.serviceId;
      this.serviceName = u.serviceName;
      this.briefInfo = u.briefInfo;
      this.description = u.description;
      this.deleteFlag = false;
      this.price = u.price;
    },
    createClick() {
      if (this.price === "") {
        this.price = 0;
      }
      if (this.serviceName === "" || this.briefInfo === "") {
        alert("Tên dịch vụ hoặc nhóm dịch vụ không được để trống!");
        return;
      }
      axios
        .post("https://localhost:7034/api/Service", {
          serviceName: this.serviceName,
          briefInfo: this.briefInfo,
          description: this.description,
          deleteFlag: false,
          price: this.price,
        })
        .then((response) => {
          alert("Thêm mới thành công!");
          this.fetchServices();
        });
    },
    updateClick() {
      if (this.price === "") {
        this.price = 0;
      }
      if (this.serviceName === "" || this.briefInfo === "") {
        alert("Tên dịch vụ hoặc nhóm dịch vụ không được để trống!");
        return;
      }
      axios
        .put("https://localhost:7034/api/Service/" + this.ID, {
          serviceName: this.serviceName,
          briefInfo: this.briefInfo,
          description: this.description,
          deleteFlag: this.deleteFlag,
          price: this.price,
        })
        .then((response) => {
          alert("Cập nhật thành công!");
          this.fetchServices();
        });
    },
    deleteClick(id) {
      if (!confirm("Bạn có chắc chắn muốn xóa không ?")) {
        return;
      }
      axios
        .delete("https://localhost:7034/api/Service/" + id)
        .then((response) => {
          this.fetchServices();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa dịch vụ!";
        });
    },
    filterResults() {
      if (this.searchText.includes("@")) {
        this.searchText = "";
      }
      if (this.searchText) {
        this.services = this.allServices.filter((service) =>
          Object.values(service).some(
            (value) =>
              value !== null &&
              value !== undefined &&
              value
                .toString()
                .toLowerCase()
                .includes(this.searchText.toLowerCase().trim())
          )
        );
      } else {
        this.fetchServices();
      }
    },
    handleNavigation(view) {
      this.currentView = view;
    },
    logOut() {
      this.$router.push({ name: "Login" });
      localStorage.removeItem("userRole");
    },
  },
  mounted: function () {
    this.CheckRole();
    this.getAllServices();
    this.fetchServices();
  },
};
</script>

<style scoped>
.pagination {
  cursor: pointer;
}
.page-link.active-page {
  background-color: rgb(77, 75, 75);
  color: white;
}
.input-group-text {
  background-color: rgb(255, 255, 255);
  margin-right: 20%;
}
.form-control {
  margin-right: 30%;
  width: 80%;
}
.form-Des {
  width: 320%;
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
.form-price {
  float: right;
  margin-right: -30px;
  margin-top: -30px;
}
.addnew {
  margin-left: -5%;
}
</style>
