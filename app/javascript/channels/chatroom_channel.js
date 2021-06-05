import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages-list');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data)
      },
    });
  }
}

export { initChatroomCable };
