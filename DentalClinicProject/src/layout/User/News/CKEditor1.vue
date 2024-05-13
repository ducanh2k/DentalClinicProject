<template>
  <div>
    <ckeditor
      :editor="editor"
      v-model="description"
      :config="editorConfig"
    ></ckeditor>
    <div>
      <span class="input-group-text"><strong>Nhập mã tin tức</strong></span>
      <input
        type="text"
        class="form-control"
        placeholder="mã tin tức"
        v-model="ID"
      />
    </div>
    <button class="editorButton" @click="fetchDataClick()">Lấy dữ liệu.</button>
    <button class="editorButton" @click="updateClick()">Lưu</button>
    <button class="editorButton" @click="backHome()">Trở về</button>
  </div>
</template>

<script>
import CKEditor from "@ckeditor/ckeditor5-vue";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";
import axios from "axios";

export default {
  name: "CKEditor1",
  components: {
    ckeditor: CKEditor.component,
  },
  data() {
    return {
      ID: 0,
      tittle: "",
      briefInfo: "",
      price: 0,
      deleteFlag: false,
      editor: ClassicEditor,
      description: "",
      author: 0,
      createdAt: "",
      featured: true,
      img: "",
      editorConfig: {},
    };
  },
  methods: {
    CheckRole() {
      this.role = localStorage.getItem("userRole");
    },
    fetchDataClick() {
      let apiURL = "https://localhost:7034/api/News/" + this.ID;
      axios
        .get(apiURL)
        .then((response) => {
          this.tittle = response.data.tittle;
          this.briefInfo = response.data.briefInfo;
          this.author = response.data.author;
          this.createdAt = response.data.createdAt;
          this.featured = response.data.featured;
          this.img = response.data.img;
          
          alert("Lấy dữ liệu thành công!");
        })
        .catch((error) => {
          console.error("There has been a problem");
        });
    },
    updateClick() {
      axios
        .put("https://localhost:7034/api/News/" + this.ID, {
          description: this.description,
          tittle: this.tittle,
          briefInfo: this.briefInfo,
          price: this.price,
          author: this.author,
          authorName: "Hệ thống nha khoa",
          createdAt: this.createdAt,
          featured: this.featured,
          img: this.img,
          deleteFlag: false,
        })
        .then((response) => {
          alert("Cập nhật thành công!");
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
  height: 2%;
  display: flex;
  bottom: 0;
}
</style>
