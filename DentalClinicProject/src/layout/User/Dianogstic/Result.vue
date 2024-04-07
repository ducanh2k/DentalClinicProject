<template>
  <div class="result-container">
    <h1 class="cus Result-header">PHIẾU KHÁM BỆNH</h1>
    <div class="cus cusName" v-if="userData !== null">
      Họ và tên:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ userData.name }}
    </div>
    <div class="cus cusAge" v-if="userData !== null">
      Năm sinh:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ userData.dob }}
    </div>
    <div class="cus cusAddress" v-if="userData !== null">
      Địa chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ userData.address }}
    </div>
    <div class="cus cusPhone" v-if="userData !== null">
      Điện thoại:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ userData.phone }}
    </div>
    <div class="cus cusEmail" v-if="userData !== null">
      Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ userData.email }}
    </div>
    <div class="range-Result">
      <div class="table-container">
        <table>
          <tr>
            <th>Mã</th>
            <th>Triệu chứng/Chẩn đoán</th>
            <th>Thủ thuật điều trị</th>
            <th>Bác sỹ</th>
            <th>Đơn giá</th>
            <th>S.lượng</th>
            <th>K.mại</th>
            <th>Thành tiền</th>
          </tr>
          <!-- Repeat this row for each record -->
          <tr v-for="d in detailsList" :key="d.mrDetailId">
            <td>{{ d.mrDetailId }}</td>
            <td>{{ d.diagnosis }}</td>
            <td>{{ d.serviceName }}</td>
            <td>{{ d.appointments[0].doctorName }}</td>
            <td>{{ d.servicePay }}</td>
            <td>1</td>
            <td>0</td>
            <td>{{ d.servicePay }}</td>
          </tr>
        </table>
      </div>
    </div>
    <div class="result-info">
      <div class="cus cusBooking">Lịch hẹn:</div>
      <div class="result-info-left" v-for="d in detailsList" :key="d.mrDetailId">
        <div class="cusBookingContent">{{ d.appointments[0].datetime }}</div>
        <div class="cusBookingContent">-Nội dung: {{ d.appointments[0].note }}</div>
      </div>
      <div class="result-info-right">
        <div class="cusBooking">
          <strong>Tổng tiền:</strong
          >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          600.000
        </div>
        <div class="cusBooking">
          <strong>Tổng khuyến mại:</strong
          >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0
        </div>
        <div class="cusBooking">
          <strong>Nợ cũ:</strong
          >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          1.114.000
        </div>
        <div class="cusBooking">
          <strong>Đã thanh toán:</strong
          >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          0
        </div>
        <div class="cusBooking">
          <strong>Còn lại:</strong
          >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          1.714.000
        </div>
      </div>
    </div>

    <br />
    <div class="cus cusBooking">Lời dặn:</div>
    <div class="cusBookingContent">
      -Kiêng ăn uống đồ dễ gây nhiễm màu như chè, cà phê, thuốc lá, rượu vang đỏ
      ... và hạn chế dùng đồ quá cứng, quá nóng, quá lạnh sau khi tẩy trắng răng
      ít nhất 2 tuần.
    </div>
    <div class="signing">
      <div class="cusSigning">
        <div class="Signing-header">KHÁCH HÀNG</div>
        <div class="Signing-content">(Ký và ghi rõ họ tên)</div>
      </div>
      <div class="accSigning">
        <div class="Signing-header">KẾ TOÁN</div>
        <div class="Signing-content">(Ký và ghi rõ họ tên)</div>
      </div>
      <div class="docSigning">
        <div class="Signing-header">BÁC SỸ</div>
        <div class="Signing-content">(Ký và ghi rõ họ tên)</div>
      </div>
    </div>
    <button type="button" @click="backProfile()" class="btn btn-primary">
      Trở lại
    </button>
    <button
      type="button"
      @click="printResult()"
      class="btn btn-primary"
      style="margin-left: 80%"
    >
      In kết quả
    </button>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Result",
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
      selectedService: null,
      searchText: "",
      UserId: 0,
      userData: null,
      serviceId: 0,
      doctorId: 0,
      selectedMrdetailIds: [],
      detailsList: [],
    };
  },
  methods: {
    backProfile() {
      this.$router.push({ name: "Diagnose" });
    },
    CheckRole() {
      this.selectedMrdetailIds = localStorage.getItem("listMdr").split(",");
      this.role = localStorage.getItem("userRole");
      this.UserId = localStorage.getItem("UserId");
    },
    fetchUsers() {
      let apiURL = "https://localhost:7034/api/User/" + this.UserId;
      axios
        .get(apiURL)
        .then((response) => {
          this.userData = response.data.user;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    fetchDetailsForSelectedServices() {
      this.detailsList = [];
      if (!Array.isArray(this.selectedMrdetailIds)) {
        console.error(
          "selectedMrdetailIds is not an array",
          this.selectedMrdetailIds
        );
        return;
      }
      const requests = this.selectedMrdetailIds.map((id) => {
        const url = `https://localhost:7034/api/MedicalRecordDetails/${id}`;
        return axios.get(url);
      });
      Promise.all(requests)
        .then((responses) => {
          responses.forEach((response) => {
            this.detailsList.push(response.data);
          });
        })
        .catch((error) => {
          console.error("There was an error fetching the details:", error);
        });
    },
  },
  mounted: function () {
    this.CheckRole();
    this.fetchUsers();
    this.fetchDetailsForSelectedServices();
  },
};
</script>
<style scoped>
.range-Result {
  height: 100%;
}
.result-container {
  margin-left: 10%;
  margin-right: 10%;
}
.cus {
  font-weight: bold;
}
.Result-header {
  display: flex;
  justify-content: center;
  align-items: center;
}
.signing {
  margin-top: 10%;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20%;
}
.cusSigning {
  margin-right: 30%;
}
.accSigning {
  margin-right: 30%;
}
.cusSigning,
.accSigning,
.docSigning {
  text-align: center;
}
.result-info {
  margin-top: 2%;
  width: 100%;
  height: 100%;
  display: flex;
}
.result-info-right {
  margin-left: 60%;
}
.table-container {
  font-family: Arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  height: 100%;
  margin-top: 20px;
}

.table-container th,
.table-container td {
  border: 1px solid #ddd;
  text-align: left;
  padding: 8px;
}

.table-container tr:nth-child(even) {
  background-color: #f2f2f2;
}

.table-container th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #a0a0a0;
  color: white;
}
</style>
