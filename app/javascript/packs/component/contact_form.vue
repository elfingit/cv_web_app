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

import Vue from 'vue'
import axios from 'axios';
import Alert from './alert.vue'

export default {
  name: 'contact_form',

  data: function () {
    return {
      entity: {
        email: '',
        name: '',
        message: ''
      },
      error_container: null
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

      if (this.error_container) {
        this.error_container.remove()
        this.error_container = null
      }

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

      let self = this

      axios.post('/message.json', { 'message': this.entity })
        .then( response => {

          if (response.data.status && response.data.status == 'Ok') {

            let div = document.createElement('div')
            div.setAttribute('class', 'alert alert-success')
            div.setAttribute('role', 'alert')

            let txt = document.createTextNode("Thank you for your interest. I'll contact with you soon as possible!");
            div.appendChild(txt);

            form.parentNode.replaceChild(div, form)
          }

        }).catch( err => {

          if (err.response.data) {
            let alertComponent = Vue.extend(Alert)
            let instance = new alertComponent({
              propsData: { messages: err.response.data.errors }
            })
            instance.$mount()
            self.error_container = self.$el.insertBefore(instance.$el, self.$el.firstChild)

          }

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
