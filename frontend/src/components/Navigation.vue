<!-- This example requires Tailwind CSS v2.0+ -->
<template>
  <Disclosure as="nav" class="bg-transparent-800">
    <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
      <div class="relative flex items-center justify-between h-16">
        <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
          <div class="flex-shrink-0 flex items-center">
            <router-link to="/">
              <img class="block lg:hidden h-8 w-auto" src="../assets/icon.png" alt="AutoToken" />
              <img class="hidden lg:block h-8 w-auto" src="../assets/logo.png" alt="AutoToken" />
            </router-link>
          </div>
          <div class="hidden sm:block sm:ml-6">
            <div class="flex space-x-4">
              <a v-for="item in navigation" :key="item.name" :href="item.href" :class="[item.current ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white', 'px-3 py-2 rounded-md text-sm font-medium']" :aria-current="item.current ? 'page' : undefined">{{ item.name }}</a>
            </div>
          </div>
        </div>

        <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
          <router-link to="/token/create" type="button" class="nav-button bg-pink-800 p-1 rounded-full text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white">
            <span class="sr-only">Create a Token</span>
            <PlusIcon class="h-6 w-6" aria-hidden="true" />
          </router-link>

          <router-link type="button" to="/tokens" class="nav-button bg-pink-800 p-1 rounded-full text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white">
            <span class="sr-only">View your tokens</span>
            <CollectionIcon class="h-6 w-6" aria-hidden="true" />
          </router-link>
        </div>
      </div>
    </div>
  </Disclosure>
</template>

<script setup>
import { Disclosure } from '@headlessui/vue'
import { CollectionIcon, PlusIcon } from '@heroicons/vue/outline'

</script>

<script>
const { ethers } = require("ethers");

export default {
  name: 'NavBar',
  props: {
    msg: String
  }
}
</script>

<style scoped>
a.nav-button, button.nav-button{ 
  margin-left: 20px;
}
</style>