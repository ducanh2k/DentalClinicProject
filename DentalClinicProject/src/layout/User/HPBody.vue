<template>
  <div>
    <section class="modern-facilities">
      <Slider></Slider>
      <DentalService></DentalService>
      <TeamDoctor></TeamDoctor>
      <Certificate></Certificate>
      <Facilites></Facilites>
      <example></example>
      <CustomerComment></CustomerComment>
      <DentalKnowledge></DentalKnowledge>
      <ContactUs></ContactUs>
      <Footer></Footer>
    </section>
  </div>
</template>

<script>
import "../../css/User/body.css";
import Slider from "../ToolTip/Slider.vue";
import DentalService from "./DentalService.vue";
import TeamDoctor from "./TeamDoctor.vue";
import Certificate from "./Certificate.vue";
import Facilites from "./Facilites.vue";
import example from "./example.vue";
import CustomerComment from "./CustomerComment.vue";
import DentalKnowledge from "./DentalKnowledge.vue";
import ContactUs from "./ContactUs.vue";
import Footer from "./Footer.vue";
import FacilitesVue from './Facilites.vue';
export default {
  name: "HPBody",
  components: {
    Slider,
    DentalService,
    TeamDoctor,
    Certificate,
    Facilites,
    example,
    CustomerComment,
    DentalKnowledge,
    ContactUs,
    Footer,
  },
};
</script>

<style scoped></style>
