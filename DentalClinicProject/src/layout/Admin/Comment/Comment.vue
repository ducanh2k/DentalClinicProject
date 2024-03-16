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
          <!-- <div class="addnew">
            <button
              class="button-create"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
              @click="addClick()"
            >
              Thêm mới bình luận
            </button>
          </div> -->
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tên người dùng</th>
                <th scope="col">Nội dung</th>
                <th scope="col">Tạo ngày</th>
                <!-- <th scope="col"></th> -->
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="p in comments" :key="p.id">
                <th scope="row">{{ p.id }}</th>
                <td class="data-from-db">{{ p.patientName }}</td>
                <td class="data-from-db">{{ p.commentDetail }}</td>
                <td class="data-from-db">{{ p.createdAt }}</td>
                <!-- <td>
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    @click="editClick(p)"
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
                </td> -->
                <td>
                  <button
                    type="button"
                    @click="deleteClick(p.id)"
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
          <div class="sum__staff">Tổng số bình luận: <strong>10</strong></div>
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
                  ><strong>Mã người dùng</strong></span
                >
                <input
                  type="number"
                  class="form-control"
                  v-model="patientId"
                  placeholder="Nhập mã người dùng"
                />
              </div>
              <div>
                <span class="input-group-text"><strong>Nội dung</strong></span>
                <input
                  type="text"
                  class="form-control"
                  v-model="commentDetail"
                  placeholder="Nhập nội dung"
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
import TheSidebar from "../TheSidebar.vue";
import "/src/css/Admin/main.css";
import axios from "axios";
export default {
  name: "Comment",
  components: { TheSidebar },
  data() {
    return {
      comments: [],
      modalTitle: "",
      id: 0,
      patientId: 0,
      commentDetail: "",
      deleteFlag: false,
      ID: 0,
      currentPage: 1,
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
      return this.users.slice(start, end);
    },
    degreesArray: {
      get() {
        return this.degrees.join("\n");
      },
      set(value) {
        this.degrees = value.split("\n");
      },
    },
  },
  methods: {
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
      let apiURL = "https://localhost:7034/api/Comment/list";
      apiURL =
        "https://localhost:7034/api/Comment/list?pageNumber=" +
        this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.comments = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    addClick() {
      this.modalTitle = "Thêm mới bình luận";
      this.ID = 0;
      this.patientId = 1;
      this.commentDetail = "";
      this.deleteFlag = false;
    },
    editClick(u) {
      this.modalTitle = "Sửa thông tin người dùng";
      this.ID = u.id;
      this.patientId = u.patientId;
      this.commentDetail = u.commentDetail;
      this.deleteFlag = u.deleteFlag;
    },
    createClick() {
      axios
        .post("https://localhost:7034/api/Comment", {
          patientId: this.patientId,
          commentDetail: this.commentDetail,
          deleteFlag: false,
        })
        .then((response) => {
          alert(response.data);
          this.fetchUsers();
        });
    },
    updateClick() {
      axios
        .put("https://localhost:7034/api/Comment/" + this.ID, {
          patientId: this.patientId,
          commentDetail: this.commentDetail,
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
        .delete("https://localhost:7034/api/Comment/" + id)
        .then((response) => {
          this.fetchUsers();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa bình luận.";
        });
    },
    filterResults() {
      console.log(this.searchText);
      if (this.searchText) {
        this.comments = this.comments.filter((user) =>
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
