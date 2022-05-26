<template>
  <div class="tokens">
    <h1 class="pink">Tokens</h1>
    <div class="container my-12 mx-auto px-4 md:px-12">
      <div class="flex flex-wrap -mx-1 lg:-mx-4">
        <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3 text-center" v-for="token in this.tokens" v-bind:key="token.id">
            <router-link :to="{ name: 'MyTokens', params: { tokenSymbol: token.symbol }}">
              <article class="overflow-hidden rounded-lg shadow-lg column">
                <h2>
                  ${{token.symbol}}
                </h2>
                <p>{{token.name}}</p>
              </article>
            </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {ethers} from 'ethers';
import { erc20FactoryABI } from './abis/erc20factory';
import { erc721FactoryABI } from './abis/erc721factory';

export default {
  name: 'TokenList',
  props: {
    msg: String
  },
  data() {
    return {
      counter: 1,
      tokens: []
    }
  },
  methods: {
    async getTokens(address, abi){
      let counter = this.counter;
      const tokens = this.tokens;

      const provider = new ethers.providers.Web3Provider(window.ethereum, "any");
      await provider.send("eth_requestAccounts", []);
      const signer = provider.getSigner();
      const instance = new ethers.Contract(address, abi, signer);

      const response = await instance.getAll();

      response.forEach(function(data) 
      {
        var jsonData = {};

        jsonData['id'] = counter;
        jsonData['name'] = data.name;
        jsonData['symbol'] = data.symbol;
        jsonData['tokenType'] = data.tokenType;
        jsonData['isBurnable'] = data.isBurnable;
        jsonData['isMintable'] = data.isMintable;

        counter++;
        tokens.push(jsonData);
      });

      this.counter = counter;
      this.tokens = tokens;
    }
  },
  async mounted(){
    const erc20address = '0xEF5e78E21b3a4e9ad93bc412621418C7B2814720';
    await this.getTokens(erc20address, erc20FactoryABI);

    const erc721address = '0x0f24Cce1d1A95F6357Af393567B067dDA0f6a5AC';
    await this.getTokens(erc721address, erc721FactoryABI);

  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.tokens{
  text-align: center;
  margin-top: 60px;
  color: white;
}
.tokens .column{ 
  margin-top: 20px;
  width: 95%;
  padding: 15px;
  background: black;
  height: 130px;
  border-radius: 20px;
  color: white;
  box-shadow: 2px 2px 19px -8px rgba(253,108,158,0.29);
-webkit-box-shadow: 2px 2px 19px -8px rgba(253,108,158,0.29);
-moz-box-shadow: 2px 2px 19px -8px rgba(253,108,158,0.29);
}
.tokens .pink{ 
  color: #fd6c9e;;
}
.tokens .column:hover{ 
 background: #cc8899;
 box-shadow: 2px 2px 19px -8px rgba(0,0,0,0.29);
-webkit-box-shadow: 2px 2px 19px -8px rgba(0,0,0,0.29);
-moz-box-shadow: 2px 2px 19px -8px rgba(0,0,0,0.29);
}

.tokens h1{
  font-size: 70px;
  margin: 0px;
}
.tokens h2 {
  font-size: 30px !important;
}
</style>
