<template>
  <div class="container-Admin">
    <TheSidebar></TheSidebar>
    <div class="main">
      <div class="main-header">
        <div class="title">
          <div class="title__toggle"></div>
          <div class="title__company">Nha khoa Dentistry</div>
          <div class="exit__button"></div>
          <!-- <i class="fa-solid fa-arrow-right-from-bracket "></i> -->
        </div>
      </div>
      <div class="main-body">
        <!-- <AddEButton></AddEButton> -->
        <div class="search-container">
          <input type="text" placeholder="Nhập từ khóa" class="search-box" />
          <button class="search-button">Tìm kiếm</button>
          <div class="addnew">
            <button
              class="button-create"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
              @click="addClick()"
            >
              Thêm mới user
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">DateCreated</th>
                <th scope="col">Phone</th>
                <th scope="col">Email</th>
                <th scope="col">Img</th>
                <th scope="col">Description</th>
                <th scope="col">Salary</th>
                <th scope="col">Role</th>
                <th scope="col">Password</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(user, index) in users" :key="user.userId">
                <th scope="row">{{ index + 1 }}</th>
                <td class="data-from-db">{{ user.name }}</td>
                <td class="data-from-db">{{ user.dateCreated }}</td>
                <td class="data-from-db">{{ user.phone }}</td>
                <td class="data-from-db">{{ user.email }}</td>
                <td class="data-from-db">{{ user.img }}</td>
                <td class="data-from-db">{{ user.description }}</td>
                <td class="data-from-db">{{ user.salary }}</td>
                <td class="data-from-db">{{ user.roleName }}</td>
                <td class="data-from-db">{{ user.password }}</td>
                <td>
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    @click="editClick(user)"
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
                    @click="deleteClick(user.userId)"
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
          <div class="sum__staff">Tổng số User: <strong>14</strong></div>
          <!-- <div class="pagination">
              <li><a href="#" class="page-1">1</a></li>
              <li><a href="#" class="page-2">2</a></li>
              <li><a href="#" class="page-3">3</a></li>
              <li><a href="#" class="Next-page">Next ></a></li>
            </div> -->
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
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                {{ modalTitle }}
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
          </div>
          <div class="modal-body">
            <div class="input-group md-3">
              <div>
                <span class="input-group-text">userId</span>
                <input
                  type="text"
                  class="form-control"
                  v-model="userId"
                  readonly
                />
              </div>
              <div>
                <span class="input-group-text">Name</span>
                <input type="text" class="form-control" v-model="name" />
              </div>
              <div>
                <span class="input-group-text">DateCreated</span>
                <input type="text" class="form-control" v-model="dateCreated" />
              </div>
              <div>
                <span class="input-group-text">Phone</span>
                <input type="text" class="form-control" v-model="phone" />
              </div>
              <div>
                <span class="input-group-text">Email</span>
                <input type="text" class="form-control" v-model="email" />
              </div>
              <div>
                <span class="input-group-text">Img</span>
                <input type="text" class="form-control" v-model="img" />
              </div>
              <div>
                <span class="input-group-text">Password</span>
                <input type="text" class="form-control" v-model="password" />
              </div>

              <div>
                <span class="input-group-text">Salary</span>
                <input type="text" class="form-control" v-model="salary" />
              </div>
              <div>
                <span class="input-group-text">RoleID</span>
                <input type="number" class="form-control" v-model="roleId" />
              </div>
              <div>
                <span class="input-group-text">RoleName</span>
                <input type="text" class="form-control" v-model="role" />
              </div>
              <div>
                <span class="input-group-text">Delete Flag</span>
                <input type="text" class="form-control" v-model="deleteFlag" />
              </div>
              <div>
                <span class="input-group-text">Description</span>
                <textarea
                  type="text"
                  class="form-control form-Des"
                  v-model="description"
                  name=""
                  id=""
                  cols="30"
                  rows="10"
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
                Create User
              </button>

              <button
                type="button"
                @click="updateClick()"
                v-if="ID != 0"
                class="btn btn-primary"
              >
                Update User
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
  name: "Account",
  components: {
    TheSidebar,
  },
  data() {
    return {
      users: [], // Data property to store the servicers data
      modalTitle: "",
      userId: 0,
      name: "",
      dateCreated: "",
      phone: "",
      email: "",
      img: "",
      description: "",
      salary: 0,
      roleId: 0,
      role: "",
      deleteFlag: false,
      password: "",
      ID: 0,
    };
  },
  methods: {
    async fetchUsers() {
      axios
        .get("https://localhost:7034/api/User/list")
        .then((response) => {
          this.users = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    addClick() {
      this.modalTitle = "Thêm người dùng";
      this.ID = 0;
      this.name = "";
      this.dateCreated = "";
      this.phone = "";
      this.email = "";
      this.img = "";
      this.description = "";
      this.salary = "";
      this.roleId = 1;
      this.role = "";
      this.deleteFlag = false;
      this.password = "";
    },
    editClick(u) {
      this.modalTitle = "Sửa thông tin người dùng";
      this.ID = u.userId;
      this.name = u.name;
      this.dateCreated = u.dateCreated;
      this.phone = u.phone;
      this.email = u.email;
      this.img = u.img;
      this.description = u.description;
      this.salary = u.salary;
      this.roleId = u.roleId;
      this.role = u.roleName;
      this.deleteFlag = u.deleteFlag;
      this.password = u.password;
    },
    createClick() {
      axios
        .post("https://localhost:7034/api/User", {
          name: this.name,
          dateCreated: this.dateCreated,
          phone: this.phone,
          email: this.email,
          img: this.img,
          description: this.description,
          salary: this.salary,
          roleId: this.roleId,
          roleName: this.role,
          deleteFlag: true,
          password: this.password,
        })
        .then((response) => {
          alert(response.data);
          this.fetchUsers();
        });
    },
    updateClick() {
      axios
        .put("https://localhost:7034/api/User/" + this.ID, {
          userId: this.userId,
          name: this.name,
          dateCreated: this.dateCreated,
          phone: this.phone,
          email: this.email,
          img: this.img,
          description: this.description,
          salary: this.salary,
          roleId: this.roleId,
          roleName: this.role,
          deleteFlag: this.deleteFlag,
          password: this.password,
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
        .delete("https://localhost:7034/api/User/" + id)
        .then((response) => {
          this.fetchUsers();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa người dùng.";
        });
    },
  },
  mounted: function () {
    this.fetchUsers();
  },
};
</script>

<style scoped>
.input-group-text {
  background-color: rgb(215, 223, 230);
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
.form-control{
  margin-bottom: 10%;
}
</style>
