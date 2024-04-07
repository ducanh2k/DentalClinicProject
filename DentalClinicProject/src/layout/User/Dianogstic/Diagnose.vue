<template>
  <div>
    <h1 class="diagnose-header">PHIẾU KẾT QUẢ CHẨN ĐOÁN</h1>
    <h2 class="diagnose-content-header">Mô tả kết quả</h2>
    <div class="diagnose-content">
      <div class="diagnose-description">
        <div
          class="description-inner"
          v-for="mdr in mdrs"
          :key="mdr.mrDetailId"
        >
          &nbsp; {{ mdr.imageDescription }}asdfadfasdf
        </div>
        <br />
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
      <div
        class="btnchoice-container"
        v-for="mdr in mdrs"
        :key="mdr.mrDetailId"
      >
        <input
          type="checkbox"
          v-model="selectedService"
          :value="mdr.mrDetailId"
        />&nbsp; {{ mdr.serviceName }}
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
import axios from "axios";

export default {
  name: "Diagnose",
  data() {
    return {
      role: "",
      profiles: [],
      services: [],
      users: [],
      name: "",
      roleId: 0,
      role: "",
      note: "",
      mdrs: [],
      UserId: 0,
      selectedService: null,
    };
  },
  methods: {
    CheckRole() {
      this.role = localStorage.getItem("userRole");
      this.UserId = localStorage.getItem("UserId");
    },
    fetchMdr() {
      let apiURL =
        "https://localhost:7034/api/MedicalRecord/patient/" + this.UserId;
      axios
        .get(apiURL)
        .then((response) => {
          this.mdrs = response.data[0].medicalRecordDetails;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    NextPage() {
      this.$router.push({ name: "Result" });
    },
    backProfile() {
      this.$router.push({ name: "Profile" });
    },
  },
  mounted: function () {
    this.CheckRole();
    this.fetchMdr();
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
  overflow: auto;
}
.description-inner {
  overflow: auto;
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
