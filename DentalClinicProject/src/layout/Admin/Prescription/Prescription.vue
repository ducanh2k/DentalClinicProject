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
          <div class="addnew">
            <button
              class="button-create"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
              @click="addClick()"
            >
              Thêm mới đơn thuốc
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Ngày tạo</th>
                <th scope="col">Tên bác sĩ</th>
                <th scope="col">Ghi chú</th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="pre in prescriptions" :key="pre.prescriptionId">
                <th scope="row">{{ pre.prescriptionId }}</th>
                <td class="data-from-db">{{ pre.createdDate }}</td>
                <td class="data-from-db">{{ pre.doctorName }}</td>
                <td class="data-from-db">{{ pre.note }}</td>
                <td>
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    @click="editClick(pre)"
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
                <td>
                  <button
                    type="button"
                    @click="deleteClick(pre.prescriptionId)"
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
                <td>
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal1"
                    @click="ViewDetail(pre)"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-card-text"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"
                      />
                      <path
                        d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8m0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5"
                      />
                    </svg>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="under-table">
          <div class="sum__staff">Tổng số đơn thuốc: <strong>10</strong></div>
          <div class="pagination">
            <li><a @click="changPageNumber(1)" class="page-1">1</a></li>
            <li><a @click="changPageNumber(2)" class="page-2">2</a></li>
            <li><a @click="changPageNumber(3)" class="page-3">3</a></li>
            <li><a @click="changPageNumber(0)" class="Next-page">Next</a></li>
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
          <div class="modal-body" v-if="(ID === 0 || ID != 0) && ID != 2">
            <div class="input-group md-3">
              <div>
                <span class="input-group-text"><strong>Mã bác sĩ</strong></span>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Ảnh của người dùng"
                  v-model="doctorId"
                />
              </div>
              <div v-if="(ID === 0 || ID != 0) && ID != 2">
                <span class="input-group-text"><strong>Ghi chú</strong></span>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Thêm ghi chú"
                  v-model="note"
                />
              </div>
              <div v-if="ID != 0">
                <span class="input-group-text"
                  ><strong>Delete Flag</strong></span
                >
                <input type="text" class="form-control" v-model="deleteFlag" />
              </div>
            </div>
            <div>
              <button
                type="button"
                @click="createClick(ID)"
                v-if="ID === 0"
                class="btn btn-primary"
              >
                Lưu
              </button>
              <button
                type="button"
                @click="createClick(ID)"
                v-if="ID === 2"
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
    <div
      class="modal fade"
      id="exampleModal1"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-header1">
              <h5 class="modal-title" id="exampleModalLabel">
                <strong>Thông tin chi tiết</strong>
              </h5>
            </div>
          </div>
          <div class="range">
            <table class="table table-striped table-hover" style="height: 30%">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Mã đơn thuốc</th>
                  <th scope="col">Tên thuốc</th>
                  <th scope="col">Số lượng</th>
                  <th scope="col">Hướng dẫn liều lượng</th>
                  <!-- <th scope="col"></th>
                  <th scope="col"></th> -->
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="p in prescriptionDetails"
                  :key="p.prescriptionDetailId"
                >
                  <th scope="row">{{ p.prescriptionDetailId }}</th>
                  <td class="data-from-db">{{ p.prescriptionId }}</td>
                  <td class="data-from-db">{{ p.medicineName }}</td>
                  <td class="data-from-db">{{ p.quantity }}</td>
                  <td class="data-from-db">{{ p.dosageInstruction }}</td>
                  <!-- <td>
                    <button
                      type="button"
                      class="btn btn-light mr-1"
                      data-bs-toggle="modal"
                      data-bs-target="#exampleModal"
                      @click="editClick(pre)"
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
                  <td>
                    <button
                      type="button"
                      @click="deleteClick(pre.prescriptionId)"
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
                  </td> -->
                </tr>
              </tbody>
            </table>
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
  name: "Prescription",
  components: { TheSidebar },
  data() {
    return {
      prescriptions: [],
      modalTitle: "",
      doctorId: 0,
      createdDate: "",
      note: "",
      deleteFlag: false,
      ID: 0,
      currentPage: 1,
      pageSize: 10,
      totalItems: 0,
      totalPages: 0,
      searchText: "",
      prescriptionDetails: [],
      isClicked: true,
    };
  },

  methods: {
    openSideBar() {
      if (this.isClicked === true) this.isClicked = false;
      else if (this.isClicked === false) this.isClicked = true;
    },
    ViewDetail(user) {
      let apiURL =
        "https://localhost:7034/api/Prescription/" + user.prescriptionId;
      axios
        .get(apiURL)
        .then((response) => {
          this.prescriptionDetails = response.data[0].prescriptionDetail;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
      this.ID = 2;
    },
    changPageNumber(page) {
      if (page == 1) {
        this.currentPage = 1;
      } else if (page == 2) {
        this.currentPage = 2;
      } else if (page == 3) {
        this.currentPage = 3;
      } else {
        this.currentPage++;
      }
      this.fetchUsers();
    },
    async fetchUsers() {
      let apiURL = "https://localhost:7034/api/Prescription/list";
      apiURL =
        "https://localhost:7034/api/Prescription/list?pageNumber=" +
        this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.prescriptions = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    addClick() {
      this.modalTitle = "Thêm mới đơn thuốc";
      this.ID = 0;
      this.doctorId = 0;
      this.createdDate = "";
      this.note = "";
      this.deleteFlag = false;
    },
    editClick(u) {
      this.modalTitle = "Sửa thông tin";
      this.ID = u.prescriptionId;
      this.doctorId = u.doctorId;
      this.createdDate = u.createdDate;
      this.note = u.note;
    },
    createClick(id) {
      if (id == 0) {
        let apiURL = "https://localhost:7034/api/Prescription";
      } else if (id == 2) {
        let apiURL = "https://localhost:7034/api/Prescription";
      }
      axios
        .post(apiURL, {
          doctorId: this.doctorId,
          note: this.note,
          deleteFlag: false,
        })
        .then((response) => {
          alert(response.data);
          this.fetchUsers();
        });
    },
    updateClick() {
      axios
        .put("https://localhost:7034/api/Prescription/" + this.ID, {
          doctorId: this.doctorId,
          createdDate: this.createdDate,
          note: this.note,
          deleteFlag: this.deleteFlag,
        })
        .then((response) => {
          alert("Update thành công!");
          this.fetchUsers();
        });
    },
    deleteClick(id) {
      if (!confirm("Bạn có chắc không ?")) {
        return;
      }
      axios
        .delete("https://localhost:7034/api/Prescription/" + id)
        .then((response) => {
          this.fetchUsers();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa đơn thuốc.";
        });
    },
    filterResults() {
      console.log(this.searchText);
      if (this.searchText) {
        this.prescriptions = this.prescriptions.filter((user) =>
          Object.values(user).some((value) =>
            value
              .toString()
              .toLowerCase()
              .includes(this.searchText.toLowerCase())
          )
        );
      } else {
        this.fetchUsers();
      }
    },
    logOut() {
      this.$router.push({ name: "Login" });
      localStorage.removeItem("userRole");
    },
  },
  mounted: function () {
    this.fetchUsers();
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
.table th,
.table td {
  min-width: 120px; /* Hoặc một giá trị phù hợp với nội dung của bạn */
  word-wrap: break-word;
}
.detailUser {
  margin-right: 40px;
  margin-bottom: 3px;
}
.input-group-text {
  margin-top: 20px;
  width: 200px;
  margin-right: 100px;
}
.input-group-text {
  border: none;
}
.form-control {
  width: 400px;
  margin-right: 80px;
}
.modal-content {
  width: 1000px;
}
.modal-body {
  width: 1000px;
}
.btnRole-container {
  margin-right: 120px;
}
.btn-primary {
  width: 150px;
  margin-right: 20px;
}
.modal-body {
  height: auto;
}
.detailUser::before {
  content: "•";
  padding-right: 8px;
  color: black;
  font-size: large;
}
</style>
