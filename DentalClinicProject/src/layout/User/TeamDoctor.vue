<template>
  <div class="TeamDoc">
    <h3 class="teamName"><strong>TEAM DOCTOR</strong></h3>
    <div class="container">
      <div class="TeamDoc-picture"></div>
      <div class="TeamDoc-Content">
        <p style="font-size: 16px">Ph.D, Doctor Nguyen Van A</p>
        <p style="font-size: 16px">
          One of the highly trained surgeons in dental implant surgery in Japan,
          who presides over in-depth studies on implant implants such as sinus
          lift, bone grafting, and the use of new materials in dentistry. In
          particular, Dr. A has successfully performed many dental implant
          transplants for patients with microsurgery to reconstruct the lower
          jaw bone, and at the same time brought a new look to patients with
          protruding jaw, underbite, gummy smile… through orthodontic surgery.
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Director of Vietnam – Cuba
          Hospital, Hanoi
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Professional advisor of
          Dental Implant Dentium, Korea
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Member of Japan Dental
          Surgeons Association
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Member of the American Dental
          Association (ADA)
        </p>
        <p style="font-size: 16px">
          <i class="fa-solid fa-circle-check"></i> Member of the International
          Implant Association (ITI)
        </p>
      </div>
    </div>
    <button type="button" class="btn btn-primary">
      <strong>See All</strong>
    </button>
  </div>
</template>

<script>
export default {
  name: "TeamDoctor",
};
</script>

<style scoped>
.TeamDoc {
  width: 100%;
  height: 100%;
  margin-top: 10%;
}
.teamName {
  color: rgb(219, 169, 83);
  font-size: 3rem;
  margin-left: 43%;
}
.container {
  margin-top: 2%;
  display: flex;
  justify-content: center;
  align-items: center;
  /* background-color: black; */
  width: 100%;
}
.TeamDoc-Content {
  /* background-color: brow n;    */
  height: 45vh;
  width: 40%;
  margin-left: 7%;
}
.TeamDoc-picture {
  height: 45vh;
  width: 25%;
  /* background-color: rgb(224, 196, 140); */
  background-image: url("../../imgs/bacsi.webp");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}

.btn-primary {
  margin-top: 10%;
  font-size: 1.5rem;
  width: 20%;
  height: 5vh;
  background-color: #fff;
  color: rgb(224, 196, 140);
  border-radius: 6px;
  border: 0.5px solid rgb(201, 201, 201);
  margin-bottom: 2%;
  margin-left: 40%;
}
.btn-primary:hover,
.btn-primary:focus {
  transition: background-color 0.5s ease, color 0.5s ease;
  background-color: #e3e3e3;
  border: 1px solid rgb(224, 196, 140);
  color: rgb(74, 85, 110);
}
@media (max-width: 1500px) {
  .TeamDoc-Content {
    /* background-color: brow n;    */
    height: 60vh;
    width: 40%;
  }
  .TeamDoc-picture {
    height: 60vh;
    width: 30%;
  }
  .btn-primary {
    margin-left: 40%;
    height: 7vh;
  }
}
</style>
