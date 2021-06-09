// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { initChatroomCable } from '../channels/chatroom_channel';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  const redHeart = document.getElementById("red-heart")
  const grayHeart = document.getElementById("gray-heart")

  // let redHearts = document.getElementsByClassName("red-heart")
  // let grayHearts = document.getElementsByClassName("gray-heart")

  // Array.from(redHearts).forEach(function(element) {
  //   element.addEventListener("ajax:success", (event) => {
  //   grayHeart.style.display = "block"
  //   redHeart.style.display = "none"
  // });

// for (var i = 0; i < redHearts.length; i++) {
//     redHearts[i].addEventListener("ajax:success", (event) => {
//     grayHearts[i].style.display = "block"
//     redHearts[i].style.display = "none"
//   });
// };

// for (var i = 0; i < grayHearts.length; i++) {
//       console.log(grayHearts[i])
//       console.log(redHearts[i])
//     grayHearts[i].addEventListener("ajax:success", (event) => {
//       console.log("teste")
//     redHearts[i].style.display = "block"
//     grayHearts[i].style.display = "none"
//   });
// };

  grayHeart.addEventListener("ajax:success", (event) => {
    redHeart.style.display = "block"
    grayHeart.style.display = "none"
  })
  redHeart.addEventListener("ajax:success", (event) => {
    grayHeart.style.display = "block"
    redHeart.style.display = "none"
  })
});

initChatroomCable();

