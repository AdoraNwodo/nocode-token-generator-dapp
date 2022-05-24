<template>
  <div>
    <Navigation />
    <router-view />
  </div>
</template>
<script>
import Navigation from './components/Navigation.vue';
import './assets/tailwind.css'

export default {
    name: "App",
    components: { Navigation }
}
</script>

<style>

#app {
  color: #ffffff;
  width: 100%;
  background-image: url('./assets/background.jpg');
  min-height: 100vh;
  font-family: 'Roboto Flex', sans-serif;
}
h1, h2, h3, h4, h5, h6{
  font-weight: 900;
  color: #ffffff;
}
</style>
