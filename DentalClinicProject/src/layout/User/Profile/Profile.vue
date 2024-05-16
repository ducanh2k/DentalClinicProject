<template>
  <div class="profile-container">
    <div class="profile-info">
      <div class="info-picture"></div>
      <div class="Char" style="margin-top: -100%; margin-left: -2%">
        {{ firstChar }}
      </div>
      <div class="info-raw" v-if="userData !== null">
        <p class="info-inner">Họ và tên: {{ userData.name }}</p>

        <p class="info-inner">
          Ngày sinh: {{ formatDateString(userData.dob) }}
        </p>

        <p class="info-inner" v-if="userData.gender == true">Giới tính: Nam</p>
        <p class="info-inner" v-if="userData.gender == false">Giới tính: Nữ</p>

        <p class="info-inner">Địa chỉ: {{ userData.address }}</p>

        <p class="info-inner">Email: {{ userData.email }}</p>

        <p class="info-inner">Số điện thoại: {{ userData.phone }}</p>

        <!-- <p class="info-inner">Đổi mật khẩu</p> -->
        <div class="d-grid">
          <button
            class="btn btn-dark btn-lg"
            @click="changPassClick()"
            data-bs-toggle="modal"
            data-bs-target="#exampleModalChangePass"
          >
            Đổi mật khẩu
          </button>
        </div>
      </div>
    </div>
    <div class="profile-body">
      <div class="profile-header">
        <div class="mdr-name">Danh sách lịch hẹn</div>
        <div class="go-homepage" @click="goHome()">Trang chủ</div>
        <div class="log-out" @click="logOut()">Đăng xuất</div>
        <div class="diagnose-button" @click="checkDiagnose()">
          Hồ sơ bệnh án
        </div>
      </div>
      <div class="profile-mdr">
        <div class="main-body">
          <div class="search-container">
            <input
              type="text"
              placeholder="Nhập từ khóa"
              class="search-box"
              v-model="searchText"
              @input="filterResults"
            />
            <button class="search-button" @click="filterResults">
              Tìm kiếm
            </button>
            <div class="addnew" v-if="role === 'Patient'">
              <button
                class="button-create"
                data-bs-toggle="modal"
                data-bs-target="#exampleModal"
                @click="addClick()"
                style="margin-right: -250px"
              >
                Đặt lịch hẹn
              </button>
            </div>
          </div>
          <div class="range">
            <table class="table table-striped table-hover" style="height: 30%">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Ngày khám</th>
                  <th scope="col">Số điện thoại</th>
                  <th scope="col" v-if="role !== 'Doctor'">Bác sĩ</th>
                  <th scope="col" v-if="role == 'Doctor'">Bệnh nhân</th>
                  <!-- <th scope="col">Đơn thuốc</th> -->
                  <!-- <th scope="col">Hóa đơn</th> -->
                  <th scope="col">Ghi chú</th>
                  <th scope="col">Trang thái</th>
                </tr>
              </thead>
              <tbody>
                <!-- <tr v-for="p in profiles" :key="p.appointmentId">
                  <th scope="row">{{ p.appointmentId }}</th>
                  <td class="data-from-db">{{ p.datetime }}</td>
                  <td class="data-from-db">
                    {{ p.serviceInfos[0].serviceName }}
                  </td>
                  <td class="data-from-db" v-if="role !== 'Doctor'">
                    {{ p.doctorName }}
                  </td>
                  <td class="data-from-db" v-if="role === 'Doctor'">
                    {{ p.patientName }}
                  </td>
                  <td class="data-from-db" v-if="role !== 'Doctor'">
                    {{ p.note }}
                  </td>
                  <td class="data-from-db" v-if="role !== 'Doctor'">
                    {{ p.serviceInfos[0].servicePay }}
                  </td>
                  <td class="data-from-db" v-if="role !== 'Doctor'">
                    {{ p.status }}
                  </td>
                </tr> -->
                <tr v-for="p in appointments" :key="p.appointmentId">
                  <th scope="row">{{ p.appointmentId }}</th>
                  <td class="data-from-db">
                    {{ formatDateString(p.bookingDate) }}
                  </td>
                  <td class="data-from-db">
                    {{ p.phone }}
                  </td>
                  <td class="data-from-db" v-if="role !== 'Doctor'">
                    {{ p.doctorName }}
                  </td>
                  <td class="data-from-db" v-if="role === 'Doctor'">
                    {{ p.patientName }}
                  </td>
                  <td class="data-from-db">
                    {{ p.note }}
                  </td>
                  <!-- <td class="data-from-db" v-if="role !== 'Doctor'">
                    {{ p.note }}
                  </td>
                  <td class="data-from-db" v-if="role !== 'Doctor'">
                    {{ p.bookingDate }}
                  </td> -->
                  <!-- Medicine -->
                  <!-- <td>
                    <button
                      type="button"
                      class="btn btn-light mr-1"
                      data-bs-toggle="modal"
                      data-bs-target="#exampleModalMedicine"
                      @click="CheckPre(mRecord)"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-capsule"
                        viewBox="0 0 16 16"
                      >
                        <path
                          d="M1.828 8.9 8.9 1.827a4 4 0 1 1 5.657 5.657l-7.07 7.071A4 4 0 1 1 1.827 8.9Zm9.128.771 2.893-2.893a3 3 0 1 0-4.243-4.242L6.713 5.429z"
                        />
                      </svg>
                    </button>
                  </td> -->
                  <!-- Invoice -->
                  <!-- <td>
                    <button
                      type="button"
                      class="btn btn-light mr-1"
                      data-bs-toggle="modal"
                      data-bs-target="#exampleModalInvoice"
                      @click="editInvoiceClick(mRecord)"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-cash"
                        viewBox="0 0 16 16"
                      >
                        <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4" />
                        <path
                          d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2z"
                        />
                      </svg>
                    </button>
                  </td> -->
                  <!-- <td class="data-from-db" v-if="role !== 'Doctor'">
                    {{ p.status }}
                  </td> -->
                  <td
                    class="data-from-db"
                    v-if="p.status != 1"
                    style="color: red"
                  >
                    Kết thúc
                  </td>
                  <td
                    class="data-from-db"
                    v-if="p.status == 1"
                    style="color: green"
                  >
                    Đang chờ
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="under-table">
            <div class="sum__staff">
              Tổng số lịch hẹn: <strong>{{ appCount }}</strong>
            </div>
            <div class="pagination">
              <a
                @click="decreasePage()"
                class="page-link"
                v-if="currentPage > 1"
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
        <!-- ChangePass -->
        <div
          class="modal fade"
          id="exampleModalChangePass"
          tabindex="-1"
          aria-labelledby="exampleModalLabel"
          aria-hidden="true"
        >
          <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <div class="modal-header1">
                  <h5 class="modal-title" id="exampleModalLabel">
                    <strong> {{ modalTitle }} </strong>
                  </h5>
                </div>
              </div>
              <div class="modal-body">
                <div class="input-group md-3">
                  <div class="col-md-12">
                    <label class="labels">Mật khẩu cũ</label
                    ><input
                      type="password"
                      class="form-control"
                      placeholder="Nhập mật khẩu cũ"
                      value=""
                      v-model="oldPass"
                    />
                  </div>
                  <div class="col-md-12">
                    <label class="labels">Mật khẩu mới</label
                    ><input
                      type="password"
                      class="form-control"
                      placeholder="Nhập mật khẩu mới"
                      value=""
                      v-model="newPass"
                    />
                  </div>
                  <div class="col-md-12">
                    <label class="labels">Mật khẩu mới</label
                    ><input
                      type="password"
                      class="form-control"
                      placeholder="Nhập lại mật khẩu mới"
                      value=""
                      v-model="newPass1"
                    />
                  </div>
                  <div class="mt-5 text-center">
                    <button
                      class="btn btn-primary profile-button"
                      @click="updatePassClick()"
                      type="button"
                    >
                      Lưu mật khẩu
                    </button>
                  </div>
                </div>
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
                        >Chọn ngày
                        <b class="star" style="color: red">*</b></strong
                      ></span
                    >
                    <input
                      type="date"
                      class="form-control"
                      v-model="datetime"
                      placeholder="yyyy-MM-dd"
                    />
                  </div>
                  <div>
                    <span class="input-group-text"
                      ><strong>Ghi chú</strong></span
                    >
                    <input
                      type="text"
                      class="form-control"
                      v-model="note"
                      placeholder="Nhập ghi chú"
                    />
                  </div>
                  <div>
                    <span class="input-group-text"
                      ><strong
                        >Chọn bác sĩ
                        <b class="star" style="color: red">*</b></strong
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
                        <li style="height: 200px; overflow-y: auto">
                          <a
                            class="dropdown-item"
                            v-for="user in users"
                            :key="user.userId"
                            @click.prevent="addUser(user.userId)"
                          >
                            {{ user.name }}</a
                          >
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div>
                  <button
                    type="button"
                    @click="Booking()"
                    class="btn btn-primary"
                    style="margin-right: 2%; width: 11%"
                  >
                    Lưu
                  </button>

                  <button
                    type="button"
                    class="btn btn-primary"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                    style="background-color: rgb(77, 75, 75); width: 12%"
                  >
                    Hủy
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Medicine  -->
        <div
          class="modal fade"
          id="exampleModalMedicine"
          tabindex="-1"
          aria-labelledby="exampleModalLabel"
          style="width: 100%; overflow-y: auto"
          aria-hidden="true"
        >
          <div
            class="modal-dialog modal-lg modal-dialog-centered"
            style="margin-left: 30%"
          >
            <div class="modal-content" style="width: 70%">
              <div class="modal-header">
                <div class="modal-header1">
                  <h5 class="modal-title" id="exampleModalLabel">
                    <strong>Đơn thuốc</strong>
                  </h5>
                </div>
              </div>
              <div class="modal-body" style="width: 70%">
                <div class="">
                  <div>
                    <span class="input-group-text"
                      ><strong>Mã đơn thuốc: &nbsp;&nbsp;{{ preId }} </strong>
                    </span>
                  </div>
                  <!-- <div>
                    <span class="input-group-text"
                      ><strong
                        >Tên thuốc
                        <b class="star" style="color: red">*</b></strong
                      ></span
                    >
                    <input
                      type="text"
                      class="form-control"
                      v-model="medicineName"
                      @input="fetchSuggestionsMedicine"
                    />
                    <select
                      v-if="suggestionsMedicine !== null"
                      class="form-control"
                      @click="fillMedicineName($event)"
                    >
                      <option
                        v-for="m in suggestionsMedicine"
                        :value="m.name"
                        :key="m.id"
                      >
                        {{ m.name }}
                      </option>
                    </select>
                    <button
                      type="button"
                      @click="AddMedicine()"
                      class="btn btn-primary"
                    >
                      Thêm vào danh sách
                    </button>
                  </div> -->
                  <span class="input-group-text"
                    ><strong>Đơn thuốc</strong></span
                  >
                  <ul
                    class="list-group"
                    style="
                      overflow-y: auto;
                      height: 200px;
                      width: 140%;
                      border: 1px solid gray;
                    "
                  >
                    <li
                      class="list-group-item"
                      v-for="m in listSelectedMedicine"
                      :key="m.id"
                    >
                      Tên thuốc: {{ m.name }} || Liều lượng:
                      {{ m.dosageInstruction }}

                      <button
                        type="button"
                        @click="removeMedicine(m.id)"
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
                    </li>
                  </ul>
                  <div>
                    <span class="input-group-text"
                      ><strong>Ghi chú</strong></span
                    >
                    <textarea
                      type="text"
                      class="form-control"
                      v-model="notePrescription"
                      placeholder="Nhập ghi chú"
                      style="height: 150px; width: 140%"
                    ></textarea>
                  </div>
                </div>
                <div>
                  <button
                    type="button"
                    @click="updatePreClick()"
                    class="btn btn-primary"
                  >
                    Lưu
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Invoice -->
        <div
          class="modal fade"
          id="exampleModalInvoice"
          tabindex="-1"
          aria-labelledby="exampleModalLabel"
          style="width: 100%; overflow-y: auto"
          aria-hidden="true"
        >
          <div
            class="modal-dialog modal-lg modal-dialog-centered"
            style="margin-left: 30%"
          >
            <div class="modal-content" style="width: 70%">
              <div class="modal-header">
                <div class="modal-header1">
                  <h5 class="modal-title" id="exampleModalLabel">
                    <strong>Hóa đơn</strong>
                  </h5>
                </div>
              </div>
              <div class="modal-body" style="width: 70%">
                <div class="">
                  <div>
                    <span class="input-group-text"
                      ><strong>Mã hóa đơn: &nbsp;&nbsp;{{ invoiceId }} </strong>
                    </span>
                  </div>
                  <div>
                    <span class="input-group-text"
                      ><strong>Tên bệnh nhân </strong></span
                    >
                    <input
                      type="text"
                      class="form-control"
                      v-model="customer"
                      readonly
                    />
                  </div>
                  <div>
                    <span class="input-group-text"
                      ><strong>Tên dịch vụ </strong></span
                    >
                    <input
                      type="text"
                      class="form-control"
                      v-model="service_name"
                      readonly
                    />
                  </div>
                  <div>
                    <span class="input-group-text"
                      ><strong>Tổng tiền </strong></span
                    >
                    <input
                      type="text"
                      class="form-control"
                      v-model="price"
                      readonly
                    />
                  </div>
                  <div style="width: 150%">
                    <span class="input-group-text"
                      ><strong>Trạng thái</strong></span
                    >
                    <div class="btnRole-container">
                      <input
                        type="radio"
                        class="btn-role"
                        v-model="status"
                        value="1"
                      />&nbsp; Chưa thanh toán
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input
                        type="radio"
                        class="btn-role"
                        v-model="status"
                        value="2"
                      />&nbsp; Đã thanh toán
                    </div>
                  </div>
                  <div style="display: flex">
                    <div>
                      <span class="input-group-text"
                        ><strong>Phương thức thanh toán</strong></span
                      >
                      <input
                        type="radio"
                        class="btn-role"
                        v-model="paymentId"
                        value="1"
                      />&nbsp; Tiền mặt
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input
                        type="radio"
                        class="btn-role"
                        v-model="paymentId"
                        value="2"
                      />&nbsp; Chuyển khoản
                    </div>
                  </div>
                  <div>
                    <span class="input-group-text"
                      ><strong>Ghi chú</strong></span
                    >
                    <textarea
                      type="text"
                      class="form-control"
                      v-model="comment"
                      placeholder="Nhập ghi chú"
                      style="height: 150px; width: 140%"
                    ></textarea>
                  </div>
                </div>
                <div>
                  <button
                    type="button"
                    @click="updateInvoiceClick()"
                    class="btn btn-primary"
                  >
                    Lưu
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { format, parseISO } from "date-fns";
import axios from "axios";
import "../../../css/Admin/main.css";
import User from "../../Admin/UserManagement/User.vue";
export default {
  name: "Profile",
  components: {},
  data() {
    return {
      role: "",
      profiles: [],
      appointments: [],
      services: [],
      users: [],
      listSelectedMedicine: [],
      mRecords: [],
      name: "",
      datetime: "",
      note: "",
      modalTitle: "Bạn muốn đặt cuộc hẹn vào ngày :",
      roleId: 0,
      role: "",
      deleteFlag: false,
      password: "",
      ID: 0,
      selectedService: null,
      currentPage: 1,
      pageSize: 10,
      totalItems: 0,
      totalPages: 0,
      searchText: "",
      UserId: 0,
      userData: null,
      docData: null,
      firstChar: "",
      searchText1: "",
      searchText2: "",
      serviceId: 0,
      doctorId: 0,
      appCount: 0,
      flag: 0,
      Page1: 1,
      Page2: 2,
      Page3: 3,
      flagNext: 0,
      oldPass: "",
      newPass: "",
      newPass1: "",
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.appointments.length / 10);
    },
    paginatedUsers() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.appointments.slice(start, end);
    },
  },
  methods: {
    formatDateString(isoString) {
      if (isoString == null) {
        return;
      }
      return format(parseISO(isoString), "dd-MM-yyyy");
    },
    formatDateString2(isoString) {
      return format(parseISO(isoString), "yyyy-MM-dd");
    },
    changPageNumber(number) {
      this.currentPage = number;
      this.fetchUsers();
    },
    decreasePage() {
      if (this.currentPage > 1) {
        this.currentPage--;
        if (this.currentPage % 3 === 0) {
          this.Page1 = this.currentPage - 2;
          this.Page2 = this.currentPage - 1;
          this.Page3 = this.currentPage;
        }
        this.fetchUsers();
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
        this.fetchUsers();
      }
    },
    addClick() {
      this.datetime = "";
      this.note = "";
      this.searchText2 = "";
    },
    addService(id) {
      this.serviceId = id;
    },
    changPassClick() {
      this.modalTitle = "Đổi mật khẩu";
      this.oldPass = "";
      this.newPass = "";
      this.newPass1 = "";
    },
    addUser(id) {
      this.doctorId = id;
      let apiURL = "https://localhost:7034/api/User/" + this.doctorId;

      axios
        .get(apiURL)
        .then((response) => {
          this.docData = response.data.user;
          this.searchText2 = this.docData.name;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    updatePassClick() {
      if (this.newPass.trim() != this.newPass1.trim()) {
        alert("Mật khẩu không khớp.Vui lòng nhập lại!");
        return;
      }
      axios
        .put(
          "https://localhost:7034/api/User/changePassword/" +
            this.UserId +
            "?Oldpassword=" +
            this.oldPass.trim() +
            "&Newpassword=" +
            this.newPass.trim()
        )
        .then((response) => {
          alert(response.data);
          this.fetchUsers();
        })
        .catch((error) => {
          if (error.response) {
            alert("Đã xảy ra lỗi. Vui lòng kiểm tra lại thông tin" + "!");
          } else if (error.request) {
            alert("Error: No response received from the server");
          } else {
            alert(error.message);
          }
        });
    },
    getDoctor() {
      let apiURL = "https://localhost:7034/api/User/" + this.doctorId;

      axios
        .get(apiURL)
        .then((response) => {
          this.docData = response.data.user;
          this.searchText2 = this.docData.name;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    filterResultsService() {
      if (this.searchText1) {
        this.services = this.services.filter((service) =>
          service.serviceName
            .toLowerCase()
            .includes(this.searchText1.toLowerCase())
        );
      } else {
        this.fetchServices();
      }
    },
    filterResultsUser() {
      if (this.searchText2) {
        this.users = this.users.filter((user) =>
          user.userName
            .trim()
            .toLowerCase()
            .includes(this.searchText2.trim().toLowerCase())
        );
      } else {
        this.fetchListUsers();
      }
    },
    filterResults() {
      if (this.searchText.includes("@")) {
        this.searchText = "";
      }
      if (this.searchText && this.searchText.trim() !== "") {
        const searchTextLower = this.searchText.trim().toLowerCase();
        this.appointments = this.appointments.filter((user) =>
          Object.values(user).some(
            (value) =>
              value !== null &&
              value !== undefined &&
              value.toString().toLowerCase().includes(searchTextLower)
          )
        );
      } else {
        this.fetchAppointment();
      }
    },
    CheckRole() {
      this.role = localStorage.getItem("userRole");
      this.UserId = localStorage.getItem("UserId");
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
    getDoctor() {
      let apiURL = "https://localhost:7034/api/User/" + this.UserId;

      axios
        .get(apiURL)
        .then((response) => {
          this.userData = response.data.user;
          if (this.userData !== null) {
            this.firstChar = this.userData.name.charAt(0);
          }
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    fetchUsers() {
      let apiURL = "https://localhost:7034/api/User/" + this.UserId;

      axios
        .get(apiURL)
        .then((response) => {
          this.userData = response.data.user;
          if (this.userData !== null) {
            this.firstChar = this.userData.name.charAt(0);
          }
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    // fetchAppointment() {
    //   let apiURL =
    //     "https://localhost:7034/api/Appointment/list/userId?userId=" +
    //     this.UserId;

    //   if (this.role == "Doctor") {
    //     apiURL = "https://localhost:7034/api/Appointment/listall";
    //   }
    //   axios
    //     .get(apiURL)
    //     .then((response) => {
    //       this.appointments = response.data;
    //       this.appCount = this.appointments.length;

    //       // if (this.role === "Doctor") {
    //       //   this.appointments = this.appointments.filter(
    //       //     (appointment) =>
    //       //       appointment.doctorName.toLowerCase() ===
    //       //       this.userData.name.toLowerCase()
    //       //   );
    //       // }

    //       // if (this.userData !== null) {
    //       //   this.firstChar = this.userData.name.charAt(0);
    //       // }
    //     })
    //     .catch((error) => {
    //       console.error("There has been a problem");
    //     });
    // },
    Booking() {
      if (this.datetime == "") {
        alert("Ngày đặt lịch không được để trống!");
        return;
      }

      const bookingDate = new Date(this.datetime);
      const currentDate = new Date();
      bookingDate.setHours(0, 0, 0, 0);
      currentDate.setHours(0, 0, 0, 0);

      if (bookingDate < currentDate) {
        alert("Ngày đặt lịch phải lớn hơn hoặc bằng ngày hiện tại!");
        return;
      }
      if (this.searchText2 == "" || this.doctorId == null) {
        alert("Vui lòng nhập tên bác sĩ và chọn bác sĩ tương ứng!");
        return;
      }
      let apiURL = "https://localhost:7034/api/Appointment";
      axios
        .post(apiURL, {
          patientId: this.userData.userId,
          doctorId: this.doctorId,
          bookingDate: this.datetime,
          note: this.note,
        })
        .then((response) => {
          alert("Đặt lịch thành công!");
          this.fetchProfiles();
        });
    },
    async fetchProfiles() {
      let apiURL =
        "https://localhost:7034/api/Appointment/list/userId?userId=" +
        this.UserId;
      if (this.role === "Doctor") {
        apiURL =
          "https://localhost:7034/api/Appointment/list/doctorId?doctorId=" +
          this.UserId;
      }
      axios
        .get(apiURL)
        .then((response) => {
          this.appointments = response.data;
          this.appCount = this.appointments.length;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },

    async fetchServices() {
      let apiURL = "https://localhost:7034/api/Service/list";
      axios
        .get(apiURL)
        .then((response) => {
          this.services = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    async fetchMRecords() {
      let apiURL = "https://localhost:7034/api/MedicalRecord/list";
      apiURL =
        "https://localhost:7034/api/MedicalRecord/list?pageNumber=" +
        this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.mRecords = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    fetchPreById: async function () {
      try {
        const response = await axios.get(
          "https://localhost:7034/api/Prescription/" + this.preId,
          {}
        );
        this.listPres = response.data;
        this.fetchAllMedicine();
        if (this.listPres.details) {
          this.listSelectedMedicine = this.listPres.details;
        }
      } catch (error) {
        console.error("Lỗi lấy dữ liệu:", error);
      }
    },
    selectService(service) {
      this.selectedService = services;
    },
    goHome() {
      this.$router.push({ name: "Home" });
    },
    checkDiagnose() {
      this.$router.push({ name: "userMedical" });
    },
    logOut() {
      this.$router.push({ name: "Login" });
      localStorage.removeItem("userRole");
    },
  },
  mounted: function () {
    this.CheckRole();
    this.fetchUsers();
    this.fetchProfiles();
    this.fetchServices();
    this.fetchListUsers();
    // this.fetchAppointment();
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
.profile-container {
  margin: 0;
  display: flex;
  width: 100%;
  height: 100vh;
}
.profile-info {
  color: white;
  background-color: brown;
  padding: 20px;
  width: 20%;
  height: 100vh;
}
.info-picture {
  margin-left: 8%;
  margin-bottom: 20px;
  width: 150px;
  height: 150px;
  border-radius: 50%;
  background-color: bisque;
}
.profile-body {
  width: 100%;
  height: 100%;
}
.profile-header {
  width: 100%;
  height: 10%;
  border-bottom: 1px solid gray;
}
.profile-header {
  padding: 20px;
  display: flex;
  align-items: center;
}
.mdr-name {
  cursor: pointer;
}
.log-out {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(205, 230, 230);
  width: 100px;
  height: 35px;
  cursor: pointer;
  margin-right: 10px;
  position: absolute;
  right: 0;
}
.go-homepage {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(205, 230, 230);
  width: 100px;
  height: 35px;
  cursor: pointer;
  position: absolute;
  right: 120px;
}
.diagnose-button {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(205, 230, 230);
  width: 200px;
  height: 35px;
  cursor: pointer;
  position: absolute;
  right: 230px;
}
.Char {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: -90%;
  margin-left: -10%;
  margin-bottom: 30%;
  font-size: 6rem;
  color: black;
}
.dropdown100 {
}
</style>
