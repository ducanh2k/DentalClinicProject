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
              Thêm mới tin tức
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tin tức</th>
                <th scope="col">Thông tin</th>
                <th scope="col">Nội dung</th>
                <th scope="col">Ngày tạo</th>
                <th scope="col">Kiểu</th>
                <th scope="col" v-if="role === 'Admin'"></th>
                <th scope="col" v-if="role === 'Admin'"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(News, index) in Newss" :key="News.id">
                <th scope="row">{{ index + 1 }}</th>
                <td>{{ News.tittle }}</td>
                <td>{{ News.briefInfo }}</td>
                <td>{{ News.description }}</td>
                <td>{{ formatDateString(News.createdAt) }}</td>
                <td v-if="News.featured === true">Tin nổi bật</td>
                <td v-if="News.featured === false">Tin tức</td>
                <td v-if="role === 'Admin'">
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    @click="editClick(News)"
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
                    @click="deleteClick(News.id)"
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
          <div class="sum__staff">Tổng số dịch vụ: <strong>10</strong></div>
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
                  ><strong
                    >Tiêu đề <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="tittle"
                  placeholder="Nhập tiêu đề"
                />
              </div>
              <div>
                <span class="input-group-text"><strong>Thông tin</strong></span>
                <input
                  type="text"
                  class="form-control"
                  v-model="briefInfo"
                  placeholder="Nhập thông tin"
                />
              </div>
              <div>
                <span class="input-group-text"><strong>Kiểu</strong></span>
                <div class="btnRole-container">
                  <input
                    type="radio"
                    class="btn-role"
                    v-model="type"
                    value="true"
                  />&nbsp; Tin nổi bật
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input
                    type="radio"
                    class="btn-role"
                    v-model="type"
                    value="false"
                  />&nbsp; Tin tức
                </div>
              </div>

              <div>
                <span class="input-group-text"
                  ><strong
                    >Nội dung <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <textarea
                  type="text"
                  class="form-control form-Des"
                  v-model="description"
                  name=""
                  id=""
                  cols="30"
                  rows="10"
                  placeholder="Nhập nội dung"
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
import { format, parseISO } from "date-fns";
import "/src/css/Admin/main.css";
import axios from "axios";
import TheSidebar from "../TheSidebar.vue";
export default {
  name: "News",
  components: { TheSidebar },
  data() {
    return {
      role: "",
      Newss: [],
      modalTitle: "",
      tittle: "",
      briefInfo: "",
      description: "",
      author: 0,
      createdAt: "",
      deleteFlag: false,
      feature: true,
      ID: 0,
      currentPage: 1,
      searchText: "",
      isClicked: true,
      UserId: 0,
      type: true,
    };
  },
  methods: {
    formatDateString(isoString) {
      return format(parseISO(isoString), "dd-MM-yyyy");
    },
    openSideBar() {
      if (this.isClicked === true) this.isClicked = false;
      else if (this.isClicked === false) this.isClicked = true;
    },
    CheckRole() {
      this.role = localStorage.getItem("userRole");
      this.UserId = localStorage.getItem("UserId");
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
      this.fetchNewss();
    },
    async fetchNewss() {
      let apiURL = "https://localhost:7034/api/News/list";
      apiURL =
        "https://localhost:7034/api/News/list?pageNumber=" + this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.Newss = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    addClick() {
      this.modalTitle = "Thêm tin tức";
      this.ID = 0;
      this.tittle = "";
      this.briefInfo = "";
      this.description = "";
      this.createdAt = "";
      this.deleteFlag = false;
      if (this.type === "true") {
        this.type = true;
      } else {
        this.type = false;
      }
    },
    editClick(u) {
      this.modalTitle = "Sửa tin tức";
      this.ID = u.id;
      this.tittle = u.tittle;
      this.briefInfo = u.briefInfo;
      this.description = u.description;
      this.deleteFlag = false;
      if (u.featured == true) {
        this.type = true;
      } else {
        this.type = false;
      }
      console.log(u.featured);
    },
    createClick() {
      if (this.tittle === "" || this.description === "") {
        alert("Tiêu đề hoặc nội dung không được để trống!");
        return;
      }
      if (this.type === "true") {
        this.type = true;
      } else {
        this.type = false;
      }
      console.log(this.UserId);
      axios
        .post("https://localhost:7034/api/News", {
          tittle: this.tittle,
          briefInfo: this.briefInfo,
          description: this.description,
          author: this.UserId,
          deleteFlag: false,
          featured: this.type,
          img: "string",
        })
        .then((response) => {
          alert("Thêm mới thành công!");
          this.fetchNewss();
        });
    },
    updateClick() {
      if (this.tittle === "" || this.description === "") {
        alert("Tiêu đề hoặc nội dung không được để trống!");
        return;
      }
      if (this.type === "true") {
        this.type = true;
      } else {
        this.type = false;
      }
      axios
        .put("https://localhost:7034/api/News/" + this.ID, {
          tittle: this.tittle,
          briefInfo: this.briefInfo,
          description: this.description,
          author: this.UserId,
          deleteFlag: this.deleteFlag,
          featured: this.type,
          img: "string",
        })
        .then((response) => {
          alert("Cập nhật thành công!");
          this.fetchNewss();
        });
    },
    deleteClick(id) {
      if (!confirm("Bạn có chắc chắn muốn xóa không ?")) {
        return;
      }
      axios
        .delete("https://localhost:7034/api/News/" + id)
        .then((response) => {
          this.fetchNewss();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          console.error("Error:", error);
          this.message = "Lỗi xóa tin tức.";
        });
    },
    filterResults() {
      if (this.searchText) {
        this.Newss = this.Newss.filter((News) =>
          Object.values(News).some((value) =>
            value
              .toString()
              .toLowerCase()
              .includes(this.searchText.toLowerCase())
          )
        );
      } else {
        this.fetchNewss();
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
    this.fetchNewss();
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
  width: 300%;
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
.addnew {
  margin-left: -5%;
}
</style>
