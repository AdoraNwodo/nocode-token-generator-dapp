<template>
  <div>
    <Navigation />
    <router-view v-if="hasEthProvider" />
    <h1 v-else class="no-metamask">Please install the MetaMask browser extension and try again</h1>
  </div>
</template>
<script>
import {ethers} from 'ethers';
import Navigation from './components/Navigation.vue';
import './assets/tailwind.css'

export default {
    name: "App",
    components: { Navigation },
    data() {
      return {
        hasEthProvider: false
      }
    },
    async mounted() {
      const provider = new ethers.providers.Web3Provider(window.ethereum, "any");
      if (provider != null)
      {
        this.hasEthProvider = true
      }
    } 
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
h1.no-metamask{ 
  padding-top: 80px;
  text-align: center;
}
</style>
