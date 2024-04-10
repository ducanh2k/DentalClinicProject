import { createRouter, createWebHistory } from "vue-router";
import HomePage from "../layout/User/HomePage.vue";
import Admin from "../Admin.vue";
import Appointment from "../layout/Admin/Appointment/Appointment.vue";
import Comment from "../layout/Admin/Comment/Comment.vue";
import Degree from "../layout/Admin/Degree/Degree.vue";
import Invoice from "../layout/Admin/Invoice/Invoice.vue";
import Material from "../layout/Admin/MaterialManagement/Material.vue";
import Medicine from "../layout/Admin/MedicineManagement/Medicine.vue";
import News from "../layout/Admin/NewsManagement/News.vue";
import Prescription from "../layout/Admin/Prescription/Prescription.vue";
import Revenue from "../layout/Admin/RevenueManagement/Revenue.vue";
import User from "../layout/Admin/UserManagement/User.vue";
import Service from "../layout/Admin/ServiceManagement/Service.vue";
import MedicalRecord from "../layout/Admin/MedicalRecordManagement/MedicalRecord.vue";
import AdminController from "../layout/Admin/AdminController.vue";
import Login from "../Login/Login.vue";
import Overview from "../layout/User/OverviewClinic/Overview.vue";
import Profile from "../layout/User/Profile/Profile.vue";
import TeamDoctor from "../layout/User/TeamDoctor/TeamDoctor-container.vue";
import Implant from "../layout/User/Service/Implant.vue";
import Implant1 from "../layout/User/Service/Implant1.vue";
import Diagnose from "../layout/User/Dianogstic/Diagnose.vue";
import Result from "../layout/User/Dianogstic/Result.vue";
import PriceList from "../layout/User/Service/PriceList.vue";
import DentalKnowledge from "../layout/User/News/DentalKnowledge.vue";
import CKEditor1 from "../layout/User/News/CKEditor1.vue";
import NewsEdit from "../layout/User/News/News.vue";
import CKEditor from "../layout/User/Service/CKEditor.vue";
import CommentHP from "../layout/User/Comment/Comment.vue";
import Infrastructure from "../layout/User/Infrastructure/Infrastructure.vue";
const routes = [
  {
    path: "/home",
    name: "Home",
    component: HomePage,
  },
  {
    path: "/commentHP",
    name: "CommentHP",
    component: CommentHP,
  },
  {
    path: "/infrastructure",
    name: "Infrastructure",
    component: Infrastructure,
  },
  {
    path: "/price",
    name: "PriceList",
    component: PriceList,
  },
  {
    path: "/dentalKnowledge",
    name: "DentalKnowledge",
    component: DentalKnowledge,
  },
  {
    path: "/result",
    name: "Result",
    component: Result,
  },
  {
    path: "/diagnose",
    name: "Diagnose",
    component: Diagnose,
  },
  {
    path: "/teamdoctor",
    name: "TeamDoctor",
    component: TeamDoctor,
  },
  {
    path: "/profile",
    name: "Profile",
    component: Profile,
  },
  {
    path: "/overview",
    name: "Overview",
    component: Overview,
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
  },
  {
    path: "/staff",
    name: "Staff",
    component: User,
    meta: { role: "Staff" },
  },
  {
    path: "/admin",
    name: "Admin",
    component: Revenue,
    meta: { role: "Admin" },
  },
  {
    path: "/appointment",
    name: "Appointment",
    component: Appointment,
    meta: { role: "admin" },
  },
  {
    path: "/comment",
    name: "Comment",
    component: Comment,
  },
  {
    path: "/invoice",
    name: "Invoice",
    component: Invoice,
  },
  {
    path: "/material",
    name: "Material",
    component: Material,
  },
  {
    path: "/medicine",
    name: "Medicine",
    component: Medicine,
  },
  {
    path: "/news",
    name: "News",
    component: News,
  },
  {
    path: "/newsEdit",
    name: "NewsEdit",
    component: NewsEdit,
  },

  {
    path: "/pre",
    name: "Prescription",
    component: Prescription,
  },
  {
    path: "/medicalRecord",
    name: "MedicalRecord",
    component: MedicalRecord,
  },
  {
    path: "/user",
    name: "User",
    component: User,
  },
  {
    path: "/service",
    name: "Service",
    component: Implant,
  },
  {
    path: "/service",
    name: "Service1",
    component: Implant1,
  },
  {
    path: "/service2",
    name: "Service2",
    component: Service,
  },
  {
    path: "/doctor",
    name: "Doctor",
    component: HomePage,
  },
  {
    path: "/patient",
    name: "Patient",
    component: HomePage,
  },
  {
    path: "/",
    name: "Home",
    component: HomePage,
  },
  {
    path: "/cKEditor",
    name: "CKEditor",
    component: CKEditor,
  },
  {
    path: "/cKEditor1",
    name: "CKEditor1",
    component: CKEditor1,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
