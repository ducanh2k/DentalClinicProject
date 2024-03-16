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
        <!-- <AddEButton></AddEButton> -->
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
              Thêm mới thuốc
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tên thuốc</th>
                <th scope="col">Đơn vị</th>
                <th scope="col">Ngày hết hạn</th>
                <th scope="col">Ngày sản xuất</th>
                <th scope="col">Giá</th>
                <th scope="col">Số lượng hiện tại</th>
                <th scope="col">Liều lượng</th>
                <th scope="col">Mô tả</th>
                <th scope="col" v-if="role === 'Admin'"></th>
                <th scope="col" v-if="role === 'Admin'"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(medicine, index) in medicines" :key="medicine.id">
                <th scope="row">{{ index + 1 }}</th>
                <td class="data-from-db">{{ medicine.name }}</td>
                <td class="data-from-db">{{ medicine.manufacturer }}</td>
                <td class="data-from-db">{{ medicine.expiryDate }}</td>
                <td class="data-from-db">{{ medicine.inputDay }}</td>
                <td class="data-from-db">{{ medicine.price }}</td>
                <td class="data-from-db">{{ medicine.quantityInStock }}</td>
                <td class="data-from-db">{{ medicine.dosage }}</td>
                <td class="data-from-db">{{ medicine.description }}</td>
                <td v-if="role === 'Admin'">
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    @click="editClick(medicine)"
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
                    @click="deleteClick(medicine.id)"
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
            Tổng số thuốc: <strong>{{ this.medicines.length }}</strong>
          </div>
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
                <span class="input-group-text"><strong>Tên thuốc</strong></span>
                <input
                  type="text"
                  class="form-control"
                  v-model="name"
                  placeholder="Nhập tên thuốc"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>Đơn vị sản xuất</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="manufacturer"
                  placeholder="Nhập đơn vị sản xuất"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>Ngày hết hạn</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="expiryDate"
                  placeholder="Nhập ngày hết hạn"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>ngày sản xuất</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="inputDay"
                  placeholder="Nhập ngày sản xuất"
                />
              </div>
              <div>
                <span class="input-group-text"><strong>Giá thành</strong></span>
                <input
                  type="text"
                  class="form-control"
                  v-model="price"
                  placeholder="Nhập giá thành"
                />
              </div>

              <div>
                <span class="input-group-text"><strong>Số lượng</strong></span>
                <input
                  type="text"
                  class="form-control"
                  v-model="quantityInStock"
                  placeholder="Nhập số lượng"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>Liều lượng</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="dosage"
                  placeholder="Nhập liều lượng"
                />
              </div>
              <div v-if="ID != 0">
                <span class="input-group-text"
                  ><strong>Delete Flag</strong></span
                >
                <input type="text" class="form-control" v-model="deleteFlag" />
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
                  placeholder="Mô tả ngắn gọn"
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
import TheSidebar from "../TheSidebar.vue";
import axios from "axios";
export default {
  name: "Account",
  components: { TheSidebar },
  data() {
    return {
      medicines: [], // Data property to store the servicers data
      modalTitle: "",
      id: 0,
      name: "",
      manufacturer: "",
      expiryDate: "",
      inputDay: "",
      price: 0,
      quantityInStock: 0,
      dosage: "",
      description: "",
      deleteFlag: false,
      ID: 0,
      currentPage: 1,
      searchText: "",
      role: "",
    };
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
      this.fetchMedicines();
    },
    async fetchMedicines() {
      let apiURL = "https://localhost:7034/api/Medicine/list";
      console.log(this.currentPage);
      apiURL =
        "https://localhost:7034/api/Medicine/list?pageNumber=" +
        this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.medicines = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    addClick() {
      this.modalTitle = "Thêm thuốc mới";
      this.ID = 0;
      this.name = "";
      this.manufacturer = "";
      this.expiryDate = "";
      this.inputDay = "";
      this.price = "";
      this.quantityInStock = "";
      this.dosage = "";
      this.description = "";
      this.deleteFlag = false;
    },
    editClick(u) {
      this.modalTitle = "Sửa thông tin thuốc";
      this.ID = u.id;
      this.name = u.name;
      this.manufacturer = u.manufacturer;
      this.expiryDate = u.expiryDate;
      this.inputDay = u.inputDay;
      this.price = u.price;
      this.quantityInStock = u.quantityInStock;
      this.dosage = u.dosage;
      this.description = u.description;
      this.deleteFlag = u.deleteFlag;
      console.log(this.name);
    },
    createClick() {
      axios
        .post("https://localhost:7034/api/Medicine", {
          name: this.name,
          manufacturer: this.manufacturer,
          expiryDate: this.expiryDate,
          inputDay: this.inputDay,
          price: this.price,
          quantityInStock: this.quantityInStock,
          dosage: this.dosage,
          description: this.description,
          deleteFlag: false,
        })
        .then((response) => {
          alert(response.data);
          this.fetchMedicines();
        });
    },
    updateClick() {
      axios
        .put("https://localhost:7034/api/Medicine/" + this.ID, {
          // userId: this.userId,
          name: this.name,
          manufacturer: this.manufacturer,
          expiryDate: this.expiryDate,
          inputDay: this.inputDay,
          price: this.price,
          quantityInStock: this.quantityInStock,
          dosage: this.dosage,
          description: this.description,
          deleteFlag: false,
        })
        .then((response) => {
          alert("Update thành công!");
          this.fetchMedicines();
        });
    },
    deleteClick(id) {
      if (!confirm("Bạn có chắc không ?")) {
        return;
      }
      axios
        .delete("https://localhost:7034/api/Medicine/" + id)
        .then((response) => {
          this.fetchMedicines();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa người dùng.";
        });
    },
    filterResults() {
      console.log(this.searchText);
      if (this.searchText) {
        this.medicines = this.medicines.filter((medicine) =>
          Object.values(medicine).some((value) =>
            value
              .toString()
              .toLowerCase()
              .includes(this.searchText.toLowerCase())
          )
        );
      } else {
        this.fetchMedicines();
      }
    }, 
    logOut(){
      this.$router.push({ name: "Login" });
      localStorage.removeItem("userRole");
    }
  },
  mounted: function () {
    this.fetchMedicines();
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
}
.modal-body {
  width: 1000px;
}
.btn-primary {
  width: 150px;
  margin-right: 20px;
}
.modal-body {
  height: auto;
}
</style>
