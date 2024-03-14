import { createApp } from "vue";
import App from "./App.vue";
import "./index.css";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap/dist/js/bootstrap.bundle";
import router from "./js/routerControl";
const app = createApp(App);
app.use(router);
app.mount("#app");
