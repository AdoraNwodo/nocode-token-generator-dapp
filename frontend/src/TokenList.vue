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
export default {
  name: 'TokenList',
  props: {
    msg: String
  },
  data() {
    return {
      tokens: [
        { id:"1", symbol: "NENZ", name: "The Nenz Token"},
        { id:"2", symbol: "BLS", name: "The Blessing Token"},
        { id:"3", symbol: "PFT", name: "The Parfait Token"},
        { id:"4", symbol: "TKVR", name: "The Takeover Token"},
      ]
    }
  },
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
