<template>
  <div class="result-container">
    <h1 class="cus Result-header">PHIẾU KHÁM BỆNH</h1>
    <div class="cus cusName">
      Họ và tên:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trần Đức Anh
    </div>
    <div class="cus cusAge">
      Năm sinh:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17/05/2000
    </div>
    <div class="cus cusAddress">
      Địa chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đinh Công, Hoàng Mai
    </div>
    <div class="cus cusPhone">
      Điện thoại:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0965316967
    </div>
    <div class="cus cusEmail">
      Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; anhtdhe141741@fpt.edu.vn
    </div>
    <div class="range-Result">
      <div class="table-container">
        <table>
          <tr>
            <th>Lần</th>
            <th>Triệu chứng/Chẩn đoán</th>
            <th>Thủ thuật điều trị</th>
            <th>Bác sỹ</th>
            <th>Đơn giá</th>
            <th>S.lượng</th>
            <th>K.mại</th>
            <th>Thành tiền</th>
          </tr>
          <!-- Repeat this row for each record -->
          <tr>
            <td>3</td>
            <td>Chẩn đoán: Abscess chế</td>
            <td>Cắt lợi bằng Laser r23</td>
            <td>THI HIEN</td>
            <td>500,000</td>
            <td>1</td>
            <td>0</td>
            <td>500,000</td>
          </tr>
          <tr>
            <td>3</td>
            <td>Chẩn đoán: Abscess chế</td>
            <td>Cắt lợi bằng Laser r23</td>
            <td>THI HIEN</td>
            <td>500,000</td>
            <td>1</td>
            <td>0</td>
            <td>500,000</td>
          </tr>
          <tr>
            <td>3</td>
            <td>Chẩn đoán: Abscess chế</td>
            <td>Cắt lợi bằng Laser r23</td>
            <td>THI HIEN</td>
            <td>500,000</td>
            <td>1</td>
            <td>0</td>
            <td>500,000</td>
          </tr>
          <!-- Additional rows go here -->
        </table>
      </div>
    </div>
    <div class="result-info">
      <div class="result-info-left">
        <div class="cus cusBooking">Lịch hẹn:</div>
        <div class="cusBookingContent">-11:00:00 ngày 16/09/2019</div>
        <div class="cusBookingContent">-Nội dung: lịch hẹn</div>
      </div>
      <div class="result-info-right">
        <div class="cusBooking">
          <strong>Lịch hẹn:</strong
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
export default {
  name: "Result",
  data() {
    return {};
  },
  methods: {
    backProfile() {
      this.$router.push({ name: "Diagnose" });
    },
  },
};
</script>
<style scoped>
.range-Result {
  /* border: 1px solid black; */
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
