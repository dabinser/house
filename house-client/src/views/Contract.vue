<template>
  <div class="pdf">

      <pdf src="src" ></pdf>


  </div>
</template>

<script>
import pdf from 'vue-pdf'

export default {
name: "Contract",
  components:{

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
