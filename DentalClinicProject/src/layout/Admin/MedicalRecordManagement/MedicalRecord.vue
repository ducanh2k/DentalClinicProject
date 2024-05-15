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
          <div class="addnew" style="margin-left: -5%">
            <button
              class="button-create"
              data-bs-toggle="modal"
              data-bs-target="#exampleModalAddNew"
              @click="addClick()"
            >
              Thêm mới hồ sơ
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">Mã hồ sơ</th>
                <th scope="col">Bệnh nhân</th>
                <th scope="col">Mô tả</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Ngày sinh</th>
                <th scope="col">Giới tính</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="mRecord in mRecords" :key="mRecord.medicalRecordId">
                <td class="data-from-db">{{ mRecord.medicalRecordId }}</td>
                <td class="data-from-db">{{ mRecord.patientName }}</td>
                <td class="data-from-db">{{ mRecord.description }}</td>
                <td class="data-from-db">{{ mRecord.phone }}</td>
                <td class="data-from-db">
                  {{ formatDateString(mRecord.dob) }}
                </td>
                <td class="data-from-db" v-if="mRecord.gender == true">Nam</td>
                <td class="data-from-db" v-if="mRecord.gender == false">Nữ</td>
                <td class="data-from-db">{{ mRecord.address }}</td>
                <!-- Medicine -->
                <td>
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
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
                </td>
                <!-- Invoice -->
                <td>
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
                </td>
                <!-- Edit  -->
                <td>
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModalAddNew"
                    @click="editClick(mRecord)"
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
                <!-- Delete  -->
                <td>
                  <button
                    type="button"
                    @click="deleteClick(mRecord.medicalRecordId)"
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
                <!-- Details  -->
                <td>
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal1"
                    @click="ViewDetail(mRecord)"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-card-text"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"
                      />
                      <path
                        d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8m0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5"
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
            Tổng số hồ sơ: <strong>{{ totalRecords }}</strong>
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
    <!-- Addnew  -->
    <div
      class="modal fade"
      id="exampleModalAddNew"
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
              <div>
                <span class="input-group-text"
                  ><strong
                    >Số điện thoại
                    <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="phonePatient"
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
                    >Tên dịch vụ
                    <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="service_name"
                  placeholder="Nhập tên dịch vụ"
                  @input="fetchSuggestionsService"
                />
                <select
                  v-if="suggestionsService !== null"
                  class="form-control"
                  @click="fillServiceName($event)"
                >
                  <option
                    v-for="ser in suggestionsService"
                    :value="ser.serviceName"
                    :key="ser.serviceId"
                  >
                    {{ ser.serviceName }}
                  </option>
                </select>
              </div>
              <div>
                <span class="input-group-text"><strong>Mô tả </strong></span>
                <input
                  type="text"
                  class="form-control"
                  v-model="descriptionMdr"
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
              <div>
                <span class="input-group-text"
                  ><strong
                    >Tên thuốc <b class="star" style="color: red">*</b></strong
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
              </div>
              <span class="input-group-text"><strong>Đơn thuốc</strong></span>
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
                <span class="input-group-text"><strong>Ghi chú</strong></span>
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
                <span class="input-group-text"><strong>Ghi chú</strong></span>
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
    <!-- Add new Process  -->
    <div
      class="modal fade"
      id="exampleModal"
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
                <strong>{{ modalTitle }}</strong>
              </h5>
            </div>
          </div>
          <div class="modal-body" style="width: 70%">
            <div class="">
              <div>
                <span class="input-group-text"
                  ><strong
                    >Ngày khám <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="date"
                  class="form-control"
                  v-model="examinationDay"
                  placeholder="Nhập ngày khám"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong
                    >Nội dung <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <textarea
                  type="text"
                  class="form-control"
                  v-model="examinationContent"
                  placeholder="Nhập nội dung"
                  style="height: 150px; width: 140%"
                ></textarea>
              </div>
              <div>
                <span class="input-group-text"><strong>Ghi chú</strong></span>
                <textarea
                  type="text"
                  class="form-control"
                  v-model="noteProcess"
                  placeholder="Nhập ghi chú"
                  style="height: 150px; width: 140%"
                ></textarea>
              </div>
            </div>
            <div>
              <button
                type="button"
                @click="createProcessClick()"
                v-if="ID === 0"
                class="btn btn-primary"
              >
                Lưu
              </button>

              <button
                type="button"
                @click="updateProcessClick()"
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
    <!-- Process  -->
    <div
      class="modal fade"
      id="exampleModal1"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-header1">
              <h5 class="modal-title" id="exampleModalLabel">
                <strong>Quy trình</strong>
              </h5>
            </div>
            <div class="addnew newProcess">
              <button
                class="createProcess"
                data-bs-toggle="modal"
                data-bs-target="#exampleModal"
                @click="addProcessClick()"
              >
                Thêm mới quy trình
              </button>
            </div>
          </div>
          <div class="modal-body">
            <div class="input-group md-3">
              <div class="range">
                <table
                  class="table table-striped table-hover"
                  style="height: 30%"
                >
                  <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Ngày khám</th>
                      <th scope="col">Nội dung</th>
                      <th scope="col">Ghi chú</th>
                      <th scope="col"></th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="a in process" :key="a.processId">
                      <td class="data-from-db">{{ a.processId }}</td>

                      <td class="data-from-db">
                        {{ formatDateString(a.examinationDay) }}
                      </td>
                      <td class="data-from-db">{{ a.examinationContent }}</td>
                      <td class="data-from-db">{{ a.note }}</td>
                      <td v-if="role === 'Admin'">
                        <button
                          type="button"
                          class="btn btn-light mr-1"
                          data-bs-toggle="modal"
                          data-bs-target="#exampleModal"
                          @click="editProcessClick(a)"
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
                          @click="deleteProcessClick(a.processId)"
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
  name: "MedicalRecord",
  components: { TheSidebar },
  data() {
    return {
      role: "",
      mRecords: [],
      mrDetails: [],
      modalTitle: "",
      medicalRecordId: 0,
      ID: 0,
      currentPage: 1,
      pageSize: 10,
      totalItems: 0,
      totalPages: 0,
      searchText: "",
      medicalRecordDetailId: 0,
      employeeId: 0,
      employeeName: "",
      patientId: 0,
      patientName: "",
      doctorId: 0,
      doctorName: "",
      serviceId: 0,
      serviceName: "",
      servicePay: "",
      prescriptionId: 0,
      datetime: "",
      note: "",
      status: "",
      deleteFlag: false,
      appointmentDetailsList: [],
      appointmentIds: [],
      isClicked: true,
      patientPhone: 0,
      suggestions: [],
      serviceName: "",
      AllService: [],
      service_name: "",
      listServices: [],
      suggestionsService: [],
      invoices: [],
      invoiceId: 0,
      invoiceDate: "",
      paymentId: 0,
      payment: "",
      status: 0,
      comment: "",
      customer: "",
      phonePatient: 0,
      Patient: [],
      process: [],
      mrId: 0,
      noteProcess: "",
      examinationDay: "",
      examinationContent: "",
      meId: 0,
      medicineName: "",
      suggestionsMedicine: [],
      listMedicine: [],
      listSelectedMedicine: [],
      confirmation: 0,
      notePrescription: "",
      listPreId: [],
      preId: 0,
      listPres: [],
      ListPres2: [],
      descriptionMdr: "",
      price: 0,
      flag: 0,
      Page1: 1,
      Page2: 2,
      Page3: 3,
      flagNext: 0,
      totalRecords: 0,
    };
  },
  computed: {
    totalPages() {
      if (this.totalRecords >= 10) return Math.ceil(this.totalRecords / 10);
      else return 1;
    },
    paginatedUsers() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.mRecords.slice(start, end);
    },
  },
  methods: {
    formatDateString(isoString) {
      if (isoString != null) {
        return format(parseISO(isoString), "dd-MM-yyyy");
      }
      return null;
    },
    formatDateString2(isoString) {
      return format(parseISO(isoString), "yyyy-MM-dd");
    },
    fetchSuggestions() {
      let apiURL =
        "https://localhost:7034/api/User/searchphonge?phone=" +
        this.phonePatient;
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
    fetchProcess() {
      let apiURL = "https://localhost:7034/api/Process/list?mrId=" + this.mrId;
      axios
        .get(apiURL)
        .then((response) => {
          this.process = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    fetchSuggestionsService() {
      let apiURL = "https://localhost:7034/api/Service/listall";
      axios
        .get(apiURL)
        .then((response) => {
          this.suggestionsService = response.data.filter((ser) =>
            ser.serviceName
              .toLowerCase()
              .includes(this.service_name.toLowerCase())
          );
        })
        .catch((error) => {
          this.suggestionsService = null;
          console.error("There has been a problem");
        });
    },
    // medicine
    fetchSuggestionsMedicine() {
      let apiURL = "https://localhost:7034/api/Medicine/listall";
      axios
        .get(apiURL)
        .then((response) => {
          this.suggestionsMedicine = response.data.filter((m) =>
            m.name.toLowerCase().includes(this.medicineName.toLowerCase())
          );
        })
        .catch((error) => {
          this.suggestionsMedicine = null;
          console.error("There has been a problem");
        });
    },
    fetchAllMedicine: async function () {
      try {
        const response = await axios.get(
          "https://localhost:7034/api/Medicine/listall",
          {}
        );
        const allMedicines = response.data;
        if (this.listPres.details) {
          const detailsIds = this.listPres.details.map((detail) => detail.id);

          this.ListPres2 = allMedicines.filter((medicine) =>
            detailsIds.includes(medicine.id)
          );
        }
      } catch (error) {
        console.error("Lỗi lấy dữ liệu:", error);
      }
    },
    CheckPre(mRecord) {
      this.mrId = mRecord.medicalRecordId;
      if (!mRecord.prescriptionId) {
        if (
          confirm(
            "Bệnh nhân này chưa có đơn thuốc, bạn muốn tạo mới đơn thuốc không?"
          )
        ) {
          this.createPreClick();
          this.fetchMRecords();
          this.preId = mRecord.prescriptionId;
        }
      } else {
        this.preId = mRecord.prescriptionId;
        this.fetchPreById();

        $("#exampleModalMedicine").modal("show");
      }
    },
    fillMedicineName(event) {
      const selectedMedicine = event.target.value;
      this.medicineName = selectedMedicine;
      const selectedMedicineName = this.suggestionsMedicine.find(
        (m) => m.name === selectedMedicine
      );
      this.listMedicine = selectedMedicineName;
      if (this.listMedicine != null) {
        this.meId = this.listMedicine.id;
        this.medicineName = this.listMedicine.name;
      }
    },
    AddMedicine() {
      this.listSelectedMedicine.push(this.listMedicine);
    },
    AddMedicine() {
      const alreadyExists = this.listSelectedMedicine.some(
        (med) => med.id === this.listMedicine.id
      );

      if (!alreadyExists) {
        this.listSelectedMedicine.push(this.listMedicine);
      } else {
        alert("Thuốc đã tồn tại trong danh sách!");
      }
    },

    removeMedicine(itemId) {
      this.listSelectedMedicine = this.listSelectedMedicine.filter(
        (item) => item.id !== itemId
      );
    },
    fillPhoneNumber(event) {
      const selectedUserId = event.target.value;
      this.phonePatient = selectedUserId;
      const selectedPatient = this.suggestions.find(
        (patient) => patient.phone === selectedUserId
      );
      this.Patient = selectedPatient;
      this.patientId = this.Patient.userId;
      this.patientName = this.Patient.name;
    },
    fillServiceName(event) {
      const selectedService = event.target.value;
      this.service_name = selectedService;
      const selectedServiceName = this.suggestionsService.find(
        (ser) => ser.serviceName === selectedService
      );
      this.listServices = selectedServiceName;
      if (this.listServices != null) {
        this.serviceId = this.listServices.serviceId;
        this.service_name = this.listServices.serviceName;
      }
    },
    openSideBar() {
      if (this.isClicked === true) this.isClicked = false;
      else if (this.isClicked === false) this.isClicked = true;
    },
    CheckRole() {
      this.role = localStorage.getItem("userRole");
    },
    showAppointmentDetails(appointmentIds) {
      this.fetchAppointmentDetailsForEach(appointmentIds);
      console.log(appointmentIds);
      $("#appointmentModal").modal("show");
    },
    fetchPrescription() {
      let apiURL = "https://localhost:7034/api/MedicalRecordDetails/list";
      axios
        .get(apiURL)
        .then((response) => {})
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    fetchAppointment(id) {
      let apiURL = "https://localhost:7034/api/Appointment/" + id;
      axios
        .get(apiURL)
        .then((response) => {})
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    ViewDetail(mRecord) {
      this.mrId = mRecord.medicalRecordId;
      let apiURL =
        "https://localhost:7034/api/Process/list?mrId=" +
        mRecord.medicalRecordId;
      axios
        .get(apiURL)
        .then((response) => {
          this.process = response.data;
        })
        .catch((error) => {
          this.process = null;
          console.error("There has been a problem");
        });
    },

    fetchAppointmentDetailsForEach(appointmentIds) {
      const newArray = appointmentIds.map((a) => {
        return a;
      });
      this.appointmentDetailsList = [];
      newArray.forEach((appointmentId) => {
        axios
          .get(`https://localhost:7034/api/Appointment/${appointmentId}`)
          .then((response) => {
            this.appointmentDetailsList.push(response.data);
          })
          .catch((error) => {
            console.error("Error fetching appointment details:", error);
          });
      });
    },
    changPageNumber(number) {
      this.currentPage = number;
      this.fetchMRecords();
    },
    decreasePage() {
      if (this.currentPage > 1) {
        this.currentPage--;
        if (this.currentPage % 3 === 0) {
          this.Page1 = this.currentPage - 2;
          this.Page2 = this.currentPage - 1;
          this.Page3 = this.currentPage;
        }
        this.fetchMRecords();
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
        this.fetchMRecords();
      }
    },
    async getTotalRecords() {
      let apiURL = "https://localhost:7034/api/MedicalRecord/count";
      axios
        .get(apiURL)
        .then((response) => {
          this.totalRecords = response.data;
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

    addClick() {
      this.modalTitle = "Thêm mới hồ sơ bệnh án";
      this.ID = 0;
      this.patientId = "";
      this.deleteFlag = false;
      this.phonePatient = 0;
      this.serviceName = "";
      this.descriptionMdr = "";
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

    editClick(u) {
      this.modalTitle = "Sửa thông tin hồ sơ";
      this.ID = u.medicalRecordId;
      this.patientId = u.patientId;
      this.serviceId = u.serviceId;
      this.phonePatient = u.phone;
      this.service_name = u.serviceName;
      this.descriptionMdr = u.description;
    },
    editInvoiceClick: async function (u) {
      this.ID = u.medicalRecordId;
      this.invoiceId = u.invoiceId;
      this.serviceId = u.serviceId;
      this.service_name = u.serviceName;
      this.patientId = u.patientId;
      this.customer = u.patientName;
      this.deleteFlag = u.deleteFlag;
      await this.fetchInvoice();
      if (this.invoices.length > 0) {
        this.status = this.invoices[0].status;
        this.payment = this.invoices[0].paymentType;
        this.paymentId = this.invoices[0].paymentId;
        this.invoiceDate = this.invoices[0].date;
        this.comment = this.invoices[0].comment;
        this.price = this.invoices[0].price;
        this.price = this.price.toLocaleString("vi-VN") + ".000 VND";
      } else {
        console.log("No invoice found with the specified ID.");
      }
    },

    fetchInvoice: async function () {
      try {
        const response = await axios.get(
          "https://localhost:7034/api/Invoice/list",
          {}
        );
        this.invoices = response.data.filter(
          (invoice) => invoice.invoiceId === this.invoiceId
        );
        // console.log(this.invoices);
      } catch (error) {
        console.error("Error fetching invoices:", error);
      }
    },

    // Invoice
    updateInvoiceClick() {
      axios
        .put("https://localhost:7034/api/Invoice/" + this.invoiceId, {
          status: this.status,
          comment: this.comment,
          paymentId: this.paymentId,
          date: this.invoiceDate,
          serviceId: this.serviceId,
        })
        .then((response) => {
          alert("Cập nhật thành công!");
        });
    },
    addProcessClick() {
      this.modalTitle = "Thêm mới quy trình";
      this.ID = 0;
      this.examinationDay = "";
      this.examinationContent = "";
      this.noteProcess = "";
    },
    editProcessClick(u) {
      this.modalTitle = "Sửa thông tin quy trình";
      this.ID = u.processId;
      this.examinationDay = this.formatDateString2(u.examinationDay);
      this.examinationContent = u.examinationContent;
      this.noteProcess = u.note;
    },
    createClick() {
      if (this.patientId == 0) {
        alert("Vui lòng nhập số điện thoại và chọn bệnh nhân tương ứng!");
        return;
      }
      if (this.serviceId == 0) {
        alert("Vui lòng nhập tên dịch vụ và chọn dịch vụ tương ứng!");
        return;
      }
      axios
        .post("https://localhost:7034/api/MedicalRecord", {
          patientId: this.patientId,
          serviceId: this.serviceId,
          description: this.descriptionMdr,
        })
        .then((response) => {
          alert("Thêm mới hồ sơ thành công!");
          this.fetchMRecords();
        });
    },
    createPreClick() {
      axios
        .post("https://localhost:7034/api/Prescription?RecordId=" + this.mrId, {
          note: "",
          details: [],
        })
        .then((response) => {
          alert("Tạo đơn thuốc thành công!");
          this.fetchMRecords();
        });
    },
    updatePreClick() {
      const details = this.listSelectedMedicine.map((item) => {
        return { id: item.id };
      });
      axios
        .put("https://localhost:7034/api/Prescription/" + this.preId, {
          note: this.notePrescription,
          details: details,
        })
        .then((response) => {
          alert("Cập nhật đơn thuốc thành công!");
          this.fetchMRecords();
        });
    },
    createMedicine() {
      axios
        .post("https://localhost:7034/api/Prescription", {
          note: "",
        })
        .then((response) => {
          alert("Tạo đơn thuốc thành công!");
        });
    },
    createProcessClick() {
      if (this.examinationDay == "") {
        alert("Ngày đặt lịch không được để trống!");
        return;
      }
      if (this.examinationContent == "") {
        alert("Nội dung không được để trống!");
        return;
      }
      axios
        .post("https://localhost:7034/api/Process", {
          examinationDay: this.examinationDay,
          examinationContent: this.examinationContent,
          note: this.noteProcess,
          medicalRecordId: this.mrId,
        })
        .then((response) => {
          alert("Thêm mới quy trình thành công!");
          this.fetchProcess();
        });
    },
    updateProcessClick() {
      if (this.examinationDay == "") {
        alert("Ngày đặt lịch không được để trống!");
        return;
      }
      if (this.examinationContent == "") {
        alert("Nội dung không được để trống!");
        return;
      }
      axios
        .put("https://localhost:7034/api/Process/" + this.ID, {
          examinationDay: this.examinationDay,
          examinationContent: this.examinationContent,
          note: this.noteProcess,
          medicalRecordId: this.mrId,
        })
        .then((response) => {
          alert("Cập nhật thành công!");
          this.fetchProcess();
        });
    },
    deleteProcessClick(id) {
      if (!confirm("Bạn có chắc chắn muốn xóa không ?")) {
        return;
      }
      axios
        .delete("https://localhost:7034/api/Process/" + id)
        .then((response) => {
          this.fetchProcess();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa người dùng.";
        });
    },
    updateClick() {
      if (this.phonePatient == "" || this.phonePatient == 0) {
        alert("Vui lòng nhập số điện thoại và chọn bệnh nhân tương ứng!");
        return;
      }
      if (this.service_name == "") {
        alert("Vui lòng nhập tên dịch vụ và chọn dịch vụ tương ứng!");
        return;
      }
      axios
        .put("https://localhost:7034/api/MedicalRecord/" + this.ID, {
          patientId: this.patientId,
          serviceId: this.serviceId,
          description: this.descriptionMdr,
        })
        .then((response) => {
          alert("Cập nhật thành công!");
          this.fetchMRecords();
        });
    },
    //
    deleteClick(id) {
      if (!confirm("Bạn có chắc chắn muốn xóa không ?")) {
        return;
      }
      axios
        .delete("https://localhost:7034/api/MedicalRecord/" + id)
        .then((response) => {
          this.fetchMRecords();
          alert("Xóa thành công!");
        })
        .catch((error) => {
          // Handle errors
          console.error("Error:", error);
          this.message = "Lỗi xóa người dùng.";
        });
    },
    filterResults() {
      if (this.searchText && this.searchText.trim() !== "") {
        const searchTextLower = this.searchText.trim().toLowerCase();
        this.mRecords = this.mRecords.filter((user) =>
          Object.values(user).some(
            (value) =>
              value !== null &&
              value !== undefined &&
              value.toString().toLowerCase().includes(searchTextLower)
          )
        );
      } else {
        this.fetchMRecords();
      }
    },
    logOut() {
      this.$router.push({ name: "Login" });
      localStorage.removeItem("userRole");
    },
  },
  mounted: function () {
    this.fetchMRecords();
    this.CheckRole();
    this.getTotalRecords();
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
.newProcess {
  margin-left: 60%;
}
</style>
