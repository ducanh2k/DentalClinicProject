<template>
  <div>
    <ckeditor
      :editor="editor"
      v-model="description"
      :config="editorConfig"
    ></ckeditor>
    <div>
      <span class="input-group-text"><strong>Nhập mã dịch vụ</strong></span>
      <input
        type="text"
        class="form-control"
        placeholder="mã dịch vụ"
        v-model="ID"
      />
    </div>
    <button class="editorButton" @click="fetchDataClick()">
      Lấy dữ liệu
    </button>
    <button class="editorButton" @click="updateClick()">Lưu</button>
    <button class="editorButton" @click="backHome()">Trở về</button>
  </div>
</template>

<script>
import CKEditor from "@ckeditor/ckeditor5-vue";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";
import axios from "axios";

export default {
  name: "CKEditor",
  components: {
    ckeditor: CKEditor.component,
  },
  data() {
    return {
      ID: 0,
      serviceName: "",
      briefInfo: "",
      price: 0,
      deleteFlag: false,
      editor: ClassicEditor,
      description: "",
      editorConfig: {
        // Cấu hình CKEditor ở đây
      },
    };
  },
  methods: {
    CheckRole() {
      this.role = localStorage.getItem("userRole");
    },
    fetchDataClick() {
      let apiURL = "https://localhost:7034/api/Service/" + this.ID;
      axios
        .get(apiURL)
        .then((response) => {
          this.serviceName = response.data.serviceName;
          this.briefInfo = response.data.briefInfo;
          this.price = response.data.price;
          this.deleteFlag = response.data.deleteFlag;
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
      alert("fetch successful");
    },
    updateClick() {
      axios
        .put("https://localhost:7034/api/Service/" + this.ID, {
          description: this.description,
          serviceName: this.serviceName,
          briefInfo: this.briefInfo,
          price: this.price,
          deleteFlag: this.deleteFlag,
        })
        .then((response) => {
          alert("Update thành công!");
        });
    },
    backHome() {
      this.$router.push({ name: "Service2" });
    },
  },
  mounted: function () {
    // this.fetchServices();
  },
};
</script>
<style scoped>
.editorButton {
  width: 7%;
  height: 4% ;
  display: flex;
  bottom: 0;
}
</style>
