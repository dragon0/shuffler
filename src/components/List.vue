<template>
  <div class="list">
    <div class="add-item">
      <input v-model="tempItem" v-on:keyup.enter="addItem"><button v-on:click="addItem">+</button>
    </div>
    <ul>
      <li v-for="item in items" v-bind:key="item.id">
        <span class="list-item">{{ item.text }}</span>
        <button v-on:click="$emit('remove-from-list', item.id)">-</button>
      </li>
    </ul>
  </div>
</template>

<script>

  export default {
    name: 'List',

    props: ['items'],

    data: () => {return{
      nextKey: 0,
      tempItem: ''
    }},

    methods:{

      addItem: function(){
        if(this.tempItem.trim() !== ''){
          this.$emit('add-to-list', {id: this.nextKey, text: this.tempItem.trim()});
          this.nextKey += 1;
        }
        this.tempItem = '';
      }

    }
  }
</script>

<style scoped lang="scss">

.list{
  border: 1px solid black;

  @media screen and (min-width: $desktop-width){
    float: left;
  }

}

</style>

