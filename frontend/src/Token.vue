<template>
  <div class="create-token">
    <div class="container mx-auto px-4 md:px-12 padding-bottom-full">
      <label for="tokenname" class="block text-sm font-medium text-gray-700">Token Name*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="The Nenz Token" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="tokensymbol" class="block text-sm font-medium text-gray-700">Token Symbol*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="$NENZ" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="initialsupply" class="block text-sm font-medium text-gray-700">Initial Token Supply</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="150000" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="decimals" class="block text-sm font-medium text-gray-700">Decimals</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="644" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="burnable" class="block text-sm font-medium text-gray-700">Burnable</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="true" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="mintable" class="block text-sm font-medium text-gray-700">Mintable</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="true" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="fees" class="block text-sm font-medium text-gray-700">Has Fees/Taxes</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="true" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="burnfee" class="block text-sm font-medium text-gray-700">Burn Fee (%)</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="5" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="transactiontax" class="block text-sm font-medium text-gray-700">Transaction Tax (%)</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="4" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="taxaddress" class="block text-sm font-medium text-gray-700">Tas Receiving Address</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="0xdddddddddddd" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="holderredistribution" class="block text-sm font-medium text-gray-700">Has Holder Redistribution</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="true" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="holderredistribution" class="block text-sm font-medium text-gray-700">Holders Reward Fee (%)</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" value="5" disabled class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: 'MyToken',
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
    async checkFeesToggle(e) {
      if (e.target.checked){
        this.hasFees = true;
      }
      else {
        this.hasFees = false;
      }
    },
    async checkHolderRedistribution(e) {
      if (e.target.checked){
        this.HolderRedistribution = true;
      }
      else {
        this.HolderRedistribution = false;
      }
    }
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
</style>
