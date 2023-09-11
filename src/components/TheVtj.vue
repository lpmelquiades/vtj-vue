<script setup lang="ts">
import { ref } from 'vue'

import WelcomeItem from './WelcomeItem.vue'
import DeputyCard from './DeputyCard.vue'

const items = ref([
  {
    message: 'Foo',
    image_path: "https://www.camara.leg.br/internet/deputado/bandep/76874.jpg"
  },
  {
    message: 'Bar',
    image_path: "https://www.camara.leg.br/internet/deputado/bandep/76874.jpg"
  }
])

</script>

<template>
  <WelcomeItem>
    <template #heading>LLLLL Vue</template>

    As an independent project, Vue relies on community backing for its sustainability. You can help
    us by
    <a href="https://vuejs.org/sponsor/" target="_blank" rel="noopener">becoming a sponsor</a>.
  </WelcomeItem>

  <DeputyCard v-for="item in items" name={{item.message}} party={{item.message}} state={{item.message}} >
      <template #avatar>
      <img
        src= {{image_path}}
        alt="Vue Logo"
      >
      </template>
  </DeputyCard>

  <li v-for="item in items">
  {{ item.message }}
  </li>

</template>
  
