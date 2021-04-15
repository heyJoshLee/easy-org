import consumer from "./consumer"
import { scroll_bottom } from '../packs/application';


$(document).on('turbolinks:load', function() {

  consumer.subscriptions.create({
    channel: "ChatRoomChannel",
    room_id: document.getElementById("chatbox-id").getAttribute("data-room-id")
    }, {
    connected(data) {
      console.log(data)
      let imgSource = $('#user-profile-image-container img').attr('src');
      $('#online-chatters').append(`<img class="chatter-image" src='${imgSource}' />`);
      console.log(imgSource);
    },
  
    disconnected() {
      let imgSource = $('#user-profile-image-container img').attr('src');
      $(`img[src$='${imageSource}']`).remove();
    },
  
    received(data) {
      console.log(data)
      let audio = new Audio('message-notification.mp3');
      audio.play();
      $("#messages-container").append(`<p>${data.user}: ${data.body}</p>`);
      $("#chatbox-input-field").val("");

    }
  });
  
})

