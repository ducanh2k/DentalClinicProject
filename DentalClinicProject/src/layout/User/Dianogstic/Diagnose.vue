<template>
  <div>
    <h1 class="diagnose-header">PHIẾU KẾT QUẢ CHẨN ĐOÁN</h1>
    <h2 class="diagnose-content-header">Mô tả kết quả</h2>
    <div class="diagnose-content">
      <div class="diagnose-description">
        Chẩn đoán (diagnosis) là một từ ghép nghĩa; trong đó “chẩn” là xác định,
        phân biệt dựa trên những triệu chứng, dấu hiệu có sẵn; “đoán” có nghĩa
        dựa vào những có sẵn, đã biết để tìm ra, suy ra những điều còn chưa rõ
        hoặc chưa xảy ra.
        <br />
        Như vậy “chẩn đoán” trong y học có nghĩa là thông qua biểu hiện các dấu
        hiệu, triệu chứng, kết quả xét nghiệm từ đó đưa ra được kết luận về bệnh
        hay một tình trạng sức khỏe.
        <br />
        Chẩn đoán là một bước rất quan trọng, quyết định đến toàn bộ quá trình
        điều trị, chăm sóc hay các can thiệp y khoa.
        <br />

        Việc đưa ra chẩn đoán cần có cơ sở khoa học vững chắc, rõ ràng và luôn
        là thách thức với đội ngũ y tế; bởi lẽ có những bệnh hay vấn đề sức khỏe
        có dấu hiệu, triệu chứng rõ ràng, nhưng cũng có nhiều trường hợp bệnh
        không điển hình và đòi hỏi người khám cần vận dụng kiến thức, thậm chí
        là kinh nghiệm để tìm tòi, khai thác và đưa ra được kết luận đúng đắn.
        <br />
        Chẩn đoán trong y học có nhiều loại. Ứng với các chuyên ngành khác nhau
        sẽ có các loại chẩn đoán khác nhau.
        <br />

        Việc đưa ra chẩn đoán cần có cơ sở khoa học vững chắc, rõ ràng và luôn
        là thách thức với đội ngũ y tế; bởi lẽ có những bệnh hay vấn đề sức khỏe
        có dấu hiệu, triệu chứng rõ ràng, nhưng cũng có nhiều trường hợp bệnh
        không điển hình và đòi hỏi người khám cần vận dụng kiến thức, thậm chí
        là kinh nghiệm để tìm tòi, khai thác và đưa ra được kết luận đúng đắn.
        <br />
        Chẩn đoán trong y học có nhiều loại. Ứng với các chuyên ngành khác nhau
        sẽ có các loại chẩn đoán khác nhau.
      </div>
      <div class="diagnose-picture">
        <h2 class="diagnose-picture-header">Hình ảnh chẩn đoán</h2>
        <div class="picture-diagnose">
          <div class="picture-diagnose-inner"></div>
          <div class="picture-diagnose-inner1"></div>
          <div class="picture-diagnose-inner2"></div>
        </div>
      </div>
    </div>
    <h3 class="Result-diagnose-header">
      Kết quả: Chẩn đoán hình ảnh là một ngành trong lĩnh vực y tế.
    </h3>
    <h3 class="Result-diagnose-header">
      Lựa chọn thủ thuật phù hợp cho việc chẩn đoán:
    </h3>
    <div class="service-choice">
      <div class="service-choice-name"></div>
      <div class="btnchoice-container">
        <input
          type="radio"
          class="btnchoice"
          v-model="btnchoice"
          value=""
        />&nbsp; Thủ Thuật 1
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          type="radio"
          class="btnchoice"
          v-model="btnchoice"
          value=""
        />&nbsp; Thủ Thuật 2
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          type="radio"
          class="btnchoice"
          v-model="btnchoice"
          value=""
        />&nbsp; Thủ Thuật 3
      </div>
      <div class="btnchoice-container">
        <input
          type="radio"
          class="btnchoice"
          v-model="btnchoice"
          value=""
        />&nbsp; Thủ Thuật 4
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          type="radio"
          class="btnchoice"
          v-model="btnchoice"
          value=""
        />&nbsp; Thủ Thuật 5
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          type="radio"
          class="btnchoice"
          v-model="btnchoice"
          value=""
        />&nbsp; Thủ Thuật 6
      </div>
      <div class="btnchoice-container">
        <input
          type="radio"
          class="btnchoice"
          v-model="btnchoice"
          value=""
        />&nbsp; Thủ Thuật 7
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          type="radio"
          class="btnchoice"
          v-model="btnchoice"
          value=""
        />&nbsp; Thủ Thuật 8
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          type="radio"
          class="btnchoice"
          v-model="btnchoice"
          value=""
        />&nbsp; Thủ Thuật 9
      </div>
    </div>
    <button
      type="button"
      @click="backProfile()"
      class="btn btn-primary"
      style="margin-left: 10%"
    >
      Trở lại
    </button>
    <button
      type="button"
      @click="printResult()"
      class="btn btn-primary"
      style="margin-left: 50%"
    >
      In kết quả
    </button>
    <button
      type="button"
      @click="NextPage()"
      class="btn btn-primary"
      style="margin-left: 1%"
    >
      Tiếp theo
    </button>
  </div>
</template>

<script>
export default {
  name: "Diagnose",
  data() {
    return {};
  },
  methods: {
    NextPage() {
      this.$router.push({ name: "Result" });
    },
    backProfile() {
      this.$router.push({ name: "Profile" });
    },
  },
};
</script>
<style scoped>
.diagnose-header {
  display: flex;
  justify-content: center;
  align-items: center;
}
.diagnose-content-header {
  margin-left: 10%;
}
.diagnose-content {
  height: 100vh;
  display: flex;
  margin-left: 10%;
  margin-right: 10%;
}
.diagnose-description {
  width: 60%;
}
.diagnose-picture {
  height: 100%;
  width: 40%;
}
.diagnose-picture-header {
  margin-top: -10%;
  margin-left: 25%;
}
.picture-diagnose {
  height: 100%;
  width: 100%;
}
.picture-diagnose-inner {
  margin-left: 25%;
  height: 25%;
  width: 80%;
  background-image: url("../../../imgs/image.png");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.picture-diagnose-inner1 {
  margin-left: 25%;
  margin-top: 5%;
  height: 25%;
  width: 80%;
  background-image: url("../../../imgs/unnamed.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.picture-diagnose-inner2 {
  margin-left: 25%;
  margin-top: 5%;
  height: 25%;
  width: 80%;
  background-image: url("../../../imgs/chup-x-quang-nho-rang-khon-1.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
.Result-diagnose-header {
  margin-bottom: 3%;
  margin-left: 10%;
}
.service-choice {
  width: 100%;
  height: 100%;
  margin-bottom: 5%;
}
.service-choice-name {
}
.btnchoice-container {
  margin-bottom: 3%;
  margin-left: 10%;
}
</style>
