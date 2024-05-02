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
                <th scope="col">Bệnh nhân</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Bác sĩ</th>
                <th scope="col">Ngày khám</th>
                <th scope="col">Ghi chú</th>
                <th scope="col">Trạng thái</th>
                <th
                  scope="col"
                  v-if="role === 'Admin' || role === 'Staff'"
                ></th>
                <th scope="col" v-if="role === 'Admin'"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(a, index) in appointments" :key="a.appointmentId">
                <th scope="row">{{ index + 1 }}</th>
                <td class="data-from-db">{{ a.patientName }}</td>
                <td class="data-from-db">{{ a.phone }}</td>
                <td class="data-from-db">{{ a.doctorName }}</td>
                <td class="data-from-db">
                  {{ formatDateString(a.bookingDate) }}
                </td>
                <td class="data-from-db">{{ a.note }}</td>
                <td
                  class="data-from-db"
                  style="color: blue"
                  v-if="a.status == '2'"
                >
                  Kết thúc
                </td>
                <td
                  class="data-from-db"
                  style="color: green"
                  v-if="a.status == '1'"
                >
                  Đang chờ
                </td>
                <td
                  class="data-from-db"
                  style="color: red"
                  v-if="a.status == '3'"
                >
                  Hủy
                </td>
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
          <div class="sum__staff">
            Tổng số lịch hẹn: <strong> {{ numOfApp }} </strong>
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
                    >Số điện thoại bệnh nhân
                    <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="patientPhone"
                  placeholder="Nhập số điện thoại"
                  @input="fetchSuggestions"
                />
                <select
                  v-if="suggestions !== null"
                  class="form-control"
                  @click="fillPhoneNumber($event)"
                >
                  <option
                    v-for="patient in suggestions"
                    :value="patient.phone"
                    :key="patient.userId"
                  >
                    {{ patient.name }}
                  </option>
                </select>
              </div>

              <div>
                <span class="input-group-text"
                  ><strong
                    >Bác sĩ <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <div class="dropdown100">
                  <button
                    class="btn btn-secondary dropdown-toggle"
                    type="button"
                    id="dropdownMenuButton1"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                    @click="filterResultsUser"
                  >
                    <input
                      type="text"
                      placeholder="Chọn bác sĩ"
                      class="search-box2"
                      v-model="searchText2"
                      @input="filterResultsUser"
                    />
                  </button>
                  <ul
                    class="dropdown-menu"
                    aria-labelledby="dropdownMenuButton1"
                  >
                    <li
                      style="height: 200px; overflow-y: auto"
                      v-if="users.length != 0"
                    >
                      <a
                        class="dropdown-item"
                        v-for="user in users"
                        :key="user.userId"
                        @click.prevent="addUser(user)"
                      >
                        {{ user.name }}</a
                      >
                    </li>
                  </ul>
                </div>
              </div>

              <div>
                <span class="input-group-text"
                  ><strong
                    >Ngày đặt lịch
                    <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="date"
                  class="form-control"
                  v-model="datetime"
                  placeholder="Nhập ngày đặt lịch"
                />
              </div>
              <div>
                <span class="input-group-text"><strong>Ghi chú</strong></span>
                <input
                  type="text"
                  class="form-control form-Des"
                  v-model="note"
                  placeholder="Nhập ghi chú"
                />
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
              <button
                type="button"
                @click="CancelClick()"
                v-if="status == 1"
                class="btn btn-primary"
                data-bs-dismiss="modal"
                aria-label="Close"
                style="background-color: rgb(77, 75, 75)"
              >
                Hủy lịch hẹn
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
import { format, parseISO } from "date-fns";
import axios from "axios";
import TheSidebar from "../TheSidebar.vue";
export default {
  name: "Appointment",
  components: {
    TheSidebar,
  },
  data() {
    return {
      patientId: "",
      patients: [],
      suggestions: [],
      isClicked: true,
      role: "",
      appointments: [],
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
      searchText2: "",
      suggestions: [],
      users: [],
      patientPhone: 0,
      Patient: null,
      numOfApp: 0,
      flag: 0,
      Page1: 1,
      Page2: 2,
      Page3: 3,
      allApp: [],
      flagNext: 0,
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.numOfApp / 10);
    },
    paginatedUsers() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.appointments.slice(start, end);
    },
  },
  watch: {
    patientId(newValue) {
      if (newValue.length >= 3) {
        this.fetchSuggestions(newValue);
      } else {
        this.suggestions = [];
      }
    },
  },
  methods: {
    formatDateString(isoString) {
      return format(parseISO(isoString), "dd-MM-yyyy");
    },
    formatDateString2(isoString) {
      return format(parseISO(isoString), "yyyy-MM-dd");
    },
    fetchSuggestions() {
      let apiURL =
        "https://localhost:7034/api/User/searchphonge?phone=" +
        this.patientPhone;
      axios
        .get(apiURL)
        .then((response) => {
          this.suggestions = response.data;
        })
        .catch((error) => {
          this.suggestions = null;
          console.error("There has been a problem");
        });
    },
    fillPhoneNumber(event) {
      const selectedUserId = event.target.value;
      this.patientPhone = selectedUserId;
      const selectedPatient = this.suggestions.find(
        (patient) => patient.phone === selectedUserId
      );
      this.Patient = selectedPatient;
    },
    filterResultsUser() {
      if (this.users.length == 0) {
        this.fetchListUsers();
      }
      if (this.searchText2) {
        this.users = this.users.filter((user) =>
          user.name.toLowerCase().includes(this.searchText2.toLowerCase())
        );
      } else {
        this.fetchListUsers();
      }
    },
    addUser(user) {
      this.doctorId = user.userId;
      this.searchText2 = user.name;
    },
    openSideBar() {
      if (this.isClicked === true) this.isClicked = false;
      else if (this.isClicked === false) this.isClicked = true;
    },
    CheckRole() {
      this.role = localStorage.getItem("userRole");
    },
    changPageNumber(number) {
      this.currentPage = number;
      this.fetchAppointment();
    },
    decreasePage() {
      if (this.currentPage > 1) {
        this.currentPage--;
        if (this.currentPage % 3 === 0) {
          this.Page1 = this.currentPage - 2;
          this.Page2 = this.currentPage - 1;
          this.Page3 = this.currentPage;
        }
        this.fetchAppointment();
      }
    },
    increasePage() {
      const total = this.numOfApp / 10;
      if (this.currentPage < total) {
        if (this.currentPage % 3 === 0) {
          this.Page1 += 3;
          this.Page2 += 3;
          this.Page3 += 3;
        }
        this.flag = this.currentPage;
        this.currentPage++;
        this.fetchAppointment();
      }
    },
    async fetchListUsers() {
      let apiURL = "https://localhost:7034/api/User/doctor/list";
      axios
        .get(apiURL)
        .then((response) => {
          this.users = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    async getAllAppointment() {
      let apiURL = "https://localhost:7034/api/Appointment/listall";
      axios
        .get(apiURL)
        .then((response) => {
          this.allApp = response.data;
          this.numOfApp = response.data.length;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
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
      this.modalTitle = "Thêm mới lịch hẹn";
      this.ID = 0;
      this.patientId = 0;
      this.doctorId = 0;
      this.datetime = "";
      this.note = "";
      this.deleteFlag = false;
    },
    changeValue() {
      if (this.status === "1") {
        this.status === 1;
      } else if (this.status == "2") {
        this.status === 2;
      } else if (this.status == "3") {
        this.status === 3;
      }
    },
    editClick(u) {
      this.modalTitle = "Sửa thông tin lịch hẹn";
      this.ID = u.appointmentId;
      this.patientId = u.patientId;
      this.patientPhone = u.phone;
      this.searchText2 = u.doctorName;
      this.doctorId = u.doctorId;
      this.datetime = this.formatDateString2(u.bookingDate);
      this.status = u.status;
      this.note = u.note;
    },
    createClick() {
      if (this.Patient == null) {
        alert("Vui lòng nhập số điện thoại và chọn bệnh nhân tương ứng!");
        return;
      }
      if (this.doctorId == 0) {
        alert("Vui lòng nhập tên bác si và chọn bác sĩ tương ứng!");
        return;
      }
      if (this.datetime == "") {
        alert("Ngày đặt lịch không được để trống!");
        return;
      }
      const bookingDate = new Date(this.datetime);
      const currentDate = new Date();
      bookingDate.setHours(0, 0, 0, 0);
      currentDate.setHours(0, 0, 0, 0);

      if (bookingDate <= currentDate) {
        alert("Ngày đặt lịch phải là hôm nay hoặc ngày sau đó!");
        return;
      }
      axios
        .post("https://localhost:7034/api/Appointment", {
          patientId: this.Patient.userId,
          doctorId: this.doctorId,
          bookingDate: this.datetime,
          note: this.note,
        })
        .then((response) => {
          alert(response.data);
          this.fetchAppointment();
        });
    },
    updateClick() {
      if (this.Patient == null) {
        alert("Vui lòng nhập số điện thoại và chọn bệnh nhân tương ứng!");
        return;
      }
      if (this.doctorId == 0) {
        alert("Vui lòng nhập tên bác si và chọn bác sĩ tương ứng!");
        return;
      }
      if (this.datetime == "") {
        alert("Ngày đặt lịch không được để trống!");
        return;
      }
      const bookingDate = new Date(this.datetime);
      const currentDate = new Date();
      bookingDate.setHours(0, 0, 0, 0);
      currentDate.setHours(0, 0, 0, 0);

      if (bookingDate <= currentDate) {
        alert("Ngày đặt lịch phải là hôm nay hoặc ngày sau đó!");
        return;
      }
      const idPatient = this.patientId;
      if (this.Patient !== null) {
        idPatient = this.Patient.userId;
      }
      axios
        .put("https://localhost:7034/api/Appointment/" + this.ID, {
          patientId: idPatient,
          doctorId: this.doctorId,
          bookingDate: this.datetime,
          note: this.note,
        })
        .then((response) => {
          alert(response.data);
          this.fetchAppointment();
        });
    },
    CancelClick() {
      axios
        .put("https://localhost:7034/api/Appointment/cancel/" + this.ID, {})
        .then((response) => {
          alert(response.data);
          this.fetchAppointment();
        });
    },
    deleteClick(id) {
      if (!confirm("Bạn có chắc chắn muốn xóa không ?")) {
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
        this.appointments = this.allApp.filter((a) =>
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
    logOut() {
      this.$router.push({ name: "Login" });
      localStorage.removeItem("userRole");
    },
    navigateToCurrentRoute() {
      this.$router.push("Appointment");
    },
  },
  mounted: function () {
    this.navigateToCurrentRoute();
    this.getAllAppointment();
    this.fetchAppointment();
    this.CheckRole();
    this.fetchListUsers();
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
  height: 80%;
  word-wrap: break-word;
  margin-bottom: 80%;
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
.addnew {
  margin-left: -5%;
}
</style>
