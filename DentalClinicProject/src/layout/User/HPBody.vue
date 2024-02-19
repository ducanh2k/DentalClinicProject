<template>
  <div>
    <section class="modern-facilities">
      <Slider></Slider>
      <DentalService></DentalService>
      <TeamDoctor></TeamDoctor>
      <Certificate></Certificate>
      <Facilites></Facilites>
      <example></example>
    </section>
  </div>
</template>

<script>
import "../../css/User/body.css";
import Slider from "../ToolTip/Slider.vue";
import DentalService from "./DentalService.vue";
import TeamDoctor from "./TeamDoctor.vue";
import Certificate from "./Certificate.vue";
import Facilites from './Facilites.vue';
import example from './example.vue';
export default {
  name: "HPBody",
  components: {
    Slider,
    DentalService,
    TeamDoctor,
    Certificate,
    Facilites,
    example
  },
};
</script>

<style scoped></style>
