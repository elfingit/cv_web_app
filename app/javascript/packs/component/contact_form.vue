<template>
  <div class="row">
    <div class="col-lg-4">
      <form method="post" action="#" v-on:submit="sendForm">
        <div class="form-group">
          <label>Please provide your email <span class="red">*</span></label>
          <input type="email" name="email" class="form-control" placeholder="example@example.com" requried>
          <small class="form-text text-muted">It's need for back contact with you, so I'll never share your email with anyone else</small>
        </div>
        <div class="form-group">
          <label>Please provide your name </label>
          <input type="text" name="name" class="form-control" placeholder="Jhon Smith">
        </div>
        <div class="form-group">
          <label>Message <span class="red">*</span></label>
          <textarea name="message" class="form-control" rows="3"></textarea>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-primary">Send</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'contact_form',

  methods: {
    sendForm: function (event) {
      event.preventDefault()

      const defaultInputBorderColor = '#ced4da';

      let form = event.target
      let emailField = form.querySelector('input[name="email"]')

      let emailValue = emailField.value.trim()

      if (!emailValue) {
        emailField.style.borderColor = '#FF0000';
        return;
      }

      let messageField = form.querySelector('textarea[name="message"]')
      let messageValue = messageField.value.trim()

      if (!messageValue) {
        messageField.style.borderColor = '#FF0000';
        return;
      }

    }
  }

}
</script>

<style scoped>
</style>
