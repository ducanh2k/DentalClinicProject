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
          <div class="addnew">
            <button
              class="button-create"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
              @click="addClick()"
            >
              Thêm mới hóa đơn
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tên khách hàng</th>
                <th scope="col">Tên nhân viên</th>
                <th scope="col">Ngày xuất</th>
                <th scope="col">Trạng thái</th>
                <th scope="col">Ghi chú</th>
                <th scope="col">Phương thức thanh toán</th>
                <th scope="col"></th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(invoice, index) in invoices" :key="invoice.invoiceId">
                <th scope="row">{{ index + 1 }}</th>
                <td>{{ invoice.customerName }}</td>
                <td>{{ invoice.staffName }}</td>
                <td>{{ formatDateString(invoice.date) }}</td>
                <td v-if="invoice.status === 1" style="color: burlywood">
                  Bản nháp
                </td>
                <td v-if="invoice.status === 2" style="color: green">
                  Đã thanh toán
                </td>
                <td v-if="invoice.status === 3" style="color: brown">Đã huỷ</td>
                <td>{{ invoice.comment }}</td>
                <td>{{ invoice.paymentType }}</td>
                <td>
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                    @click="editClick(invoice)"
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
                    @click="deleteClick(invoice.invoiceId)"
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
          <div class="sum__staff">Tổng số hóa đơn: <strong>10</strong></div>
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
                  ><strong>Mã khách hàng</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="customerId"
                  placeholder="Nhập mã khách hàng"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>Mã nhân viên</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="staffId"
                  placeholder="Nhập mã nhân viên"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong>Khuyến mãi</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="discount"
                  placeholder="Nhập khuyến mãi"
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
                  ><strong>Mã phương thức thanh toán</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="paymentId"
                  placeholder="Nhập mã"
                />
              </div>
              <div v-if="ID === 0">
                <span class="input-group-text"
                  ><strong>Delete Flag</strong></span
                >
                <input type="text" class="form-control" v-model="deleteFlag" />
              </div>
              <div>
                <span class="input-group-text"><strong>Ghi chú</strong></span>
                <textarea
                  type="text"
                  class="form-control form-Des"
                  v-model="comment"
                  name=""
                  id=""
                  cols="30"
                  rows="10"
                  placeholder="ghi chú ngắn gọn"
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
  name: "Service",
  components: { TheSidebar },
  data() {
    return {
      invoices: [],
      modalTitle: "",
      invoiceId: 0,
      customerId: 0,
      staffId: 0,
      date: "",
      discount: 0,
      status: 0,
      comment: "",
      paymentId: 0,
      deleteFlag: false,
      ID: 0,
      currentPage: 1,
      searchText: "",
      isClicked: true,
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
      this.fetchInvoices();
    },
    async fetchInvoices() {
      let apiURL = "https://localhost:7034/api/Invoice/list";
      apiURL =
        "https://localhost:7034/api/Invoice/list?pageNumber=" +
        this.currentPage;
      axios
        .get(apiURL)
        .then((response) => {
          this.invoices = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    addClick() {
      this.modalTitle = "Thêm hóa đơn";
      this.ID = 0;
      this.invoiceId = 0;
      this.customerId = 0;
      this.staffId = 0;
      this.discount = 0;
      this.status = 0;
      this.comment = 0;
      this.paymentId = 0;
      this.deleteFlag = false;
    },
    editClick(u) {
      this.modalTitle = "Sửa hóa đơn";
      this.ID = u.invoiceId;
      this.customerId = u.customerId;
      this.staffId = u.staffId;
      this.discount = u.discount;
      this.status = u.status;
      this.comment = u.comment;
      this.paymentId = u.paymentId;
      this.deleteFlag = u.deleteFlag;
    },
    createClick() {
      axios
        .post("https://localhost:7034/api/Invoice", {
          customerId: this.customerId,
          staffId: this.staffId,
          discount: this.discount,
          status: this.status,
          comment: this.comment,
          paymentId: this.paymentId,
          deleteFlag: false,
        })
        .then((response) => {
          alert(response.data);
          this.fetchInvoices();
        });
    },
    updateClick() {
      axios
        .put("https://localhost:7034/api/Invoice/" + this.ID, {
          customerId: this.customerId,
          staffId: this.staffId,
          discount: this.discount,
          status: this.status,
          comment: this.comment,
          paymentId: this.paymentId,
          deleteFlag: this.deleteFlag,
        })
        .then((response) => {
          alert("Update thành công!");
          this.fetchInvoices();
        });
    },
    deleteClick(id) {
      if (!confirm("Bạn có chắc không ?")) {
        return;
      }
      axios
        .delete("https://localhost:7034/api/Invoice/" + id)
        .then((response) => {
          this.fetchInvoices();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa hóa đơn.";
        });
    },
    filterResults() {
      if (this.searchText) {
        this.invoices = this.invoices.filter((invoice) =>
          Object.values(invoice).some((value) =>
            value
              .toString()
              .toLowerCase()
              .includes(this.searchText.toLowerCase())
          )
        );
      } else {
        this.fetchInvoices();
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
    this.fetchInvoices();
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
