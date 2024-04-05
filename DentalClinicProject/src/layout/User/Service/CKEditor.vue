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
      fetch DataData
    </button>
    <button class="editorButton" @click="updateClick()">Save</button>
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
    // async fetchServices() {
    //   let apiURL = "https://localhost:7034/api/Service/" + this.ID;
    //   axios
    //     .get(apiURL)
    //     .then((response) => {
    //       this.serviceName = response.data.serviceName;
    //       this.briefInfo = response.data.briefInfo;
    //       this.price = response.data.price;
    //       this.deleteFlag = response.data.deleteFlag;
    //     })
    //     .catch((error) => {
    //       console.error("There has been a problem");
    //     });
    // },
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
  },
  mounted: function () {
    // this.fetchServices();
  },
};
</script>
<style scoped>
.editorButton {
  width: 3%;
  height: 2%;
  display: flex;
  bottom: 0;
}
</style>
