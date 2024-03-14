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
const routes = [
  {
    path: "/home",
    name: "Patient",
    component: HomePage,
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
    component: Service,
  },

  {
    path: "/doctor",
    name: "Doctor",
    component: AdminController,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
