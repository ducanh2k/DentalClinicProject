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
              Thêm mới nguyên liệu
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tên</th>
                <th scope="col">Nguồn cung</th>
                <th scope="col">Giá cả</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Kiểu</th>
                <th scope="col" v-if="role === 'Admin'"></th>
                <th scope="col" v-if="role === 'Admin'"></th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="(material, index) in materials"
                :key="material.materialId"
              >
                <th scope="row">{{ index + 1 }}</th>
                <td class="data-from-db">{{ material.materialName }}</td>
                <td class="data-from-db">{{ material.supplier }}</td>
                <td class="data-from-db">{{ material.unitPrice }}</td>
                <td class="data-from-db">{{ material.quantityInStock }}</td>
                <td class="data-from-db">{{ material.type }}</td>
                <td v-if="role === 'Admin'">
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    @click="editClick(material)"
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
                    @click="deleteClick(material.materialId)"
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
          <div class="sum__staff">Tổng số nguyên liệu: <strong>10</strong></div>
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
                  ><strong>Tên vật liệu</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="materialName"
                  placeholder="Nhập tên vật liệu"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>Nhà cung ứng</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="supplier"
                  placeholder="Nhập tên nhà cung ứng"
                />
              </div>
              <div>
                <span class="input-group-text"><strong>Giá thành</strong></span>
                <input
                  type="text"
                  class="form-control"
                  v-model="unitPrice"
                  placeholder="Nhập giá thành"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>Số lượng còn lại</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="quantityInStock"
                  placeholder="Nhập số lượng"
                />
              </div>
              <div>
                <span class="input-group-text">Delete Flag</span>
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
  name: "Material",
  components: {
    TheSidebar,
  },
  data() {
    return {
      materials: [], // Data property to store the servicers data
      modalTitle: "",
      materialId: 0,
      materialName: "",
      supplier: "",
      unitPrice: 0,
      quantityInStock: 0,
      type: true,
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
      this.fetchMaterial();
    },
    async fetchMaterial() {
      let apiURL = "https://localhost:7034/api/Material/list";
      console.log(this.currentPage);
      apiURL =
        "https://localhost:7034/api/Material/list?pageNumber=" +
        this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.materials = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    addClick() {
      this.modalTitle = "Thêm người dùng";
      this.materialId = 0;
      this.materialName = "";
      this.supplier = "";
      this.unitPrice = 0;
      this.quantityInStock = 0;
      this.type = true;
      this.deleteFlag = false;
    },
    editClick(u) {
      this.modalTitle = "Sửa thông tin người dùng";
      this.ID = u.materialId;
      this.materialName = u.materialName;
      this.supplier = u.supplier;
      this.unitPrice = u.unitPrice;
      this.quantityInStock = u.quantityInStock;
      this.type = u.type;
      this.deleteFlag = u.deleteFlag;
    },
    createClick() {
      axios
        .post("https://localhost:7034/api/Material", {
          materialName: this.materialName,
          supplier: this.supplier,
          unitPrice: this.unitPrice,
          quantityInStock: this.quantityInStock,
          type: this.type,
          deleteFlag: false,
        })
        .then((response) => {
          alert(response.data);
          this.fetchMaterial();
        });
    },
    updateClick() {
      axios
        .put("https://localhost:7034/api/Material/" + this.ID, {
          materialId: this.ID,
          materialName: this.materialName,
          supplier: this.supplier,
          unitPrice: this.unitPrice,
          quantityInStock: this.quantityInStock,
          type: this.type,
          deleteFlag: this.deleteFlag,
        })
        .then((response) => {
          alert("Update thành công!");
          this.fetchMaterial();
        });
    },
    deleteClick(id) {
      if (!confirm("Bạn có chắc không ?")) {
        return;
      }
      axios
        .delete("https://localhost:7034/api/Material/" + id)
        .then((response) => {
          this.fetchMaterial();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa nguyên liệu";
        });
    },
    filterResults() {
      console.log(this.searchText);
      if (this.searchText) {
        this.materials = this.materials.filter((material) =>
          Object.values(material).some((value) =>
            value
              .toString()
              .toLowerCase()
              .includes(this.searchText.toLowerCase())
          )
        );
      } else {
        this.fetchMaterial();
      }
    },
    logOut() {
      this.$router.push({ name: "Login" });
      localStorage.removeItem("userRole");
    },
  },
  mounted: function () {
    this.fetchMaterial();
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
  min-width: 120px;
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
.modal-body {
  height: auto;
}
.btn-primary {
  width: 150px;
  margin-right: 20px;
}
</style>
