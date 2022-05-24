<template>
  <div class="create-token">
    <h1 class="text-center">Balance - 0.99 ETH</h1>
    <div class="container mx-auto px-4 md:px-12 padding-bottom-full">
      <label for="tokenname" class="block text-sm font-medium text-gray-700">Token Name*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" name="tokenname" id="tokenname" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="tokensymbol" class="block text-sm font-medium text-gray-700">Token Symbol*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" name="tokensymbol" id="tokensymbol" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="initialsupply" class="block text-sm font-medium text-gray-700">Initial Token Supply*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="number" name="initialsupply" id="initialsupply" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="decimals" class="block text-sm font-medium text-gray-700">Decimals*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="number" name="decimals" id="decimals" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <div class="flex w-full">
        <label for="burnableToggle" class="flex cursor-pointer">
          <div class="relative">
            <input type="checkbox" id="burnableToggle" class="sr-only">
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
            <input type="checkbox" id="mintableToggle" class="sr-only">
            <div class="block bg-gray-600 w-14 h-8 rounded-full"></div>
            <div class="dot absolute left-1 top-1 bg-white w-6 h-6 rounded-full transition"></div>
          </div>
          <div class="ml-3 text-gray-700 font-medium label">
            Mintable
          </div>
        </label>
      </div>

      <div class="flex w-full">
        <label for="feesToggle" class="flex cursor-pointer">
          <div class="relative">
            <input type="checkbox" id="feesToggle" class="sr-only" @change="checkFeesToggle($event)">
            <div class="block bg-gray-600 w-14 h-8 rounded-full"></div>
            <div class="dot absolute left-1 top-1 bg-white w-6 h-6 rounded-full transition"></div>
          </div>
          <div class="ml-3 text-gray-700 font-medium label">
            Fees/Taxes
          </div>
        </label>
      </div>

      <div v-if="hasFees">
        <label for="burnfee" class="block text-sm font-medium text-gray-700">Burn Fee (%)</label>
        <div class="mt-1 relative rounded-md shadow-sm">
          <input type="number" name="burnfee" id="burnfee" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
        </div>

        <label for="transactiontax" class="block text-sm font-medium text-gray-700">Transaction Tax (%)</label>
        <div class="mt-1 relative rounded-md shadow-sm">
          <input type="number" name="transactiontax" id="transactiontax" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
        </div>

        <label for="taxaddress" class="block text-sm font-medium text-gray-700">Tas Receiving Address</label>
        <div class="mt-1 relative rounded-md shadow-sm">
          <input type="text" name="taxaddress" id="taxaddress" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
        </div>
      </div>

      <div class="flex w-full">
        <label for="holderRedistributionToggle" class="flex cursor-pointer">
          <div class="relative">
            <input type="checkbox" id="holderRedistributionToggle" class="sr-only" @change="checkHolderRedistribution($event)">
            <div class="block bg-gray-600 w-14 h-8 rounded-full"></div>
            <div class="dot absolute left-1 top-1 bg-white w-6 h-6 rounded-full transition"></div>
          </div>
          <div class="ml-3 text-gray-700 font-medium label">
            Holder Redistribution
          </div>
        </label>
      </div>

      <div v-if="HolderRedistribution">
        <label for="rewardfee" class="block text-sm font-medium text-gray-700">Holders Reward Fee (%)</label>
        <div class="mt-1 relative rounded-md shadow-sm">
          <input type="number" name="rewardfee" id="rewardfee" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
        </div>
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
      hasFees: false,
      HolderRedistribution: false
    }
  },
  props: {
    msg: String
  },
  methods: {
    submit() { }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.create-token input{ 
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
