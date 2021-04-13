import consumer from "./consumer"

consumer.subscriptions.create("ChatRoomChannel", {
  connected() {

  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
  }
});
