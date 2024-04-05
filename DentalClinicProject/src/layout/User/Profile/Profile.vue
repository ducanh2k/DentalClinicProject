<template>
  <div class="profile-container">
    <div class="profile-info">
      <div class="info-picture"></div>
      <div class="info-raw" v-if="userData !== null">
        Họ và tên: {{ userData.name }}
        <p class="info-inner"></p>
        Tuổi: {{ userData.dob }}
        <p class="info-inner"></p>
        Giới tính: {{ userData.gender }}
        <p class="info-inner"></p>
        Địa chỉ: {{ userData.address }}
        <p class="info-inner"></p>
        Email: {{ userData.email }}
        <p class="info-inner"></p>
        Số điện thoại: {{ userData.phone }}
        <p class="info-inner"></p>
        <p class="info-inner">Đổi mật khẩu</p>
      </div>
    </div>
    <div class="profile-body">
      <div class="profile-header">
        <div class="mdr-name">Hồ sơ bệnh án</div>
        <div class="go-homepage" @click="goHome()">Trang chủ</div>
        <div class="log-out" @click="logOut()">Đăng xuất</div>
        <div class="diagnose-button" @click="checkDiagnose()">
          Xem chẩn đoán của bạn
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
                  <th scope="col">Nội dung khám</th>
                  <th scope="col">Bác sĩ</th>
                  <th scope="col">Đơn thuốc</th>
                  <th scope="col">Tổng thanh toán</th>
                  <th scope="col">Trang thái</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="p in profiles" :key="p.appointmentId">
                  <th scope="row">{{ p.appointmentId }}</th>
                  <td class="data-from-db">{{ p.datetime }}</td>
                  <td class="data-from-db">{{ p.serviceName }}</td>
                  <td class="data-from-db">{{ p.doctorName }}</td>
                  <td class="data-from-db">{{ p.note }}</td>
                  <td class="data-from-db">{{ p.servicePay }}</td>
                  <td class="data-from-db">{{ p.status }}</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="under-table">
            <div class="sum__staff">Tổng số lịch hẹn: <strong>10</strong></div>
            <div class="pagination">
              <li><a @click="changPageNumber(1)" class="page-1">1</a></li>
              <li><a @click="changPageNumber(2)" class="page-2">2</a></li>
              <li><a @click="changPageNumber(3)" class="page-3">3</a></li>
              <li><a @click="changPageNumber(0)" class="Next-page">Next</a></li>
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
                      ><strong>Chọn ngày</strong></span
                    >
                    <input
                      type="text"
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
    </div>
  </div>
</template>

<script>
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
      services: [],
      users: [],
      name: "",
      datetime: "",
      note: "",
      modalTitle: "Bạn muốn đặt cuộc hẹn vào ngày :",
      roleId: 0,
      role: "",
      deleteFlag: false,
      password: "",
      ID: 0,
      currentPage: 1,
      pageSize: 10,
      totalItems: 0,
      totalPages: 0,
      searchText: "",
      UserId: 0,
      userData: null,
    };
  },
  methods: {
    CheckRole() {
      this.role = localStorage.getItem("userRole");
      this.UserId = localStorage.getItem("UserId");
    },
    fetchUsers() {
      let apiURL = "https://localhost:7034/api/User/" + this.UserId;
      console.log(apiURL);
      axios
        .get(apiURL)
        .then((response) => {
          this.userData = response.data.user;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    async fetchProfiles() {
      let apiURL =
        "https://localhost:7034/api/Appointment/list/userId?userId=4";
      // +this.UserId;
      axios
        .get(apiURL)
        .then((response) => {
          this.profiles = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    filterResults() {
      console.log(this.searchText);
      if (this.searchText) {
        this.users = this.users.filter((user) =>
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
    goHome() {
      this.$router.push({ name: "Home" });
    },
    checkDiagnose() {
      this.$router.push({ name: "Diagnose" });
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
  },
};
</script>

<style scoped>
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
</style>
