<template>
  <div class="row">
    <div class="col-lg-4">
      <form method="post" action="#" v-on:submit="sendForm">
        <div class="form-group">
          <label>Please provide your email <span class="red">*</span></label>
          <input type="email" name="email" v-model="entity.email" v-on:focus="onFocus" class="form-control" placeholder="example@example.com">
          <small class="form-text text-muted">It's need for back contact with you, so I'll never share your email with anyone else</small>
        </div>
        <div class="form-group">
          <label>Please provide your name </label>
          <input type="text" v-model="entity.name" name="name" class="form-control" placeholder="Jhon Smith">
        </div>
        <div class="form-group">
          <label>Message <span class="red">*</span></label>
          <textarea v-on:focus="onFocus" v-model="entity.message" name="message" class="form-control" rows="3"></textarea>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-primary">Send</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>

import axios from 'axios';

export default {
  name: 'contact_form',

  data: function () {
    return {
      entity: {
        email: '',
        name: '',
        message: ''
      }
    }
  },
  mounted() {
    const tokenDom = document.querySelector("meta[name=csrf-token]")
    if (tokenDom) {
      const csrfToken = tokenDom.content
      axios.defaults.headers.common['X-CSRF-Token'] = csrfToken
   }
  },

  methods: {
    sendForm: function (event) {
      event.preventDefault()
      let form = event.target
      let email = this.entity.email.trim()

      if (!email) {
        let emailField = form.querySelector('input[name="email"]')
        emailField.style.borderColor = '#FF0000';
        return;
      }

      let message = this.entity.message.trim()

      if (!message) {
        let messageField = form.querySelector('textarea[name="message"]')
        messageField.style.borderColor = '#FF0000';
        return;
      }

      axios.post('/message.json', { 'message': this.entity })
        .then( response => {
          console.dir(response)
        }).catch( err => {
          console.dir(err)
        })

    },

    onFocus: function (event) {

      const defaultInputBorderColor = '#ced4da';

      event.target.style.borderColor = defaultInputBorderColor;
    }
  }

}
</script>

<style scoped>
</style>
