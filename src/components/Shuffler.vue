<template>
  <div class="shuffler">
    <div class="list-container">
      <List
         v-for="list in lists"
         v-bind:key="list.id"
         v-bind:items="list.items"
         v-on:add-to-list="addToList(list.id, $event)"
         v-on:remove-from-list="removeFromList(list.id, $event)"/>
    </div>
    <div class="new-list">
      <button v-on:click="addList">+</button>
    </div>
    <div class="shuffle">
      <button v-on:click="shuffle">Shuffle</button>
    </div>
  </div>
</template>

<script>
  import List from './List.vue'

  export default {
    name: 'Shuffler',

    props: {
    },

    data: ()=>{return{
      lists: [{id: 0, items: []}, {id: 1, items: []}],
      nextId: 2
    }},

    methods: {
      findList: function(listId){
        return this.lists.find((list) => {return list.id == listId});
      },

      addToList: function(listId, item){
        var list = this.findList(listId);
        list.items.push(item);
      },

      removeFromList: function(listId, id){
        var list = this.findList(listId);
        list.items = list.items.filter((item)=>{return item.id != id})
      },

      addList: function(){
        this.lists.push({id: this.nextId, items: []});
        this.nextId++;
      },

      shuffle: function(){
        var lists = this.lists.map((list) => {return list.items.slice()});

        //console.log(lists);
        var longest = 0;
        for(var index in lists){
          var list = lists[index];
          if(list.length > longest){
            longest = list.length;
          }

          for(var i = 0; i < list.length; i++){
            var j = Math.floor(Math.random() * list.length);
            var tmp = list[i];
            list[i] = list[j];
            list[j] = tmp;
          }
        }

        var newList = [];
        for(var i = 0; i < longest; i++){
          var row = [];
          for(var index in lists){
            var list = lists[index];
            if(list[i]){
              row.push(list[i].text);
            }
          }
          newList.push({id: i, text: row.join(", ")});
        }
        console.log(newList);

        this.lists.push({id: this.nextId, items: newList});
        this.nextId++;
      }
    },

    components: {
      List
    }

  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
