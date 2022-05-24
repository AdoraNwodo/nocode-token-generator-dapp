<template>
  <div class="home">
    <h1 text-3xl font-bold underline>AutoToken</h1>
    <p >The easiest way to create your ERC20, ERC721 and ERC1155 Token without any line of code!</p>
    <button @click="login">Get Started</button>
  </div>
</template>

<script>
const { ethers } = require("ethers");

export default {
  name: 'HomeComponent',
  data() {
    return {
      hasEthProvider: false,
      walletAddress: "",
      nonce: "",
      hasError: false,
      loading: false,
      completed: false,
      success: false,
      errorMessage: ""
    }
  },
  methods: {
    async login() {
      const provider = new ethers.providers.Web3Provider(window.ethereum, "any");
      if (provider != null)
      {
        this.hasEthProvider = true
      }

      // Prompt user for account connections
      await provider.send("eth_requestAccounts", []);
      const signer = provider.getSigner();
      const address = await signer.getAddress();
      if (address != null){
        this.$router.push('/tokens');
      }
    }
  }
}
</script>

<style scoped>
.home{
  text-align: center;
  margin-top: 160px;
}
.home h1{
  font-size: 70px;
  margin: 0px;
}
.home button{ 
  background: #fd6c9e;
  padding: 15px 35px;
  font-size: 18px;
  color: white;
  border-radius: 20px;
  margin-top: 50px;
}
</style>
