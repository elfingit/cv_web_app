<template>
  <div class="col-lg-12">
    <div v-for="message in messages" class="alert alert-danger alert-dismissible fade show" role="alert">
      {{ message }}
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
  </div>
</template>

<script>

export default {
  name: 'alert',

  props: {
    messages: Array
  }
}
</script>

<style scoped>
</style>
