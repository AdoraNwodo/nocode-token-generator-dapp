<template>
  <div class="create-token">
    <h1 class="text-center">Balance - 0.99 ETH</h1>
    <div class="container mx-auto px-4 md:px-12 padding-bottom-full">
      <label for="tokenname" class="block text-sm font-medium text-gray-700">Token Name*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" name="tokenname" id="tokenname" v-model="name" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="tokensymbol" class="block text-sm font-medium text-gray-700">Token Symbol*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" name="tokensymbol" id="tokensymbol" v-model="symbol" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="tokentype" class="block text-sm font-medium text-gray-700">Initial Token Supply*</label>
      <select id="tokentype" name="tokentype" @change="changeTokenType($event)" class="block w-full pl-7 pr-12 sm:text-sm rounded-md">
        <option value="ERC20">ERC20</option>
        <option value="ERC721">ERC721</option>
        <option value="ERC1155">ERC1155</option>
      </select>

      <label for="initialsupply" class="block text-sm font-medium text-gray-700" v-if="tokenType != 'ERC721'">Initial Token Supply*</label>
      <div class="mt-1 relative rounded-md shadow-sm" v-if="tokenType != 'ERC721'">
        <input type="number" name="initialsupply" id="initialsupply" v-model="tokenSupply" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <div class="flex w-full">
        <label for="burnableToggle" class="flex cursor-pointer">
          <div class="relative">
            <input type="checkbox" id="burnableToggle" @change="checkBurnableToggle($event)" class="sr-only">
            <div class="block bg-gray-600 w-14 h-8 rounded-full"></div>
            <div class="dot absolute left-1 top-1 bg-white w-6 h-6 rounded-full transition"></div>
          </div>
          <div class="ml-3 text-gray-700 font-medium label">
            Burnable
          </div>
        </label>
      </div>

      <div class="flex w-full">
        <label for="mintableToggle" class="flex cursor-pointer">
          <div class="relative">
            <input type="checkbox" id="mintableToggle" @change="checkMintableToggle($event)" class="sr-only">
            <div class="block bg-gray-600 w-14 h-8 rounded-full"></div>
            <div class="dot absolute left-1 top-1 bg-white w-6 h-6 rounded-full transition"></div>
          </div>
          <div class="ml-3 text-gray-700 font-medium label">
            Mintable
          </div>
        </label>
      </div>

      <div class="text-center">
        <button @click="submit" >Submit</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CreateToken',
  data() {
    return {
      name: "",
      symbol: "",
      tokenSupply: 0,
      isBurnable: false,
      isMintable: false,
      tokenType: "ERC20",
      
    }
  },
  props: {
    msg: String
  },
  methods: {
    submit() { 
      console.log(this.name);
      console.log(this.symbol);
      console.log(this.tokenSupply);
      console.log(this.tokenType);
      console.log(this.isBurnable);
      console.log(this.isMintable);
    },
    changeTokenType(event) {
      this.tokenType = event.target.value;
    },
    checkBurnableToggle(event) {
      this.isBurnable = event.target.checked;
    },
    checkMintableToggle(event) {
      this.isMintable = event.target.checked;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.create-token input, .create-token select{ 
  height: 40px;
  background: transparent;
  border: 1px #ccc solid;
}

.create-token label{ 
  margin-top: 30px;
  font-weight: bolder;
  color: #fff;
  font-size: 20px;
}

.label{ 
  color: #fff !important;
  font-weight: bolder;
}

.create-token .padding-bottom-full{ 
  padding-bottom: 100px;
}

input:checked ~ .dot {
  transform: translateX(100%);
  background-color: #fd6c9e;
}

.create-token button{ 
  background: #fd6c9e;
  padding: 15px 45px;
  font-size: 18px;
  color: white;
  border-radius: 20px;
  margin-top: 50px;
  font-weight: bolder;
}
</style>
