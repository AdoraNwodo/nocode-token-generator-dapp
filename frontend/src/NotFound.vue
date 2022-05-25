<template>
  <div class="not-found text-center">
    <h1>404</h1>
    <h2>Not Found</h2>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.text-center{ 
  text-align: center;
}
.not-found h1{ 
  font-size: 100px;
  padding-top: 100px;
}
.not-found h1{ 
  font-size: 70px;
}
</style>
