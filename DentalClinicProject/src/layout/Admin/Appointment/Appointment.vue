<template>
  <div class="container-Admin">
    <TheSidebar></TheSidebar>
    <div class="main">
      <div class="main-header">
        <div class="title">
          <div class="title__toggle">
            <i class="fa-solid fa-bars fa-xl"></i>
          </div>
          <div class="title__company">Nha khoa Dentistry</div>
          <div class="exit__button">
            <i class="fa-solid fa-right-from-bracket fa-xl" @click="logOut()"></i>
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
          <div class="addnew" v-if="role === 'Admin' || role === 'Staff'">
            <button
              class="button-create"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
              @click="addClick()"
            >
              Thêm mới lịch hẹn
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Nhân viên</th>
                <th scope="col">Bệnh nhân</th>
                <th scope="col">Bác sĩ</th>
                <th scope="col">Ngày tiếp nhận</th>
                <th scope="col">Ghi chú</th>
                <th scope="col">Trạng thái</th>
                <th scope="col" v-if="role === 'Admin' || role === 'Staff'"></th>
                <th scope="col" v-if="role === 'Admin'"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(a, index) in appointments" :key="a.appointmentId">
                <th scope="row">{{ index + 1 }}</th>
                <td class="data-from-db">{{ a.employeeName }}</td>
                <td class="data-from-db">{{ a.patientName }}</td>
                <td class="data-from-db">{{ a.doctorName }}</td>
                <td class="data-from-db">{{ a.datetime }}</td>
                <td class="data-from-db">{{ a.note }}</td>
                <td class="data-from-db">{{ a.status }}</td>
                <td v-if="role === 'Admin' || role === 'Staff'">
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    @click="editClick(a)"
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
                    @click="deleteClick(a.appointmentId)"
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
          <div class="sum__staff">Tổng số Appoitment: <strong>10</strong></div>
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
          <div class="modal-body">
            <div class="input-group md-3">
              <div>
                <span class="input-group-text"
                  ><strong>Mã nhân viên</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="employeeId"
                  placeholder="Nhập mã nhân viên"
                />
              </div>

              <div>
                <span class="input-group-text"
                  ><strong>Mã bệnh nhân</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="patientId"
                  placeholder="Nhập mã bệnh nhân"
                />
              </div>

              <div>
                <span class="input-group-text"><strong>Mã bác sĩ</strong></span>
                <input
                  type="text"
                  class="form-control"
                  v-model="doctorId"
                  placeholder="Nhập mã bệnh nhân"
                />
              </div>

              <div>
                <span class="input-group-text"
                  ><strong>Ngày tiếp nhận</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="datetime"
                  placeholder="Nhập ngày tiếp nhận"
                />
              </div>
              <div>
                <span class="input-group-text"><strong>Ghi chú</strong></span>
                <input
                  type="text"
                  class="form-control"
                  v-model="note"
                  placeholder="Nhập ghi chú"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>Trạng thái</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="status"
                  placeholder="Nhập trạng thái"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>Delete Flag</strong></span
                >
                <input type="text" class="form-control" v-model="deleteFlag" />
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
  name: "Appointment",
  components: { 
    TheSidebar
  },
  data() {
    return {
      role:"",
      appointments: [], // Data property to store the servicers data
      modalTitle: "",
      appointmentId: 0,
      employeeId: 0,
      patientId: 0,
      doctorId: 0,
      datetime: "",
      note: "",
      status: "",
      ID: 0,
      currentPage: 1,
      deleteFlag: false,
      pageSize: 10,
      totalItems: 0,
      totalPages: 0,
      searchText: "",
    };
  },
  computed: {
    totalPage() {
      return Math.cell(this.users.length / this.pageSize);
    },
    paginatedUsers() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.appointments.slice(start, end);
    },
  },
  methods: {
    CheckRole() {
      this.role = localStorage.getItem("userRole");
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
      this.fetchAppointment();
    },
    async fetchAppointment() {
      let apiURL = "https://localhost:7034/api/Appointment/list";
      apiURL =
        "https://localhost:7034/api/Appointment/list?pageNumber=" +
        this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.appointments = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    addClick() {
      this.modalTitle = "Thêm lịch hẹn";
      this.ID = 0;
      this.employeeId = 0;
      this.patientId = 0;
      (this.doctorId = 0), (this.datetime = "");
      this.note = "";
      this.status = "";
      this.deleteFlag = false;
    },
    editClick(u) {
      this.modalTitle = "Sửa thông tin lich hẹn";
      this.ID = u.appointmentId;
      this.employeeId = u.employeeId;
      this.patientId = u.patientId;
      (this.doctorId = u.doctorId), (this.datetime = u.datetime);
      this.note = u.note;
      this.status = u.status;
      this.deleteFlag = u.deleteFlag;
    },
    createClick() {
      axios
        .post("https://localhost:7034/api/Appointment", {
          employeeId: this.employeeId,
          patientId: this.patientId,
          doctorId: this.doctorId,
          datetime: this.datetime,
          note: this.note,
          status: this.status,
          deleteFlag: false,
        })
        .then((response) => {
          alert(response.data);
          this.fetchAppointment();
        });
    },
    updateClick() {
      axios
        .put("https://localhost:7034/api/Appointment/" + this.ID, {
          employeeId: this.employeeId,
          patientId: this.patientId,
          doctorId: this.doctorId,
          datetime: this.datetime,
          note: this.note,
          status: this.status,
          deleteFlag: this.deleteFlag,
        })
        .then((response) => {
          alert("Update thành công!");
          this.fetchAppointment();
        });
    },
    deleteClick(id) {
      if (!confirm("Bạn có chắc không ?")) {
        return;
      }
      axios
        .delete("https://localhost:7034/api/Appointment/" + id)
        .then((response) => {
          this.fetchAppointment();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa lịch hẹn.";
        });
    },
    filterResults() {
      console.log(this.appointments);
      if (this.searchText) {
        this.appointments = this.appointments.filter((a) =>
          Object.values(a).some((value) =>
            value
              .toString()
              .toLowerCase()
              .includes(this.searchText.toLowerCase())
          )
        );
      } else {
        this.fetchAppointment();
      }
    },
    logOut(){
      this.$router.push({ name: "Login" });
      localStorage.removeItem("userRole");
    }
  },
  mounted: function () {
    this.fetchAppointment();
    this.CheckRole();
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
  margin-left: -80px;
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
</style>
