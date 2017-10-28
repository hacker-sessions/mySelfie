<template>
  <div id="tag">
    <input type="text" v-model="addtag"/>
    <button @click="addTag()">Add Tag</button>
  </div>
</template>

<script>
export default {
  name: 'book',
  created() {
    fetch('tags.json')
    .then((res) => { return res.json() })
    .then((res) => { this.tags = res })
  },
  data: function () {
    return {
      message: "Hello Vue!",
      addbook: '',
      tags: []
    }
  },
  methods: {
    addTag() {
      this.$http.post('books.json', {title: this.addbook}, {})
        .then((res) => window.location = "/tags")
        .catch( (error) => console.log('Got a problem' + error));
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
