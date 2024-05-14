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
      <div class="main-body" style="width: 100%; overflow: auto; height: 100%">
        <div class="container rounded bg-white mt-5 mb-5">
          <div class="row">
            <div class="col-md-3 border-right">
              <div
                class="d-flex flex-column align-items-center text-center p-3 py-5"
              >
                <img
                  class="rounded-circle mt-5"
                  width="150px"
                  src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"
                /><span class="font-weight-bold">{{ name }}</span
                ><span class="text-black-50">{{ email }}</span
                ><span> </span>
                <br />

                <span class="font-weight-bold">Đổi mật khẩu</span>
                <div class="col-md-12">
                  <label class="labels">Mật khẩu cũ</label
                  ><input
                    type="text"
                    class="form-control"
                    placeholder="Nhập mật khẩu cũ"
                    value=""
                    v-model="oldPass"
                  />
                </div>
                <div class="col-md-12">
                  <label class="labels">Mật khẩu mới</label
                  ><input
                    type="text"
                    class="form-control"
                    placeholder="Nhập mật khẩu mới"
                    value=""
                    v-model="newPass"
                  />
                </div>
                <div class="col-md-12">
                  <label class="labels">Mật khẩu mới</label
                  ><input
                    type="text"
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
            <div class="col-md-5 border-right">
              <div class="p-3 py-5">
                <div
                  class="d-flex justify-content-between align-items-center mb-3"
                >
                  <h4 class="text-right">Cài đặt thông tin cá nhân</h4>
                </div>
                <div class="row mt-3">
                  <div class="col-md-12">
                    <label class="labels"
                      >Số điện thoại
                      <b class="star" style="color: red">*</b></label
                    ><input
                      type="text"
                      class="form-control"
                      placeholder="Nhập số điện thoại"
                      value=""
                      v-model="phone"
                    />
                  </div>
                  <div class="col-md-12">
                    <label class="labels">Mô tả</label
                    ><textarea
                      type="text"
                      class="form-control"
                      placeholder="Nhập Mô tả"
                      value=""
                      v-model="description"
                    ></textarea>
                  </div>
                  <!-- <div class="col-md-12">
                    <label class="labels">Lương (.000 VND)</label
                    ><input
                      type="text"
                      class="form-control"
                      placeholder="Nhập Lương"
                      value=""
                      v-model="salary"
                      disabled
                    />
                  </div> -->
                  <div class="col-md-12">
                    <span class="input-group-text"
                      ><label class="labels">Giới tính</label></span
                    >
                    <input
                      type="radio"
                      class="btn-role"
                      v-model="gender"
                      value="true"
                    />&nbsp; Nam
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input
                      type="radio"
                      class="btn-role"
                      v-model="gender"
                      value="false"
                    />&nbsp; Nữ
                  </div>
                  <div class="col-md-12">
                    <label class="labels"
                      >Ngày sinh <b class="star" style="color: red">*</b></label
                    ><input
                      type="date"
                      class="form-control"
                      placeholder="Nhập Ngày sinh"
                      value=""
                      v-model="dob"
                    />
                  </div>
                  <div class="col-md-12">
                    <label class="labels">Địa chỉ</label
                    ><input
                      type="text"
                      class="form-control"
                      placeholder="Nhập Địa chỉ"
                      value=""
                      v-model="address"
                    />
                  </div>
                  <!-- <div class="col-md-12">
                    <label class="labels">Vai trò</label>
                    <div class="btnRole-container">
                      <input
                        type="radio"
                        class="btn-role"
                        v-model="role"
                        value="Doctor"
                      />&nbsp; Bác sĩ
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input
                        type="radio"
                        class="btn-role"
                        v-model="role"
                        value="Staff"
                      />&nbsp; Nhân viên
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input
                        type="radio"
                        class="btn-role"
                        v-model="role"
                        value="Patient"
                      />&nbsp; Bệnh nhân
                    </div>
                  </div> -->
                </div>
                <!-- <div class="row mt-3">
                  <div class="col-md-6">
                    <label class="labels">Country</label
                    ><input
                      type="text"
                      class="form-control"
                      placeholder="country"
                      value=""
                    />
                  </div>
                  <div class="col-md-6">
                    <label class="labels">State/Region</label
                    ><input
                      type="text"
                      class="form-control"
                      value=""
                      placeholder="state"
                    />
                  </div>
                </div> -->
                <div class="mt-5 text-center">
                  <button
                    class="btn btn-primary profile-button"
                    @click="updateClick()"
                    type="button"
                  >
                    Lưu thông tin
                  </button>
                </div>
              </div>
            </div>
            <!-- <div class="col-md-4">
              <div class="p-3 py-5">
                <div
                  class="d-flex justify-content-between align-items-center experience"
                >
                  <span>Edit Experience</span
                  ><span class="border px-3 p-1 add-experience"
                    ><i class="fa fa-plus"></i>&nbsp;Experience</span
                  >
                </div>
                <br />
                <div class="col-md-12">
                  <label class="labels">Experience in Designing</label
                  ><input
                    type="text"
                    class="form-control"
                    placeholder="experience"
                    value=""
                  />
                </div>
                <br />
                <div class="col-md-12">
                  <label class="labels">Additional Details</label
                  ><input
                    type="text"
                    class="form-control"
                    placeholder="additional details"
                    value=""
                  />
                </div>
              </div>
            </div> -->
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
  name: "Material2",
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
      isClicked: true,
      status: "",
      flag: 0,
      Page1: 1,
      Page2: 2,
      Page3: 3,
      flagNext: 0,
      allMaterial: [],
      totalMaterials: 0,
      UserId: 0,
      user: [],
      name: "",
      email: "",
      phone: "",
      description: "",
      salary: "",
      gender: "",
      dob: "",
      address: "",
      role: "",
      roleId: 0,
      img: "",
      oldPass: "",
      newPass: "",
      newPass1: "",
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.totalMaterials / 10);
    },
  },
  methods: {
    formatDateString(isoString) {
      return format(parseISO(isoString), "dd-MM-yyyy");
    },
    formatDateString2(isoString) {
      return format(parseISO(isoString), "yyyy-MM-dd");
    },
    openSideBar() {
      if (this.isClicked === true) this.isClicked = false;
      else if (this.isClicked === false) this.isClicked = true;
    },
    CheckRole() {
      this.role = localStorage.getItem("userRole");
      this.UserId = localStorage.getItem("UserId");
    },
    changPageNumber(number) {
      this.currentPage = number;
      this.fetchMaterial();
    },
    decreasePage() {
      if (this.currentPage > 1) {
        this.currentPage--;
        if (this.currentPage % 3 === 0) {
          this.Page1 = this.currentPage - 2;
          this.Page2 = this.currentPage - 1;
          this.Page3 = this.currentPage;
        }
        this.fetchMaterial();
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
        this.fetchMaterial();
      }
    },
    async getAllMaterials() {
      let apiURL = "https://localhost:7034/api/Material/listall";
      axios
        .get(apiURL)
        .then((response) => {
          this.allMaterial = response.data;
          this.totalMaterials = response.data.length;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    async fetchMaterial() {
      let apiURL = "https://localhost:7034/api/Material/list";
      apiURL =
        "https://localhost:7034/api/Material/list?pageNumber=" +
        this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.materials = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem!");
        });
    },
    changeValue() {
      if (this.type === "true") {
        this.type === false;
      } else {
        this.type === true;
      }
      // alert(this.type);
    },
    addClick() {
      if (this.type === "true") {
        this.type = true;
      } else {
        this.type = false;
      }
      this.modalTitle = "Thêm vật tư - vật liệu";
      this.materialId = 0;
      this.materialName = "";
      this.supplier = "";
      this.unitPrice = 0;
      this.quantityInStock = 0;
      this.deleteFlag = false;
    },
    editClick(u) {
      if (u.type == true) {
        this.type = true;
      } else {
        this.type = false;
      }
      this.modalTitle = "Sửa thông tin vật tư - vật liệu";
      this.ID = u.materialId;
      this.materialName = u.materialName;
      this.supplier = u.supplier;
      this.unitPrice = u.unitPrice;
      this.quantityInStock = u.quantityInStock;
      this.deleteFlag = false;
    },
    fetchUsers: async function () {
      try {
        let apiURL = "https://localhost:7034/api/User/" + this.UserId;
        const response = await axios.get(apiURL, {});
        this.user = response.data.user;
        this.name = this.user.name;
        this.email = this.user.email;
        this.phone = this.user.phone;
        this.description = this.user.description;
        this.salary = this.user.salary;
        this.gender = this.user.gender;
        this.dob = this.formatDateString2(this.user.dob);
        this.address = this.user.address;
        this.role = this.user.roleName;
      } catch (error) {
        console.error("Lỗi lấy dữ liệu:", error);
      }
    },
    createClick() {
      if (this.materialName === "" || this.supplier === "") {
        alert("Tên vật liệu hoặc nhà cung cấp không được để trống!");
        return;
      }
      if (this.type === "true") {
        this.type = true;
      } else {
        this.type = false;
      }
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
      if (this.role == "doctor") {
        this.roleId = 3;
      } else if (this.role == "staff") {
        this.roleId = 2;
      } else {
        this.roleId = 4;
      }
      if (this.phone == "") {
        alert("Số điện thoại không được để trống!");
        return;
      } else if (this.phone.trim().length !== 10) {
        alert("Số điện thoại phải đủ 10 chữ số!");
        return;
      } else if (!/^\d+$/.test(this.phone.trim())) {
        alert("Số điện thoại không bao gồm kí tự khác ngoài số!");
        return;
      } else if (this.role == "") {
        alert("Người dùng phải có vai trò trong hệ thống!");
        return;
      }
      if (this.role == "Doctor") {
        this.roleId = 3;
      } else if (this.role == "Staff") {
        this.roleId = 2;
      } else if (this.role == "Patient") {
        this.roleId = 4;
      }
      if (this.gender == "false") {
        this.gender = false;
      } else {
        this.gender = true;
      }
      axios
        .put("https://localhost:7034/api/User/" + this.UserId, {
          name: this.name,
          phone: this.phone,
          email: this.email,
          img: this.img,
          description: this.description,
          salary: this.salary,
          roleId: this.roleId,
          roleName: this.role,
          deleteFlag: false,
          gender: this.gender,
          dob: this.dob,
          address: this.address,
        })
        .then((response) => {
          alert(response.data);
          this.fetchUsers();
        })
        .catch((error) => {
          if (error.response) {
            alert(error.response.data + "!");
          } else if (error.request) {
            alert("Error: No response received from the server");
          } else {
            alert(error.message);
          }
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
    deleteClick(id) {
      if (!confirm("Bạn có chắc chắn muốn xóa không ?")) {
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
        this.materials = this.allMaterial.filter((material) =>
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
    this.fetchUsers();
    this.getAllMaterials();
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
.addnew {
  margin-left: -5% !important;
}
.form-price {
  float: right;
  margin-right: -30px;
  margin-top: -30px;
}
body {
  background: rgb(99, 39, 120);
}

.form-control:focus {
  box-shadow: none;
  border-color: #ba68c8;
}

.profile-button {
  background: rgb(99, 39, 120);
  box-shadow: none;
  border: none;
}

.profile-button:hover {
  background: #682773;
}

.profile-button:focus {
  background: #682773;
  box-shadow: none;
}

.profile-button:active {
  background: #682773;
  box-shadow: none;
}

.back:hover {
  color: #682773;
  cursor: pointer;
}

.labels {
  font-size: 11px;
}

.add-experience:hover {
  background: #ba68c8;
  color: #fff;
  cursor: pointer;
  border: solid 1px #ba68c8;
}
</style>
