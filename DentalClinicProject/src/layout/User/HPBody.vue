<template>
  <div>
    <section class="modern-facilities">
      <Slider></Slider>
      <DentalService></DentalService>
    </section>

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
