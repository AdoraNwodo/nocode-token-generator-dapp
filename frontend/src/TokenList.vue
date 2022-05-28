<template>
  <div class="tokens">
    <h1 class="pink">Tokens</h1>
    <div class="container my-12 mx-auto px-4 md:px-12">
      <div class="flex flex-wrap -mx-1 lg:-mx-4">
        <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3 text-center" v-for="token in this.tokens" v-bind:key="token.id">
            <a v-bind:href="token.url" target="_blank">
              <article class="overflow-hidden rounded-lg shadow-lg column" v-if="token.tokenType != 'ERC1155'">
                <h2>
                  ${{token.symbol}}
                </h2>
                <p>{{token.name}}</p>
                <p class="pink">{{token.tokenType}}</p>
                <p class="address">{{token.tokenAddress}}</p>
              </article>
              <article class="overflow-hidden rounded-lg shadow-lg column" v-else>
                <p class="pd-top-20">{{token.name}}</p>
                <p class="pink">{{token.tokenType}}</p>
                <p class="address">{{token.metadataUrl}}</p>
                <p class="address">{{token.tokenAddress}}</p>
              </article>
            </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {ethers} from 'ethers';
import { erc20FactoryABI } from './abis/erc20factory';
import { erc721FactoryABI } from './abis/erc721factory';
import { erc1155FactoryABI } from './abis/erc1155factory';
import { ERC20Address, ERC721Address, ERC1155Address } from './utils/constants';

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
        jsonData['url'] = `https://rinkeby.etherscan.io/token/${data.tokenAddress}`;

        if (data.tokenType)
        {
          jsonData['name'] = data.name;
          jsonData['symbol'] = data.symbol;
          jsonData['tokenType'] = data.tokenType;
          jsonData['isBurnable'] = data.isBurnable;
          jsonData['isMintable'] = data.isMintable;
          jsonData['tokenAddress'] = data.tokenAddress;
        }
        else
        {
          jsonData['name'] = data.contractName;
          jsonData['tokenType'] = "ERC1155";
          jsonData['metadataUrl'] = data.uri;
          jsonData['tokenAddress'] = data.tokenAddress;
        }

        counter++;
        tokens.push(jsonData);
      });

      this.counter = counter;
      this.tokens = tokens;
    }
  },
  async mounted(){
    await this.getTokens(ERC20Address, erc20FactoryABI);
    await this.getTokens(ERC721Address, erc721FactoryABI);
    await this.getTokens(ERC1155Address, erc1155FactoryABI);
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
  margin-bottom: 30px;
  width: 95%;
  padding: 15px;
  background: black;
  height: 170px;
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
  font-size: 20px !important;
  padding-top: 20px;
}
p.pd-top-20{ 
  padding-top: 20px;
}
p.address{ 
  font-size: 11px !important;
}
</style>
