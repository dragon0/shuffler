<template>
  <div id="app">
    <img alt="logo" src="./assets/logo.png">
    <Shuffler/>
  </div>
</template>

<script>
import Shuffler from './components/Shuffler.vue'

export default {
  name: 'app',
  components: {
    Shuffler
  }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
