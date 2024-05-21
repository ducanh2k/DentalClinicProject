<template>
  <div class="container-Admin">
    <TheSidebar v-if="isClicked === true"></TheSidebar>
    <div class="main">
      <div class="main-header">
        <div class="title">
          <div class="title__toggle" @click="openSideBar()">
            <i class="fa-solid fa-bars fa-xl"></i>
          </div>
          <div class="title__company">Nha khoa DBMS</div>
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
              Thêm mới người dùng
            </button>
          </div>
        </div>
        <div class="range">
          <table class="table table-striped table-hover" style="height: 30%">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tên người dùng</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Email</th>
                <th scope="col">Địa chỉ</th>
                <!-- <th scope="col">Ảnh</th> -->
                <th scope="col">Mô tả</th>
                <th scope="col">Lương</th>
                <th scope="col">Vai trò</th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col" v-if="roleName == 'Doctor'"  ></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="user in users" :key="user.userId">
                <th scope="row">{{ user.userId }}</th>
                <td class="data-from-db">{{ user.name }}</td>
                <td class="data-from-db">{{ user.phone }}</td>
                <td class="data-from-db">{{ user.email }}</td>
                <td class="data-from-db">{{ user.address }}</td>
                <!-- <td class="data-from-db">{{ user.img }}</td> -->
                <td class="data-from-db">{{ user.description }}</td>
                <td class="data-from-db" v-if="user.salary != null">
                  {{ user.salary.toLocaleString("vi-VN") }}.000 VND
                </td>
                <td class="data-from-db" v-if="user.salary == null">0</td>
                <td class="data-from-db" v-if="user.roleName == 'Staff'">
                  Nhân viên
                </td>
                <td class="data-from-db" v-if="user.roleName == 'Doctor'">
                  Bác sĩ
                </td>
                <td class="data-from-db" v-if="user.roleName == 'Patient'">
                  Bệnh nhân
                </td>
                <td class="data-from-db" v-if="user.roleName == 'Admin'">
                  Quản trị viên
                </td>
                <td class="data-from-db" v-if="user.roleName == null"></td>

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
                <td
                  v-if="user.roleName == 'Doctor'"
                >
                  <button
                    type="button"
                    class="btn btn-light mr-1"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal1"
                    @click="ViewDetail(user)"
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
            Tổng số người dùng:
            <strong>{{ totalUsers }}</strong>
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
                    >Họ và Tên <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="text"
                  class="form-control"
                  v-model="name"
                  placeholder="Nhập họ và tên người dùng"
                />
              </div>
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
                  v-model="phone"
                  placeholder="Nhập số điện thoại"
                />
              </div>
              <div>
                <span class="input-group-text"
                  ><strong
                    >Email <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="text"
                  class="form-control"
                  placeholder="Nhập địa chỉ email"
                  v-model="email"
                />
              </div>
              <!-- <div>
                <span class="input-group-text"
                  ><strong>Ảnh đại diện</strong></span
                >
                <input
                  type="text"
                  class="form-control"
                  placeholder="Ảnh của người dùng"
                  v-model="img"
                />
              </div> -->
              <div v-if="ID == 0">
                <span class="input-group-text"
                  ><strong
                    >Mật khẩu <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="password"
                  class="form-control"
                  v-model="password"
                />
              </div>

              <div v-if="role != 'patient'">
                <span class="input-group-text"
                  ><strong>Lương (.000 VND)</strong></span
                >
                <input
                  type="number"
                  class="form-control"
                  placeholder="Nhập lương"
                  v-model="salary"
                />
              </div>
              <div v-if="role != 'Admin'">
                <span class="input-group-text"
                  ><strong
                    >Chức vụ <b class="star" style="color: red">*</b></strong
                  ></span
                >
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
              </div>
              <!-- <div v-if="ID != 0">
                <span class="input-group-text"
                  ><strong>Delete Flag</strong></span
                >
                <input type="text" class="form-control" v-model="deleteFlag" />
              </div> -->
              <div>
                <span class="input-group-text"><strong>Mô tả</strong></span>
                <textarea
                  placeholder="mô tả sơ lược"
                  type="text"
                  class="form-control form-Des"
                  v-model="description"
                  name=""
                  id=""
                  cols="30"
                  rows="10"
                ></textarea>
              </div>
              <div>
                <span class="input-group-text"><strong>Giới tính</strong></span>
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
              <div>
                <span class="input-group-text"
                  ><strong
                    >Ngày sinh <b class="star" style="color: red">*</b></strong
                  ></span
                >
                <input
                  type="date"
                  class="form-control"
                  placeholder="Nhập ngày sinh"
                  v-model="dob"
                />
              </div>
              <div>
                <span class="input-group-text"><strong>Địa chỉ</strong></span>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Nhập địa chỉ"
                  v-model="address"
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
                <strong>Thông tin chi tiết</strong>
              </h5>
            </div>
          </div>
          <div class="modal-body">
            <div class="input-group md-3">
              <div class="detail-container">
                <span class="input-group-text"
                  ><strong>Chứng Chỉ</strong>
                  <div class="new-detail">
                    <button
                      type="button"
                      @click="CheckActivation('-newCerti')"
                      class="btn btn-light mr-1"
                      data-bs-toggle="modal"
                      data-bs-target="#exampleModal2"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-plus-square"
                        viewBox="0 0 16 16"
                      >
                        <path
                          d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"
                        />
                        <path
                          d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"
                        />
                      </svg>
                    </button></div
                ></span>
                <div class="detailUser" v-for="d in degrees" :key="d.id">
                  {{ d.detail }}
                  <div class="edit-detail">
                    <button
                      type="button"
                      class="btn btn-light mr-1"
                      data-bs-toggle="modal"
                      data-bs-target="#exampleModal2"
                      @click="CheckActivation(d.id + '-editCerti')"
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
                  </div>
                  <div class="edit-detail">
                    <button
                      type="button"
                      @click="CheckActivation(d.id + '-deleteCerti')"
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
                  </div>
                </div>
              </div>
              <div class="detail-container">
                <span class="input-group-text"
                  ><strong>Kinh nghiệm công việc</strong>
                  <div class="new-detail">
                    <button
                      type="button"
                      @click="CheckActivation('-newEx')"
                      class="btn btn-light mr-1"
                      data-bs-toggle="modal"
                      data-bs-target="#exampleModal2"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-plus-square"
                        viewBox="0 0 16 16"
                      >
                        <path
                          d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"
                        />
                        <path
                          d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"
                        />
                      </svg>
                    </button></div
                ></span>
                <div class="detailUser" v-for="d in trainingCourse" :key="d.id">
                  {{ d.detail }}
                  <div class="edit-detail">
                    <button
                      type="button"
                      class="btn btn-light mr-1"
                      data-bs-toggle="modal"
                      data-bs-target="#exampleModal2"
                      @click="CheckActivation(d.id + '-editEx')"
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
                  </div>
                  <div class="edit-detail">
                    <button
                      type="button"
                      @click="CheckActivation(d.id + '-deleteEx')"
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
                  </div>
                </div>
              </div>
              <div class="detail-container">
                <div>
                  <span class="input-group-text"
                    ><strong>Lĩnh vực chuyên môn</strong>
                    <div class="new-detail">
                      <button
                        type="button"
                        @click="CheckActivation('-newExp')"
                        class="btn btn-light mr-1"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModal2"
                      >
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          width="16"
                          height="16"
                          fill="currentColor"
                          class="bi bi-plus-square"
                          viewBox="0 0 16 16"
                        >
                          <path
                            d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"
                          />
                          <path
                            d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"
                          />
                        </svg>
                      </button></div
                  ></span>
                  <div class="detail-container">
                    <div class="detailUser" v-for="d in experties" :key="d.id">
                      {{ d.detail }}
                      <div class="edit-detail">
                        <button
                          type="button"
                          class="btn btn-light mr-1"
                          data-bs-toggle="modal"
                          data-bs-target="#exampleModal2"
                          @click="CheckActivation(d.id + '-editExp')"
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
                      </div>
                      <div class="edit-detail">
                        <button
                          type="button"
                          @click="CheckActivation(d.id + '-deleteExp')"
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
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="detail-container">
                <div>
                  <span class="input-group-text"
                    ><strong>Ngôn ngữ</strong>
                    <div class="new-detail">
                      <button
                        type="button"
                        @click="CheckActivation('-newLang')"
                        class="btn btn-light mr-1"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModal2"
                      >
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          width="16"
                          height="16"
                          fill="currentColor"
                          class="bi bi-plus-square"
                          viewBox="0 0 16 16"
                        >
                          <path
                            d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"
                          />
                          <path
                            d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"
                          />
                        </svg>
                      </button></div
                  ></span>
                  <div class="detail-container">
                    <div class="detailUser" v-for="d in language" :key="d.id">
                      {{ d.detail }}
                      <div class="edit-detail">
                        <button
                          type="button"
                          class="btn btn-light mr-1"
                          data-bs-toggle="modal"
                          data-bs-target="#exampleModal2"
                          @click="CheckActivation(d.id + '-editLang')"
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
                      </div>
                      <div class="edit-detail">
                        <button
                          type="button"
                          @click="CheckActivation(d.id + '-deleteLang')"
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
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div
      class="modal fade"
      id="exampleModal2"
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
                <span class="input-group-text"><strong>Mô tả</strong></span>
                <textarea
                  placeholder="mô tả sơ lược"
                  type="text"
                  class="form-control form-Des"
                  v-model="detail"
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
                @click="NewDetailUser()"
                v-if="status === 0"
                class="btn btn-primary"
              >
                Lưu
              </button>

              <button
                type="button"
                @click="EditDetailUser()"
                v-if="status != 0"
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
import TheSidebar from "../TheSidebar.vue";
import axios from "axios";
export default {
  name: "Account",
  components: {
    TheSidebar,
  },
  data() {
    return {
      users: [],
      modalTitle: "",
      userId: 0,
      name: "",
      dateCreated: "",
      phone: "",
      rawPhone: "",
      email: "",
      rawEmail: "",
      img: "",
      description: "",
      salary: 0,
      roleId: 0,
      role: "",
      deleteFlag: false,
      password: "",
      gender: "",
      dob: "",
      address: "",
      ID: 0,
      currentPage: 1,
      pageSize: 10,
      totalItems: 0,
      searchText: "",
      degrees: [],
      trainingCourse: [],
      experties: [],
      language: [],
      detail: "",
      action: "",
      empId: 0,
      status: 0,
      flag: 0,
      Page1: 1,
      Page2: 2,
      Page3: 3,
      flagNext: 0,
      totalUsers: 0,
      isClicked: true,
      allUsers: [],
      tempSalary: 0,
      allUsers: [],
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.totalUsers / 10);
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
    CheckActivation(actionId) {
      this.detail = "";
      let arr = actionId.split("-");
      this.ID = arr[0];
      this.action = arr[1];
      this.status = 1;
      if (this.action === "newCerti") {
        this.modalTitle = "Thêm mới";
        this.status = 0;
      }
      if (this.action === "editCerti") {
        this.modalTitle = "Sửa thông tin";
      }
      if (this.action === "newEx") {
        this.modalTitle = "Thêm mới";
        this.status = 0;
      }
      if (this.action === "editEx") {
        this.modalTitle = "Sửa thông tin";
      }
      if (this.action === "newExp") {
        this.modalTitle = "Thêm mới";
        this.status = 0;
      }
      if (this.action === "editExp") {
        this.modalTitle = "Sửa thông tin";
      }
      if (this.action === "newLang") {
        this.modalTitle = "Thêm mới";
        this.status = 0;
      }
      if (this.action === "editLang") {
        this.modalTitle = "Sửa thông tin";
      }
      if (
        this.action === "deleteCerti" ||
        this.action === "deleteEx" ||
        this.action === "deleteExp" ||
        this.action === "deleteLang"
      ) {
        this.DeleteDetailUser(this.ID);
      }
    },
    NewDetailUser() {
      let apiUrl = "";
      if (this.action === "newCerti") {
        apiUrl = "https://localhost:7034/api/User/degree";
      }
      if (this.action === "newExp") {
        apiUrl = "https://localhost:7034/api/User/AreasOfExpertise";
      }
      if (this.action === "newEx") {
        apiUrl = "https://localhost:7034/api/User/ParticipatingTrainingCourses";
      }
      if (this.action === "newLang") {
        apiUrl = "https://localhost:7034/api/User/ForeignLanguages";
      }
      axios
        .post(apiUrl, {
          employeeId: this.empId,
          detail: this.detail,
        })
        .then((response) => {
          alert("Thêm mới thành công!");
        });
    },
    EditDetailUser() {
      let apiUrl = "";
      if (this.action === "editCerti") {
        apiUrl = "https://localhost:7034/api/User/degree/";
      }
      if (this.action === "editEx") {
        apiUrl = "https://localhost:7034/api/User/AreasOfExpertise/";
      }
      if (this.action === "editExp") {
        apiUrl =
          "https://localhost:7034/api/User/ParticipatingTrainingCourses/";
      }
      if (this.action === "editLang") {
        apiUrl = "https://localhost:7034/api/User/ForeignLanguages/";
      }
      axios
        .put(apiUrl + this.ID, {
          employeeId: this.empId,
          detail: this.detail,
        })
        .then((response) => {
          alert("Sửa thành công!");
        });
    },
    DeleteDetailUser(id) {
      let apiUrl = "";
      if (this.action === "deleteCerti") {
        apiUrl = "https://localhost:7034/api/User/degree/";
      }
      if (this.action === "deleteExp") {
        apiUrl = "https://localhost:7034/api/User/AreasOfExpertise/";
      }
      if (this.action === "deleteEx") {
        apiUrl =
          "https://localhost:7034/api/User/ParticipatingTrainingCourses/";
      }
      if (this.action === "deleteLang") {
        apiUrl = "https://localhost:7034/api/User/ForeignLanguages/";
      }
      if (!confirm("Bạn có chắc không ?")) {
        return;
      }
      console.log(apiUrl + id);
      axios
        .delete(apiUrl + id)
        .then((response) => {
          alert("Xóa thành công!");
        })
        .catch((error) => {
          this.message = "Lỗi không xóa được.";
        });
    },
    ViewDetail(user) {
      this.empId = user.userId;
      this.ID = user.userId;
      let apiURL =
        "https://localhost:7034/api/User/degree?userId=" + user.userId;
      axios
        .get(apiURL)
        .then((response) => {
          this.degrees = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
      apiURL =
        "https://localhost:7034/api/User/AreasOfExpertise?userId=" +
        user.userId;
      axios
        .get(apiURL)
        .then((response) => {
          this.experties = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
      apiURL =
        "https://localhost:7034/api/User/ForeignLanguages?userId=" +
        user.userId;
      axios
        .get(apiURL)
        .then((response) => {
          this.language = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
      apiURL =
        "https://localhost:7034/api/User/ParticipatingTrainingCourse?userId=" +
        user.userId;
      axios
        .get(apiURL)
        .then((response) => {
          this.trainingCourse = response.data;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
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
    getAllUsers1: async function () {
      try {
        let apiURL = "https://localhost:7034/api/User/doctor/list";
        const response = await axios.get(apiURL, {});
        this.allUsers = response.data;
      } catch (error) {
        console.error("Lỗi lấy dữ liệu:", error);
      }
    },
    getAllUsers: async function () {
      try {
        let apiURL = "https://localhost:7034/api/User/count";
        const response = await axios.get(apiURL, {});
        this.totalUsers = response.data;
      } catch (error) {
        console.error("Lỗi lấy dữ liệu:", error);
      }
      // let apiURL = "https://localhost:7034/api/User/count";
      // axios
      //   .get(apiURL)
      //   .then((response) => {
      //     this.totalUsers = response.data;
      //   })
      //   .catch((error) => {
      //     console.error("There has been a problem");
      //   });
    },
    fetchUsers: async function () {
      try {
        let apiURL = "https://localhost:7034/api/User/list";
        apiURL =
          "https://localhost:7034/api/User/list?pageNumber=" + this.currentPage;
        const response = await axios.get(apiURL, {});
        this.users = response.data;
      } catch (error) {
        console.error("Lỗi lấy dữ liệu:", error);
      }
      // let apiURL = "https://localhost:7034/api/User/list";
      // apiURL =
      //   "https://localhost:7034/api/User/list?pageNumber=" + this.currentPage;
      // axios
      //   .get(apiURL)
      //   .then((response) => {
      //     this.users = response.data;
      //   })
      //   .catch((error) => {
      //     console.error("There has been a problem");
      //   });
    },
    addClick() {
      this.modalTitle = "Thêm mới người dùng";
      this.ID = 0;
      this.name = "";
      this.dateCreated = "";
      this.phone = 0;
      this.email = "";
      this.img = "";
      this.description = "";
      this.salary = 0;
      this.roleId = 1;
      this.role = "Patient";
      this.password = "";
      this.dob = "";
      this.address = "";
      this.gender = true;
    },
    editClick(u) {
      this.modalTitle = "Sửa thông tin người dùng";
      this.ID = u.userId;
      this.name = u.name;
      this.dateCreated = u.dateCreated;
      this.phone = u.phone;
      this.rawPhone = u.phone;
      this.email = u.email;
      this.rawEmail = u.email;
      this.img = u.img;
      this.description = u.description;
      this.salary = u.salary;
      this.roleId = u.roleId;
      this.role = u.roleName;
      this.dob = this.formatDateString2(u.dob);
      this.address = u.address;
      this.gender = u.gender;
    },
    isNumber(value) {
      return typeof value === "number" && !isNaN(value);
    },
    validateEmail(email) {
      const re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      return re.test(email);
    },
    isEmailExists(email, userList) {
      return userList.some((user) => user.email === email);
    },
    isPhoneExists(phone, userList) {
      return userList.some((user) => user.phone == phone);
    },
    createClick() {
      if (this.role == "doctor") {
        this.roleId = 3;
      } else if (this.role == "staff") {
        this.roleId = 2;
      } else {
        this.roleId = 4;
      }
      if (this.gender === "true") {
        this.gender = true;
      } else {
        this.gender = false;
      }
      console.log(this.role + " " + this.dob);
      if (this.name == "") {
        alert("Tên không được để trống!");
        return;
      } else if (this.phone == "") {
        alert("Số điện thoại không được để trống!");
        return;
      } else if (this.phone.trim().length !== 10) {
        alert("Số điện thoại phải đủ 10 chữ số!");
        return;
      } else if (!/^\d+$/.test(this.phone)) {
        alert("Số điện thoại không bao gồm kí tự khác ngoài số!");
        return;
        // } else if (this.isPhoneExists(this.phone, this.allUsers)) {
        //   alert("Số điện thoại đã tồn tại!");
        //   return;
        // } else if (this.isEmailExists(this.email, this.allUsers)) {
        //   alert("Địa chỉ email đã tồn tại!");
        //   return;
      } else if (this.email == "") {
        alert("Email không được để trống!");
        return;
      } else if (!this.validateEmail(this.email)) {
        alert("Email sai định dạng!");
        return;
      } else if (this.password == "") {
        alert("Mật khẩu không được để trống!");
        return;
      } else if (this.role == "") {
        alert("Người dùng phải có vai trò trong hệ thống!");
        return;
      } else if (this.dob == "") {
        alert("Người dùng phải có ngày sinh!");
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
        .post("https://localhost:7034/api/User", {
          email: this.email,
          roleId: this.roleId,
          password: this.password,
          name: this.name,
          phone: this.phone,
          img: this.img,
          description: this.description,
          gender: this.gender,
          address: this.address,
          dob: this.formatDateString2(this.dob),
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
    updateClick() {
      if (this.role == "doctor") {
        this.roleId = 3;
      } else if (this.role == "staff") {
        this.roleId = 2;
      } else {
        this.roleId = 4;
      }
      if (this.name == "") {
        alert("Tên không được để trống!");
        return;
      } else if (this.phone == "") {
        alert("Số điện thoại không được để trống!");
        return;
      } else if (this.phone.trim().length !== 10) {
        alert("Số điện thoại phải đủ 10 chữ số!");
        return;
      } else if (!/^\d+$/.test(this.phone.trim())) {
        alert("Số điện thoại không bao gồm kí tự khác ngoài số!");
        return;
        // } else if (this.phone != this.rawPhone) {
        //   if (this.isPhoneExists(this.phone.trim(), this.allUsers)) {
        //     alert("Số điện thoại đã tồn tại!");
        //     return;
        //   }
        // } else if (this.email != this.rawEmail) {
        //   console.log(this.allUserser);
        //   if (this.isPhoneExists(this.email, this.allUsers)) {
        //     alert("Địa chỉ email đã tồn tại!");
        //     return;
        //   }
      } else if (!this.validateEmail(this.email)) {
        alert("Email sai định dạng!");
        return;
      } else if (this.email == "") {
        alert("Email không được để trống!");
        return;
      } else if (this.role == "") {
        alert("Người dùng phải có vai trò trong hệ thống!");
        return;
      }
      // let Salary = 0;
      // if (this.isNumber(this.salary)) {
      //   Salary = this.salary;
      //   alert(this.salary);
      // }
      // // else Salary = this.tempSalary;
      // console.log(
      //   this.name +
      //     " " +
      //     this.email +
      //     " " +
      //     this.role +
      //     " " +
      //     this.dob +
      //     " " +
      //     this.salary
      // );
      // var numberString = this.salary.replace(/\./g, "");
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
        .put("https://localhost:7034/api/User/" + this.ID, {
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
          dob: this.formatDateString2(this.dob),
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
    deleteClick(id) {
      if (!confirm("Bạn có chắc chắn muốn xóa không ?")) {
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
    filterResults() {
      if (this.searchText.includes("@")) {
        this.searchText = "";
      }
      if (this.searchText && this.searchText.trim() !== "") {
        const searchTextLower = this.searchText.trim().toLowerCase();
        this.users = this.users.filter((user) =>
          Object.values(user).some(
            (value) =>
              value !== null &&
              value !== undefined &&
              value.toString().toLowerCase().includes(searchTextLower)
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
    // this.getAllUsers1();
    if (this.searchText == "anhtdhe141741@fpt.edu.vn") {
      this.searchText = "";
    }
    this.fetchUsers();
    this.getAllUsers();
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
  display: flex;
  margin-right: 40px;
  margin-bottom: 10px;
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
  display: flex;
  justify-content: center;
  align-items: center;
  margin-left: -130px;
  width: 1100px;
}
.modal-body {
  width: 1100px;
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
.edit-detail {
  float: right;
  margin-top: -10px;
  margin-bottom: 5px;
}
.detail-container {
  /* display: flex; */
}
.addnew {
  margin-left: -5%;
}
</style>
