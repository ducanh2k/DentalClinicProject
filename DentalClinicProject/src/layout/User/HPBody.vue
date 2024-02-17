<template>
  <div>
    <section class="modern-facilities">
      <Slider></Slider>
      <DentalService></DentalService>
    </section>

    <section class="customer-comments"></section>

    <section class="dental-knowledge"></section>

    <footer class="contact-us"></footer>
  </div>
</template>

<script>
import "../../css/User/body.css";
import Slider from "../ToolTip/Slider.vue";
import DentalService from "./DentalService.vue";
export default {
  name: "HPBody",
  components: {
    Slider,DentalService
  },
};
</script>

<style scoped></style>
