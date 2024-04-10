<template>
  <div class="TeamDoc">
    <h3 class="teamName"><strong>TEAM DOCTOR</strong></h3>
    <div class="container">
      <div class="TeamDoc-picture"></div>
      <div class="TeamDoc-Content">
        <p style="font-size: 16px">Ts, Bác sĩ Nguyễn Văn A</p>
        <p style="font-size: 16px">
          Một trong những bác sĩ phẫu thuật được đào tạo bài bản về phẫu thuật
          cấy ghép nha khoa tại Nhật Bản, người chủ trì các nghiên cứu chuyên
          sâu về cấy ghép implant như xoang nâng cơ, ghép xương và sử dụng vật
          liệu mới trong nha khoa. TRONG Đặc biệt, bác sĩ A đã thực hiện thành
          công nhiều ca trồng răng implant cấy ghép cho bệnh nhân được phẫu
          thuật vi phẫu để tái tạo lại phần dưới xương hàm, đồng thời mang lại
          diện mạo mới cho bệnh nhân hàm hô, móm, cười hở lợi… qua phẫu thuật
          chỉnh nha.
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Giám đốc Việt Nam – Cuba Bệnh
          viện, Hà Nội
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Cố vấn chuyên môn của Cấy
          ghép Implant Dentium, Hàn Quốc
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Thành viên Nha khoa Nhật Bản
          Hiệp hội bác sĩ phẫu thuật
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Thành viên Nha khoa Hoa Kỳ
          Hiệp hội (ADA)
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Thành viên của Quốc tế Hiệp
          hội cấy ghép (ITI)
        </p>
      </div>
    </div>
    <button type="button" class="btn btn-primary" @click="goDoctor()">
      <strong>Xem tất cả</strong>
    </button>
  </div>
</template>

<script>
export default {
  name: "TeamDoctor",
  methods: {
    goDoctor() {
      this.$router.push({ name: "TeamDoctor" });
    },
  },
};
</script>

<style scoped>
.TeamDoc {
  width: 100%;
  height: 100%;
  margin-top: 10%;
}
.teamName {
  color: rgb(219, 169, 83);
  font-size: 3rem;
  margin-left: 43%;
}
.container {
  margin-top: 2%;
  display: flex;
  justify-content: center;
  align-items: center;
  /* background-color: black; */
  width: 100%;
}
.TeamDoc-Content {
  /* background-color: brow n;    */
  height: 45vh;
  width: 40%;
  margin-left: 7%;
}
.TeamDoc-picture {
  height: 45vh;
  width: 25%;
  /* background-color: rgb(224, 196, 140); */
  background-image: url("../../imgs/bacsi.webp");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}

.btn-primary {
  margin-top: 10%;
  font-size: 1.5rem;
  width: 20%;
  height: 5vh;
  background-color: #fff;
  color: rgb(224, 196, 140);
  border-radius: 6px;
  border: 0.5px solid rgb(201, 201, 201);
  margin-bottom: 2%;
  margin-left: 40%;
}
.btn-primary:hover,
.btn-primary:focus {
  transition: background-color 0.5s ease, color 0.5s ease;
  background-color: #e3e3e3;
  border: 1px solid rgb(224, 196, 140);
  color: rgb(74, 85, 110);
}
@media (max-width: 1500px) {
  .TeamDoc-Content {
    /* background-color: brow n;    */
    height: 60vh;
    width: 40%;
  }
  .TeamDoc-picture {
    height: 60vh;
    width: 30%;
  }
  .btn-primary {
    margin-left: 40%;
    height: 7vh;
  }
}
</style>
