<template>
  <div class="pdf">

      <pdf src="src" ></pdf>


  </div>
</template>

<script>
import pdf from 'vue-pdf'
import Image from "./image";
export default {
name: "Contract",
  components:{
    Image,
    pdf
  },
  data(){
   return{
     src:'./public/css/s.pdf'
   }
  }

}
</script>

<style scoped>

</style>
