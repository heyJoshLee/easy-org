import consumer from "./consumer"
import { scroll_bottom } from '../packs/application';


$(document).on('turbolinks:load', function() {

  consumer.subscriptions.create({
    channel: "ChatRoomChannel",
    room_id: document.getElementById("chatbox-id").getAttribute("data-room-id")
    }, {
    connected() {
  
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      console.log(data)
      $("#messages-container").append(`<p>${data.user}: ${data.body}</p>`);
      $("#chatbox-input-field").val("");
    }
  });
  
})

